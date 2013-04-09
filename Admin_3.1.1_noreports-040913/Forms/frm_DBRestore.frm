VERSION 5.00
Object = "{B1530FCE-BAD8-11D4-A85D-0080C8DFC881}#3.0#0"; "ctRadio.ocx"
Object = "{396F7AC0-A0DD-11D3-93EC-00C0DFE7442A}#1.0#0"; "vbalIml6.ocx"
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frm_DBRestore 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Database Restore"
   ClientHeight    =   5880
   ClientLeft      =   2430
   ClientTop       =   3255
   ClientWidth     =   10080
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_DBRestore.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5880
   ScaleWidth      =   10080
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Restore"
      Default         =   -1  'True
      Height          =   375
      Left            =   8400
      TabIndex        =   4
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7080
      TabIndex        =   1
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Frame fraTitle 
      Caption         =   "Restore the database from:"
      Height          =   5535
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   9615
      Begin VB.Frame Frame1 
         Caption         =   "# of active connections:"
         Height          =   975
         Left            =   0
         TabIndex        =   6
         Top             =   4560
         Width           =   3015
         Begin VB.TextBox txtNoProcs 
            Alignment       =   2  'Center
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   330
            Left            =   240
            Locked          =   -1  'True
            TabIndex        =   8
            Text            =   "0"
            Top             =   360
            Width           =   855
         End
         Begin VB.CommandButton cmdKill 
            Caption         =   "&Terminate all"
            Height          =   375
            Left            =   1200
            TabIndex        =   7
            Top             =   360
            Width           =   1575
         End
      End
      Begin VB.Timer Timer1 
         Interval        =   100
         Left            =   8760
         Top             =   1200
      End
      Begin VB.TextBox txtLatestBackupFile 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   1680
         Width           =   9135
      End
      Begin vbAcceleratorGrid6.vbalGrid DBBackupGrid 
         Height          =   2475
         Left            =   240
         TabIndex        =   2
         Top             =   2040
         Width           =   9135
         _ExtentX        =   16113
         _ExtentY        =   4366
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
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   3960
         Top             =   3720
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin RadioLibCtl.ctRadio optDBSource 
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   10
         Top             =   1320
         Width           =   4815
         _Version        =   196608
         _ExtentX        =   8493
         _ExtentY        =   450
         _StockProps     =   70
         Caption         =   "Specify a backup...."
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PictureTrue     =   "frm_DBRestore.frx":5872
         PictureFalse    =   "frm_DBRestore.frx":588E
         BackImage       =   "frm_DBRestore.frx":58AA
         MouseIcon       =   "frm_DBRestore.frx":58C6
         Caption         =   "Specify a backup...."
      End
      Begin RadioLibCtl.ctRadio optDBSource 
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   11
         Top             =   360
         Width           =   3015
         _Version        =   196608
         _ExtentX        =   5318
         _ExtentY        =   450
         _StockProps     =   70
         Caption         =   "A backup in the history log"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PictureTrue     =   "frm_DBRestore.frx":58E2
         PictureFalse    =   "frm_DBRestore.frx":58FE
         BackImage       =   "frm_DBRestore.frx":591A
         MouseIcon       =   "frm_DBRestore.frx":5936
         ShowFocus       =   -1  'True
         Caption         =   "A backup in the history log"
      End
      Begin RadioLibCtl.ctRadio optDBSource 
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   12
         Top             =   840
         Width           =   4335
         _Version        =   196608
         _ExtentX        =   7646
         _ExtentY        =   450
         _StockProps     =   70
         Caption         =   "The latest backup"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         PictureTrue     =   "frm_DBRestore.frx":5952
         PictureFalse    =   "frm_DBRestore.frx":596E
         BackImage       =   "frm_DBRestore.frx":598A
         MouseIcon       =   "frm_DBRestore.frx":59A6
         Value           =   -1  'True
         Caption         =   "The latest backup"
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "Terminate all active processes before attempting to restore the database"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   3240
         TabIndex        =   9
         Top             =   4800
         Visible         =   0   'False
         Width           =   3375
      End
      Begin VB.Label lblProgress 
         Alignment       =   1  'Right Justify
         Caption         =   "Restore in progress......"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   6960
         TabIndex        =   5
         Top             =   4560
         Visible         =   0   'False
         Width           =   2535
      End
   End
   Begin vbalIml6.vbalImageList ilsTitleIcons 
      Left            =   240
      Top             =   4800
      _ExtentX        =   953
      _ExtentY        =   953
      ColourDepth     =   32
      Size            =   11480
      Images          =   "frm_DBRestore.frx":59C2
      Version         =   131072
      KeyCount        =   10
      Keys            =   "ÿÿÿÿÿÿÿÿÿ"
   End
