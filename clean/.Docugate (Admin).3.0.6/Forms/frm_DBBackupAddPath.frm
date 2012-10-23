VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frm_DBBackupAddPath 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Add Backup File"
   ClientHeight    =   2130
   ClientLeft      =   2970
   ClientTop       =   3765
   ClientWidth     =   9360
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_DBBackupAddPath.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2130
   ScaleWidth      =   9360
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7200
      TabIndex        =   3
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   5880
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Frame fraTitle 
      Caption         =   "Backup to destination path at the database server:"
      Height          =   1575
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   8775
      Begin VB.CommandButton cmdGetFile 
         Caption         =   "..."
         Height          =   375
         Left            =   8160
         TabIndex        =   4
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox txtBackupPath 
         Height          =   810
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   0
         Top             =   360
         Width           =   7935
      End
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   0
         Top             =   1320
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
   End
End
Attribute VB_Name = "frm_DBBackupAddPath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()
On Error GoTo Err_Handler
    If Trim(txtBackupPath.Text) = "" Then
        MsgBox "Specify the path on the database server!", vbExclamation + vbOKOnly, "Missing Path"
        txtBackupPath.SetFocus
        Exit Sub
    End If
    If gFSObj.FolderExists(txtBackupPath.Text) Then
        gDBBackupPathAdded = txtBackupPath.Text
    Else
        gDBBackupPathAdded = gFSObj.GetParentFolderName(txtBackupPath.Text)
    End If
    Unload Me
    Exit Sub
    
Err_Handler:
    MsgBox "The backup file was not selected: " & Err.Description, vbCritical + vbOKOnly, "Error"

End Sub

Private Sub cmdGetFile_click()
On Error GoTo Err_Handler

Dim Pathy, x As String
Pathy = Me.txtBackupPath.Text

'Firstly, check if the Folder exists. If not, then create it...
x = Dir(Pathy, 16)
If x = "" Then
    MkDir Pathy
Else
End If

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
    .FileName = "DOCUGATE-FULL-BCK.bak"
    .InitDir = Pathy
    .ShowSave
End With

txtBackupPath.Text = CommonDialog1.FileName
Exit Sub

Err_Handler:
    If Err.Number <> 32755 Then
        MsgBox "The backup file was not selected: " & Err.Description, vbCritical + vbOKOnly, "Error"
    End If
End Sub

Private Sub Form_Load()
    Me.fraTitle.Caption = Me.fraTitle.Caption & " " & ActiveDatabase.m_SERVER
    Call CentreForm(Me)
    gDBBackupPathAdded = ""
End Sub
