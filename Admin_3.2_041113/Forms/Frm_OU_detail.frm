VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_OU_detail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Organizational Unit"
   ClientHeight    =   8820
   ClientLeft      =   5415
   ClientTop       =   2025
   ClientWidth     =   7665
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm_OU_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8820
   ScaleWidth      =   7665
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame5 
      Caption         =   "Max Spend Limit -"
      Height          =   1215
      Left            =   120
      TabIndex        =   42
      Top             =   6960
      Width           =   7215
      Begin VB.PictureBox Picture4 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   480
         Picture         =   "Frm_OU_detail.frx":08CA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   45
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txt_maxSpend 
         BackColor       =   &H80000011&
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
         Left            =   5520
         TabIndex        =   44
         Top             =   0
         Width           =   1455
      End
      Begin VB.CheckBox chkMaxSpend 
         Alignment       =   1  'Right Justify
         Caption         =   "On/Off toggle"
         Height          =   255
         Left            =   2280
         TabIndex        =   43
         Top             =   0
         Width           =   1815
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   555
         Index           =   12
         Left            =   1320
         TabIndex        =   46
         Top             =   480
         Width           =   5565
         _Version        =   65536
         _ExtentX        =   9816
         _ExtentY        =   979
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "* This is the Max spend limit that any account in this OU can accumlate before they are logged off."
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   5280
         TabIndex        =   47
         Top             =   0
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "$ "
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
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
      Left            =   2400
      TabIndex        =   39
      Top             =   9840
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
      Left            =   240
      TabIndex        =   38
      Top             =   9720
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
      Left            =   5880
      TabIndex        =   37
      Top             =   8280
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
      Left            =   3240
      TabIndex        =   36
      Top             =   8280
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
      Left            =   4560
      TabIndex        =   35
      Top             =   8280
      Width           =   1215
   End
   Begin VB.Frame Frame6 
      Caption         =   "OU Costing Options:"
      Height          =   1215
      Left            =   120
      TabIndex        =   31
      Top             =   5640
      Width           =   7215
      Begin VB.ComboBox Cbm_OU_CHARGE 
         Height          =   360
         ItemData        =   "Frm_OU_detail.frx":0EC7
         Left            =   5400
         List            =   "Frm_OU_detail.frx":0ED4
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   15
         Top             =   720
         Width           =   1575
      End
      Begin VB.TextBox txt_OU_CPY_MULTIPLR 
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
         Left            =   3840
         TabIndex        =   14
         Top             =   720
         Width           =   1455
      End
      Begin VB.TextBox txt_OU_PRN_MULTIPLR 
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
         Left            =   3840
         TabIndex        =   13
         Top             =   360
         Width           =   1455
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   1
         Left            =   1560
         TabIndex        =   32
         Top             =   360
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Print Multiplier:"
         Alignment       =   1
         Enabled         =   0   'False
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   2
         Left            =   1560
         TabIndex        =   33
         Top             =   720
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Copy Multiplier:"
         Alignment       =   1
         Enabled         =   0   'False
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   5
         Left            =   5400
         TabIndex        =   34
         Top             =   360
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         Index           =   2
         Left            =   3480
         TabIndex        =   40
         Top             =   360
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "% "
         Alignment       =   1
         Enabled         =   0   'False
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   3480
         TabIndex        =   41
         Top             =   720
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "% "
         Alignment       =   1
         Enabled         =   0   'False
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame4 
      Height          =   1215
      Left            =   120
      TabIndex        =   25
      Top             =   4320
      Width           =   7215
      Begin VB.ComboBox Cbm_OU_DEFAULT_MATTER 
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
         ItemData        =   "Frm_OU_detail.frx":0EF1
         Left            =   3600
         List            =   "Frm_OU_detail.frx":0EF3
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   360
         Width           =   3375
      End
      Begin VB.ComboBox Cbm_OU_DEFAULT_CLIENT 
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
         ItemData        =   "Frm_OU_detail.frx":0EF5
         Left            =   240
         List            =   "Frm_OU_detail.frx":0EF7
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   360
         Width           =   3255
      End
      Begin VB.TextBox txt_Def_Matter 
         BackColor       =   &H00E0E0E0&
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
         Left            =   3600
         Locked          =   -1  'True
         TabIndex        =   17
         Top             =   720
         Width           =   3375
      End
      Begin VB.TextBox txt_Def_Client 
         BackColor       =   &H00E0E0E0&
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
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   720
         Width           =   3255
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   10
         Left            =   240
         TabIndex        =   26
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         Left            =   3600
         TabIndex        =   27
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
      Height          =   735
      Left            =   120
      TabIndex        =   24
      Top             =   3480
      Width           =   7215
      Begin VB.CheckBox chk_OU_ALLOWNEG 
         Caption         =   "Allow Negative Balances"
         Enabled         =   0   'False
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.CheckBox chk_OU_CODES 
         Caption         =   "Billing Codes Enabled"
         Enabled         =   0   'False
         Height          =   255
         Left            =   6000
         TabIndex        =   9
         Top             =   240
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.CheckBox chk_OU_LOCKED 
         Caption         =   "Lock the Organizational Unit"
         Height          =   375
         Left            =   2280
         TabIndex        =   8
         Top             =   240
         Width           =   3015
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
      Height          =   1485
      Left            =   120
      TabIndex        =   22
      Top             =   1920
      Width           =   7245
      Begin VB.TextBox txt_OU_LOWBAL_MSGTXT 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   570
         Left            =   2040
         TabIndex        =   7
         Top             =   720
         Width           =   4935
      End
      Begin VB.TextBox txt_OU_LOWBAL_TITLE 
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
         TabIndex        =   6
         Top             =   360
         Width           =   4935
      End
      Begin VB.CheckBox chk_OU_LOWBALANCE 
         Caption         =   "User Balance Notication"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   0
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
         Left            =   5400
         TabIndex        =   5
         Top             =   0
         Width           =   1575
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   9
         Left            =   3600
         TabIndex        =   23
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Amount to notify:  $ "
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   17
         Left            =   240
         TabIndex        =   28
         Top             =   720
         Width           =   1635
         _Version        =   65536
         _ExtentX        =   2884
         _ExtentY        =   450
         _StockProps     =   13
         Caption         =   "Message Text:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   18
         Left            =   240
         TabIndex        =   29
         Top             =   360
         Width           =   1395
         _Version        =   65536
         _ExtentX        =   2461
         _ExtentY        =   450
         _StockProps     =   13
         Caption         =   "Message Title:"
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
      Height          =   1845
      Left            =   120
      TabIndex        =   18
      Top             =   0
      Width           =   7245
      Begin VB.TextBox txt_OU_SUPERVISOR_EMAIL 
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
         Left            =   2160
         TabIndex        =   3
         Top             =   1320
         Width           =   4815
      End
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
         Left            =   2160
         TabIndex        =   1
         Top             =   600
         Width           =   4815
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
         Left            =   2160
         TabIndex        =   2
         Top             =   960
         Width           =   4815
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
         Left            =   2160
         TabIndex        =   0
         Top             =   240
         Width           =   4815
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   240
         TabIndex        =   19
         Top             =   240
         Width           =   2205
         _Version        =   65536
         _ExtentX        =   3889
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         Left            =   240
         TabIndex        =   20
         Top             =   960
         Width           =   2205
         _Version        =   65536
         _ExtentX        =   3889
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Supervisor Name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   8
         Left            =   240
         TabIndex        =   21
         Top             =   600
         Width           =   2205
         _Version        =   65536
         _ExtentX        =   3889
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         Index           =   6
         Left            =   240
         TabIndex        =   30
         Top             =   1320
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Supervisor Email:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Top             =   8280
   End
