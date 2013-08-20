VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Object = "{396F7AC0-A0DD-11D3-93EC-00C0DFE7442A}#1.0#0"; "vbalIml6.ocx"
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Begin VB.Form frm_DBBackup 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Database Backup"
   ClientHeight    =   6090
   ClientLeft      =   1140
   ClientTop       =   2010
   ClientWidth     =   10815
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_DBBackup.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6090
   ScaleWidth      =   10815
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdExpand 
      Caption         =   "Expand &View"
      Height          =   375
      Left            =   7560
      TabIndex        =   11
      Top             =   5520
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.CommandButton cmdExportCSV 
      Caption         =   "CSV &Export"
      Height          =   375
      Left            =   6120
      TabIndex        =   10
      Top             =   5520
      Visible         =   0   'False
      Width           =   1335
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   9240
      TabIndex        =   9
      Top             =   5520
      Width           =   1335
   End
   Begin VB.Frame fraLastBackup 
      Caption         =   "Last Backup:"
      Height          =   3135
      Left            =   240
      TabIndex        =   7
      Top             =   2280
      Width           =   10335
      Begin VB.TextBox txtLatestBackupFile 
         Height          =   330
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   8
         Top             =   360
         Width           =   9855
      End
      Begin vbAcceleratorGrid6.vbalGrid DBBackupGrid 
         Height          =   2115
         Left            =   240
         TabIndex        =   12
         Top             =   840
         Width           =   9855
         _ExtentX        =   17383
         _ExtentY        =   3731
         BackgroundPictureHeight=   0
         BackgroundPictureWidth=   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   7.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DisableIcons    =   -1  'True
      End
   End
   Begin VB.Frame fraTitle 
      Caption         =   "Destination:"
      Height          =   1935
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   10335
      Begin VB.TextBox txtSelectedFolder 
         Height          =   330
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   0
         Top             =   315
         Width           =   8535
      End
      Begin VB.CommandButton Cmd_Process 
         Caption         =   "&Backup"
         Default         =   -1  'True
         Height          =   375
         Left            =   8880
         TabIndex        =   6
         Top             =   360
         Width           =   1215
      End
      Begin VB.CommandButton cmdRemoveFolder 
         Caption         =   "&Remove"
         Height          =   375
         Left            =   8880
         TabIndex        =   4
         ToolTipText     =   "Remove backup folder"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.ListBox lstBackupFolder 
         Height          =   960
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   8535
      End
      Begin VB.CommandButton cmdAddFolder 
         Caption         =   "&Add..."
         Height          =   375
         Left            =   8880
         TabIndex        =   2
         ToolTipText     =   "Add backup folder"
         Top             =   840
         Width           =   1215
      End
      Begin SCLABELLib.SCLabel lblProgress 
         Height          =   315
         Left            =   7800
         TabIndex        =   5
         Top             =   0
         Visible         =   0   'False
         Width           =   2325
         _Version        =   65536
         _ExtentX        =   4101
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Backup in progress..."
         Alignment       =   3
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin vbalIml6.vbalImageList ilsTitleIcons 
      Left            =   5040
      Top             =   4320
      _ExtentX        =   953
      _ExtentY        =   953
      ColourDepth     =   32
      Size            =   11480
      Images          =   "frm_DBBackup.frx":5872
      Version         =   131072
      KeyCount        =   10
      Keys            =   "ÿÿÿÿÿÿÿÿÿ"
   End
End
Attribute VB_Name = "frm_DBBackup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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

Private m_Processing As Boolean
Dim mBackupPaths() As String
Dim mBackupPathsCnt As Long

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()

