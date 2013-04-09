Attribute VB_Name = "Mod_Main"
''****************************************************************************
''
'' Copyright (C) 2007-2010 Network Printing Solutions,INC and/or its subsidiary(-ies)
'' and/or its Assignees.
'' All rights reserved.
''
'' This file is part of the Realtime Administrator Source Code Distribution.
''
'' You may use this file under the following terms:
''
''  In plain English:
''
''  1. We don't promise that this software works
''  2. We don't promise that it will meet any requirement or need.
''  3. You can use this software for whatever you want. You don't have to pay us.
''  4. Permission for use of this software is granted only if the user accepts full responsibility for any undesirable consequences;
''     the authors accept NO LIABILITY for damages of any kind whatsoever for what ever reason.
''  5. Permission is NOT granted for the use of author's name or company name in advertising or publicity relating to this software
''     or products derived from
''  6. If any part of the source code for this software is distributed, then this usage must be included,with this copyright and
''     no-warranty notice unaltered; and any additions, deletions, or changes to the original files must be clearly indicated in
''     accompanying documentation.
''  7. We specifically permit and encourage the use of this software as the basis of commercial products, provided that all warranty
''     or liability claims are assumed by you
''  8. We do not offer to nor will we be required to support or maintain the software.
''  9. You assume full responsibility in requesting permission to use and if required you assume the full cost and effort in re-licensing
''     any third party components that may or may not be used by the software.
''
''
'' " Redistribution and use in source and binary forms, with or without
''   modification, are permitted without fee provided that the following
''   conditions are agreed and met:
''   * Redistributions of source code must retain the above copyright
''     notice, this list of conditions and the following disclaimer.
''   * Redistributions in binary form must reproduce the above copyright
''     notice, this list of conditions and the following disclaimer in
''     the documentation and/or other materials provided with the
''     distribution.
''   * Neither the name of Network Printing Solutions,its Subsidiary(-ies)
''     and/or its assigness nor the names of its contributors may be used to
''     endorse or promote products derived from this software without specific
''     prior written permission.
''
'' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
'' "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
'' LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
'' A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
'' OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
'' SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
'' LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
'' DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
'' THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
'' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
'' OF OR THE INABLITY TO USE THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
'' OF SUCH DAMAGE."
''
''****************************************************************************/
Option Explicit

Declare Sub Sleep Lib "KERNEL32" (ByVal dwMilliseconds As Long)
Declare Function LoadLibrary Lib "KERNEL32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Declare Function FreeLibrary Lib "KERNEL32" (ByVal hLibModule As Long) As Long
Private Declare Sub InitCommonControls Lib "Comctl32.dll" ()
Private Declare Function SetErrorMode Lib "KERNEL32" (ByVal wMode As Long) As Long
Private Const SEM_FAILCRITICALERRORS = &H1
Private Const SEM_NOGPFAULTERRORBOX = &H2
Private Const SEM_NOOPENFILEERRORBOX = &H8000
Public m_hMod As Long
Public SkinOb As New SKINCRAFTERLib.SCSkin2
Private m_bInIDE As Boolean
Public ArgArray() As String

Public Sub Main()

    Set gObjIni = New obj_IniSettings
    gAppIniPath = App.Path & "\Docugate.ini"
    gAppTraceFolder = App.Path & "\DebugTrace"
    
    '11/17/2010
    '' if no .ini file then display message and exit
    
    If Dir(gAppIniPath) = "" Then
     '' no  ini file located
     Dim ErrMsg As String
     ErrMsg = "The .ini file could not be located" & vbCrLf & gAppIniPath & vbCrLf & "Realtime Administrator will exit"
     MsgBox (ErrMsg)
     Exit Sub
    End If
    
  '' 11/17/2010 removed causes the .ini to be empty
  ''  Call CreateIniSectionsIfMissing
    
    gObjIni.ReadIniSetting ("DATABASE")
    gObjIni.ReadIniSetting ("GENERAL")
    gObjIni.ReadIniSetting ("TITLE-BAR-ICONS")
    gComputername = uct(Environ$("COMPUTERNAME"))
    
    '// if the server name is not specified, assume the SQL instance is installed locally on the workstation
    If CurrentDatabase.servername = "" Then
        CurrentDatabase.servername = gComputername & "\DOCUGATE"
        Call gObjIni.WriteIniSetting(gAppIniPath, "DATABASE", "SERVER", "S", CurrentDatabase.servername)
    End If
    
    m_hMod = LoadLibrary("shell32.dll")
    InitCommonControls
        
    gAppName = App.title
    gAppVersion = App.ProductName & " Version: " & App.Major & "." & App.Minor & "." & App.Revision
    gVersion = App.Major & "." & App.Minor & "." & App.Revision
    
    Set gObjDBConn = New obj_DBConnection
    
    '// debug settings
    'If gDevMode = True Then
    '    gReportsGUIDWidth = 64
    'Else
    '    gReportsGUIDWidth = 0
    'End If
    
    If (gObjDBConn.ConnectDB = False) Then
          MsgBox gObjDBConn.mLastError, vbExclamation + vbOKOnly, "Error"
          Call UnloadApp
    Else
            
            '''''''''''''''''''''''''''''''''''''''''''''''
            '' 303 add for the computername index and view'
            '''''''''''''''''''''''''''''''''''''''''''''''
            RunSQL ("CREATE INDEX idx_docugate_general_activity_computername on [dbo].[docugate_general_activity](COMPUTERNAME)")
            RunSQL ("CREATE VIEW [dbo].[docugate_computername_view] AS SELECT DISTINCT(COMPUTERNAME) FROM [dbo].[docugate_general_activity]")
                        
            Set gObjAccountMngr = New obj_AccountMngr
            Set gObjOuMngr = New obj_OUMngr
            Set gObjClientMngr = New obj_ClientMngr
            Set gObjMatterMngr = New obj_MatterMngr
            Set gObjLogonMngr = New obj_LogonMngr
            
            '//lynette - new classes
            Set gObjCtrlParams = New obj_CtrlParams
            Set gObjCtrlUnitMngr = New obj_CtrlUnitMngr
            
