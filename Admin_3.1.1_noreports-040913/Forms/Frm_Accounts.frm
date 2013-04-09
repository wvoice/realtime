VERSION 5.00
Begin VB.Form Frm_Accounts 
   Caption         =   "DocuGate Accounts"
   ClientHeight    =   4185
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10200
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm_Accounts.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4185
   ScaleWidth      =   10200
   Begin VB.Timer RefreshList 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   960
      Top             =   3450
   End
   Begin VB.PictureBox ctList 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3015
      Left            =   90
      ScaleHeight     =   2955
      ScaleWidth      =   9915
      TabIndex        =   0
      Top             =   60
      Width           =   9975
   End
End
Attribute VB_Name = "Frm_Accounts"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
    RefreshList.Enabled = True
End Sub

Private Sub Form_Resize()
 On Error Resume Next
    Me.ctList.Left = 0
    Me.ctList.Top = 0
    Me.ctList.Width = Me.Width - 250
    Me.ctList.Height = Me.Height - 550
End Sub

Private Sub RefreshList_Timer()
    RefreshList.Enabled = False
    Me.ctList.ClearList
    gClsDatabase.Account_Refresh Me.ctList
End Sub
