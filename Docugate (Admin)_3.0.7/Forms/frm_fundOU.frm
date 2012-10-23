VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_fundOU 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Fund OU Members"
   ClientHeight    =   5820
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6420
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5820
   ScaleWidth      =   6420
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Cmd_Close 
      Cancel          =   -1  'True
      Caption         =   "&Close"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4920
      TabIndex        =   22
      Top             =   5280
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "OU Name:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   120
      TabIndex        =   19
      Top             =   120
      Width           =   6110
      Begin VB.ComboBox frm_OU_Fund 
         Height          =   315
         ItemData        =   "frm_fundOU.frx":0000
         Left            =   2040
         List            =   "frm_fundOU.frx":0002
         Style           =   2  'Dropdown List
         TabIndex        =   23
         Top             =   0
         Width           =   3855
      End
      Begin VB.TextBox txt_Email 
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   480
         Width           =   3885
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   375
         Index           =   1
         Left            =   240
         TabIndex        =   21
         Top             =   480
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   661
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.74
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "First name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Adjust Fund Balance with:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   120
      TabIndex        =   12
      Top             =   1560
      Width           =   6110
      Begin VB.TextBox txt_Amount 
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
         Left            =   120
         TabIndex        =   18
         Top             =   300
         Width           =   1485
      End
      Begin VB.CommandButton cmdDebit 
         Caption         =   "&Debit"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   3720
         TabIndex        =   17
         Top             =   720
         Width           =   1095
      End
      Begin VB.CommandButton cmdCredit 
         Caption         =   "C&redit"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   4920
         TabIndex        =   16
         Top             =   720
         Width           =   1068
      End
      Begin VB.ComboBox cmb_Printers 
         Height          =   315
         ItemData        =   "frm_fundOU.frx":0004
         Left            =   2160
         List            =   "frm_fundOU.frx":0006
         TabIndex        =   15
         Text            =   "cmb_Printers"
         Top             =   1200
         Width           =   3855
      End
      Begin VB.CheckBox chk_Receipt 
         Caption         =   "Receipt Required:"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   1200
         Width           =   1815
      End
      Begin VB.ComboBox cbm_Transcode 
         Height          =   315
         ItemData        =   "frm_fundOU.frx":0008
         Left            =   1680
         List            =   "frm_fundOU.frx":000A
         TabIndex        =   13
         Text            =   "cbm_Transcode"
         Top             =   300
         Width           =   4335
      End
   End
   Begin VB.Frame Cash_Frame 
      Height          =   1750
      Left            =   120
      TabIndex        =   0
      Top             =   3360
      Width           =   6110
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.01"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   0
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.05"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   1
         Left            =   960
         TabIndex        =   10
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.10"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   2
         Left            =   1800
         TabIndex        =   9
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$.25"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   3
         Left            =   2640
         TabIndex        =   8
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$1.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   4
         Left            =   120
         TabIndex        =   7
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$5.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   5
         Left            =   960
         TabIndex        =   6
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$10.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   6
         Left            =   1800
         TabIndex        =   5
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$20.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   7
         Left            =   2640
         TabIndex        =   4
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$50.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   8
         Left            =   3480
         TabIndex        =   3
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$100.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   9
         Left            =   4320
         TabIndex        =   2
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton cmdReset 
         Caption         =   "&Reset"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Left            =   5160
         TabIndex        =   1
         Top             =   960
         Width           =   795
      End
   End
End
Attribute VB_Name = "frm_fundOU"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CashCmd_Click(Index As Integer)

End Sub

Private Sub Cmd_Close_Click()
Unload Me
End Sub

Private Sub cmdCredit_Click()

End Sub

Private Sub cmdDebit_Click()

End Sub

Private Sub cmdReset_Click()

End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    LoadComboFromSQL "SELECT OU_NAME FROM DOCUGATE_GENERAL_OU ORDER BY OU_NAME", Me.cbm_ous
End Sub