'            Set gClsReports = New obj_Reports
            Set gObjGlobals = New obj_Globals
            Set gObjSpc = New obj_spc
            Set gObjConsoleTasks = New obj_ConsoleTasks

            '//17/06/2008 - add the DebugTrace folder and move all debug and logs files into this subfolder
            Call CreateAppFolders
            
            '// The list of terminal types are in the ini file
            '// temp fix - only for administrator, won't work for concurrent use - sort out later
            gObjIni.ReadIniSetting ("TYPE-OF-TERMINAL")
            Call FixTypeOfTerminal
            '//
            
            '// ver 3.0.4
            Set gObjFormEvent = New obj_FormEvent
            '// ver 3.0.4
            
            
            If gDevMode = True Then Open gAppTraceFolder & "\TraceLog.txt" For Output As #99
            
            Dim f As New Frm_Main
            f.Caption = gAppName & " " & gVersion
            f.Hide
            Set f = Nothing
    End If
    gMonitorStats = True
End Sub

Private Sub CreateAppFolders()
On Error GoTo Err_Handler

    If gFSObj.FolderExists(App.Path & "\Database\Backups") = False Then
        Call CreateFolder(App.Path & "\Database\Backups")
    End If
    If gFSObj.FolderExists(App.Path & "\Database\Scripts") = False Then
        Call CreateFolder(App.Path & "\Database\Scripts")
    End If
    If gFSObj.FolderExists(App.Path & "\Database\Exports") = False Then
        Call CreateFolder(App.Path & "\Database\Exports")
    End If
    
    '//17/06/2008 - move the debug files into a debug folder
    On Error Resume Next
    If gFSObj.FolderExists(gAppTraceFolder) = False Then CreateFolder (gAppTraceFolder)
    If Err.Number = 0 Then
        ClearFolder (gAppTraceFolder)
    Else
        gAppTraceFolder = App.Path
    End If
    Err.Clear
    '// end of new code
    
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Public Function LogTrace(msg As String, Optional PrintBlankLineAfter As Boolean)
'//17/06/2008 - added this function
    Print #99, Format(Now, "yyyy-mm-dd HH:nn:ss") & "." & Right(Format(Timer, "#0.000"), 3) & Space(2) & msg
    If PrintBlankLineAfter Then
        Print #99, Format(Now, "yyyy-mm-dd HH:nn:ss") & "." & Right(Format(Timer, "#0.000"), 3)
    End If
End Function

Public Sub UnloadApp()
      
   Set gObjDBConn = Nothing
   Set gObjAccountMngr = Nothing
   Set gObjOuMngr = Nothing
   Set gObjClientMngr = Nothing
   Set gObjMatterMngr = Nothing
   Set gObjLogonMngr = Nothing
   
   'If Not InIDE() Then
   '   SetErrorMode SEM_NOGPFAULTERRORBOX
   'End If
   
   If gDevMode = True Then Close #99
   End
End Sub

Public Property Get InIDE() As Boolean
   Debug.Assert (IsInIDE())
   InIDE = m_bInIDE
End Property

Private Function IsInIDE() As Boolean
   m_bInIDE = True
   IsInIDE = m_bInIDE
End Function

'//
Public Function TranDesc(Tran As Integer) As String
    If Tran = 1 Then
        TranDesc = "Add"
    ElseIf Tran = 2 Then
        TranDesc = "Update"
    ElseIf Tran = 3 Then
        TranDesc = "Delete"
    ElseIf Tran = 4 Then
        TranDesc = "View"
    End If
End Function

Public Sub CentreForm(FormName As Form)
    FormName.Left = Screen.Width / 2 - FormName.Width / 2
    FormName.Top = Screen.Height / 2 - FormName.Height / 2
End Sub