End
Attribute VB_Name = "frm_DBRestore"
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

Private m_AdminDBConn As ADODB.Connection

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()
    
   If Len(Me.txtLatestBackupFile.Text) = 0 Then
        MsgBox "Specify the database backup to restore!", vbExclamation + vbOKOnly, "Error"
        Exit Sub
   End If
    
   If Len(Me.txtLatestBackupFile.Text) > 512 Then
        MsgBox "The path of the database backup may not exceed 512 characters!", vbExclamation + vbOKOnly, "Error"
        Exit Sub
   End If
   
   If Val(txtNoProcs) > 0 Then
        MsgBox "The database cannot be restored until all user connections have been terminated.  " _
        & " Click on on the 'Terminate' button force all user out of the database.", vbExclamation + vbOKOnly, "Warning"
        Exit Sub
   End If
    
   If RestoreFromBackup = True Then Unload Me

End Sub

Public Function ConnectToAdminDB() As Boolean
             
On Error GoTo Err_Handler
    
    gMonitorStats = False
    
    '// disconnect from the docugate database
    Call gObjDBConn.CloseDB
    '//Set gObjDBConn = Nothing
    Set gConn = Nothing
          
    gObjIni.ReadIniSetting ("DATABASE")
    ConnectToAdminDB = False
    
    If m_AdminDBConn Is Nothing Then
        Set m_AdminDBConn = New ADODB.Connection
    End If
        
    If m_AdminDBConn.State = adStateClosed Then
        m_AdminDBConn.CursorLocation = adUseClient
        With CurrentDatabase
           m_AdminDBConn.ConnectionString = "Provider=SQLOLEDB" & ";SERVER=" _
                & .servername & ";DATABASE=ADMIN;UID=" & .DBLogin & " ;PWD=" & .Password & ";"
        End With
       m_AdminDBConn.Open
    End If
       
    ConnectToAdminDB = True
    Exit Function

Err_Handler:
    MsgBox "010-" & gcOperCodeDBConnect & Err.Description, vbCritical + vbOKOnly, "Error"
     
End Function

Public Sub AdminCloseDB()

On Error Resume Next

    If m_AdminDBConn Is Nothing Then
        '//
    Else
        If m_AdminDBConn.State = adStateOpen Then
            m_AdminDBConn.Close
        End If
    End If
    Set m_AdminDBConn = Nothing
    
End Sub

Private Function RestoreFromBackup() As Boolean

