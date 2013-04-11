VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_ECASHIER_detail 
   Caption         =   "Form1"
   ClientHeight    =   6030
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6285
   LinkTopic       =   "Form1"
   ScaleHeight     =   6030
   ScaleWidth      =   6285
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   " Account Badge/ID:"
      Height          =   5175
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   6015
      Begin VB.TextBox txt_ACC_EMAIL 
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
         Left            =   2280
         TabIndex        =   14
         Top             =   1800
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_PASSWORD 
         Enabled         =   0   'False
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
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   13
         Top             =   360
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_LASTNAME 
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
         Left            =   2280
         TabIndex        =   12
         Top             =   1080
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_FIRSTNAME 
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
         Left            =   2280
         TabIndex        =   11
         Top             =   720
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_BADGE 
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
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   10
         Top             =   0
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_FULLNAME 
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
         Left            =   2280
         TabIndex        =   9
         Top             =   1440
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_COPYID 
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
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   8
         Top             =   2340
         Width           =   3405
      End
      Begin VB.TextBox txt_ACC_COPYPIN 
         Enabled         =   0   'False
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
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   7
         Top             =   2700
         Width           =   3405
      End
      Begin VB.ComboBox Cbm_OU 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         ItemData        =   "frm_ECASHIER_detail.frx":0000
         Left            =   2280
         List            =   "frm_ECASHIER_detail.frx":0002
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   3600
         Width           =   3405
      End
      Begin VB.ComboBox Cbm_ACC_TYPE 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         ItemData        =   "frm_ECASHIER_detail.frx":0004
         Left            =   2280
         List            =   "frm_ECASHIER_detail.frx":000E
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         Top             =   3240
         Width           =   3405
      End
      Begin VB.Frame Frame3 
         Caption         =   "Account Options:"
         ForeColor       =   &H8000000E&
         Height          =   855
         Left            =   2280
         TabIndex        =   3
         Top             =   4080
         Width           =   3375
         Begin VB.CheckBox chk_Pin_Required 
            Caption         =   "Pin Required"
            ForeColor       =   &H8000000E&
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   480
            Visible         =   0   'False
            Width           =   1575
         End
         Begin VB.CheckBox chk_Enable_Acct_AVS 
            Caption         =   "Enable New Account"
            ForeColor       =   &H8000000E&
            Height          =   255
            Left            =   120
            TabIndex        =   4
            Top             =   240
            Visible         =   0   'False
            Width           =   2175
         End
      End
      Begin SCLABELLib.SCLabel lbl_ACC_FIRSTNAME 
         Height          =   315
         Index           =   1
         Left            =   360
         TabIndex        =   15
         Top             =   720
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel lbl_ACC_LASTNAME 
         Height          =   315
         Index           =   2
         Left            =   360
         TabIndex        =   16
         Top             =   1080
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Last name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   360
         TabIndex        =   17
         Top             =   360
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Password:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   360
         TabIndex        =   18
         Top             =   1800
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Email:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lbl_ACC_FULLNAME 
         Height          =   315
         Index           =   7
         Left            =   360
         TabIndex        =   19
         Top             =   1440
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Full name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   9
         Left            =   360
         TabIndex        =   20
         Top             =   2340
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Copy ID:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   10
         Left            =   360
         TabIndex        =   21
         Top             =   2700
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Copy Pin:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lbl_OU 
         Height          =   315
         Index           =   5
         Left            =   360
         TabIndex        =   22
         Top             =   3600
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Organizational Unit:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lbl_ACC_TYPE 
         Height          =   315
         Index           =   12
         Left            =   360
         TabIndex        =   23
         Top             =   3240
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Account Type:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Save and Exit"
      Default         =   -1  'True
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
      Left            =   4560
      TabIndex        =   1
      Top             =   5400
      Width           =   1575
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
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
      Left            =   2880
      TabIndex        =   0
      Top             =   5400
      Width           =   1575
   End
End
Attribute VB_Name = "frm_ecashier_detail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Form_Load()
        
        Call CentreForm(Me)
        Frame1.Caption = "eCashier Alias/Identifier:"
        lbl_ACC_FIRSTNAME(1).Caption = "eCashier Add:"
        lbl_ACC_LASTNAME(2).Caption = "eCashier Loc:"
        lbl_ACC_FULLNAME(7).Caption = "eCashier Add/Loc:"
        SCLabel1(4).Caption = "Institution Desc:"
        chk_Enable_Acct_AVS.Visible = True
        
End Sub
