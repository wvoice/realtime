VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CLIENT_detail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Client"
   ClientHeight    =   5580
   ClientLeft      =   6645
   ClientTop       =   2520
   ClientWidth     =   6015
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm_CLIENT_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5580
   ScaleWidth      =   6015
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmd_Previous 
      Caption         =   "&Previous"
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
      Left            =   120
      TabIndex        =   45
      Top             =   5040
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton cmd_Next 
      Caption         =   "&Next"
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
      Left            =   120
      TabIndex        =   44
      Top             =   5040
      Visible         =   0   'False
      Width           =   1215
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
      Left            =   4320
      TabIndex        =   43
      Top             =   5040
      Width           =   1455
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
      Left            =   3000
      TabIndex        =   42
      Top             =   5040
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Delete 
      Caption         =   "&Delete"
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
      Left            =   1680
      TabIndex        =   41
      Top             =   5040
      Width           =   1215
   End
   Begin VB.Frame Frame6 
      Caption         =   "Cost Multiplier:"
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   120
      TabIndex        =   38
      ToolTipText     =   "This feature will be made available in the next release of the RealTime Chargeback Solutions."
      Top             =   3600
      Width           =   5655
      Begin VB.CheckBox chkPriceOverride 
         Caption         =   "Pricing Override Enabled"
         Enabled         =   0   'False
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2040
         TabIndex        =   8
         ToolTipText     =   "This feature will be available in the next release of the RealTime Chargeback Solutions."
         Top             =   0
         Width           =   2895
      End
      Begin VB.TextBox txt_CC_PRN_MULTIPLR 
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
         Left            =   4200
         TabIndex        =   9
         Top             =   480
         Width           =   1215
      End
      Begin VB.TextBox txt_CC_CPY_MULTIPLR 
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
         Left            =   4200
         TabIndex        =   10
         Top             =   840
         Width           =   1215
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   1
         Left            =   2040
         TabIndex        =   39
         Top             =   480
         Width           =   1725
         _Version        =   65536
         _ExtentX        =   3043
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Print Multiplier:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   2
         Left            =   2040
         TabIndex        =   40
         Top             =   840
         Width           =   1725
         _Version        =   65536
         _ExtentX        =   3043
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Copy Multiplier:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   14
         Left            =   3840
         TabIndex        =   46
         Top             =   480
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483631
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "% -"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   19
         Left            =   3840
         TabIndex        =   47
         Top             =   840
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483631
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "% -"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Cost:"
      ForeColor       =   &H8000000E&
      Height          =   1095
      Left            =   7200
      TabIndex        =   28
      Top             =   240
      Visible         =   0   'False
      Width           =   5655
      Begin VB.TextBox txt_CC_PRINT_COST 
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
         Left            =   4200
         TabIndex        =   14
         Top             =   600
         Width           =   1245
      End
      Begin VB.TextBox txt_CC_COPY_COST 
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
         Left            =   2040
         TabIndex        =   13
         Top             =   600
         Width           =   1245
      End
      Begin VB.TextBox txt_CC_EMAIL_COST 
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
         Left            =   4200
         TabIndex        =   12
         Top             =   240
         Width           =   1245
      End
      Begin VB.TextBox txt_CC_FAX_COST 
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
         Left            =   2040
         TabIndex        =   11
         Top             =   240
         Width           =   1245
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   10
         Left            =   1440
         TabIndex        =   29
         Top             =   240
         Width           =   525
         _Version        =   65536
         _ExtentX        =   926
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Fax:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   11
         Left            =   3480
         TabIndex        =   30
         Top             =   240
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Email:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   12
         Left            =   1440
         TabIndex        =   31
         Top             =   600
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Copy"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   13
         Left            =   3480
         TabIndex        =   32
         Top             =   600
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Print"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Cost Per Page:"
      ForeColor       =   &H8000000E&
      Height          =   1095
      Left            =   7200
      TabIndex        =   33
      Top             =   1440
      Visible         =   0   'False
      Width           =   5655
      Begin VB.TextBox txt_CC_FAXPP 
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
         Left            =   2040
         TabIndex        =   15
         Top             =   240
         Width           =   1245
      End
      Begin VB.TextBox txt_CC_EMAILPP 
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
         Left            =   4200
         TabIndex        =   16
         Top             =   240
         Width           =   1245
      End
      Begin VB.TextBox txt_CC_COPYPP 
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
         Left            =   2040
         TabIndex        =   17
         Top             =   600
         Width           =   1245
      End
      Begin VB.TextBox txt_CC_PRINTPP 
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
         Left            =   4200
         TabIndex        =   18
         Top             =   600
         Width           =   1245
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   15
         Left            =   1440
         TabIndex        =   34
         Top             =   240
         Width           =   525
         _Version        =   65536
         _ExtentX        =   926
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Fax:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   16
         Left            =   3480
         TabIndex        =   35
         Top             =   240
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Email:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   17
         Left            =   1440
         TabIndex        =   36
         Top             =   600
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Copy"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   18
         Left            =   3480
         TabIndex        =   37
         Top             =   600
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         Caption         =   "Print"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3435
      Left            =   120
      TabIndex        =   19
      Top             =   120
      Width           =   5685
      Begin VB.TextBox txt_CC_CONTACT 
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
         Left            =   2010
         TabIndex        =   5
         Top             =   2190
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_PHONE_NUM 
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
         Left            =   2010
         TabIndex        =   6
         Top             =   2550
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_FAX_NUM 
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
         Left            =   2010
         TabIndex        =   7
         Top             =   2910
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_CUSTOM 
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
         Left            =   2010
         TabIndex        =   3
         Top             =   1440
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_EMAIL 
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
         Left            =   2010
         TabIndex        =   4
         Top             =   1800
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_DESC 
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
         Left            =   2010
         TabIndex        =   2
         Top             =   1080
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_CODE 
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
         Left            =   2010
         TabIndex        =   1
         Top             =   720
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_NAME 
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
         Left            =   2010
         TabIndex        =   0
         Top             =   360
         Width           =   3405
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   270
         TabIndex        =   20
         Top             =   360
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Client Name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   270
         TabIndex        =   21
         Top             =   720
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Client Code:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   2
         Left            =   270
         TabIndex        =   22
         Top             =   1080
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Description:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   270
         TabIndex        =   23
         Top             =   1800
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
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
         Index           =   4
         Left            =   270
         TabIndex        =   24
         Top             =   1440
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Custom:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   6
         Left            =   270
         TabIndex        =   25
         Top             =   2190
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Contact:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   7
         Left            =   270
         TabIndex        =   26
         Top             =   2550
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Phone Number:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   9
         Left            =   270
         TabIndex        =   27
         Top             =   2910
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Fax Number:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
End
Attribute VB_Name = "Frm_CLIENT_detail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
''****************************************************************************
''
'' Copyright (C) 2007-2010 Network Printing Solutions,INC and/or its subsidiary(-ies)
'' and/or its Assignees.
'' All rights reserved.
''
'' This file is part of the Realtime Administrator Source Code Distribution.
''
'' You may use this file under the following terms:
''
''
''  In plain English:
''
''  1. We don't promise that this software works
''  2. We don't promise that it will meet any requirement or need.
''  3. You can use this software for whatever you want. You don't have to pay us.
''  4. Permission for use of this software is granted only if the user accepts full responsibility for any undesirable consequences;
''     the authors accept NO LIABILITY for damages of any kind whatsoever for what ever reason.
''  5. Permission is NOT granted for the use of author's name or company name in advertising or publicity relating to this software
''     or products derived from
''  6. If any part of the source code for this software is distributed, then this usage must be included,with this copyright and
''     no-warranty notice unaltered; and any additions, deletions, or changes to the original files must be clearly indicated in
''     accompanying documentation.
''  7. We specifically permit and encourage the use of this software as the basis of commercial products, provided that all warranty
''     or liability claims are assumed by you
''  8. We do not offer to nor will we be required to support or maintain the software.
''  9. You assume full responsibility in requesting permission to use and if required you assume the full cost and effort in re-licensing
''     any third party components that may or may not be used by the software.
''
'' " Redistribution and use in source and binary forms, with or without
''   modification, are permitted without fee provided that the following
''   conditions are agreed and met:
''   * Redistributions of source code must retain the above copyright
''     notice, this list of conditions and the following disclaimer.
''   * Redistributions in binary form must reproduce the above copyright
''     notice, this list of conditions and the following disclaimer in
''     the documentation and/or other materials provided with the
''     distribution.
''   * Neither the name of Network Printing Solutions,its Subsidiary(-ies)
''     and/or its assigness nor the names of its contributors may be used to
''     endorse or promote products derived from this software without specific
''     prior written permission.
''
'' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
'' "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
'' LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
'' A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
'' OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
'' SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
'' LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
'' DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
'' THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
'' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
'' OF OR THE INABLITY TO USE THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
'' OF SUCH DAMAGE."
''
''****************************************************************************/
Option Explicit

