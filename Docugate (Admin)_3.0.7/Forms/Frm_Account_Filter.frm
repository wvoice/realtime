VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_Account_Filter 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Account Filter"
   ClientHeight    =   2265
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7230
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2265
   ScaleWidth      =   7230
   Begin VB.CommandButton cmd_Close 
      Caption         =   "&Close"
      Height          =   375
      Left            =   5520
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   1800
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Caption         =   "Complete Filter Data:"
      Height          =   1575
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   6975
      Begin VB.ComboBox Combo1 
         Height          =   315
         ItemData        =   "Frm_Account_Filter.frx":0000
         Left            =   1440
         List            =   "Frm_Account_Filter.frx":0010
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   480
         Width           =   3855
      End
      Begin VB.CommandButton Cmd_ApplyFilter 
         Caption         =   "&Apply Filter"
         Default         =   -1  'True
         Height          =   375
         Left            =   5400
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   960
         Width           =   1455
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   3
         Top             =   480
         Width           =   855
         _Version        =   65536
         _ExtentX        =   1508
         _ExtentY        =   450
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Filter On:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin VB.TextBox txt_Firstname 
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         IMEMode         =   3  'DISABLE
         Left            =   1440
         MaxLength       =   50
         TabIndex        =   1
         ToolTipText     =   "Enter Filter Data"
         Top             =   960
         Width           =   3885
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   5
         Top             =   840
         Width           =   975
         _Version        =   65536
         _ExtentX        =   1720
         _ExtentY        =   450
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Filter Data:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
End
Attribute VB_Name = "Frm_Account_Filter"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_ApplyFilter_Click()

Mod_MainGrid.GridFilter (Frm_Main.MainGrid)

End Sub

Private Sub cmd_Close_Click()
  Unload Me
End Sub

Private Sub Form_Load()
 Call CentreForm(Me)
End Sub
