VERSION 5.00
Begin VB.Form frm_SelectTerminalType 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Select a Terminal Type"
   ClientHeight    =   2424
   ClientLeft      =   5256
   ClientTop       =   2112
   ClientWidth     =   3996
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2424
   ScaleWidth      =   3996
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Next 
      Caption         =   "&Next"
      Default         =   -1  'True
      Height          =   375
      Left            =   2520
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   1800
      Width           =   1092
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   1320
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   1800
      Width           =   1092
   End
   Begin VB.Frame Frame1 
      Height          =   1812
      Left            =   240
      TabIndex        =   5
      Top             =   120
      Width           =   3492
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   252
         Index           =   3
         Left            =   240
         TabIndex        =   2
         Top             =   1320
         Width           =   3012
      End
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   252
         Index           =   2
         Left            =   240
         TabIndex        =   1
         Top             =   840
         Width           =   3012
      End
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   252
         Index           =   1
         Left            =   240
         TabIndex        =   0
         Top             =   360
         Value           =   -1  'True
         Width           =   3012
      End
   End
End
Attribute VB_Name = "frm_SelectTerminalType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Next_Click()
    Dim i As Integer
    For i = 1 To 3
        If Me.optTermType(i).Value = True Then gClsCtrlUnitManager.TerminalType = i
    Next i
    Unload Me
End Sub

Private Sub Form_Load()

    '//initialize to a invalid value
    gClsCtrlUnitManager.TerminalType = 0
    
    Call CentreForm(Me)
    
    '// The list of terminal types are in the ini file
    gClsConfig.Get_ini ("TYPE-OF-TERMINAL")
    
    Dim i As Integer
    For i = 1 To 3
        Me.optTermType(i).Caption = gTerminalTypes(i)
    Next i
    
End Sub
