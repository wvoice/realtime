VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_Add_OU 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Form1"
   ClientHeight    =   4635
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   5535
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4635
   ScaleWidth      =   5535
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox PriceLine 
      Height          =   405
      Index           =   3
      Left            =   1890
      TabIndex        =   17
      Text            =   "Text1"
      Top             =   3030
      Width           =   3375
   End
   Begin VB.TextBox PriceLine 
      Height          =   405
      Index           =   2
      Left            =   1890
      TabIndex        =   16
      Text            =   "Text1"
      Top             =   2610
      Width           =   3375
   End
   Begin VB.TextBox PriceLine 
      Height          =   405
      Index           =   1
      Left            =   1890
      TabIndex        =   15
      Text            =   "Text1"
      Top             =   2190
      Width           =   3375
   End
   Begin VB.TextBox txt_OU_MULTIPLIER 
      Height          =   405
      Left            =   1890
      TabIndex        =   14
      Text            =   "Text2"
      Top             =   3450
      Width           =   3375
   End
   Begin VB.TextBox PriceLine 
      Height          =   405
      Index           =   0
      Left            =   1890
      TabIndex        =   12
      Text            =   "Text1"
      Top             =   1770
      Width           =   3375
   End
   Begin VB.TextBox txt_OU_NAME 
      Height          =   330
      Left            =   1830
      TabIndex        =   5
      Top             =   150
      Width           =   3495
   End
   Begin VB.TextBox txt_OU_SUPERVISOR 
      Height          =   330
      Left            =   1890
      TabIndex        =   4
      Top             =   720
      Width           =   3405
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
      Height          =   375
      Left            =   4110
      TabIndex        =   3
      Top             =   4080
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2790
      TabIndex        =   2
      Top             =   4080
      Width           =   1215
   End
   Begin VB.ComboBox Cbm_OU_CHARGE 
      Height          =   315
      ItemData        =   "Frm_Add_OU.frx":0000
      Left            =   1890
      List            =   "Frm_Add_OU.frx":000D
      TabIndex        =   1
      Text            =   "Credit"
      Top             =   1140
      Width           =   3405
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2250
      Top             =   4050
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   0
      Left            =   90
      TabIndex        =   0
      Top             =   150
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
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
      Index           =   1
      Left            =   90
      TabIndex        =   6
      Top             =   720
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Supervisor:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   5
      Left            =   90
      TabIndex        =   7
      Top             =   1140
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Charge:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   6
      Left            =   90
      TabIndex        =   8
      Top             =   1770
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Price Line 1:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   2
      Left            =   90
      TabIndex        =   9
      Top             =   2190
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Price Line 2:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   3
      Left            =   90
      TabIndex        =   10
      Top             =   2640
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Price Line 3:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   4
      Left            =   90
      TabIndex        =   11
      Top             =   3060
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Price Line 4:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   7
      Left            =   90
      TabIndex        =   13
      Top             =   3510
      Width           =   1605
      _Version        =   65536
      _ExtentX        =   2831
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483634
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.76
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Multiplier:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
End
Attribute VB_Name = "Frm_Add_ou"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_Process_Click()
    cls_Database.OU_Add (Me)
End Sub

Private Sub Form_Load()

Me.Caption = "Add Organizational Unit"

For Each f In PriceLine
    f.Text = "1.00"
Next f

End Sub


