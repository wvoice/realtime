VERSION 5.00
Begin VB.Form Frm_CheckIn 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cashier"
   ClientHeight    =   5550
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5325
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   5550
   ScaleWidth      =   5325
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Frame2"
      Height          =   825
      Left            =   180
      TabIndex        =   1
      Top             =   90
      Width           =   5055
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   3165
      Left            =   180
      TabIndex        =   0
      Top             =   960
      Width           =   5085
   End
End
Attribute VB_Name = "Frm_CheckIn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Resize()
 On Error Resume Next
    SSCashierTab.Width = Me.Width - 400
    SSCashierTab.Height = Me.Height - 800
End Sub