End
Attribute VB_Name = "Frm_OU_detail"
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

Private Function ValidatePosNumTxtZero(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If NumericTxt.Text <> "" Then
        If Not IsNumeric(NumericTxt.Text) Then
            NumericTxt.Text = "0.00"
            MsgBox "Specify a positive numeric or zero value!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
        Else
            If Val(NumericTxt.Text) < 0 Then
                NumericTxt.Text = "0.00"
                MsgBox "Specify a positive numeric or zero value!", vbExclamation + vbOKOnly, "Data Error"
                NumericTxt.SetFocus
            Else
                NumericTxt.Text = Format(NumericTxt.Text, "#,##0.00")
            End If
        End If
    End If
End Function

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
            NumericTxt.Text = Format(NumericTxt.Text, "#,##0.00")
        End If
    End If
End Function


Private Sub chkMaxSpend_Click()
If (chkMaxSpend.Value = 0) Then
    txt_maxSpend.Enabled = False
    txt_maxSpend.BackColor = &H80000011
    
Else
    txt_maxSpend.Enabled = True
    txt_maxSpend.BackColor = &HFFFFFF
    
    On Error Resume Next
        txt_maxSpend.SetFocus
End If
End Sub

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    
    If gObjOuMngr.DeleteOU(gObjOuMngr.RecordGUID) = False Then
        If gObjOuMngr.mLastError <> "" Then
            MsgBox gObjOuMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Caption = gObjOuMngr.mLastError
    Else
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()
    If Validate() = False Then Exit Sub
    If gObjOuMngr.SaveOU(Me) = False Then
        If gObjOuMngr.mLastError <> "" Then
            MsgBox gObjOuMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
        
    Else
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    m_Entity = "Organizational Unit"
End Sub

Private Function Validate() As Boolean
    If Trim(txt_OU_Name.Text) = "" Then
        MsgBox "Specify the name of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_OU_Name.SetFocus
        Exit Function
    End If
    
    If gObjOuMngr.VerifyOU_Exists(Me.txt_OU_Name.Text) = True Then
        MsgBox "Attempt to create a duplicate " & m_Entity & " Name!", vbExclamation + vbOKOnly, "Error"
        txt_OU_Name.SetFocus
        Exit Function
    ElseIf gObjOuMngr.mLastError <> "" Then
        MsgBox gObjOuMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        Exit Function
    End If
    
    Validate = True
End Function

Private Sub Cbm_OU_DEFAULT_CLIENT_Click()

   Call Mod_Data.LoadComboFromSQL("Select CM_Matter from dbo.docugate_general_cm " _
    & " where CC_GUID = (Select CC_GUID from dbo.docugate_general_cc " _
    & " where CC_Code = '" & Cbm_OU_DEFAULT_CLIENT.Text & "')", Cbm_OU_DEFAULT_MATTER)
    
   '//Lookup the matter description which the user just selected
   txt_Def_Client.Text = nchk(Mod_Data.GetSQLValue("Select CC_DESC from dbo.docugate_general_cc " _
    & " where CC_Code = '" & Cbm_OU_DEFAULT_CLIENT.Text & "'"))
   txt_Def_Matter.Text = ""
    
End Sub

Private Sub Cbm_OU_DEFAULT_MATTER_Click()
   '//Lookup the matter description which the user just selected
   If Me.Cbm_OU_DEFAULT_MATTER.Text = "" Then
        Me.txt_Def_Matter.Text = ""
   Else
        txt_Def_Matter.Text = nchk(Mod_Data.GetSQLValue("Select CM_DESCRIPTION from dbo.docugate_general_cm " _
            & " where CM_MATTER = '" & Cbm_OU_DEFAULT_MATTER.Text & "'"))
   End If
End Sub


Private Sub txt_OU_DESCRIPTION_GotFocus()
    Call HighLightField(txt_OU_DESCRIPTION)
End Sub

Private Sub txt_OU_LOWBAL_MSGTXT_Gotfocus()
    Call HighLightField(txt_OU_LOWBAL_MSGTXT)
End Sub

Private Sub txt_OU_LOWBAL_TITLE_GotFocus()
    Call HighLightField(txt_OU_LOWBAL_TITLE)
End Sub

Private Sub txt_OU_NAME_GotFocus()
    Call HighLightField(txt_OU_Name)
End Sub

Private Sub txt_OU_NAME_LostFocus()
    txt_OU_Name.Text = RemoveQuotes(txt_OU_Name.Text)
End Sub

Private Sub txt_OU_PRN_MULTIPLR_LostFocus()
    Call ValidatePosNumTxt(txt_OU_PRN_MULTIPLR)
End Sub

Private Sub txt_OU_PRN_MULTIPLR_GotFocus()
    Call HighLightField(txt_OU_PRN_MULTIPLR)
End Sub

Private Sub txt_OU_CPY_MULTIPLR_LostFocus()
    Call ValidatePosNumTxt(txt_OU_CPY_MULTIPLR)
End Sub

Private Sub txt_OU_CPY_MULTIPLR_GotFocus()
    Call HighLightField(txt_OU_CPY_MULTIPLR)
End Sub

Private Sub txt_OU_SUPERVISOR_EMAIL_GotFocus()
    Call HighLightField(txt_OU_SUPERVISOR_EMAIL)
End Sub

Private Sub txt_OU_SUPERVISOR_GotFocus()
    Call HighLightField(txt_OU_SUPERVISOR)
End Sub

Private Sub txt_OU_THRESHOLD_GotFocus()
    Call HighLightField(txt_OU_THRESHOLD)
End Sub

Private Sub txt_OU_THRESHOLD_Lostfocus()
    Call ValidatePosNumTxtZero(txt_OU_THRESHOLD)
End Sub