On Error GoTo Err_Handler

    If ConnectToAdminDB = False Then Exit Function

    DoEvents
    
    Screen.MousePointer = vbHourglass
    DoEvents
    
    lblProgress.Visible = True
    DoEvents
    
    Dim mClsMSSQLDb As New obj_MSSQLDB
    
    Call mClsMSSQLDb.RestoreDatabaseFromFile(CurrentDatabase.servername, CurrentDatabase.DBName, _
        False, CurrentDatabase.DBLogin, CurrentDatabase.Password, txtLatestBackupFile.Text)
    
    Screen.MousePointer = vbNormal
    lblProgress.Visible = False
    DoEvents
    
    If mClsMSSQLDb.LastError <> "" Then
        MsgBox "The restore failed: " & mClsMSSQLDb.LastError, vbExclamation + vbOKOnly, "Error"
        Set mClsMSSQLDb = Nothing
        Exit Function
    End If
    
    Set mClsMSSQLDb = Nothing
    
    Me.Cmd_Cancel.Caption = "&Close"
    MsgBox "The restore completed successfully!", vbExclamation + vbOKOnly, "Database Restore"
    Screen.MousePointer = vbNormal
    
    If (gObjDBConn.ConnectDB = False) Then
        MsgBox "A connection to the DOCUGATE database failed: " & Err.Description
        Call Mod_Main.UnloadApp
        Exit Function
    End If
    
    gMonitorStats = True
    RestoreFromBackup = True
    
    Exit Function
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox "010-" & gcOperCodeDBRestore & Err.Description, vbCritical + vbOKOnly, "Error"
    Call Mod_Main.UnloadApp
    
On Error Resume Next
    Screen.MousePointer = vbNormal
    lblProgress.Visible = False
    DoEvents
    
End Function

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

Private Sub DBBackupGrid_DblClick(ByVal lRow As Long, ByVal lCol As Long)
    Call ShowSelectedFile
End Sub

Private Sub ShowSelectedFile()
     If DBBackupGrid.Rows > 0 Then
        If DBBackupGrid.SelectedRow = 0 Then
            Me.txtLatestBackupFile.Text = DBBackupGrid.CellText(1, 5)
        Else
            Me.txtLatestBackupFile.Text = DBBackupGrid.CellText(DBBackupGrid.SelectedRow, 5)
        End If
    Else
        txtLatestBackupFile.Text = ""
    End If
    optDBSource(1).Value = True
End Sub

Private Sub DBBackupGrid_KeyUp(KeyCode As Integer, Shift As Integer)
    ShowSelectedFile
End Sub

Private Sub DBBackupGrid_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    ShowSelectedFile
End Sub

Private Sub Form_Load()

On Error GoTo Err_Handler

    Call CentreForm(Me)
    
    Me.Caption = Me.Caption & " - database server:  " & CurrentDatabase.servername
    Me.txtLatestBackupFile.Text = nchk(gObjConsoleTasks.GetLastBackupFile)
    optDBSource(0).Value = True
    optDBSource(0).Caption = "The last backup as at: " & nchk(gObjConsoleTasks.GetLastBackupDate)
    Me.DBBackupGrid.ImageList = ilsTitleIcons.hIml

    Call RefreshBackupLog
    Timer1.Interval = 200
    Timer1.Enabled = True
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox "010-" & gcOperCodeLoadDetail & Err.Description, vbCritical + vbOKOnly, "Error"
    Call Mod_Main.UnloadApp
    
On Error Resume Next
    Screen.MousePointer = vbNormal
    lblProgress.Visible = False
    DoEvents
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
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox "010-" & gcOperCodeRefreshGridView & Err.Description, vbCritical + vbOKOnly, "Error"
End Sub

Private Sub GetBackupFile()
 
On Error GoTo Err_Handler
   
    optDBSource(2).Value = True

    With CommonDialog1
        .DialogTitle = "Database backup file *.bak"
        .CancelError = True
        .Flags = cdlOFNHideReadOnly
        .Flags = cdlOFNOverwritePrompt
        .Flags = cdlOFNPathMustExist
        .Flags = cdlOFNNoChangeDir
        .Filter = "All Files(*.bak)|*.bak"
        .FilterIndex = 1  '1 = Save and 2 = Open  'This is used to specify which extension is displayed on top.
        .DefaultExt = ".sql"
        .FileName = "DocuGate-Full-Bck.bak"
        .ShowOpen
    End With
    
    Me.txtLatestBackupFile.Text = CommonDialog1.FileName
    Exit Sub

