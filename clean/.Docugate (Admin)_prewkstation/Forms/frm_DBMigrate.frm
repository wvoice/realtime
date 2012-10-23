VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frm_DBMigrate 
   AutoRedraw      =   -1  'True
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Migrate to another MS SQL Server instance"
   ClientHeight    =   6990
   ClientLeft      =   3270
   ClientTop       =   3375
   ClientWidth     =   9345
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_DBMigrate.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6990
   ScaleWidth      =   9345
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdClose 
      Cancel          =   -1  'True
      Caption         =   "&Close"
      Height          =   375
      Left            =   7920
      TabIndex        =   9
      Top             =   6480
      Width           =   1095
   End
   Begin VB.Frame Frame2 
      Caption         =   "Current Connection:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   120
      TabIndex        =   12
      Top             =   120
      Width           =   9015
      Begin VB.CommandButton cmd_LoginSecurity 
         Caption         =   "&Security"
         Height          =   375
         Left            =   6360
         TabIndex        =   3
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton cmd_Backup 
         Caption         =   "&Backup"
         Height          =   375
         Left            =   7680
         TabIndex        =   2
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txtCurrentConnection 
         BeginProperty Font 
            Name            =   "Lucida Console"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1290
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   0
         Top             =   240
         Width           =   6135
      End
      Begin VB.CommandButton cmd_ShowProperties 
         Caption         =   "&Properties"
         Height          =   375
         Left            =   6360
         TabIndex        =   1
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmd_Migrate 
         Caption         =   "&Migrate to..."
         Height          =   375
         Left            =   7680
         TabIndex        =   4
         Top             =   720
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Results:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   120
      TabIndex        =   11
      Top             =   4320
      Width           =   9015
      Begin RichTextLib.RichTextBox txtResults 
         Height          =   1935
         Left            =   120
         TabIndex        =   8
         Top             =   240
         Width           =   8775
         _ExtentX        =   15478
         _ExtentY        =   3413
         _Version        =   393217
         Enabled         =   -1  'True
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"frm_DBMigrate.frx":5872
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Lucida Console"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin VB.Frame fraExecuteSQL 
      Caption         =   "Execute SQL Statement:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2295
      Left            =   120
      TabIndex        =   10
      Top             =   1920
      Width           =   9015
      Begin VB.CommandButton cmdExecute 
         Caption         =   "&Execute"
         Height          =   375
         Left            =   7920
         TabIndex        =   6
         Top             =   240
         Width           =   975
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "C&lear"
         Height          =   375
         Left            =   7920
         TabIndex        =   7
         Top             =   720
         Width           =   975
      End
      Begin RichTextLib.RichTextBox txtExecuteSQL 
         Height          =   1935
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   7695
         _ExtentX        =   13573
         _ExtentY        =   3413
         _Version        =   393217
         Enabled         =   -1  'True
         TextRTF         =   $"frm_DBMigrate.frx":58F5
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Lucida Console"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
End
Attribute VB_Name = "frm_DBMigrate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim mClsSQLNS As cls_SQLNS

Private Sub cmd_Backup_Click()

On Error GoTo Err_Handler

    Screen.MousePointer = vbHourglass
    Call mClsSQLNS.BackupDB
    Screen.MousePointer = vbNormal
    Exit Sub
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description, vbCritical + vbOKOnly, "Error"

End Sub

Private Sub cmd_LoginSecurity_Click()

On Error GoTo Err_Handler

    Screen.MousePointer = vbHourglass
    Call mClsSQLNS.ShowLoginSecurity
    Screen.MousePointer = vbNormal
    Exit Sub
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description, vbCritical + vbOKOnly, "Error"
End Sub

Private Sub cmd_Migrate_Click()
 
On Error GoTo Err_Handler

    Screen.MousePointer = vbHourglass
    Call mClsSQLNS.ShowDataMigrate
    Screen.MousePointer = vbNormal
    Exit Sub
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description, vbCritical + vbOKOnly, "Error"
End Sub

Private Sub cmd_ShowProperties_Click()

On Error GoTo Err_Handler
    Screen.MousePointer = vbHourglass
    Call mClsSQLNS.ShowProperties
    Screen.MousePointer = vbNormal
    Exit Sub
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description, vbCritical + vbOKOnly, "Error"
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub cmdClear_Click()
On Error Resume Next
    txtExecuteSQL = ""
    txtResults = ""
End Sub

Private Sub cmdExecute_Click()

On Error GoTo Err_Handler
    Screen.MousePointer = vbHourglass
    Call mClsSQLNS.ExecuteSQL(Me.txtExecuteSQL, Me.txtResults)
    Screen.MousePointer = vbNormal
    Exit Sub
    
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description, vbCritical + vbOKOnly, "Error"
    
End Sub

Private Sub Form_Load()

   Call CentreForm(Me)
  
   Set mClsSQLNS = New cls_SQLNS
   Call mClsSQLNS.ConnectToDatabase
      mClsSQLNS.KeepDatabaseConnection = True

   
   Dim vTmp As Variant
   Dim i As Integer
   Dim iRet() As Integer
   Dim DispLine As String

   vTmp = Split(uct(ActiveDatabase.m_CONNECTIONSTRING), ";")

   ReDim iRet(UBound(vTmp))
   For i = 0 To UBound(vTmp)
        
        If Mid(vTmp(i), 1, 3) <> "PWD" Then
            DispLine = vTmp(i)
        Else
            DispLine = "PWD=******"
        End If
        
        If txtCurrentConnection.Text = "" Then
            txtCurrentConnection = DispLine
        Else
            txtCurrentConnection.Text = txtCurrentConnection.Text + vbCrLf + DispLine
        End If
   Next

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Call mClsSQLNS.DisconnectFromDatabase
    Set mClsSQLNS = Nothing
End Sub