Private m_Entity As String

Private Function ValidatePosNumTxt(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If Not IsNumeric(NumericTxt.Text) Then
        NumericTxt.Text = "1.00"
        MsgBox "Specify a positive numeric value!", vbExclamation + vbOKOnly, "Data Error"
        NumericTxt.SetFocus
    Else
        If Val(NumericTxt.Text) <= 0 Then
            NumericTxt.Text = "1.00"
            MsgBox "Specify a positive numeric value!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
        Else
            NumericTxt.Text = Format(NumericTxt, "##0.00")
        End If
    End If
End Function

Private Sub chkPriceOverride_Click()
    If chkPriceOverride.Value = 1 Then
        Me.txt_CC_PRN_MULTIPLR.Enabled = True
        Me.txt_CC_CPY_MULTIPLR.Enabled = True
        On Error Resume Next
        txt_CC_PRN_MULTIPLR.SetFocus
    Else
        Me.txt_CC_PRN_MULTIPLR.Enabled = False
        Me.txt_CC_CPY_MULTIPLR.Enabled = False
        
        Me.txt_CC_PRN_MULTIPLR.Text = "1.00"
        Me.txt_CC_CPY_MULTIPLR.Text = "1.00"
    End If
End Sub

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    
    If gObjClientMngr.DeleteClient(gObjClientMngr.RecordGUID) = False Then
        Caption = gObjClientMngr.mLastError
        If gObjClientMngr.mLastError <> "" Then
            MsgBox gObjClientMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
    Else
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()
    If Validate() = False Then Exit Sub
    If gObjClientMngr.SaveClient(Me) = False Then
        If gObjClientMngr.mLastError <> "" Then
            MsgBox gObjClientMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
    Else
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    m_Entity = "Client"
End Sub

Private Function Validate() As Boolean
    If Trim(Me.txt_CC_NAME.Text) = "" Then
        MsgBox "Specify the name of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        Me.txt_CC_NAME.SetFocus
        Exit Function
    End If
    If Trim(Me.txt_CC_CODE.Text) = "" Then
        MsgBox "Specify the code of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        Me.txt_CC_CODE.SetFocus
        Exit Function
    End If
    If gObjClientMngr.VerifyCC_Exists(Me.txt_CC_CODE.Text) = True Then
        MsgBox "Attempt to create a duplicate " & m_Entity & " Code!", vbExclamation + vbOKOnly, "Error"
        txt_CC_CODE.SetFocus
        Exit Function
    End If
    Validate = True
End Function

Private Sub txt_CC_CODE_LostFocus()
    txt_CC_CODE.Text = RemoveQuotes(txt_CC_CODE.Text)
End Sub

Private Sub txt_CC_CUSTOM_LostFocus()
    txt_CC_CUSTOM.Text = RemoveQuotes(txt_CC_CUSTOM.Text)
End Sub

Private Sub txt_CC_NAME_GotFocus()
    Call HighLightField(txt_CC_NAME)
End Sub

Private Sub txt_CC_CODE_GotFocus()
    Call HighLightField(txt_CC_CODE)
End Sub
Private Sub txt_CC_DESC_GotFocus()
    Call HighLightField(txt_CC_DESC)
End Sub
Private Sub txt_CC_CUSTOM_GotFocus()
    Call HighLightField(txt_CC_CUSTOM)
End Sub
Private Sub txt_CC_EMAIL_GotFocus()
    Call HighLightField(txt_CC_EMAIL)
End Sub

Private Sub txt_CC_NAME_LostFocus()
    txt_CC_NAME.Text = RemoveQuotes(txt_CC_NAME.Text)
End Sub

Private Sub txt_CC_CONTACT_GotFocus()
    Call HighLightField(txt_CC_CONTACT)
End Sub
Private Sub txt_CC_PHONE_NUM_GotFocus()
    Call HighLightField(txt_CC_PHONE_NUM)
End Sub
Private Sub txt_CC_FAX_NUM_GotFocus()
    Call HighLightField(txt_CC_FAX_NUM)
End Sub
Private Sub txt_CC_PRN_MULTIPLR_GotFocus()
    Call HighLightField(txt_CC_PRN_MULTIPLR)
End Sub
Private Sub txt_CC_CPY_MULTIPLR_GotFocus()
    Call HighLightField(txt_CC_CPY_MULTIPLR)
End Sub
Private Sub txt_CC_PRN_MULTIPLR_LostFocus()
    Call ValidatePosNumTxt(txt_CC_PRN_MULTIPLR)
End Sub

Private Sub txt_CC_CPY_MULTIPLR_LostFocus()
    Call ValidatePosNumTxt(txt_CC_CPY_MULTIPLR)
End Sub