Public Function FixTypeOfTerminal()
    gConn.Execute ("Delete from dbo.docugate_static_terminaltype")
    
    If Trim(gTerminalTypes(1)) = "" Then gTerminalTypes(1) = "SmartCopy"
    If Trim(gTerminalTypes(2)) = "" Then gTerminalTypes(2) = "SmartMCR"
    If Trim(gTerminalTypes(3)) = "" Then gTerminalTypes(3) = "SmartRelease"
    
    Dim i As Integer
    For i = 1 To 3
        Call gConn.Execute("insert into docugate_static_terminaltype values (" & Str(i) & ",'" & gTerminalTypes(i) & "')")
    Next i
End Function


Sub LoadResStrings(frm As Form)
  On Error Resume Next

  Dim ctl As Control
  Dim obj As Object
  Dim fnt As Object
  Dim sCtlType As String
  Dim nVal As Integer

  'Festlegen des Formulartitels
  frm.Caption = LoadResString(CInt(frm.Tag))
  
  'Festlegen der Schriftart
  Set fnt = frm.Font
  fnt.Name = LoadResString(20)
  fnt.Size = CInt(LoadResString(21))
  
  'Festlegen der Steuerelementbeschriftungen
  'Für Menübefehle wird die Caption-Eigenschaft
  'und für alle anderen Steuerelemente die Tag-
  'Eigenschaft verwendet.
  For Each ctl In frm.Controls
    Set ctl.Font = fnt
    sCtlType = TypeName(ctl)
    If sCtlType = "Label" Then
      ctl.Caption = LoadResString(CInt(ctl.Tag))
    ElseIf sCtlType = "Menu" Then
      ctl.Caption = LoadResString(CInt(ctl.Caption))
      '--- MsgBox ctl.Caption
    ElseIf sCtlType = "TabStrip" Then
      For Each obj In ctl.Tabs
        obj.Caption = LoadResString(CInt(obj.Tag))
        obj.ToolTipText = LoadResString(CInt(obj.ToolTipText))
      Next
    ElseIf sCtlType = "Toolbar" Then
      For Each obj In ctl.Buttons
        obj.ToolTipText = LoadResString(CInt(obj.ToolTipText))
      Next
    ElseIf sCtlType = "ListView" Then
      For Each obj In ctl.ColumnHeaders
        obj.Text = LoadResString(CInt(obj.Tag))
      Next
    Else
      nVal = 0
      nVal = Val(ctl.Tag)
      If nVal > 0 Then ctl.Caption = LoadResString(nVal)
      nVal = 0
      nVal = Val(ctl.ToolTipText)
      If nVal > 0 Then ctl.ToolTipText = LoadResString(nVal)
    End If
  Next

End Sub

Public Function CreateIniSectionsIfMissing()

    If gFSObj.FileExists(gAppIniPath) = False Then
        Dim Comments As String
        Comments = "Ini file recreated from CreateIniSectionsIfMissing() on " & Format(Date, "mm/dd/yyyy hh:mm")
        
        Call gObjIni.WriteIniSetting(gAppIniPath, "GENERAL", "COMMENTS", "", Comments)
        Call gObjIni.WriteIniSetting(gAppIniPath, "GENERAL", "DevMode", "", "0")
        Call gObjIni.WriteIniSetting(gAppIniPath, "DATABASE", "SERVER", "", "")
        Call gObjIni.WriteIniSetting(gAppIniPath, "DATABASE", "SCHEMA", "", "DOCUGATE")
        Call gObjIni.WriteIniSetting(gAppIniPath, "DATABASE", "MSDE", "", "1")
        
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "OU", "", "1")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "ACCOUNT", "", "1")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "CLIENT", "", "1")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "CTRLUNIT", "", "1")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "REPORTS", "", "1")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "CASHIER", "", "1")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "CONSOLE", "", "1")
        
        Call gObjIni.WriteIniSetting(gAppIniPath, "TYPE-OF-TERMINAL", "TYPE1", "", "SmartCopy")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TYPE-OF-TERMINAL", "TYPE2", "", "SmartMCR")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TYPE-OF-TERMINAL", "TYPE3", "", "SmartRelease")
        
        Call gObjIni.WriteIniSetting(gAppIniPath, "MCR-STATIONS", "MISSING", "", "")
    Else
        Call gObjIni.WriteIniSetting(gAppIniPath, "HANDLERS", "MISSING", "", "")
        Call gObjIni.WriteIniSetting(gAppIniPath, "READER", "MISSING", "", "")
        Call gObjIni.WriteIniSetting(gAppIniPath, "DATABASE", "MISSING", "", "")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TITLE-BAR-ICONS", "MISSING", "", "")
        Call gObjIni.WriteIniSetting(gAppIniPath, "TYPE-OF-TERMINAL", "MISSING", "", "")
    End If

    Dim BufferData As String
    BufferData = LoadFileStrIntoBuffer(gAppIniPath)
    BufferData = Replace(BufferData, "MISSING=", "")
    '//rewrite the ini file
    Call DumpBufferIntoFileStr(BufferData, gAppIniPath)
    
    Call gObjIni.Clean_ini_file
End Function



