VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_ACCOUNT_add 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Form1"
   ClientHeight    =   5430
   ClientLeft      =   3030
   ClientTop       =   2325
   ClientWidth     =   8505
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000E&
   Icon            =   "Frm_Add_Account.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5430
   ScaleWidth      =   8505
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command1 
      Caption         =   "&R"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4800
      TabIndex        =   19
      Top             =   150
      Width           =   435
   End
   Begin VB.OptionButton Option3 
      Caption         =   "User"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   4470
      TabIndex        =   17
      Top             =   2820
      Value           =   -1  'True
      Width           =   705
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Cashier"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   3420
      TabIndex        =   16
      Top             =   2820
      Width           =   975
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Administrator"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   1830
      TabIndex        =   15
      Top             =   2820
      Width           =   1515
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   0
      Left            =   90
      TabIndex        =   9
      Top             =   150
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Account Badge/ID:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2130
      Top             =   4020
   End
   Begin VB.ComboBox Cbm_OU 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "Frm_Add_Account.frx":6852
      Left            =   1800
      List            =   "Frm_Add_Account.frx":685F
      TabIndex        =   5
      Text            =   "Credit"
      Top             =   2310
      Width           =   3405
   End
   Begin VB.CommandButton Cmd_Cancel 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2670
      TabIndex        =   8
      Top             =   3990
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   4020
      TabIndex        =   7
      Top             =   3990
      Width           =   1215
   End
   Begin VB.ComboBox Cbm_Charge 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      ItemData        =   "Frm_Add_Account.frx":6878
      Left            =   1830
      List            =   "Frm_Add_Account.frx":6885
      TabIndex        =   6
      Text            =   "Credit"
      Top             =   3420
      Width           =   3405
   End
   Begin VB.TextBox txt_Email 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1800
      TabIndex        =   4
      Top             =   1920
      Width           =   3405
   End
   Begin VB.TextBox txt_Password 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1800
      TabIndex        =   3
      Top             =   1530
      Width           =   3405
   End
   Begin VB.TextBox txt_LastName 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1800
      TabIndex        =   2
      Top             =   1140
      Width           =   3405
   End
   Begin VB.TextBox txt_Firstname 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1800
      TabIndex        =   1
      Top             =   750
      Width           =   3405
   End
   Begin VB.TextBox txt_Badge 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1830
      TabIndex        =   0
      Top             =   150
      Width           =   2925
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   1
      Left            =   90
      TabIndex        =   10
      Top             =   750
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Firstname:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   2
      Left            =   90
      TabIndex        =   11
      Top             =   1140
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "LastName:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   3
      Left            =   90
      TabIndex        =   12
      Top             =   1530
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Password/Pin:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   4
      Left            =   90
      TabIndex        =   13
      Top             =   1920
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
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
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   5
      Left            =   90
      TabIndex        =   14
      Top             =   2340
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "OU Name:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   6
      Left            =   90
      TabIndex        =   18
      Top             =   3420
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Charge"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
End
Attribute VB_Name = "Frm_ACCOUNT_add"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_Cancel_Click()
Unload Me
End Sub

Private Sub Cmd_Process_Click()
    gClsAccountManager.AddAccount Me
    Caption = gClsAccountManager.mLastError
End Sub

Private Sub Command1_Click()

End Sub

Private Sub Form_Load()

    Me.Caption = "Add new account"
        
    If (gClsLogonManager.mLevel = CASHIER_LEVEL) Then
        Cbm_AccessLevel = UCase("USER")
        Cbm_AccessLevel.Enabled = False
    End If
    
    
 '   Cbm_OU.Clear
 '   Cbm_OU.AddItem myObject.mName
 
End Sub

Private Sub Reset_Timer()
    Reset.Enabled = False
    Me.Caption = "&Add Account"
End Sub
