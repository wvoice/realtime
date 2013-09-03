VERSION 5.00
Begin VB.Form Frm_Groups 
   Caption         =   "DocuGate OU's"
   ClientHeight    =   4425
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11070
   Icon            =   "Frm_Groups.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   4425
   ScaleWidth      =   11070
   Begin VB.PictureBox FRAME_OU 
      BackColor       =   &H00E0E0E0&
      Height          =   4035
      Left            =   5670
      ScaleHeight     =   3975
      ScaleWidth      =   5205
      TabIndex        =   1
      Top             =   180
      Width           =   5265
      Begin VB.Label Label1 
         Caption         =   "Label1"
         Height          =   285
         Left            =   210
         TabIndex        =   2
         Top             =   300
         Width           =   2535
      End
   End
   Begin VB.Timer RefreshList 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   840
      Top             =   3570
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
      Height          =   4065
      Left            =   150
      ScaleHeight     =   4005
      ScaleWidth      =   5325
      TabIndex        =   0
      Top             =   150
      Width           =   5385
   End
End
Attribute VB_Name = "Frm_Groups"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
   ' Me.VB2_SkinCtrl1.ActivateSkin
    RefreshList.Enabled = True
End Sub

Private Sub Form_Resize()
    
    On Error Resume Next
    
    Me.ctList.Left = 0
    Me.ctList.Top = 0
    Me.ctList.Width = Me.Width / 2
    Me.ctList.Height = Me.Height - 550
    
    Me.FRAME_OU.Top = 0
    Me.FRAME_OU.Left = Me.ctList.Width + 10
    Me.FRAME_OU.Height = Me.Height - 550
    Me.FRAME_OU.Width = (Me.Width / 2) - 400
   

End Sub

Private Sub RefreshList_Timer()
    Dim Index As Long
    RefreshList.Enabled = False
    Me.ctList.ClearList
    
    Dim ou As cls_ou
    For Each ou In MyOUs
        Index = ctList.AddItem(ou.mName)
        ctList.CellText(Index, 2) = ou.mSupervisor
        ctList.CellText(Index, 3) = ou.mCharge
        ctList.ListCargo(Index) = ou.mGuid
     Next ou

End Sub

