VERSION 5.00
Object = "{B1530FCE-BAD8-11D4-A85D-0080C8DFC881}#3.0#0"; "ctRadio.ocx"
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_ACCOUNT_detail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Account"
   ClientHeight    =   8040
   ClientLeft      =   4215
   ClientTop       =   3315
   ClientWidth     =   9105
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000005&
   Icon            =   "Frm_ACCOUNT_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8040
   ScaleWidth      =   9105
   ShowInTaskbar   =   0   'False
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
      ItemData        =   "Frm_ACCOUNT_detail.frx":08CA
      Left            =   2640
      List            =   "Frm_ACCOUNT_detail.frx":08D7
      Style           =   2  'Dropdown List
      TabIndex        =   46
      Top             =   7680
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Frame Frame5 
      Caption         =   "Max Spend Limit -"
      Height          =   1215
      Left            =   120
      TabIndex        =   40
      Top             =   4800
      Width           =   8895
      Begin VB.CheckBox chkMaxSpend 
         Alignment       =   1  'Right Justify
         Caption         =   "On/Off toggle"
         Height          =   255
         Left            =   4680
         TabIndex        =   43
         Top             =   0
         Width           =   1815
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
         Left            =   7200
         TabIndex        =   42
         Top             =   0
         Width           =   1455
      End
      Begin VB.PictureBox Picture4 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   480
         Picture         =   "Frm_ACCOUNT_detail.frx":08F4
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   41
         Top             =   480
         Width           =   615
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   555
         Index           =   12
         Left            =   1200
         TabIndex        =   44
         Top             =   480
         Width           =   7485
         _Version        =   65536
         _ExtentX        =   13203
         _ExtentY        =   979
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "* This is the Max spend limit that this single account can accumulate before the account is  logged off."
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   6840
         TabIndex        =   45
         Top             =   0
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
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
      Left            =   4440
      TabIndex        =   17
      Top             =   7560
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
      Left            =   6000
      TabIndex        =   16
      Top             =   7560
      Width           =   1455
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
      Left            =   7560
      TabIndex        =   13
      Top             =   7560
      Width           =   1455
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
      Left            =   7440
      TabIndex        =   14
      Top             =   8640
      Visible         =   0   'False
      Width           =   1215
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
      Left            =   4560
      TabIndex        =   15
      Top             =   5640
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Frame Frame4 
      Height          =   1335
      Left            =   120
      TabIndex        =   26
      Top             =   6120
      Width           =   8895
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
         ItemData        =   "Frm_ACCOUNT_detail.frx":0EF1
         Left            =   120
         List            =   "Frm_ACCOUNT_detail.frx":0EF3
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   360
         Width           =   4335
      End
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
         ItemData        =   "Frm_ACCOUNT_detail.frx":0EF5
         Left            =   4560
         List            =   "Frm_ACCOUNT_detail.frx":0EF7
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   360
         Width           =   4215
      End
      Begin VB.TextBox txt_Def_ClientCode 
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
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   28
         Top             =   720
         Width           =   4335
      End
      Begin VB.TextBox txt_Def_MatterCode 
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
         Left            =   4560
         Locked          =   -1  'True
         TabIndex        =   27
         Top             =   720
         Width           =   4215
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   14
         Left            =   120
         TabIndex        =   29
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
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
         Index           =   15
         Left            =   4560
         TabIndex        =   30
         Top             =   0
         Width           =   2085
         _Version        =   65536
         _ExtentX        =   3678
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
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
   Begin VB.Frame Frame1 
      Caption         =   " Account Badge/ID:"
      Height          =   4575
      Left            =   120
      TabIndex        =   18
      Top             =   120
      Width           =   8895
      Begin VB.CommandButton Cmd_Fund 
         Caption         =   "&Fund"
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
         Left            =   7485
         TabIndex        =   54
         Top             =   0
         Width           =   1245
      End
      Begin VB.Frame Frame6 
         Height          =   1395
         Left            =   150
         TabIndex        =   48
         Top             =   3000
         Width           =   5535
         Begin VB.TextBox txt_ACC_FUNDS 
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
            TabIndex        =   50
            Top             =   960
            Width           =   1605
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
            ItemData        =   "Frm_ACCOUNT_detail.frx":0EF9
            Left            =   2040
            List            =   "Frm_ACCOUNT_detail.frx":0EFB
            Sorted          =   -1  'True
            Style           =   2  'Dropdown List
            TabIndex        =   49
            Top             =   600
            Width           =   3405
         End
         Begin SCLABELLib.SCLabel lbl_OU 
            Height          =   315
            Index           =   5
            Left            =   120
            TabIndex        =   51
            Top             =   600
            Width           =   1845
            _Version        =   65536
            _ExtentX        =   3254
            _ExtentY        =   556
            _StockProps     =   13
            ForeColor       =   -2147483630
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
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
         Begin SCLABELLib.SCLabel SCLabel1 
            Height          =   315
            Index           =   8
            Left            =   120
            TabIndex        =   52
            Top             =   960
            Width           =   1395
            _Version        =   65536
            _ExtentX        =   2461
            _ExtentY        =   556
            _StockProps     =   13
            ForeColor       =   -2147483630
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Caption         =   "Balance:"
            Alignment       =   1
            Enabled         =   -1  'True
            WordWrap        =   0   'False
         End
         Begin SCLABELLib.SCLabel SCLabel1 
            Height          =   315
            Index           =   1
            Left            =   1800
            TabIndex        =   53
            Top             =   960
            Width           =   285
            _Version        =   65536
            _ExtentX        =   503
            _ExtentY        =   556
            _StockProps     =   13
            ForeColor       =   -2147483630
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
      Begin VB.Frame Frame2 
         Caption         =   "Security Level:"
         Height          =   2175
         Left            =   5880
         TabIndex        =   33
         Top             =   2160
         Width           =   2775
         Begin VB.CheckBox chk_AVS 
            Caption         =   "Electronic Cashier"
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   255
            Left            =   720
            TabIndex        =   37
            Top             =   1320
            Width           =   1935
         End
         Begin RadioLibCtl.ctRadio optAccLevel 
            Height          =   255
            Index           =   2
            Left            =   360
            TabIndex        =   34
            Top             =   480
            Width           =   2175
            _Version        =   196608
            _ExtentX        =   3836
            _ExtentY        =   450
            _StockProps     =   70
            Caption         =   "Administrator"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty FontOver {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            PictureTrue     =   "Frm_ACCOUNT_detail.frx":0EFD
            PictureFalse    =   "Frm_ACCOUNT_detail.frx":0F19
            BackImage       =   "Frm_ACCOUNT_detail.frx":0F35
            MouseIcon       =   "Frm_ACCOUNT_detail.frx":0F51
            Caption         =   "Administrator"
         End
         Begin RadioLibCtl.ctRadio optAccLevel 
            Height          =   255
            Index           =   1
            Left            =   360
            TabIndex        =   35
            Top             =   960
            Width           =   2175
            _Version        =   196608
            _ExtentX        =   3836
            _ExtentY        =   450
            _StockProps     =   70
            Caption         =   "Cashier"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty FontOver {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            PictureTrue     =   "Frm_ACCOUNT_detail.frx":0F6D
            PictureFalse    =   "Frm_ACCOUNT_detail.frx":0F89
            BackImage       =   "Frm_ACCOUNT_detail.frx":0FA5
            MouseIcon       =   "Frm_ACCOUNT_detail.frx":0FC1
            Caption         =   "Cashier"
         End
         Begin RadioLibCtl.ctRadio optAccLevel 
            Height          =   255
            Index           =   0
            Left            =   360
            TabIndex        =   36
            Top             =   1680
            Width           =   2295
            _Version        =   196608
            _ExtentX        =   4048
            _ExtentY        =   450
            _StockProps     =   70
            Caption         =   "User"
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty FontOver {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            PictureTrue     =   "Frm_ACCOUNT_detail.frx":0FDD
            PictureFalse    =   "Frm_ACCOUNT_detail.frx":0FF9
            BackImage       =   "Frm_ACCOUNT_detail.frx":1015
            MouseIcon       =   "Frm_ACCOUNT_detail.frx":1031
            Value           =   -1  'True
            Caption         =   "User"
         End
      End
      Begin VB.CommandButton cmd_Encrypt 
         Caption         =   "&Decrypt"
         Height          =   315
         Left            =   5880
         TabIndex        =   32
         Top             =   0
         Width           =   1215
      End
      Begin VB.Frame Frame3 
         Caption         =   "Account Options:"
         Height          =   1575
         Left            =   5880
         TabIndex        =   31
         Top             =   480
         Width           =   2775
         Begin VB.CheckBox chk_Enable_Acct_AVS 
            Caption         =   "Enable New Account"
            Height          =   255
            Left            =   360
            TabIndex        =   39
            Top             =   960
            Visible         =   0   'False
            Width           =   2175
         End
         Begin VB.CheckBox chk_Pin_Required 
            Caption         =   "Pin Required"
            Height          =   255
            Left            =   360
            TabIndex        =   38
            Top             =   480
            Visible         =   0   'False
            Width           =   1575
         End
         Begin VB.CheckBox chk_ACC_COPYPIN_ENABLED 
            Caption         =   "Copy Pin Enabled"
            Height          =   255
            Left            =   360
            TabIndex        =   11
            Top             =   840
            Width           =   2175
         End
         Begin VB.CheckBox chk_ACC_LOCKED 
            Caption         =   "Lock the Account"
            Height          =   255
            Left            =   360
            TabIndex        =   12
            Top             =   1200
            Visible         =   0   'False
            Width           =   2055
         End
         Begin VB.CheckBox chk_ACC_PASSWORD_ENABLED 
            Caption         =   "Password Enabled"
            Height          =   255
            Left            =   360
            TabIndex        =   10
            Top             =   360
            Width           =   2175
         End
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
         TabIndex        =   6
         Top             =   2340
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
         TabIndex        =   4
         Top             =   1440
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
         TabIndex        =   0
         Top             =   0
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
         TabIndex        =   2
         Top             =   720
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
         TabIndex        =   3
         Top             =   1080
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
         TabIndex        =   1
         Top             =   360
         Width           =   3405
      End
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
         TabIndex        =   5
         Top             =   1800
         Width           =   3405
      End
      Begin SCLABELLib.SCLabel lbl_ACC_FIRSTNAME 
         Height          =   315
         Index           =   1
         Left            =   360
         TabIndex        =   19
         Top             =   720
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   20
         Top             =   1080
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   21
         Top             =   360
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   22
         Top             =   1800
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   23
         Top             =   1440
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   24
         Top             =   2340
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   25
         Top             =   2700
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   120
      Top             =   7560
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   13
      Left            =   720
      TabIndex        =   47
      Top             =   7680
      Visible         =   0   'False
      Width           =   1485
      _Version        =   65536
      _ExtentX        =   2619
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   -2147483630
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
End
Attribute VB_Name = "Frm_ACCOUNT_detail"
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
Private m_FormLoaded As Boolean
Public m_AddEcashier As Boolean
Public m_Cancelled As Boolean


Private Function ValidatePosNumTxtBLANK(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If NumericTxt.Text <> "" Then
        If Not IsNumeric(NumericTxt.Text) Then
            NumericTxt.Text = ""
            MsgBox "Specify a positive numeric value or no value!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
            Exit Function
        Else
            If Val(NumericTxt.Text) < 0 Then
                NumericTxt.Text = ""
                MsgBox "Specify a positive numeric value or no value!", vbExclamation + vbOKOnly, "Data Error"
                NumericTxt.SetFocus
                Exit Function
            End If
        End If
    End If
    
    Dim AccPin As Integer
    AccPin = NumericTxt.Text
    If AccPin <> NumericTxt.Text Then
        NumericTxt.Text = ""
        NumericTxt.SetFocus
        MsgBox "Specify a positive integer value!", vbExclamation + vbOKOnly, "Critical"
    End If
    
End Function

Private Function ValidatePosAmount(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If Trim(NumericTxt.Text) = "" Then NumericTxt.Text = "0.00"
    If Not IsNumeric(NumericTxt.Text) Then
        NumericTxt.Text = "0"
        MsgBox "Specify a positive numeric amount!", vbExclamation + vbOKOnly, "Data Error"
        NumericTxt.SetFocus
    Else
        If Val(NumericTxt.Text) < 0 Then
            NumericTxt.Text = "0.00"
            MsgBox "Specify a positive numeric amount!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
        Else
            '12102008 - changed format to remove the comma {Jeff}
            NumericTxt.Text = Format(NumericTxt.Text, "###0.00")
        End If
    End If
End Function

'Private Sub Cbm_ACC_TYPE_click()
'    If Cbm_ACC_TYPE.Text = "WALK-IN" Then
'
'     MsgBox "Please contact your Vendor if you require this Account Type.", vbExclamation + vbOKOnly, "Feature Not Available"
'        Cbm_ACC_TYPE.Text = "Permanent"
'
'    '//04292009 - Jeff
'    '//commentted out so that the users are not able to select the Wlak-in account type
'     '   optAccLevel(2).Value = False
'     '   optAccLevel(1).Value = False
'     '   optAccLevel(0).Value = True
'    '// Already commented out
'     '   DoEvents
'     '   optAccLevel(0).Refresh
'     '   DoEvents
'
'    End If
'End Sub

Private Sub Cbm_OU_Click()
    If m_FormLoaded = True Or gObjAccountMngr.TranOper = gcAddRecord Then
        Call gObjAccountMngr.SetOUDefaults(Me)
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
    End If
End Sub

Private Sub Cbm_OU_DEFAULT_CLIENT_Click()

   Call Mod_Data.LoadComboFromSQL("Select CM_Matter from dbo.docugate_general_cm " _
    & " where CC_GUID = (Select CC_GUID from dbo.docugate_general_cc " _
    & " where CC_Code = '" & Cbm_OU_DEFAULT_CLIENT.Text & "')", Cbm_OU_DEFAULT_MATTER)
    
   '//Lookup the matter description which the user just selected
   txt_Def_ClientCode.Text = nchk(Mod_Data.GetSQLValue("Select CC_DESC from dbo.docugate_general_cc " _
    & " where CC_Code = '" & Cbm_OU_DEFAULT_CLIENT.Text & "'"))
   txt_Def_MatterCode.Text = ""
    
End Sub

Private Sub Cbm_OU_DEFAULT_MATTER_Click()
   '//Lookup the matter description which the user just selected
   If Me.Cbm_OU_DEFAULT_MATTER.Text = "" Then
        Me.txt_Def_MatterCode.Text = ""
   Else
        txt_Def_MatterCode.Text = nchk(Mod_Data.GetSQLValue("Select CM_DESCRIPTION from dbo.docugate_general_cm " _
            & " where CM_MATTER = '" & Cbm_OU_DEFAULT_MATTER.Text & "'"))
   End If
End Sub

Private Sub chk_ACC_COPYPIN_ENABLED_Click()
On Error GoTo Err_Handler
    
    If chk_ACC_COPYPIN_ENABLED.Value = 1 Then
        Me.txt_ACC_COPYPIN.Enabled = True
    Else
        Me.txt_ACC_COPYPIN.Enabled = False
        Me.txt_ACC_COPYPIN.Text = ""
    End If
    
    If m_FormLoaded = True Then Me.txt_ACC_COPYPIN.SetFocus
    Exit Sub
    
Err_Handler:
End Sub

Private Sub chk_ACC_PASSWORD_ENABLED_Click()
On Error GoTo Err_Handler
    If chk_ACC_PASSWORD_ENABLED.Value = 1 Then
        Me.txt_ACC_PASSWORD.Enabled = True
    Else
        Me.txt_ACC_PASSWORD.Text = ""
        Me.txt_ACC_PASSWORD.Enabled = False
    End If
    
    If m_FormLoaded = True Then Me.txt_ACC_PASSWORD.SetFocus
    Exit Sub
Err_Handler:
End Sub



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
    gObjFormEvent.Cancelled = True
    Unload Me
End Sub

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    
    If gObjAccountMngr.DeleteAccount(gObjAccountMngr.RecordGUID) = False Then
        Caption = gObjAccountMngr.mLastError
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
    Else
        Unload Me
    End If
End Sub

Private Sub cmd_Encrypt_Click()
    If cmd_Encrypt.Caption = "&Decrypt" Then
        
        txt_ACC_BADGE.PasswordChar = ""
        txt_ACC_PASSWORD.PasswordChar = ""
        Me.txt_ACC_COPYID.PasswordChar = ""
        txt_ACC_COPYPIN.PasswordChar = ""
        cmd_Encrypt.Caption = "&Encrypt"
    Else
        txt_ACC_BADGE.PasswordChar = "*"
        txt_ACC_PASSWORD.PasswordChar = "*"
        Me.txt_ACC_COPYID.PasswordChar = "*"
        txt_ACC_COPYPIN.PasswordChar = "*"
        cmd_Encrypt.Caption = "&Decrypt"
    End If
End Sub

Private Sub Cmd_Fund_Click()
 gObjFormEvent.Cancelled = False
 gObjFormEvent.ShowFundingForm = True
 gObjFormEvent.FundingBadge = Me.txt_ACC_BADGE
 Unload Me
End Sub

Private Sub Cmd_Next_Click()
    If Validate() = False Then Exit Sub
    If gObjAccountMngr.SaveAccount(Me) = False Then
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
    End If
    
    
End Sub

Private Sub Cmd_Process_Click()

    If Validate() = False Then Exit Sub
    If gObjAccountMngr.SaveAccount(Me) = False Then
        gObjFormEvent.AccountAdded = False
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
    Else
        gObjFormEvent.AccountAdded = True
        gObjFormEvent.NewAccountBadge = Me.txt_ACC_BADGE
        Unload Me
    End If
    
End Sub

Private Function Validate() As Boolean
    If Trim(txt_ACC_BADGE.Text) = "" Then
        MsgBox "Specify the Badge/ID of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_ACC_BADGE.SetFocus
        Exit Function
    End If
    If Trim(txt_ACC_FIRSTNAME.Text) = "" Then
        MsgBox "Specify the First name of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_ACC_FIRSTNAME.SetFocus
        Exit Function
    End If
    If Trim(txt_ACC_LASTNAME.Text) = "" Then
        MsgBox "Specify the Last name of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_ACC_LASTNAME.SetFocus
        Exit Function
    End If
    If Trim(txt_ACC_FULLNAME.Text) = "" Then
        MsgBox "Specify the Full name of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_ACC_FULLNAME.SetFocus
        Exit Function
    End If
'    If Trim(Cbm_ACC_TYPE.Text) = "" Then
'        MsgBox "Specify the Type of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
'        Cbm_ACC_TYPE.SetFocus
'        Exit Function
'    End If
    If Trim(Cbm_OU.Text) = "" Then
        MsgBox "Specify the Organizational Unit " & " of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        Cbm_OU.SetFocus
        Exit Function
    End If

    If gObjAccountMngr.VerifyAccBadge_Exists(Me.txt_ACC_BADGE.Text) = True Then
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Function
        End If
        MsgBox "Attempt to create a duplicate Badge/ID!", vbExclamation + vbOKOnly, "Error"
        txt_ACC_BADGE.SetFocus
        Exit Function
    End If
    
    '//05052009 - Added to validate the OU when the electronic cashier feature is selected.
    If chk_AVS.Value = 1 Then
        If Not Cbm_OU.Text = "ECASHIER" Then
            MsgBox "When creating an Electronic Cashier please select the 'ECASHIER' OU!", vbExclamation + vbOKOnly, "Error"
            Cbm_OU.SetFocus
            Exit Function
        End If
    End If
       
    Validate = True
End Function

Private Sub Command1_Click()

End Sub

Private Sub Form_Activate()
    m_FormLoaded = True
    
     '//05052009 - handle managing AVS account
        'If Cbm_OU.Text = "ECASHIER" Then
        
      '//05272009 - handle the fact that the AVS unit adds users to the ECASHIER OU
        If optAccLevel(1).Value = True And Cbm_OU.Text = "ECASHIER" Then
        
        chk_AVS.Enabled = True
            
      '//change label
        Frame1.Caption = "eCashier Alias/ID:"
        lbl_ACC_FIRSTNAME(1).Caption = "eCashier Add:"
        lbl_ACC_LASTNAME(2).Caption = "eCashier Loc:"
        lbl_ACC_FULLNAME(7).Caption = "eCashier Add/Loc:"
        SCLabel1(4).Caption = "Institution Desc:"
            
        chk_AVS.Enabled = True
        chk_AVS.Value = 1
        chk_Pin_Required.Visible = True
        
        
        If chk_ACC_COPYPIN_ENABLED.Value = 1 Then
            chk_Pin_Required.Value = 1
        Else
            chk_Pin_Required.Value = 0
        End If
        
      '//05272009 - Added to handle the enabling and disabling of the Add
      '//           New Account feature on the AVS unit
        chk_Enable_Acct_AVS.Visible = True
        
        If chk_ACC_PASSWORD_ENABLED.Value = 1 Then
            chk_Enable_Acct_AVS.Value = 1
        Else
            chk_Enable_Acct_AVS.Value = 0
        End If
        
       '// disable
        SCLabel1(1).Visible = False
        SCLabel1(3).Visible = False
        SCLabel1(8).Visible = False
        SCLabel1(9).Visible = False
        SCLabel1(10).Visible = False
        txt_ACC_PASSWORD.Visible = False
        txt_ACC_COPYID.Visible = False
        txt_ACC_COPYPIN.Visible = False
        txt_ACC_FUNDS.Visible = False
        Frame4.Visible = False
        chk_ACC_PASSWORD_ENABLED.Visible = False
        chk_ACC_COPYPIN_ENABLED.Visible = False
    Else
        
        '//05272009 - adjusts the field labels based upon the account security level
        chk_AVS.Value = 0
        chk_AVS.Enabled = False
        
        '// Change Lable
        Frame1.Caption = " Account Badge/ID:"
        SCLabel1(3).Caption = "Password:"
        lbl_ACC_FIRSTNAME(1).Caption = "First name:"
        lbl_ACC_LASTNAME(2).Caption = "Last name:"
        lbl_ACC_FULLNAME(7).Caption = "Full Name:"
        SCLabel1(4).Caption = "Email:"
        
        
        chk_AVS.Value = 0
        chk_Pin_Required.Visible = False
        chk_Enable_Acct_AVS.Visible = False
        
        '// enable
        SCLabel1(1).Visible = True
        SCLabel1(3).Visible = True
        SCLabel1(8).Visible = True
        SCLabel1(9).Visible = True
        SCLabel1(10).Visible = True
        txt_ACC_PASSWORD.Visible = True
        txt_ACC_COPYID.Visible = True
        txt_ACC_COPYPIN.Visible = True
        txt_ACC_FUNDS.Visible = True
        Frame4.Visible = True
        chk_ACC_PASSWORD_ENABLED.Visible = True
        chk_ACC_COPYPIN_ENABLED.Visible = True
        
    End If
    
End Sub

Private Sub Form_Load()
    m_FormLoaded = False
    Call CentreForm(Me)
    m_Entity = "Account"
    m_Cancelled = False
    
    gObjFormEvent.ShowFundingForm = False
    gObjFormEvent.FundingBadge = ""
    gObjFormEvent.Cancelled = False
  
End Sub

'// 05052009
'// Added by Jeff to allow for the addition of
'// eletronic cashiers in order to support the
'// Add Value Stations {AVS Units}
'// The purpose is to allow the Admin to add an
'// eletronic cashier to the system that functions
'// as a regular cashier would. The difference is that
'// once the "Electric Cashier" option is selected
'// the labels on the GUI will change so that the Admin will
'// know the required information.

Private Sub optAccLevel_Click(Index As Integer)
    If optAccLevel(1).Value = True Then
        chk_AVS.Enabled = True
    Else
        chk_AVS.Value = 0
        chk_AVS.Enabled = False
    End If
    
End Sub

'// 05052009
'// Added by Jeff to change the screen labels

Private Sub chk_AVS_Click()
    If chk_AVS.Value = 1 Then
        '//Change Caption
        Frame1.Caption = "eCashier Alise/ID:"
        lbl_ACC_FIRSTNAME(1).Caption = "eCashier Add:"
        lbl_ACC_LASTNAME(2).Caption = "eCashier Loc:"
        lbl_ACC_FULLNAME(7).Caption = "eCashier Add/Loc:"
        SCLabel1(4).Caption = "Institution Desc:"
            
        chk_Pin_Required.Visible = True
        
        '// 05272009 - Added to enable or disable the Add new Acct feature on teh AVS unit.
        chk_Enable_Acct_AVS.Visible = True
        
        'chk_ACC_COPYPIN_ENABLED.Value = 1
        'chk_ACC_COPYPIN_ENABLED.Caption = "Account Pin Required"
        
        '//Hide Field
        SCLabel1(1).Visible = False
        SCLabel1(3).Visible = False
        SCLabel1(8).Visible = False
        SCLabel1(9).Visible = False
        SCLabel1(10).Visible = False
        txt_ACC_PASSWORD.Visible = False
        txt_ACC_COPYID.Visible = False
        txt_ACC_COPYPIN.Visible = False
        txt_ACC_FUNDS.Visible = False
        Frame4.Visible = False
        chk_ACC_PASSWORD_ENABLED.Visible = False
        chk_ACC_COPYPIN_ENABLED.Visible = False
        
    Else
    
        Frame1.Caption = " Account Badge/ID:"
        SCLabel1(3).Caption = "Password:"
        lbl_ACC_FIRSTNAME(1).Caption = "First name:"
        lbl_ACC_LASTNAME(2).Caption = "Last name:"
        lbl_ACC_FULLNAME(7).Caption = "Full Name:"
        SCLabel1(4).Caption = "Email:"
        
        chk_AVS.Value = 0
        chk_Pin_Required.Visible = False
        chk_Enable_Acct_AVS.Visible = False
        
        
        '//Enable Fields
        SCLabel1(1).Visible = True
        SCLabel1(3).Visible = True
        SCLabel1(8).Visible = True
        SCLabel1(9).Visible = True
        SCLabel1(10).Visible = True
        txt_ACC_PASSWORD.Visible = True
        txt_ACC_COPYID.Visible = True
        txt_ACC_COPYPIN.Visible = True
        txt_ACC_FUNDS.Visible = True
        Frame4.Visible = True
        chk_ACC_PASSWORD_ENABLED.Visible = True
        chk_ACC_COPYPIN_ENABLED.Visible = True
        
    End If
End Sub


Private Sub chk_Pin_Required_Click()
'//05052009
'// Added to handle enabling the pin for the AVS unit
 
 If chk_Pin_Required.Value = 1 Then
        chk_ACC_COPYPIN_ENABLED.Value = 1
    Else
        chk_ACC_COPYPIN_ENABLED.Value = 0
 End If

End Sub

Private Sub chk_Enable_Acct_AVS_Click()
'//05272009
'// added to handle the disabling of the New Acct feature of the AVS unit

    If chk_Enable_Acct_AVS.Value = 1 Then
            chk_ACC_PASSWORD_ENABLED.Value = 1
        Else
            chk_ACC_PASSWORD_ENABLED.Value = 0
    End If

End Sub

Private Sub Reset_Timer()
    Reset.Enabled = False
    Me.Caption = "&Add Account"
End Sub

Private Sub txt_ACC_BADGE_LostFocus()

    txt_ACC_BADGE.Text = RemoveQuotes(txt_ACC_BADGE.Text)
    If gObjAccountMngr.TranOper = gcAddRecord Then
        Me.txt_ACC_COPYID.Text = txt_ACC_BADGE.Text
    Else
        If uct(gObjAccountMngr.mBadge <> uct(Me.txt_ACC_BADGE.Text)) Then
            txt_ACC_BADGE.Text = gObjAccountMngr.mBadge
            MsgBox "The Account Badge/ID may not be updated! Delete and create a new account.", vbExclamation + vbOKOnly, "Error"
        End If
    End If
End Sub

Private Sub txt_ACC_BADGE_GotFocus()
    Call HighLightField(txt_ACC_BADGE)
End Sub

Private Sub txt_ACC_COPYID_GotFocus()
    Call HighLightField(txt_ACC_COPYID)
End Sub

Private Sub txt_ACC_COPYID_LostFocus()
'//04/03/2008
    If Trim(txt_ACC_COPYPIN.Text) <> "" Then
        Call ValidatePosNumTxtBLANK(txt_ACC_COPYPIN)
    End If
End Sub

Private Sub txt_ACC_COPYPIN_Gotfocus()
    Call HighLightField(txt_ACC_COPYPIN)
End Sub

Private Sub txt_ACC_COPYPIN_LostFocus()
'//04/03/2008
    If Trim(txt_ACC_COPYPIN.Text) <> "" Then
        Call ValidatePosNumTxtBLANK(txt_ACC_COPYPIN)
    End If
End Sub

Private Sub txt_ACC_EMAIL_GotFocus()
    Call HighLightField(txt_ACC_EMAIL)
End Sub

Private Sub txt_ACC_FIRSTNAME_GotFocus()
    Call HighLightField(txt_ACC_FIRSTNAME)
End Sub

Private Sub txt_ACC_FIRSTNAME_LostFocus()
    If txt_ACC_FIRSTNAME.Text <> "" Then
        Me.txt_ACC_FULLNAME.Text = txt_ACC_FIRSTNAME & Space(1) & txt_ACC_LASTNAME
    End If
End Sub

Private Sub txt_ACC_FULLNAME_Gotfocus()
    Call HighLightField(txt_ACC_FULLNAME)
End Sub

Private Sub txt_ACC_FUNDS_GotFocus()
    Call HighLightField(txt_ACC_FUNDS)
End Sub

Private Sub txt_ACC_LASTNAME_GotFocus()
    Call HighLightField(txt_ACC_LASTNAME)
End Sub

Private Sub txt_ACC_LASTNAME_LostFocus()
    If txt_ACC_LASTNAME.Text <> "" Then
        Me.txt_ACC_FULLNAME.Text = txt_ACC_FIRSTNAME & Space(1) & txt_ACC_LASTNAME
    End If
End Sub

Private Sub txt_ACC_FUNDS_LostFocus()
    '12102008 - in order to remove coma in number {Jeff}
    txt_ACC_FUNDS.Text = Format(txt_ACC_FUNDS.Text, "###0.00")
    If Trim(txt_ACC_FUNDS.Text) <> "" Then
        Call ValidatePosAmount(txt_ACC_FUNDS)
    Else
        Call ValidatePosAmount(txt_ACC_FUNDS)
    End If
End Sub

Private Sub txt_ACC_PASSWORD_LostFocus()
    If gObjAccountMngr.TranOper = gcAddRecord Then
        Me.txt_ACC_COPYPIN.Text = txt_ACC_PASSWORD.Text
    End If
End Sub

Private Sub txt_ACC_PASSWORD_GotFocus()
    Call HighLightField(txt_ACC_PASSWORD)
End Sub

Private Sub txt_ACC_PIN_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Call ValidatePosNumTxtBLANK(txt_ACC_BADGE)
End Sub
