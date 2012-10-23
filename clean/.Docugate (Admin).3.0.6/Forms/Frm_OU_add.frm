VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_OU_add 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Organizational Unit"
   ClientHeight    =   7110
   ClientLeft      =   1845
   ClientTop       =   1440
   ClientWidth     =   8580
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7110
   ScaleWidth      =   8580
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame6 
      Caption         =   "Copy Price Lines:"
      ForeColor       =   &H8000000E&
      Height          =   2295
      Left            =   4320
      TabIndex        =   35
      Top             =   4200
      Width           =   4095
      Begin VB.TextBox CopyPriceLine 
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
         Index           =   3
         Left            =   600
         TabIndex        =   40
         Top             =   1440
         Width           =   3375
      End
      Begin VB.TextBox CopyPriceLine 
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
         Index           =   2
         Left            =   600
         TabIndex        =   39
         Top             =   1080
         Width           =   3375
      End
      Begin VB.TextBox CopyPriceLine 
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
         Index           =   1
         Left            =   600
         TabIndex        =   38
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox txt_OU_CPY_MULTIPLIER 
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
         Left            =   1320
         TabIndex        =   37
         Top             =   1800
         Width           =   2655
      End
      Begin VB.TextBox CopyPriceLine 
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
         Index           =   0
         Left            =   600
         TabIndex        =   36
         Top             =   360
         Width           =   3375
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   12
         Left            =   360
         TabIndex        =   41
         Top             =   360
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "1:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   13
         Left            =   360
         TabIndex        =   42
         Top             =   720
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "2:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   14
         Left            =   360
         TabIndex        =   43
         Top             =   1080
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "3:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   15
         Left            =   360
         TabIndex        =   44
         Top             =   1440
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "4:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   16
         Left            =   360
         TabIndex        =   45
         Top             =   1800
         Width           =   1005
         _Version        =   65536
         _ExtentX        =   1773
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
         Caption         =   "Multiplier:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Print Price Lines:"
      ForeColor       =   &H8000000E&
      Height          =   2295
      Left            =   120
      TabIndex        =   24
      Top             =   4200
      Width           =   4095
      Begin VB.TextBox PrintPriceLine 
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
         Index           =   0
         Left            =   600
         TabIndex        =   29
         Top             =   360
         Width           =   3375
      End
      Begin VB.TextBox txt_OU_PRN_MULTIPLIER 
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
         Left            =   1320
         TabIndex        =   28
         Top             =   1800
         Width           =   2655
      End
      Begin VB.TextBox PrintPriceLine 
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
         Index           =   1
         Left            =   600
         TabIndex        =   27
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox PrintPriceLine 
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
         Index           =   2
         Left            =   600
         TabIndex        =   26
         Top             =   1080
         Width           =   3375
      End
      Begin VB.TextBox PrintPriceLine 
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
         Index           =   3
         Left            =   600
         TabIndex        =   25
         Top             =   1440
         Width           =   3375
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   2
         Left            =   360
         TabIndex        =   30
         Top             =   360
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "1:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   360
         TabIndex        =   31
         Top             =   720
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "2:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   360
         TabIndex        =   32
         Top             =   1080
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "3:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   6
         Left            =   360
         TabIndex        =   33
         Top             =   1440
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
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
         Caption         =   "4:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   7
         Left            =   360
         TabIndex        =   34
         Top             =   1800
         Width           =   1005
         _Version        =   65536
         _ExtentX        =   1773
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
         Caption         =   "Multiplier:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame4 
      Height          =   1335
      Left            =   120
      TabIndex        =   17
      Top             =   2760
      Width           =   8295
      Begin VB.TextBox txt_Def_MatterCode 
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
         Left            =   4920
         Locked          =   -1  'True
         TabIndex        =   47
         Top             =   720
         Width           =   3255
      End
      Begin VB.TextBox txt_Def_ClientCode 
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
         Left            =   1800
         Locked          =   -1  'True
         TabIndex        =   46
         Top             =   720
         Width           =   3015
      End
      Begin VB.ComboBox Combo2 
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
         ItemData        =   "Frm_OU_add.frx":0000
         Left            =   4920
         List            =   "Frm_OU_add.frx":000D
         TabIndex        =   23
         Text            =   "Credit"
         Top             =   360
         Width           =   3255
      End
      Begin VB.ComboBox Combo1 
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
         ItemData        =   "Frm_OU_add.frx":0026
         Left            =   1800
         List            =   "Frm_OU_add.frx":0033
         TabIndex        =   21
         Text            =   "Credit"
         Top             =   360
         Width           =   3015
      End
      Begin VB.ComboBox Cbm_OU_CHARGE 
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
         ItemData        =   "Frm_OU_add.frx":004C
         Left            =   120
         List            =   "Frm_OU_add.frx":0059
         TabIndex        =   19
         Text            =   "Credit"
         Top             =   360
         Width           =   1575
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   5
         Left            =   120
         TabIndex        =   18
         Top             =   0
         Width           =   1485
         _Version        =   65536
         _ExtentX        =   2619
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
         Caption         =   "Billing Method:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   10
         Left            =   1800
         TabIndex        =   20
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
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
         Caption         =   "Default Billing Code:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   11
         Left            =   4920
         TabIndex        =   22
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
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
         Caption         =   "Default Billing Matter:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame3 
      Height          =   1095
      Left            =   3960
      TabIndex        =   13
      Top             =   1560
      Width           =   4455
      Begin VB.CheckBox chk_OU_ALLOWNEG 
         Caption         =   "Allow Negative Balances"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   600
         Width           =   2655
      End
      Begin VB.CheckBox chk_OU_CODES 
         Caption         =   "Billing Codes Enabled"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   1800
         TabIndex        =   15
         Top             =   240
         Width           =   2535
      End
      Begin VB.CheckBox chk_OU_LOCKED 
         Caption         =   "Lock the OU"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   240
         Width           =   2655
      End
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1125
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   3765
      Begin VB.CheckBox chk_OU_LOWBALANCE 
         Caption         =   "User Balance Notication"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   2655
      End
      Begin VB.TextBox txt_OU_THRESHOLD 
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
         Left            =   2640
         TabIndex        =   10
         Top             =   600
         Width           =   975
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   9
         Left            =   840
         TabIndex        =   12
         Top             =   600
         Width           =   1845
         _Version        =   65536
         _ExtentX        =   3254
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
         Caption         =   "Amount to notify:  $"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1365
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   8325
      Begin VB.TextBox txt_OU_DESCRIPTION 
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
         Left            =   1680
         TabIndex        =   8
         Top             =   600
         Width           =   6495
      End
      Begin VB.TextBox txt_OU_SUPERVISOR 
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
         Left            =   1680
         TabIndex        =   4
         Top             =   960
         Width           =   6495
      End
      Begin VB.TextBox txt_OU_NAME 
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
         Left            =   1680
         TabIndex        =   3
         Top             =   240
         Width           =   6495
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   1245
         _Version        =   65536
         _ExtentX        =   2196
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
         Caption         =   "OU Name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   960
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
         Caption         =   "Supervisor:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   8
         Left            =   120
         TabIndex        =   7
         Top             =   600
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
         Caption         =   "OU Description:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
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
      Left            =   7230
      TabIndex        =   1
      Top             =   6600
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
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
      Left            =   5910
      TabIndex        =   0
      Top             =   6600
      Width           =   1215
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Top             =   6600
   End
End
Attribute VB_Name = "Frm_OU_add"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()
    gClsOuManager.AddOU Me
    Caption = gClsOuManager.mLastError
End Sub
    
Private Sub Form_Load()
    Call CentreForm(Me)
    Me.Caption = "Add Organizational Unit"
    For Each f In PriceLine
        f.Text = "1.00"
    Next f
End Sub

