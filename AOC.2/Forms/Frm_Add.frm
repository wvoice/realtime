VERSION 5.00
Begin VB.Form Frm_Add 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Add Station"
   ClientHeight    =   2610
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4455
   Icon            =   "Frm_Add.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2610
   ScaleWidth      =   4455
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.ComboBox cbm_KeyBoard 
      Height          =   315
      ItemData        =   "Frm_Add.frx":6852
      Left            =   2160
      List            =   "Frm_Add.frx":685C
      TabIndex        =   3
      Text            =   "NUMBER"
      Top             =   1230
      Width           =   2175
   End
   Begin VB.TextBox txtPulse 
      Height          =   285
      Left            =   2160
      TabIndex        =   4
      Text            =   "10"
      Top             =   1560
      Width           =   2175
   End
   Begin VB.CommandButton Cmd_Close 
      Caption         =   "&Close"
      Height          =   375
      Left            =   2160
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   2040
      Width           =   1020
   End
   Begin VB.CommandButton Cmd_Add 
      Caption         =   "&Add"
      Default         =   -1  'True
      Height          =   375
      Left            =   3330
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   2040
      Width           =   1005
   End
   Begin VB.TextBox txtReset 
      Height          =   315
      Left            =   2160
      TabIndex        =   2
      Text            =   "60"
      Top             =   900
      Width           =   2175
   End
   Begin VB.TextBox txtPort 
      Height          =   315
      Left            =   2160
      TabIndex        =   1
      Text            =   "1070"
      Top             =   570
      Width           =   2175
   End
   Begin VB.TextBox txtIP 
      Height          =   315
      Left            =   2160
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Keyboard Mode:"
      Height          =   255
      Left            =   240
      TabIndex        =   11
      Top             =   1260
      Width           =   1575
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Pulse Idle (Minutes)"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   1590
      Width           =   1575
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Connection Reset:"
      Height          =   255
      Left            =   240
      TabIndex        =   7
      Top             =   930
      Width           =   1575
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Port #:"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   570
      Width           =   1575
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "IP Address:"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   1575
   End
End
Attribute VB_Name = "Frm_Add"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Cmd_Add_Click()

Dim Line As String
Line = txtIP & ";" & txtPort & ";" & txtReset & ";0;0;" & cbm_KeyBoard.Text & ";" & txtPulse & ";0"

Open MyStationsPath For Append As #1
          Print #1, Line
Close #1

Frm_Main.RefreshGrid
Frm_Main.ctStatus.Caption = txtIP & " Added.!"

txtIP.Text = ""
txtIP.SetFocus

DoEvents

End Sub

Private Sub Cmd_Close_Click()
Unload Me
End Sub