On Error GoTo Err_Handler
 
   If Me.txtSelectedFolder = "" Then
       MsgBox "Click on the Add folder button to add a backup folder on the database server!", vbExclamation + vbOKOnly, "Missing Folder"
       Exit Sub
   End If
   
   If Mid(uct(Me.txtSelectedFolder), 1, 7) = "C:\TEMP" Then
       MsgBox "Do not select a temporary folder as a backup folder!", vbExclamation + vbOKOnly, "Invalid Folder"
       Exit Sub
   End If
   
   If IsValidLongFilename(Me.txtSelectedFolder.Text) = False Then
       MsgBox "Invalid folder name!", vbExclamation + vbOKOnly, "Invalid Folder"
       Exit Sub
   End If
   
   If MsgBox("Backup databases?", vbQuestion + vbYesNo, "Backup") = vbNo Then Exit Sub
   
   Dim sql As String
   If gFSObj.FolderExists(txtSelectedFolder.Text) = False Then
         Call CreateFolder(txtSelectedFolder.Text)
   End If
   
   m_Processing = True
   Screen.MousePointer = vbHourglass
   lblProgress.Visible = True
   DoEvents
   
   sql = "backup database DOCUGATE to disk " _
    & " = '" & Me.txtSelectedFolder & "\DOCUGATE_FULL_" & Format(Now(), "YYYYMMDD-HHMMSS") & ".BAK' With Init"
   Call gConn.Execute(sql)
    
   sql = "backup database ADMIN to disk " _
    & " = '" & Me.txtSelectedFolder & "\ADMIN_FULL_" & Format(Now(), "YYYYMMDD-HHMMSS") & ".BAK' With Init"
   Call gConn.Execute(sql)
   
   Screen.MousePointer = vbNormal
   Me.Cmd_Cancel.Caption = "&Close"
   MsgBox "Backup completed successfully!", vbExclamation + vbOKOnly, "Backup"
   
   Call RefreshBackupLog
   Call WritePrivateProfileString("DATABASE-BACKUPS", "LATEST-BACKUP-FILE", Me.txtLatestBackupFile.Text, gAppIniPath)
   Call WritePrivateProfileString("DATABASE-BACKUPS", "LATEST-BACKUP-DATE", Me.fraLastBackup.Caption, gAppIniPath)
   
   lblProgress.Visible = False
   m_Processing = False
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
   Screen.MousePointer = vbNormal
   MsgBox "010-" & gcOperCodeDBBackup & Err.Description, vbCritical + vbOKOnly, "Error"
   m_Processing = False
   lblProgress.Visible = False
End Sub

Private Sub cmdAddFolder_Click()

On Error GoTo Err_Handler

    Dim sFolderName As String
    sFolderName = BrowseFolder(Me.hwnd, "Select a backup folder")
    If StrPtr(sFolderName) = 0 Or Trim(sFolderName) = vbNullString Then Exit Sub
        If UCase(Right(sFolderName, 8)) = "RECYCLED" _
        Or UCase(Right(sFolderName, 7)) = "DESKTOP" _
        Or Len(sFolderName) <= 3 Then
        MsgBox "Cannot specify this type of folder" & vbCrLf & sFolderName, vbCritical + vbOKOnly, App.title
        Exit Sub
    ElseIf CheckIfFolderIsSystem(sFolderName) = True Then
        MsgBox "Cannot specify this type of folder" & vbCrLf & sFolderName, vbCritical + vbOKOnly, App.title
        Exit Sub
    End If
   
    txtSelectedFolder.Text = sFolderName
    
    If IsItemInComboList(Me.lstBackupFolder, txtSelectedFolder.Text, False, "") = False Then
        Me.lstBackupFolder.AddItem txtSelectedFolder.Text
        Call SetComboListItem(txtSelectedFolder.Text, Me.lstBackupFolder)
    Else
        Me.lstBackupFolder.ListIndex = 0
    End If
    Me.Cmd_Cancel.Caption = "&Close"
    Exit Sub
    
Err_Handler:
    MsgBox "010-" & gcOperCodeDBAddBackupFolder & Err.Description, vbCritical + vbOKOnly, "Error"
    
End Sub

Private Sub cmdRemoveFolder_Click()

On Error GoTo Err_Handler

    If Me.lstBackupFolder.ListIndex = -1 Or Me.lstBackupFolder.ListCount = 0 Then
        Me.txtSelectedFolder.Text = ""
        Exit Sub
    End If
    lstBackupFolder.RemoveItem lstBackupFolder.ListIndex
    
    If Me.lstBackupFolder.ListCount > 0 Then
        Me.lstBackupFolder.ListIndex = 0
        Me.txtSelectedFolder.Text = lstBackupFolder.List(lstBackupFolder.ListIndex)
    Else
        Me.txtSelectedFolder.Text = ""
    End If
    
    Me.Cmd_Cancel.Caption = "&Close"
    Exit Sub
    
Err_Handler:
    MsgBox "010-" & gcOperCodeDBDelBackupFolder & Err.Description, vbCritical + vbOKOnly, "Error"
    
End Sub

Private Sub DBBackupGrid_ColumnClick(ByVal lCol As Long)

Dim sTag As String
Dim i As Long
      
   With DBBackupGrid.SortObject
      .Clear
      .SortColumn(1) = lCol
   
      sTag = DBBackupGrid.ColumnTag(lCol)
      If (sTag = "") Then
         sTag = "DESC"
         .SortOrder(1) = CCLOrderAscending
      Else
         sTag = ""
         .SortOrder(1) = CCLOrderDescending
      End If
      DBBackupGrid.ColumnTag(lCol) = sTag
   
      Select Case DBBackupGrid.ColumnKey(lCol)
      Case "file", "col8"
         ' sort by icon:
         .SortType(1) = CCLSortIcon
      Case "date"
         ' sort by date:
         .SortType(1) = CCLSortDate
      Case Else
         ' sort by text:
         .SortType(1) = CCLSortString
      End Select
   End With
   Screen.MousePointer = vbHourglass
   DBBackupGrid.Sort
   Screen.MousePointer = vbDefault
   