Err_Handler:
    If Err.Number <> 32755 Then
        MsgBox "A backup file was not selected due to " & Err.Description, vbCritical + vbOKOnly, "Error"
    End If
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Call AdminCloseDB
End Sub

Private Sub optDBSource_Click(Index As Integer)
    If Index = 1 Then
        If Me.DBBackupGrid.Rows > 0 Then Me.DBBackupGrid.SelectedRow = 1
        ShowSelectedFile
    ElseIf Index = 0 Then
        If optDBSource(0).Value = True Then
            optDBSource(0).Caption = "The last backup as at: " & nchk(gObjConsoleTasks.GetLastBackupDate)
            Me.txtLatestBackupFile.Text = nchk(gObjConsoleTasks.GetLastBackupFile)
        End If
    ElseIf Index = 2 Then
        Call GetBackupFile
    End If
End Sub

Private Sub Timer1_Timer()
   Me.txtNoProcs.Text = GetCountActiveProcesses("DOCUGATE")
End Sub

Private Sub txtLatestBackupFile_Change()
    Me.txtLatestBackupFile.ToolTipText = gFSObj.GetFileName(txtLatestBackupFile.Text)
End Sub

Private Sub cmdKill_Click()
    Call KillActiveProcesses
End Sub

Public Function GetCountActiveProcesses(DatabaseName As String) As Long

On Error GoTo Err_Handler

    Dim rs As New ADODB.Recordset
    If gConn Is Nothing Then
        
        rs.Open "select count(*) from master.dbo.sysprocesses a " _
            & " join master.dbo.sysdatabases b on a.dbid = b.dbid and b.name = '" & DatabaseName _
                & "' and hostname <> '" & gComputername & "'", m_AdminDBConn, adOpenForwardOnly, adLockReadOnly
    Else
        rs.Open "select count(*) from master.dbo.sysprocesses a " _
            & " join master.dbo.sysdatabases b on a.dbid = b.dbid and b.name = '" & DatabaseName _
                & "' and hostname <> '" & gComputername & "'", gConn, adOpenForwardOnly, adLockReadOnly
    End If
 
    GetCountActiveProcesses = rs(0)
    rs.Close
    Exit Function
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox "010-" & gcOperCodeAdhocQuery & Err.Description, vbCritical + vbOKOnly, "Error"
    
End Function

Private Sub KillActiveProcesses()

On Error GoTo Err_Handler
    
    Dim rs As New ADODB.Recordset
    If gConn Is Nothing Then
       rs.Open "select spid from master.dbo.sysprocesses a " _
            & " join master.dbo.sysdatabases b on a.dbid = b.dbid where b.name = 'ADMIN' " _
            & " and hostname <> '" & gComputername & "'", m_AdminDBConn, adOpenForwardOnly, adLockReadOnly
    
           While rs.EOF = False
            On Error Resume Next
            m_AdminDBConn.Execute ("kill " & Str(rs(0)))
            If Err.Number = -2147217900 Then
                '//ok, cos not user process
                Err.Clear
            End If
            rs.MoveNext
       Wend
       rs.Close
       
    Else
         rs.Open "select spid from master.dbo.sysprocesses a " _
            & " join master.dbo.sysdatabases b on a.dbid = b.dbid where b.name = 'DOCUGATE' " _
            & " and a.hostname <> '" & gComputername & "'", gConn, adOpenForwardOnly, adLockReadOnly
    
         While rs.EOF = False
            On Error Resume Next
            gConn.Execute ("kill " & Str(rs(0)))
            If Err.Number = -2147217900 Then
                '//ok, cos not user process
                Err.Clear
            End If
            rs.MoveNext
       Wend
       rs.Close
    End If
    GetCountActiveProcesses ("DOCUGATE")
    Exit Sub
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox "010-" & gcOperCodeKillProcess & Err.Description, vbCritical + vbOKOnly, "Error"
        
End Sub