End Sub

Private Sub Form_Load()

On Error GoTo Err_Handler

    Call CentreForm(Me)
    
    Me.Caption = Me.Caption & " for database server:  " & CurrentDatabase.servername
    
    Dim i As Integer
    Dim Keyword As String
    Dim strPath As String
    Dim Buffer As String * 255
    Buffer = Space(255)
    Me.DBBackupGrid.ImageList = ilsTitleIcons.hIml
    
    i = 0
    strPath = "xxx"
    While Trim(strPath) <> ""
        i = i + 1
        Keyword = "Path-" & Trim(Str(i))
        Call GetPrivateProfileString("DATABASE-BACKUPS", Keyword, "", Buffer, 255, gAppIniPath)
        strPath = Left(Buffer, InStr(Buffer, Chr(0)) - 1)
        If strPath <> "" Then Me.lstBackupFolder.AddItem strPath
    Wend
    
    mBackupPathsCnt = i
    ReDim mBackupPaths(mBackupPathsCnt)
    i = 0
    strPath = "xxx"
    While Trim(strPath) <> ""
        i = i + 1
        Keyword = "Path-" & Trim(Str(i))
        Call GetPrivateProfileString("DATABASE-BACKUPS", Keyword, "", Buffer, 255, gAppIniPath)
        strPath = Left(Buffer, InStr(Buffer, Chr(0)) - 1)
        If strPath <> "" Then mBackupPaths(i) = strPath
    Wend

    If Me.lstBackupFolder.ListCount > 0 Then Me.lstBackupFolder.ListIndex = 0
    Call RefreshBackupLog
    Exit Sub
    
Err_Handler:
    MsgBox "010-" & gcOperCodeShowDetail & Err.Description, vbCritical + vbOKOnly, "Error"
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

On Error GoTo Err_Handler

    Dim i As Integer
    Dim Keyword As String
    
    For i = 0 To mBackupPathsCnt
        Keyword = "Path-" & Trim(Str(i + 1))
        Call WritePrivateProfileString("DATABASE-BACKUPS", Keyword, "", gAppIniPath)
    Next i
     
    For i = 0 To Me.lstBackupFolder.ListCount - 1
        Keyword = "Path-" & Trim(Str(i + 1))
        Call WritePrivateProfileString("DATABASE-BACKUPS", Keyword, Me.lstBackupFolder.List(i), gAppIniPath)
    Next i
    Exit Sub
    
Err_Handler:
    MsgBox "010-" & gcOperCodeUnloadDetail & Err.Description, vbCritical + vbOKOnly, "Error"
    
End Sub

Private Sub RefreshBackupLog()

On Error GoTo Err_Handler

   With DBBackupGrid
      .Redraw = False
      '.ImageList = ilsIcons
      .RowMode = True
      .MultiSelect = True
      .DefaultRowHeight = 18
      .HeaderFlat = True
      .SetHeaders
      .Redraw = True
   End With
   Call Mod_MainGrid.GridReset(DBBackupGrid)
   Call Mod_MainGrid.GridDBBackupLogSetup(Me.DBBackupGrid)
   
   Me.fraLastBackup.Caption = "The last backup as at: " & nchk(gObjConsoleTasks.GetLastBackupDate)
   Me.txtLatestBackupFile.Text = nchk(gObjConsoleTasks.GetLastBackupFile)
   Exit Sub
   
Err_Handler:
    MsgBox "010-" & gcOperCodeRefreshGridView & Err.Description, vbCritical + vbOKOnly, "Error"
       
End Sub

Private Sub lstBackupFolder_Click()

    If lstBackupFolder.ListCount = 0 Then
        Me.txtSelectedFolder.Text = ""
    ElseIf lstBackupFolder.ListIndex = -1 Then
         Me.txtSelectedFolder.Text = ""
    Else
        Me.txtSelectedFolder.Text = lstBackupFolder.List(lstBackupFolder.ListIndex)
    End If
    
End Sub

Private Sub txtLatestBackupFile_Change()
    txtLatestBackupFile.ToolTipText = txtLatestBackupFile.Text
End Sub

Private Sub txtSelectedFolder_Change()
    txtSelectedFolder.ToolTipText = txtSelectedFolder.Text
End Sub

Private Sub txtSelectedFolder_lostfocus()
    txtSelectedFolder.Text = Trim(txtSelectedFolder.Text)
End Sub
