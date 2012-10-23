VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{77EBD0B1-871A-4AD1-951A-26AEFE783111}#2.1#0"; "vbalExpBar6.ocx"
Object = "{396F7AC0-A0DD-11D3-93EC-00C0DFE7442A}#1.0#0"; "vbalIml6.ocx"
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Object = "{15519D4E-5365-4718-B5E8-8F541C781688}#1.1#0"; "CoolXPPanel.ocx"
Object = "{2A6D8023-0587-4248-B0CB-11006E6C640B}#3.7#0"; "CoolXPButton.ocx"
Begin VB.MDIForm Frm_Main 
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   10290
   ClientLeft      =   -525
   ClientTop       =   1005
   ClientWidth     =   15735
   Icon            =   "Frm_Main.frx":0000
   LinkTopic       =   "MDIForm1"
   ScrollBars      =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer PanelTimer 
      Interval        =   1000
      Left            =   9240
      Top             =   3360
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Left            =   9240
      Top             =   3840
   End
   Begin VB.Timer QuickStatsTimer 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   9720
      Top             =   3360
   End
   Begin vbalIml6.vbalImageList ilsTitleIcons 
      Left            =   8640
      Top             =   3360
      _ExtentX        =   953
      _ExtentY        =   953
      IconSizeX       =   32
      IconSizeY       =   32
      ColourDepth     =   32
      Size            =   39708
      Images          =   "Frm_Main.frx":08CA
      Version         =   131072
      KeyCount        =   9
      Keys            =   "ÿÿÿÿÿÿÿÿ"
   End
   Begin vbalIml6.vbalImageList ilsIcons 
      Left            =   8040
      Top             =   3360
      _ExtentX        =   953
      _ExtentY        =   953
      ColourDepth     =   32
      Size            =   13776
      Images          =   "Frm_Main.frx":A406
      Version         =   131072
      KeyCount        =   12
      Keys            =   "ÿÿÿÿÿÿÿÿÿÿÿ"
   End
   Begin vbalExplorerBarLib6.vbalExplorerBarCtl ouExplorer 
      Align           =   3  'Align Left
      Height          =   9945
      Left            =   0
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   0
      Width           =   2700
      _ExtentX        =   4763
      _ExtentY        =   17542
      BackColorEnd    =   -1
      BackColorStart  =   -1
   End
   Begin VB.PictureBox MainPicture 
      Align           =   3  'Align Left
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   9945
      Left            =   2700
      ScaleHeight     =   9945
      ScaleWidth      =   13035
      TabIndex        =   1
      Top             =   0
      Width           =   13035
      Begin VB.PictureBox pnlCashierFilter 
         BorderStyle     =   0  'None
         Height          =   1395
         Left            =   5400
         ScaleHeight     =   1395
         ScaleWidth      =   1995
         TabIndex        =   48
         Top             =   1680
         Visible         =   0   'False
         Width           =   1995
         Begin VB.TextBox txtCashierFilterData 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            Height          =   285
            Left            =   120
            TabIndex        =   51
            Top             =   480
            Width           =   1695
         End
         Begin VB.ComboBox cboCashierFilterType 
            BackColor       =   &H00FFFFFF&
            Height          =   315
            ItemData        =   "Frm_Main.frx":D9F6
            Left            =   120
            List            =   "Frm_Main.frx":DA09
            Style           =   2  'Dropdown List
            TabIndex        =   50
            Top             =   120
            Width           =   1755
         End
         Begin VB.CommandButton cmd_CashierFilterApply 
            Caption         =   "&Apply"
            Height          =   375
            Left            =   240
            TabIndex        =   49
            Top             =   840
            Width           =   1455
         End
      End
      Begin VB.PictureBox pnlModified 
         BorderStyle     =   0  'None
         Height          =   1395
         Left            =   5520
         ScaleHeight     =   1395
         ScaleWidth      =   1995
         TabIndex        =   44
         Top             =   240
         Visible         =   0   'False
         Width           =   1995
         Begin VB.CommandButton cmd_ApplyFilter 
            Caption         =   "&Apply"
            Height          =   375
            Left            =   240
            TabIndex        =   47
            Top             =   840
            Width           =   1455
         End
         Begin VB.ComboBox cboFilterType 
            BackColor       =   &H00FFFFFF&
            Height          =   315
            ItemData        =   "Frm_Main.frx":DA43
            Left            =   120
            List            =   "Frm_Main.frx":DA56
            Style           =   2  'Dropdown List
            TabIndex        =   46
            Top             =   120
            Width           =   1755
         End
         Begin VB.TextBox txtFilterData 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0FFFF&
            Height          =   285
            Left            =   120
            TabIndex        =   45
            Top             =   480
            Width           =   1695
         End
      End
      Begin CoolXPPanel.xpPanel QuickStats 
         Height          =   4095
         Left            =   480
         Top             =   240
         Visible         =   0   'False
         Width           =   4695
         _ExtentX        =   8281
         _ExtentY        =   7223
         BackColor       =   14737632
         Begin CoolXPButton.xpButton cmdQuickStatsMax 
            Height          =   300
            HelpContextID   =   300
            Left            =   8280
            TabIndex        =   7
            ToolTipText     =   "Maximise Quick Stats"
            Top             =   240
            Width           =   300
            _ExtentX        =   529
            _ExtentY        =   529
            Caption         =   ""
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty FontOnMouseOver {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Picture         =   "Frm_Main.frx":DA90
            BeginProperty FontDown {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            OfficeBackColor =   12632256
         End
         Begin VB.ComboBox cboDtPeriod 
            Appearance      =   0  'Flat
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
            Left            =   480
            TabIndex        =   9
            Text            =   "Combo1"
            Top             =   600
            Width           =   3375
         End
         Begin CoolXPButton.xpButton cmdQuickStatsMin 
            Height          =   300
            Left            =   8280
            TabIndex        =   6
            ToolTipText     =   "Minimise Quick Stats"
            Top             =   240
            Visible         =   0   'False
            Width           =   300
            _ExtentX        =   529
            _ExtentY        =   529
            Caption         =   ""
            BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            BeginProperty FontOnMouseOver {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Picture         =   "Frm_Main.frx":DBEA
            BeginProperty FontDown {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
               Name            =   "Verdana"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Top Client Avg Sales Dollar Value"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   16
            Left            =   1320
            TabIndex        =   43
            Top             =   2640
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   16
            Left            =   960
            Picture         =   "Frm_Main.frx":DD44
            Top             =   2640
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   16
            Left            =   7245
            TabIndex        =   42
            Top             =   2640
            Width           =   1605
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of Accounts/Security Levels # of ADMINISTRATORS:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   15
            Left            =   1320
            TabIndex        =   41
            Top             =   6480
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   15
            Left            =   960
            Picture         =   "Frm_Main.frx":E2A6
            Top             =   6480
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   15
            Left            =   7245
            TabIndex        =   40
            Top             =   6480
            Width           =   1605
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of Accounts/Security Levels # of CASHIERS:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   14
            Left            =   1320
            TabIndex        =   39
            Top             =   6120
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   14
            Left            =   960
            Picture         =   "Frm_Main.frx":E808
            Top             =   6120
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   14
            Left            =   7245
            TabIndex        =   38
            Top             =   6120
            Width           =   1605
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of Accounts/Security Levels # of USERS:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   13
            Left            =   1320
            TabIndex        =   37
            Top             =   5760
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   13
            Left            =   960
            Picture         =   "Frm_Main.frx":ED6A
            Top             =   5760
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   13
            Left            =   7245
            TabIndex        =   36
            Top             =   5760
            Width           =   1605
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   12
            Left            =   7245
            TabIndex        =   35
            Top             =   3720
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   12
            Left            =   960
            Picture         =   "Frm_Main.frx":F2CC
            Top             =   3720
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Total # of Pages"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   12
            Left            =   1320
            TabIndex        =   34
            Top             =   3720
            Width           =   5925
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Next Database Backup Due on"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   11
            Left            =   1320
            TabIndex        =   33
            Top             =   7440
            Visible         =   0   'False
            Width           =   3495
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   11
            Left            =   960
            Picture         =   "Frm_Main.frx":F82E
            Top             =   7440
            Visible         =   0   'False
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "mm/dd/yyyy"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   11
            Left            =   6240
            TabIndex        =   32
            Top             =   7440
            Width           =   2685
         End
         Begin VB.Image Image4 
            Height          =   480
            Left            =   360
            Picture         =   "Frm_Main.frx":FD90
            Top             =   6960
            Visible         =   0   'False
            Width           =   480
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Last Database Backup"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   10
            Left            =   1320
            TabIndex        =   31
            Top             =   7080
            Visible         =   0   'False
            Width           =   3495
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   10
            Left            =   960
            Picture         =   "Frm_Main.frx":1065A
            Top             =   7080
            Visible         =   0   'False
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "mm/dd/yyyy"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   10
            Left            =   6240
            TabIndex        =   30
            Top             =   7080
            Width           =   2685
         End
         Begin VB.Image Image3 
            Height          =   480
            Left            =   360
            Picture         =   "Frm_Main.frx":10BBC
            Top             =   4200
            Width           =   480
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Total # of Copies"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   9
            Left            =   1320
            TabIndex        =   29
            Top             =   3360
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   9
            Left            =   960
            Picture         =   "Frm_Main.frx":11486
            Top             =   3360
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   9
            Left            =   7245
            TabIndex        =   28
            Top             =   3360
            Width           =   1605
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Top OU Cost"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   8
            Left            =   1320
            TabIndex        =   27
            Top             =   3000
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   8
            Left            =   960
            Picture         =   "Frm_Main.frx":119E8
            Top             =   3000
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   8
            Left            =   7245
            TabIndex        =   26
            Top             =   3000
            Width           =   1605
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Top Client Cost"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   7
            Left            =   1320
            TabIndex        =   25
            Top             =   2280
            Width           =   5925
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   7
            Left            =   960
            Picture         =   "Frm_Main.frx":11F4A
            Top             =   2280
            Width           =   210
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   7
            Left            =   7250
            TabIndex        =   24
            Top             =   2280
            Width           =   1605
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   6
            Left            =   7245
            TabIndex        =   23
            Top             =   5400
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   6
            Left            =   960
            Picture         =   "Frm_Main.frx":124AC
            Top             =   5400
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of PERMANENT Accounts/Badges"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   6
            Left            =   1320
            TabIndex        =   22
            Top             =   5400
            Width           =   5925
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   5
            Left            =   7245
            TabIndex        =   21
            Top             =   5040
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   5
            Left            =   960
            Picture         =   "Frm_Main.frx":12A0E
            Top             =   5040
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of WALK-IN Accounts/Badges"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   5
            Left            =   1320
            TabIndex        =   20
            Top             =   5040
            Width           =   5925
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   4
            Left            =   7245
            TabIndex        =   19
            Top             =   4680
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   4
            Left            =   960
            Picture         =   "Frm_Main.frx":12F70
            Top             =   4680
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of Accounts/Badges CHECKED OUT"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   4
            Left            =   1320
            TabIndex        =   18
            Top             =   4680
            Width           =   5925
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   3
            Left            =   7245
            TabIndex        =   17
            Top             =   4320
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   3
            Left            =   960
            Picture         =   "Frm_Main.frx":134D2
            Top             =   4320
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "# of Accounts/Badges AVAILABLE"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   3
            Left            =   1320
            TabIndex        =   16
            Top             =   4320
            Width           =   5925
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   2
            Left            =   7250
            TabIndex        =   15
            Top             =   1920
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   2
            Left            =   960
            Picture         =   "Frm_Main.frx":13A34
            Top             =   1920
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Top Cashier Sales"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   2
            Left            =   1320
            TabIndex        =   14
            Top             =   1920
            Width           =   5925
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   1
            Left            =   7250
            TabIndex        =   13
            Top             =   1560
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   1
            Left            =   960
            Picture         =   "Frm_Main.frx":13F96
            Top             =   1560
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Total Sales Dollar Value"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   1
            Left            =   1320
            TabIndex        =   12
            Top             =   1560
            Width           =   5925
         End
         Begin VB.Label lbQVal 
            Alignment       =   1  'Right Justify
            BackStyle       =   0  'Transparent
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   0
            Left            =   7250
            TabIndex        =   11
            Top             =   1200
            Width           =   1605
         End
         Begin VB.Image Image2 
            Height          =   210
            Index           =   0
            Left            =   960
            Picture         =   "Frm_Main.frx":144F8
            Top             =   1200
            Width           =   210
         End
         Begin VB.Label lblQStat 
            BackStyle       =   0  'Transparent
            Caption         =   "Total Sales Count"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Index           =   0
            Left            =   1320
            TabIndex        =   10
            Top             =   1200
            Width           =   5925
         End
         Begin VB.Image Image1 
            Height          =   720
            Left            =   360
            Picture         =   "Frm_Main.frx":14A5A
            Top             =   1080
            Width           =   720
         End
         Begin VB.Label Label1 
            BackStyle       =   0  'Transparent
            Caption         =   "Quick Stats"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   12
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00800000&
            Height          =   375
            Left            =   480
            TabIndex        =   8
            Top             =   240
            Width           =   1695
         End
      End
      Begin vbAcceleratorGrid6.vbalGrid SecondaryGrid 
         Height          =   915
         Left            =   2160
         TabIndex        =   5
         Top             =   6480
         Width           =   975
         _ExtentX        =   1720
         _ExtentY        =   1614
         MultiSelect     =   -1  'True
         RowMode         =   -1  'True
         BackgroundPictureHeight=   0
         BackgroundPictureWidth=   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DisableIcons    =   -1  'True
      End
      Begin vbAcceleratorGrid6.vbalGrid MainGrid 
         Height          =   915
         Left            =   4065
         TabIndex        =   4
         Top             =   6480
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   1614
         MultiSelect     =   -1  'True
         RowMode         =   -1  'True
         BackgroundPictureHeight=   0
         BackgroundPictureWidth=   0
         HighlightBackColor=   16761024
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BorderStyle     =   2
         DisableIcons    =   -1  'True
      End
      Begin MSComctlLib.TabStrip TabStrip 
         Height          =   3405
         Left            =   360
         TabIndex        =   3
         Top             =   4320
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   6006
         _Version        =   393216
         BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
            NumTabs         =   1
            BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "Accounts"
               ImageVarType    =   2
            EndProperty
         EndProperty
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Microsoft Sans Serif"
            Size            =   7.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   0
      Top             =   9945
      Width           =   15735
      _ExtentX        =   27755
      _ExtentY        =   609
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   3519
            MinWidth        =   3528
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
            Object.Width           =   5292
            MinWidth        =   5292
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            AutoSize        =   2
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin vbalIml6.vbalImageList vbalImageList1 
      Left            =   0
      Top             =   0
      _ExtentX        =   953
      _ExtentY        =   953
      IconSizeX       =   32
      IconSizeY       =   32
      ColourDepth     =   32
      Size            =   4412
      Images          =   "Frm_Main.frx":1A23C
      Version         =   131072
      KeyCount        =   1
      Keys            =   ""
   End
   Begin VB.Menu muFile 
      Caption         =   "File"
      Begin VB.Menu mnuFileLogin 
         Caption         =   "&Login"
      End
      Begin VB.Menu mnuFileLogout 
         Caption         =   "&Logout"
      End
      Begin VB.Menu mnuFileDum1 
         Caption         =   "-"
      End
      Begin VB.Menu muExit 
         Caption         =   "&Exit"
         Shortcut        =   ^X
      End
   End
   Begin VB.Menu mnuConfiguration 
      Caption         =   "&Configuration"
      Begin VB.Menu mnuGlobals 
         Caption         =   "Global &Pricing Values"
      End
      Begin VB.Menu mnuGlobalsSmartCopy 
         Caption         =   "&SmartCopy Units"
         Visible         =   0   'False
      End
      Begin VB.Menu muSPC 
         Caption         =   "&Server Usage"
         Enabled         =   0   'False
         Visible         =   0   'False
      End
   End
   Begin VB.Menu muTools 
      Caption         =   "&Tools"
      Begin VB.Menu muDBBackup 
         Caption         =   "&Backup Database"
         Visible         =   0   'False
      End
      Begin VB.Menu muDBRestore 
         Caption         =   "&Restore Database"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuToolsDummy2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDBProperties 
         Caption         =   "Database Properties"
      End
      Begin VB.Menu muDBScriptSchema 
         Caption         =   "&Script Schema"
      End
      Begin VB.Menu muDBExport 
         Caption         =   "&Export Data"
      End
   End
   Begin VB.Menu mnuTasks 
      Caption         =   "&Administrator"
      Begin VB.Menu mnuTasksOUGroups 
         Caption         =   "&OU Tasks"
      End
      Begin VB.Menu mnuTasksAccounts 
         Caption         =   "&Account Tasks"
      End
      Begin VB.Menu mnuTasksClientMatters 
         Caption         =   "&Client Tasks"
      End
      Begin VB.Menu mnuTasksControlUnits 
         Caption         =   "&MCR Tasks"
      End
   End
   Begin VB.Menu mnuTasksCashier 
      Caption         =   "&Cashier"
      Begin VB.Menu mnuTasksCashierAccStatus 
         Caption         =   "&Account Status"
      End
      Begin VB.Menu mnuTasksCashierDum1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuTasksCashierChkOut 
         Caption         =   "Check Account/Badge &Out"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuTasksCashierChkIn 
         Caption         =   "Check Account/Badge &In"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuTasksCashierDum2 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuTasksCashierAddAcc 
         Caption         =   "&Add Account"
      End
      Begin VB.Menu mnuTasksCashierFundAcc 
         Caption         =   "&Fund Account"
      End
   End
   Begin VB.Menu mnuReports 
      Caption         =   "&Reports"
      Begin VB.Menu mnuReportsPrintAndCopy 
         Caption         =   "&Print and Copy Reports"
      End
      Begin VB.Menu mnuReportsCashier 
         Caption         =   "&Cashier Reports"
      End
      Begin VB.Menu mnuReportsCustom 
         Caption         =   "C&ustom Reports"
      End
   End
   Begin VB.Menu muHelp 
      Caption         =   "&Help"
      Begin VB.Menu muHelpDocGate 
         Caption         =   "&Help RealTime"
         Shortcut        =   {F1}
      End
      Begin VB.Menu muToolsDummy2 
         Caption         =   "-"
      End
      Begin VB.Menu muAbout 
         Caption         =   "&About"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuDisclaimer 
         Caption         =   "&Disclaimer"
         Shortcut        =   ^D
      End
   End
End
Attribute VB_Name = "Frm_Main"
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

Private m_bGroup As Boolean
Private mStartDtStr As String
Private mEndDtStr As String
Private mMainGridSelectedRow As Long
Private mContextStr As String

'//31/03/2008
Private CurrentAccountsViewFilter As String
Private AccountsViewFilter As String

Private Const m_TitleBar_NoIconIndex = 8
Private Const mc_OUTitle = "OU Groups"
Private Const mc_CTRLUNITS = "Control Units"
Private Const mc_CLIENTMATTERS = "Client / Matters"
Private Const mc_ACCOUNTS = "Accounts"
Private Const mc_PRINTCOPY_REPORTS = "Print/Copy Reports"
Private Const mc_CASHIER_REPORTS = "cashier reports"
Private Const mc_CUSTOM_REPORTS = "custom reports"
Private Const mc_ACCOUNT_STATUS = "Account Status"
Private Const mc_CASHIER_CHK_OUT = "Cashier Check OUT"
Private Const mc_CASHIER_CHK_IN = "Cashier Check IN"

Private Sub SetupOUExplorer()
      
    Dim cBar As cExplorerBar
    Dim cBar1 As cExplorerBar
    Dim cItem As cExplorerBarItem
    
    Dim sFnt As New StdFont
    sFnt.Name = "Verdana"
    sFnt.Size = 11
    sFnt.Italic = True
   
    Dim i As Integer
    
   
    With ouExplorer
      
      .Bars.Clear
      .Redraw = False
      .UseExplorerStyle = False
      .ImageList = ilsIcons.hIml
      .BarTitleImageList = ilsTitleIcons.hIml
      
    
      Set cBar = .Bars.Add(, "REPORTS", "Reports")
      cBar.ToolTipText = "RealTime Reports"
      cBar.IsSpecial = True
      If Val(MyTitleBarIconsShow.m_REPORTS) = 1 Then
         cBar.IconIndex = 4
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      cBar.State = eBarCollapsed
      If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
        Set cItem = cBar.Items.Add(, "REPORTS_PRCPY", "print and copy reports", 8)
      End If
      
      Set cItem = cBar.Items.Add(, "REPORTS_CASHIER", mc_CASHIER_REPORTS, 9)
      Set cItem = cBar.Items.Add(, "CUSTOM_REPORTS", mc_CUSTOM_REPORTS, 9)


   If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
         
      '--- OU Group
      Set cBar = .Bars.Add(, "OU", "OU Tasks")
      cBar.ToolTipText = "RealTime Organizational Unit tasks"
      If Val(MyTitleBarIconsShow.m_OU) = 1 Then
         cBar.IconIndex = 1
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      
      Call SetOUExplorerBarPermission(cBar)
      cBar.IsSpecial = True
      
      Set cItem = cBar.Items.Add(, "OU_ADD", "&Add a new &OU", 1)
      Call SetOUExplorerItemPermission(cItem)
      Set cItem = cBar.Items.Add(, "OU_MANAGE", "&Update OU", 5)
      Call SetOUExplorerItemPermission(cItem)
      Set cItem = cBar.Items.Add(, "OU_FUND", "&Fund OU", 5)
      Call SetOUExplorerItemPermission(cItem)
      cBar.State = eBarCollapsed
   
   End If
  
   
   If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
      
      '--- Accounts
      Set cBar = .Bars.Add(, mc_ACCOUNTS, "Account tasks")
      cBar.IsSpecial = True
      
      cBar.ToolTipText = "RealTime Account Tasks"
      If Val(MyTitleBarIconsShow.m_Accounts) = 1 Then
         cBar.IconIndex = 0
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      
      Set cItem = cBar.Items.Add(, "ACCOUNT_ADD", "Add a &new account", 1)
      Set cItem = cBar.Items.Add(, "ACCOUNT_MANAGE", "&Update account", 5)
      Set cItem = cBar.Items.Add(, "ACCOUNT_FUNDING", "&fund account", 4)
      Set cItem = cBar.Items.Add(, "ACCOUNT_ACTIVESESSION", "&Active Sessions", 4)
      
      Call SetOUExplorerItemPermission(cItem)
      Set cItem = cBar.Items.Add(, "AVS_ADD", "add a &new AVS Unit", 1)
      
      Set cItem = cBar.Items.Add(, "MODIFIEDPANEL", , , eItemControlPlaceHolder)
      cItem.Control = pnlModified
      cBar.State = eBarCollapsed
  
  End If
  
      
   If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
      
      '--- Client and matters
      Set cBar = .Bars.Add(, "CLIENT", "Client Tasks")
      If Val(MyTitleBarIconsShow.m_CLIENTS) = 1 Then
         cBar.IconIndex = 2
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      
      Call SetOUExplorerBarPermission(cBar)
      
      cBar.ToolTipText = "RealTime Client Matter Tasks"
      cBar.IsSpecial = True
      Call SetOUExplorerBarPermission(cBar)
      
      Set cItem = cBar.Items.Add(, "CLIENT_ADD", "add a new client", 1)
      Call SetOUExplorerItemPermission(cItem)
      
      Set cItem = cBar.Items.Add(, "CLIENT_MANAGE", "manage clients", 5)
      Call SetOUExplorerItemPermission(cItem)
      
      Set cItem = cBar.Items.Add(, "MATTER_ADD", "add a new matter", 1)
      
      Set cItem = cBar.Items.Add(, "MATTER_MANAGE", "manage matters", 5)
      Call SetOUExplorerItemPermission(cItem)
      cBar.State = eBarCollapsed
  
  End If
       
      
  If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
      
      '--- Control Station
      Set cBar = .Bars.Add(, "CTRLUNIT", "DCS Stations")
      cBar.ToolTipText = "RealTime Control Unit Tasks"
      If Val(MyTitleBarIconsShow.m_CTRLUNIT) = 1 Then
         cBar.IconIndex = 3
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      
      cBar.IsSpecial = True
      Call SetOUExplorerBarPermission(cBar)
      
      Set cItem = cBar.Items.Add(, "CTRLUNIT_ADD", "add a new &DCS", 1)
      Call SetOUExplorerItemPermission(cItem)
      
     ' Set cItem = cBar.Items.Add(, "CTRLUNIT_MANAGE", "manage units", 5)
     ' Call SetOUExplorerItemPermission(cItem)
      cBar.State = eBarCollapsed
     
   End If
    
   If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
   
      Set cBar = .Bars.Add(, "CASHIER", "&Cashier tasks")
      cBar.ToolTipText = "RealTime Cashier tasks"
      If Val(MyTitleBarIconsShow.m_CASHIER) = 1 Then
         cBar.IconIndex = 6
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      cBar.State = eBarCollapsed
      cBar.IsSpecial = True
      
      If gDevMode = True Then
        Set cItem = cBar.Items.Add(, "CASHIER_DOPRINTCOPY", "do print + copy jobs", 11)
      End If
      Set cItem = cBar.Items.Add(, "CASHIER_ACCOUNT_ADD", "add a &new account", 1)
      Set cItem = cBar.Items.Add(, "CASHIER_MANAGE", "&Update account", 5)
      Set cItem = cBar.Items.Add(, "CASHIER_ACTIVESESSION", "&Active Sessions", 4)
      Set cItem = cBar.Items.Add(, "CASHIER_FUNDING", "&fund account", 4)
      Set cItem = cBar.Items.Add(, "MODIFIEDPANEL", , , eItemControlPlaceHolder)
      cItem.Control = pnlCashierFilter
    
   End If
      
      
      Set cBar = .Bars.Add(, "CONSOLE", "&Console tasks")
      cBar.ToolTipText = "RealTime Console tasks"
      If Val(MyTitleBarIconsShow.m_CASHIER) = 1 Then
         cBar.IconIndex = 7
      Else
         cBar.IconIndex = m_TitleBar_NoIconIndex
      End If
      
      cBar.State = eBarCollapsed
      cBar.IsSpecial = True
      Set cItem = cBar.Items.Add(, "QUICKSTATS", "quick stats", 0)
      Set cItem = cBar.Items.Add(, "CONSOLE-STATS", "console stats", 0)
      Set cItem = cBar.Items.Add(, "USER-CONN", "user connections", 0)
      
      
      
      .Redraw = True
   
   End With

End Sub


'Private Sub SetupMainExplorer()
'
'    Dim cBar As cExplorerBar
'    Dim cItem As cExplorerBarItem
'
'    With MainExplorer
'      .Bars.Clear
'      .Redraw = False
'      .UseExplorerStyle = False
'      .ImageList = ilsIcons.hIml
'      .BarTitleImageList = ilsTitleIcons.hIml
'
'      Dim sFnt As New StdFont
'      sFnt.Name = "Verdana"
'      sFnt.Size = 11
'      sFnt.Italic = True
'
'      Set cBar = .Bars.Add(, "CASHIER", "&Cashier tasks")
'      cBar.ToolTipText = "RealTime Cashier tasks"
'      If Val(MyTitleBarIconsShow.m_CASHIER) = 1 Then
'         cBar.IconIndex = 6
'      Else
'         cBar.IconIndex = m_TitleBar_NoIconIndex
'      End If
'      cBar.State = eBarCollapsed
'      cBar.IsSpecial = True
'
'      '//04292009
'      '// commented out by Jeff to make the Admin seem less complicated
'      'Set cItem = cBar.Items.Add(, "CASHIER_CHECKOUT", "check out", 11)
'
'      '// this item is to allow the developer to test as if the user who checked out
'      '// the card is creating print and copy jobs
'      If gDevMode = True Then
'        Set cItem = cBar.Items.Add(, "CASHIER_DOPRINTCOPY", "do print + copy jobs", 11)
'      End If
'
'      '//04292009
'      '// commented out by Jeff to make the Admin seem less complicated
'      'Set cItem = cBar.Items.Add(, "CASHIER_CHECKIN", "check in", 10)
'      Set cItem = cBar.Items.Add(, "CASHIER_ACCOUNT_ADD", "add a &new account", 1)
'      Set cItem = cBar.Items.Add(, "CASHIER_ACTIVESESSION", "&Active Sessions", 4)
'
'      '//31/03/2008
'      'Set cItem = cBar.Items.Add(, "CASHIER_ACCOUNT_VIEW", "&view accounts", 5)
'
'      '//04292009
'      '// commented out by Jeff to make the Admin seem less complicated
'      'Set cItem = cBar.Items.Add(, "CASHIER_ACCOUNT_VIEW_WALKIN", "view &WALK-IN accounts", 5)
'
'      '//04292009
'      '// commented out by Jeff to make the Admin seem less complicated
'      'Set cItem = cBar.Items.Add(, "CASHIER_ACCOUNT_VIEW_PERM", "view &PERMANENT accounts", 5)
'
'      Set cItem = cBar.Items.Add(, "CASHIER_FUNDING", "&fund account", 4)
'
'      Set cItem = cBar.Items.Add(, "MODIFIEDPANEL", , , eItemControlPlaceHolder)
'      cItem.Control = pnlCashierFilter
'
'      '//04292009
'      '// commented out by Jeff to make the Admin seem less complicated
'      'Set cItem = cBar.Items.Add(, "CASHIER_PRINT_RECEIPT", "print receipt", 0)
'
'      Set cBar = .Bars.Add(, "REPORTS", "Reports")
'      cBar.ToolTipText = "RealTime Reports"
'      cBar.IsSpecial = True
'      If Val(MyTitleBarIconsShow.m_REPORTS) = 1 Then
'         cBar.IconIndex = 4
'      Else
'         cBar.IconIndex = m_TitleBar_NoIconIndex
'      End If
'      cBar.State = eBarCollapsed
'
'
'      If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
'        Set cItem = cBar.Items.Add(, "REPORTS_PRCPY", "print and copy reports", 8)
'      End If
'
'      Set cItem = cBar.Items.Add(, "REPORTS_CASHIER", mc_CASHIER_REPORTS, 9)
'      Set cItem = cBar.Items.Add(, "CUSTOM_REPORTS", mc_CUSTOM_REPORTS, 9)
'
'      Set cBar = .Bars.Add(, "CONSOLE", "&Console tasks")
'      cBar.ToolTipText = "RealTime Console tasks"
'      If Val(MyTitleBarIconsShow.m_CASHIER) = 1 Then
'         cBar.IconIndex = 7
'      Else
'         cBar.IconIndex = m_TitleBar_NoIconIndex
'      End If
'
'      cBar.State = eBarCollapsed
'      cBar.IsSpecial = True
'      Set cItem = cBar.Items.Add(, "QUICKSTATS", "quick stats", 0)
'      Set cItem = cBar.Items.Add(, "CONSOLE-STATS", "console stats", 0)
'      'Commented out by jeff July 1st 2008
'      'Set cItem = cBar.Items.Add(, "DATABASE-STATS", "database stats", 0)
'      Set cItem = cBar.Items.Add(, "USER-CONN", "user connections", 0)
'
'      .Redraw = True
'   End With
'
'End Sub

Private Sub cboDtPeriod_Click()
    Call gObjConsoleTasks.GetQuickStats(Me)
End Sub

Private Sub cmd_ApplyFilter_Click()
 Dim i As Integer
 Dim filterstr As String
 filterstr = UCase(txtFilterData.Text)
  
  Select Case UCase(cboFilterType.Text)
  
  Case "OU NAME"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 5)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
           DoEvents
   
      Next i
      
      Me.MainGrid.Redraw = True
  
  Case "SITE CODE"
      If (filterstr = "") Then Exit Sub
      
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 7)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
           DoEvents
   
      Next i
      
      Me.MainGrid.Redraw = True
  
  
  
  Case "FIRST NAME"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 3)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
           DoEvents
   
      Next i
      
      Me.MainGrid.Redraw = True

Case "LAST NAME"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 4)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
        DoEvents
      
      Next i
      
      Me.MainGrid.Redraw = True

Case "ACCOUNT #"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 2)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
        DoEvents
      
      Next i
      
      Me.MainGrid.Redraw = True


Case "NO FILTER"
      
      txtFilterData.Text = ""
      MainGrid.Redraw = False
      For i = 1 To MainGrid.Rows
        MainGrid.RowVisible(i) = True
        DoEvents
      Next i
      MainGrid.Redraw = True
      
End Select



End Sub



Private Sub cmd_CashierFilterApply_Click()
 Dim i As Integer
 Dim filterstr As String
 filterstr = UCase(txtCashierFilterData.Text)
 
  Select Case UCase(cboCashierFilterType.Text)
  
  Case "OU NAME"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 6)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
           DoEvents
   
      Next i
      
      Me.MainGrid.Redraw = True
      
  Case "SITE CODE"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 7)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
           DoEvents
   
      Next i
      
      Me.MainGrid.Redraw = True
  
  
  Case "FIRST NAME"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 3)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
           DoEvents
   
      Next i
      
      Me.MainGrid.Redraw = True

Case "LAST NAME"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 4)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
        DoEvents
      
      Next i
      
      Me.MainGrid.Redraw = True

Case "ACCOUNT #"

      If (filterstr = "") Then Exit Sub
    
      Me.MainGrid.Redraw = False
      
      For i = 1 To MainGrid.Rows
      
        If (InStr(UCase(MainGrid.CellText(i, 2)), filterstr) > 0) Then
            MainGrid.RowVisible(i) = True
        Else
            MainGrid.RowVisible(i) = False
        End If
        DoEvents
      
      Next i
      
      Me.MainGrid.Redraw = True


Case "NO FILTER"
      
      txtFilterData.Text = ""
      MainGrid.Redraw = False
      For i = 1 To MainGrid.Rows
        MainGrid.RowVisible(i) = True
        DoEvents
      Next i
      MainGrid.Redraw = True
      
End Select
End Sub

Private Sub cmdQuickStatsMax_Click()
    Me.ouExplorer.Visible = False
  '  Me.MainExplorer.Visible = False
    Call MDIForm_Resize
    cmdQuickStatsMax.Visible = False
    cmdQuickStatsMin.Visible = True
End Sub

Private Sub cmdQuickStatsMin_Click()
    Call SetupMenuToUserProfile
    Call MDIForm_Resize
    cmdQuickStatsMax.Visible = True
    cmdQuickStatsMin.Visible = False
End Sub

Private Sub SetWindowContext(ContextStr As String)
    If mContextStr <> ContextStr Then
        mContextStr = ContextStr
        mMainGridSelectedRow = 0
    End If
    Me.Caption = gAppName & " " & gVersion & " - " & ContextStr
End Sub

Private Sub Command1_Click()

End Sub

Private Sub MainGrid_DblClick(ByVal lRow As Long, ByVal lCol As Long)
      
    Call RecordMainGridSelectedRow

    If mContextStr = mc_OUTitle Then
        Call Edit_OU
        
    ElseIf mContextStr = mc_CTRLUNITS Then
        Call Edit_Units
        
    ElseIf mContextStr = mc_CLIENTMATTERS Then
        Call Edit_Clients
        
    ElseIf mContextStr = mc_ACCOUNTS Then
        Call Admin_Edit_Accounts
        
    ElseIf mContextStr = mc_PRINTCOPY_REPORTS Then
        Call ShowReports(0)
        
    ElseIf mContextStr = mc_CASHIER_REPORTS Then
        ShowReports (1)
    
    ElseIf mContextStr = mc_CUSTOM_REPORTS Then
        ShowReports (2)
        
    ElseIf mContextStr = mc_ACCOUNT_STATUS Or _
            mContextStr = mc_CASHIER_CHK_OUT Or _
            mContextStr = mc_CASHIER_CHK_IN Then
        Call Cashier_Edit_Accounts
    End If
    
    Call SetMainGridSelectedRow
    If gObjFormEvent.ShowFundingForm = True Then
         If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
            Call Admin_AccountFunding
         Else
            Call Cashier_AccountFunding
         End If
         
    End If
    

End Sub

Private Sub MainGrid_KeyDown(KeyCode As Integer, Shift As Integer, bDoDefault As Boolean)
   
 '  If (KeyCode = 13) Then
 '        If (mContextStr = mc_ACCOUNTS) Or (mContextStr = mc_ACCOUNT_STATUS) Then
 '                 If (MainGrid.SelectedRow > 0) Then
 '                       Call MainGrid_DblClick(MainGrid.SelectedRow, 1)
 '                 End If
 '        End If
 '  End If
   
   If mContextStr = mc_CLIENTMATTERS Then
       Call LoadClientMatterSecondaryGrid
   End If
End Sub

Private Sub MainGrid_KeyUp(KeyCode As Integer, Shift As Integer)
   If mContextStr = mc_CLIENTMATTERS Then
       Call LoadClientMatterSecondaryGrid
   End If
End Sub

Private Sub MainGrid_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If mContextStr = mc_CLIENTMATTERS Then
        Call LoadClientMatterSecondaryGrid
    End If
End Sub

Private Sub MainGrid_SelectionChange(ByVal lRow As Long, ByVal lCol As Long)
  
  Me.StatusBar1.Panels(5).Text = lRow & " of " & MainGrid.Rows
  If (mContextStr = mc_ACCOUNTS) Or (mContextStr = mc_ACCOUNT_STATUS) Then
      Me.SecondaryGrid.Clear
       GridAccountJournelPopuplate Me.SecondaryGrid, Me.MainGrid.CellText(MainGrid.SelectedRow, 1)
  End If
  
End Sub


Private Sub mnuDBProperties_Click()
   frm_DBProperties.Show vbModal
End Sub

Private Sub mnuDisclaimer_Click()
 frm_Disclaimer.Show vbModal, Me
End Sub

Private Sub mnuFileLogout_Click()

    Call LoadQuickStats
    cmdQuickStatsMin.Visible = False
    cmdQuickStatsMax.Visible = False
    
    Me.cmdQuickStatsMin.Visible = False
    Me.mnuConfiguration.Visible = False
    Me.muTools.Visible = False
    Me.mnuTasks.Visible = False
    Me.mnuTasksCashier.Visible = False
    Me.mnuReports.Visible = False
    Me.ouExplorer.Visible = False
    
    Me.mnuFileLogout.Visible = False
    Me.mnuFileLogin.Visible = True
    Call MDIForm_Resize
    

End Sub

Private Sub mnuFileLogin_click()
    Me.mnuFileLogout.Visible = True
    Me.mnuFileLogin.Visible = False
    Timer1.Interval = 50
    Timer1.Enabled = True
End Sub

Private Sub mnuGlobals_Click()
    Call gObjGlobals.ShowGlobals
End Sub

Private Sub mnuGlobalsSmartCopy_Click()
    Call gObjCtrlParams.ShowCtrlParmDetail
End Sub

Private Sub mnuReportsCashier_Click()
    ouExplorer.Bars.Item(1).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(1))
    Call LoadReports(1)
End Sub

Private Sub mnuReportsCustom_Click()
    ouExplorer.Bars.Item(1).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(1))
    Call LoadReports(2)
End Sub

Private Sub mnuReportsPrintAndCopy_Click()
    ouExplorer.Bars.Item(1).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(1))
    Call LoadReports(0)
End Sub

Private Sub mnuTasksAccounts_Click()
    ouExplorer.Bars.Item(3).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(3))
End Sub

Private Sub mnuTasksCashierAccStatus_Click()
    ouExplorer.Bars.Item(2).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(2))
End Sub

Private Sub mnuTasksCashierAddAcc_Click()
    Call Cashier_Add_Accounts
End Sub

Private Sub mnuTasksCashierChkIn_Click()
    Call CashierCheckInOut(gcCashIN)
End Sub

Private Sub mnuTasksCashierChkOut_Click()
    CashierCheckInOut (gcCashOUT)
End Sub

Private Sub mnuTasksCashierFundAcc_Click()
    Call Cashier_AccountFunding
End Sub

Private Sub mnuTasksClientMatters_Click()
    ouExplorer.Bars.Item(4).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(4))
End Sub

Private Sub mnuTasksControlUnits_Click()
    ouExplorer.Bars.Item(5).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(5))
End Sub

Private Sub mnuTasksOUGroups_Click()
    ouExplorer.Bars.Item(2).State = eBarExpanded
    Call ouExplorer_BarClick(ouExplorer.Bars.Item(2))
End Sub

Private Sub muAbout_Click()
    frm_ABOUT_Appl.Show vbModal
End Sub

Private Sub muDBBackup_Click()
    frm_DBBackup.Show vbModal
End Sub

Private Sub muDBExport_Click()
    frm_DBExport.Show vbModal
End Sub

Private Sub muDBRestore_Click()
    frm_DBRestore.Show vbModal
End Sub

'Private Sub MainExplorer_BarClick(bar As vbalExplorerBarLib6.cExplorerBar)
'
'    Me.QuickStats.Visible = False
'    Call RecordMainGridSelectedRow
'
'    Select Case bar.Key
'        Case "CASHIER"
'            If (bar.State = eBarExpanded) Then
'                ouExplorer.Bars.Item(2).State = eBarCollapsed ''accounts Bar
'                ouExplorer.Bars.Item(3).State = eBarCollapsed ''clients Bar
'                ouExplorer.Bars.Item(4).State = eBarCollapsed ''control Bar
'       '         MainExplorer.Bars.Item(2).State = eBarCollapsed ''clients Bar
'        '        MainExplorer.Bars.Item(3).State = eBarCollapsed ''control Bar
'                Call LoadCashierAccounts
'            Else
'              Call LoadQuickStats
'            End If
'
'
'        Case "REPORTS"
'             If (bar.State = eBarExpanded) Then
'                ouExplorer.Bars.Item(2).State = eBarCollapsed ''accounts Bar
'                ouExplorer.Bars.Item(3).State = eBarCollapsed ''clients Bar
'                ouExplorer.Bars.Item(4).State = eBarCollapsed ''control Bar
'                MainExplorer.Bars.Item(1).State = eBarCollapsed ''clients Bar
'                MainExplorer.Bars.Item(3).State = eBarCollapsed ''control Bar
'
'                    If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
'                       Call LoadReports(1)
'                     ''   AccountsViewFilter = "WHERE ACC_TYPE = 'WALK-IN'"
'                        AccountsViewFilter = ""
'                     Else
'                        Call LoadReports(0)
'                        AccountsViewFilter = ""
'                    End If
'            Else
'                Call LoadQuickStats
'            End If
'
'         Case "CONSOLE"
'            If (bar.State = eBarExpanded) Then
'                ouExplorer.Bars.Item(2).State = eBarCollapsed ''accounts Bar
'                ouExplorer.Bars.Item(3).State = eBarCollapsed ''clients Bar
'                ouExplorer.Bars.Item(4).State = eBarCollapsed ''control Bar
'                MainExplorer.Bars.Item(1).State = eBarCollapsed ''clients Bar
'                MainExplorer.Bars.Item(2).State = eBarCollapsed ''control Bar
'                Call LoadConsoleStats
'            Else
'              Call LoadQuickStats
'            End If
'
'    End Select
'
'    Call SetMainGridSelectedRow
'
'End Sub


Private Sub muDBScriptSchema_Click()
    frm_DBScript.txtScriptPath.Text = App.Path & "\Database\Scripts\Schema_DocuGate_" & Format(Now, "yyyymmdd_hhmmss") & ".sql"
    frm_DBScript.Show vbModal
End Sub

Private Sub muHelpDocGate_Click()
    Dim hFile As String
    hFile = App.Path & "\RealTime.chm"
    Call HtmlHelp(Me.hwnd, hFile, HH_DISPLAY_TOPIC, 0)
End Sub

Private Sub muSPC_Click()
    Call gObjSpc.ShowGlobals
End Sub

Private Sub ouExplorer_BarClick(bar As vbalExplorerBarLib6.cExplorerBar)

    Me.QuickStats.Visible = False
    Call RecordMainGridSelectedRow
    
  
  
  If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
    
    Select Case bar.Key
        
        Case "REPORTS"
             If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(2).State = eBarCollapsed ''Cashier Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Console Bar
                    If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
                       Call LoadReports(1)
                        AccountsViewFilter = ""
                     Else
                        Call LoadReports(0)
                        AccountsViewFilter = ""
                    End If
            Else
                Call LoadQuickStats
            End If
         
         
        Case "CASHIER"
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Console Bar
                Call LoadCashierAccounts
            Else
              Call LoadQuickStats
            End If
            
         
         Case "CONSOLE"
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(2).State = eBarCollapsed ''Cashier Bar
                Call LoadConsoleStats
            Else
                Call LoadQuickStats
            End If
            
            
            
    End Select
   
   End If
    
    
    
  If (gObjLogonMngr.mLevel = ADMIN_LEVEL) Then
    
    Select Case bar.Key

        Case "OU"
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Accounts Bar
                If Not (ouExplorer.Bars.Item(4) Is Nothing) Then ouExplorer.Bars.Item(4).State = eBarCollapsed ''Clients Bar
                If Not (ouExplorer.Bars.Item(5) Is Nothing) Then ouExplorer.Bars.Item(5).State = eBarCollapsed ''DCS bar
                If Not (ouExplorer.Bars.Item(6) Is Nothing) Then ouExplorer.Bars.Item(6).State = eBarCollapsed ''Console bar
                Call LoadOU
            Else
              Call LoadQuickStats
            End If
              
              
        Case "CTRLUNIT"
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''OU Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Accounts Bar
                If Not (ouExplorer.Bars.Item(4) Is Nothing) Then ouExplorer.Bars.Item(4).State = eBarCollapsed ''Clients Bar
                If Not (ouExplorer.Bars.Item(6) Is Nothing) Then ouExplorer.Bars.Item(6).State = eBarCollapsed ''Console bar
               Call LoadControlUnits
            Else
              Call LoadQuickStats
            End If
              
        Case "CLIENT"
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''OU Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Accounts Bar
                If Not (ouExplorer.Bars.Item(5) Is Nothing) Then ouExplorer.Bars.Item(5).State = eBarCollapsed ''DCS bar
                If Not (ouExplorer.Bars.Item(6) Is Nothing) Then ouExplorer.Bars.Item(6).State = eBarCollapsed ''Console bar
                Call LoadClientMatters
            Else
              Call LoadQuickStats
            End If
            
            
        Case mc_ACCOUNTS
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(2).State = eBarCollapsed ''OU Bar
                If Not (ouExplorer.Bars.Item(4) Is Nothing) Then ouExplorer.Bars.Item(4).State = eBarCollapsed ''Clients Bar
                If Not (ouExplorer.Bars.Item(5) Is Nothing) Then ouExplorer.Bars.Item(5).State = eBarCollapsed ''DCS bar
                If Not (ouExplorer.Bars.Item(6) Is Nothing) Then ouExplorer.Bars.Item(6).State = eBarCollapsed ''Console bar
              Call LoadAccounts
            Else
              Call LoadQuickStats
            End If
            
        
        
            
        Case "REPORTS"
             If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(2).State = eBarCollapsed ''OU Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Accounts Bar
                If Not (ouExplorer.Bars.Item(4) Is Nothing) Then ouExplorer.Bars.Item(4).State = eBarCollapsed ''Clients Bar
                If Not (ouExplorer.Bars.Item(5) Is Nothing) Then ouExplorer.Bars.Item(5).State = eBarCollapsed ''DCS bar
                If Not (ouExplorer.Bars.Item(6) Is Nothing) Then ouExplorer.Bars.Item(6).State = eBarCollapsed ''Console bar
                    
                    If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
                       Call LoadReports(1)
                        AccountsViewFilter = ""
                     Else
                        Call LoadReports(0)
                        AccountsViewFilter = ""
                    End If
            Else
                Call LoadQuickStats
            End If
         
         Case "CONSOLE"
            If (bar.State = eBarExpanded) Then
                If Not (ouExplorer.Bars.Item(1) Is Nothing) Then ouExplorer.Bars.Item(1).State = eBarCollapsed ''Reports Bar
                If Not (ouExplorer.Bars.Item(2) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''OU Bar
                If Not (ouExplorer.Bars.Item(3) Is Nothing) Then ouExplorer.Bars.Item(3).State = eBarCollapsed ''Accounts Bar
                If Not (ouExplorer.Bars.Item(4) Is Nothing) Then ouExplorer.Bars.Item(4).State = eBarCollapsed ''Clients Bar
                If Not (ouExplorer.Bars.Item(5) Is Nothing) Then ouExplorer.Bars.Item(5).State = eBarCollapsed ''DCS bar
                Call LoadConsoleStats
            Else
                Call LoadQuickStats
            End If
            
    End Select
   
   End If ' id logon as admin
   
   
   
   
    Call SetMainGridSelectedRow

End Sub

Private Sub LoadOU()
    Call SetWindowContext(mc_OUTitle)
    QuickStats.Visible = False
    SecondaryGrid.Visible = False
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridOUSetUp(Me.MainGrid)
    Call MDIForm_Resize
End Sub


Private Sub LoadCashierAccounts()
    QuickStats.Visible = False
    Call SetWindowContext(mc_ACCOUNT_STATUS)
    SecondaryGrid.Visible = True
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridCashierAccSetUp(Me.MainGrid, AccountsViewFilter)
    Call LoadAccountJournelSecondaryGrid
    Call MDIForm_Resize
End Sub




Private Sub LoadAccounts()
    QuickStats.Visible = False
    Call SetWindowContext(mc_ACCOUNTS)
    SecondaryGrid.Visible = True
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridAccountSetUp(Me.MainGrid)
    Call LoadAccountJournelSecondaryGrid
    Call MDIForm_Resize
End Sub

Private Sub LoadControlUnits()
    QuickStats.Visible = False
    Call SetWindowContext(mc_CTRLUNITS)
    SecondaryGrid.Visible = False
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridCtrlUnitSetUp(Me.MainGrid)
    Call MDIForm_Resize
End Sub

Private Sub LoadClientMatters()
    QuickStats.Visible = False
    Call SetWindowContext(mc_CLIENTMATTERS)
    SecondaryGrid.Visible = True
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridClientSetUp(Me.MainGrid)
    Call LoadClientMatterSecondaryGrid
    Call MDIForm_Resize
End Sub

Private Sub LoadAccountJournelSecondaryGrid()
        Call Mod_SecondaryGrid.GridReset(Me.SecondaryGrid)
        Call Mod_SecondaryGrid.GridAccountJournelSetup(Me.SecondaryGrid)
End Sub


Private Sub LoadClientMatterSecondaryGrid()

        QuickStats.Visible = False
        Call Mod_SecondaryGrid.GridReset(Me.SecondaryGrid)
        Dim CC_GUID As String
        If MainGrid.Rows > 0 Then
            If MainGrid.SelectedRow = 0 Then
               CC_GUID = MainGrid.CellText(1, 1)
            Else
               CC_GUID = MainGrid.CellText(MainGrid.SelectedRow, 1)
            End If
        Else
            CC_GUID = ""
        End If

        Call Mod_SecondaryGrid.GridMatterSetUp(Me.SecondaryGrid, CC_GUID)
        Call MDIForm_Resize
End Sub

Private Sub Add_Matters()
    
    If mContextStr <> mc_CLIENTMATTERS Then Exit Sub
    
    Dim CC_GUID As String
    Dim CC_NAME As String
    If MainGrid.Rows > 0 Then
        If MainGrid.SelectedRow = 0 Then
           CC_GUID = MainGrid.CellText(1, 1)
           CC_NAME = MainGrid.CellText(1, 2)
        Else
           CC_GUID = MainGrid.CellText(MainGrid.SelectedRow, 1)
           CC_NAME = MainGrid.CellText(MainGrid.SelectedRow, 2)
        End If
    Else
        CC_GUID = ""
        CC_NAME = ""
    End If
    
    gObjMatterMngr.CC_GUID = CC_GUID
    gObjMatterMngr.CC_NAME = CC_NAME
    Call gObjMatterMngr.ShowOUDetail(gcAddRecord, 0)
    If gObjMatterMngr.mLastError = "" Then
        Call LoadClientMatterSecondaryGrid
    End If
End Sub

Private Sub Add_OU()
    Call SetWindowContext(mc_OUTitle)
    Call gObjOuMngr.ShowOUDetail(gcAddRecord, 0)
    If gObjOuMngr.mLastError = "" Then
        Call Mod_MainGrid.GridReset(Me.MainGrid)
        Call Mod_MainGrid.GridOUSetUp(Me.MainGrid)
    End If
End Sub

Private Sub Edit_OU()
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
      Call gObjOuMngr.ShowOUDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
      If gObjOuMngr.mLastError = "" Then
          Call Mod_MainGrid.GridReset(Me.MainGrid)
          Call Mod_MainGrid.GridOUSetUp(Me.MainGrid)
      End If
    End If
End Sub

Private Sub Fund_OU()
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
      Call gObjOuMngr.FundOU(MainGrid.CellText(MainGrid.SelectedRow, 1))
      If gObjOuMngr.mLastError = "" Then
          Call Mod_MainGrid.GridReset(Me.MainGrid)
          Call Mod_MainGrid.GridOUSetUp(Me.MainGrid)
      End If
    End If
End Sub


Private Sub Add_Units()
    Call SetWindowContext(mc_CTRLUNITS)
    Call gObjCtrlUnitMngr.ShowUnitDetail(gcAddRecord, 0)
    If gObjCtrlUnitMngr.mLastError = "" Then
        Call Mod_MainGrid.GridReset(Me.MainGrid)
        Call Mod_MainGrid.GridCtrlUnitSetUp(Me.MainGrid)
    End If
End Sub

Private Sub Edit_Units()
    
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
      '// we need to know upfront the type of terminal, because each type requires a different detail screen
      gObjCtrlUnitMngr.TerminalType = MainGrid.CellText(MainGrid.SelectedRow, 7)
      
      Call gObjCtrlUnitMngr.ShowUnitDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
      If gObjCtrlUnitMngr.mLastError = "" Then
          Call Mod_MainGrid.GridReset(Me.MainGrid)
          Call Mod_MainGrid.GridCtrlUnitSetUp(Me.MainGrid)
      End If
    End If

End Sub

Private Sub Add_Clients()
     Call SetWindowContext(mc_CLIENTMATTERS)
     Call gObjClientMngr.ShowClientDetail(gcAddRecord, 0)
     If gObjClientMngr.mLastError = "" Then
           Call LoadClientMatters
     End If
End Sub

Private Sub Edit_Clients()
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
      Call gObjClientMngr.ShowClientDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
      If gObjClientMngr.mLastError = "" Then
         Call LoadClientMatters
      End If
    End If
End Sub

Private Sub Edit_Matters()
    If SecondaryGrid.Rows > 0 And SecondaryGrid.SelectedRow > 0 And Not IsNull(SecondaryGrid.CellText(SecondaryGrid.SelectedRow, 1)) Then
            
      Call gObjMatterMngr.ShowOUDetail(gcUpdateRecord, SecondaryGrid.CellText(SecondaryGrid.SelectedRow, 1))
      If gObjMatterMngr.mLastError = "" Then
            Call LoadClientMatters
      End If
    End If
End Sub

Private Sub Admin_Add_Accounts()
    
    Dim i As Integer
   
    Call SetWindowContext(mc_ACCOUNTS)
    Me.QuickStats.Visible = False
    gObjFormEvent.Cancelled = False
    Call gObjAccountMngr.ShowAccountDetail(gcAddRecord, 0)
    If gObjAccountMngr.mLastError = "" And gObjFormEvent.Cancelled = False Then
        Call LoadAccounts
        cmd_ApplyFilter_Click
        
        If (gObjFormEvent.AccountAdded) Then
           For i = 1 To MainGrid.Rows
             If (MainGrid.CellText(i, 2) = gObjFormEvent.NewAccountBadge) Then
                MainGrid.SelectedRow = i
             End If
           Next i
        End If
      
      End If
End Sub

Private Sub Cashier_Add_Accounts()

    Dim i As Integer
 
    Call SetWindowContext(mc_ACCOUNT_STATUS)
    Me.QuickStats.Visible = False
    gObjFormEvent.Cancelled = False
    Call gObjAccountMngr.ShowAccountDetail(gcAddRecord, 0)
    If gObjAccountMngr.mLastError = "" And gObjFormEvent.Cancelled = False Then
        Call LoadCashierAccounts
        cmd_CashierFilterApply_Click
        If (gObjFormEvent.AccountAdded) Then
           For i = 1 To MainGrid.Rows
             If (MainGrid.CellText(i, 2) = gObjFormEvent.NewAccountBadge) Then
                MainGrid.SelectedRow = i
             End If
           Next i
        End If
        
    
    End If
End Sub


Private Sub avs_Add_Account()
   Call SetWindowContext(mc_ACCOUNTS)
    Me.QuickStats.Visible = False
    Call gObjAccountMngr.ShowAvsDetail(gcAddRecord, 0)
    If gObjAccountMngr.mLastError = "" Then
        Call Mod_MainGrid.GridReset(Me.MainGrid)
        Call Mod_MainGrid.GridAccountSetUp(Me.MainGrid)
    End If
End Sub

Private Sub Admin_AccountFunding()
    Call SetWindowContext(mc_ACCOUNTS)
    Me.QuickStats.Visible = False
    gObjFormEvent.Cancelled = False
    Call gObjAccountMngr.ShowAccountFund
    If ((gObjAccountMngr.mLastError = "") And (gObjFormEvent.Cancelled = False)) Then
       Call Mod_MainGrid.GridReset(Me.MainGrid)
       Call Mod_MainGrid.GridAccountSetUp(Me.MainGrid)
    End If
End Sub

Private Sub Admin_ActiveSession()

  If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
      Call gObjAccountMngr.ShowCurrentActiveSessions
      
    End If
    
End Sub

Private Sub Cashier_Edit_Accounts()
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
        If (MainGrid.CellText(MainGrid.SelectedRow, 5) = "ECASHIER") Then
                Call gObjAccountMngr.ShowAvsDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
        Else
                Call gObjAccountMngr.ShowAccountDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
        End If
    End If
End Sub


Private Sub Admin_Edit_Accounts()
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
        If (MainGrid.CellText(MainGrid.SelectedRow, 5) = "ECASHIER") Then
                Call gObjAccountMngr.ShowAvsDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
        Else
                Call gObjAccountMngr.ShowAccountDetail(gcUpdateRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
        End If
        
     '' do not reload accounts
     '' takes a long time if lots of accounts
     
     '   If gObjAccountMngr.mLastError = "" Then
     '       Call Mod_MainGrid.GridReset(Me.MainGrid)
     '       Call Mod_MainGrid.GridAccountSetUp(Me.MainGrid)
     '   End If
    End If
End Sub

Private Sub ouExplorer_ItemClick(itm As vbalExplorerBarLib6.cExplorerBarItem)

        Me.QuickStats.Visible = False
        Call RecordMainGridSelectedRow

        '//Refresh the grid depending on the context of the explorer item clicked
        If itm.Key = "OU_ADD" Or itm.Key = "OU_MANAGE" Or itm.Key = "OU_FUND" Then
            If mContextStr <> mc_OUTitle Then
                  Call SetWindowContext(mc_OUTitle)
                  SecondaryGrid.Visible = False
                  Call Mod_MainGrid.GridReset(Me.MainGrid)
                  Call Mod_MainGrid.GridOUSetUp(Me.MainGrid)
                  Call MDIForm_Resize
            End If
        End If
        
        If itm.Key = "CTRLUNIT_ADD" Or itm.Key = "CTRLUNIT_MANAGE" Or itm.Key = "STATION_PARMS" Then
            If mContextStr <> mc_CTRLUNITS Then
                Call SetWindowContext(mc_CTRLUNITS)
                SecondaryGrid.Visible = False
                Call Mod_MainGrid.GridReset(Me.MainGrid)
                Call Mod_MainGrid.GridCtrlUnitSetUp(Me.MainGrid)
                Call MDIForm_Resize
            End If
        End If
        
        If itm.Key = "CLIENT_ADD" Or itm.Key = "CLIENT_MANAGE" Then
            If mContextStr <> mc_CLIENTMATTERS Then
                Call LoadClientMatters
            End If
        End If
        
        If itm.Key = "ACCOUNT_ADD" Or itm.Key = "ACCOUNT_MANAGE" Then
           If mContextStr <> mc_ACCOUNTS Then
              Call SetWindowContext(mc_ACCOUNTS)
              SecondaryGrid.Visible = False
              Call Mod_MainGrid.GridReset(Me.MainGrid)
              Call Mod_MainGrid.GridAccountSetUp(Me.MainGrid)
              Call MDIForm_Resize
           End If
        End If
        
    Select Case UCase(itm.Key)
    
        Case "CASHIER_ACCOUNT_ADD"
            Call Cashier_Add_Accounts
            
        Case "CASHIER_ACTIVESESSION"
              Call Admin_ActiveSession
      
         Case "CASHIER_FUNDING"
            Call Cashier_AccountFunding

        Case "CASHIER_MANAGE"
            Call Cashier_Edit_Accounts
            If gObjFormEvent.ShowFundingForm = True Then
                Call Cashier_AccountFunding
            End If
           
        
        Case "OU_ADD"
                Call Add_OU

        Case "OU_MANAGE"
                Call Edit_OU
                
        Case "OU_FUND"
                Call Fund_OU
                
        Case "ACCOUNT_ADD"
              Call Admin_Add_Accounts
        
        Case "AVS_ADD"
              Call avs_Add_Account
        
        Case "ACCOUNT_MANAGE"
              Call Admin_Edit_Accounts
               If gObjFormEvent.ShowFundingForm = True Then
                Call Admin_AccountFunding
              End If
                
        Case "ACCOUNT_FUNDING"
              Call Admin_AccountFunding
              
        Case "ACCOUNT_ACTIVESESSION"
              Call Admin_ActiveSession
             
        Case "CTRLUNIT_ADD"
                Call Add_Units
                
        Case "CTRLUNIT_MANAGE"
                Call Edit_Units
              
        Case "STATION_PARMS"
              Call gObjCtrlParams.ShowCtrlParmDetail
 
        Case "CLIENT_ADD"
                Call Add_Clients
                
        Case "CLIENT_MANAGE"
                Call Edit_Clients
                
       Case "MATTER_ADD"
               Call Add_Matters
                'cmdGetSelection
                
        Case "MATTER_MANAGE"
                Call Edit_Matters
                
        Case "REPORTS_PRCPY"
              Call LoadReports(0)
              
        Case "REPORTS_CASHIER"
              Call LoadReports(1)
              
        Case "CUSTOM_REPORTS"
              Call LoadReports(2)
      
    Case "CONSOLE-STATS"
            Call LoadConsoleStats
              
        Case "DATABASE-STATS"
            Call SetWindowContext("Database Stats")
            Me.QuickStats.Visible = False
            SecondaryGrid.Visible = False
            Call Mod_MainGrid.GridReset(Me.MainGrid)
            Call Mod_MainGrid.GridDBStatsSetup(Me.MainGrid)
            Call MDIForm_Resize
     
        Case "USER-CONN"
            Call SetWindowContext("User Connections")
            Me.QuickStats.Visible = False
            SecondaryGrid.Visible = False
            Call Mod_MainGrid.GridReset(Me.MainGrid)
            Call Mod_MainGrid.GridUserConnSetup(Me.MainGrid, "all", "", "")
            Call MDIForm_Resize
    
       Case "QUICKSTATS"
            Call LoadQuickStats

        Case Else
             Call SetWindowContext(itm.Text)
    End Select

    Call SetMainGridSelectedRow
    
End Sub

Private Sub SetOUExplorerItemPermission(cItem As cExplorerBarItem)
      'If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
      '      cItem.TextColor = &H80000011
      '      cItem.CanClick = False
      'End If
End Sub

Private Sub SetOUExplorerBarPermission(cBar As cExplorerBar)
      'If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
      '      cBar.State = eBarCollapsed
      'Else
            cBar.State = eBarExpanded
      'End If
End Sub

Private Sub CashierDoPrintCopyJobs(AccBadge As String)

On Error GoTo Err_Handler
    
    If (mContextStr = mc_ACCOUNT_STATUS Or _
            mContextStr = mc_CASHIER_CHK_OUT Or _
            mContextStr = mc_CASHIER_CHK_IN) And Trim(AccBadge) <> "" Then
        '//31/03/2008
        If MsgBox("Are you sure you want to create print and copy jobs for the selected account badge?", vbYesNo, "Simulate Jobs") = vbNo Then Exit Sub
        gConn.Execute ("EXEC dbo.simulate_create_jobs_per_badge '" _
            & AccBadge & "','" & gObjLogonMngr.mBadge & "'")
        MsgBox "Done!"
    Else
        Call LoadCashierAccounts
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description
 
End Sub

Private Sub CashierCheckInOut(UserInstruction As Integer)

    If mContextStr <> mc_ACCOUNT_STATUS And _
            mContextStr <> mc_CASHIER_CHK_OUT And _
            mContextStr <> mc_CASHIER_CHK_IN Then
        Call LoadCashierAccounts
        Exit Sub
    End If
    
    Dim AvailabilityStatus As String
    Dim AccBadge As String
    Dim AccType As String
    
    AvailabilityStatus = ""
    AccBadge = ""
    
    If MainGrid.Rows > 0 Then
        If MainGrid.SelectedRow = 0 Then
            AccBadge = uct(MainGrid.CellText(1, 2))
            AvailabilityStatus = uct(MainGrid.CellText(1, 7))
            AccType = uct(MainGrid.CellText(1, 5))
        Else
            AccBadge = uct(MainGrid.CellText(MainGrid.SelectedRow, 2))
            AvailabilityStatus = uct(MainGrid.CellText(MainGrid.SelectedRow, 7))
            AccType = uct(MainGrid.CellText(MainGrid.SelectedRow, 5))
        End If
    End If
        
    If AccType = "PERMANENT" Then
        Call gObjAccountMngr.ShowAccountFund
        
    ElseIf UserInstruction = gcCashNoInstr Then
        If AvailabilityStatus = "AVAILABLE" Then
            Call CashierCheckOut(AccBadge)
        ElseIf AvailabilityStatus <> "" Then
            Call CashierCheckIn(AccBadge)
        End If
    
    ElseIf UserInstruction = gcCashIN Or UserInstruction = gcCashINPrintReceipt Then
        Call CashierCheckIn(AccBadge)
    
    ElseIf UserInstruction = gcCashOUT Then
        Call CashierCheckOut(AccBadge)
        
    ElseIf UserInstruction = gcCashDoPrintCopyJobs Then
        Call CashierDoPrintCopyJobs(AccBadge)
    End If
    
End Sub

Private Sub CashierCheckOut(AccBadge As String)

    'Call SetWindowContext(mc_CASHIER_CHK_OUT)
    'Me.QuickStats.Visible = False
    Call gObjAccountMngr.ShowCheckInOut(gcCashOUT, AccBadge)
    If gObjAccountMngr.mLastError = "" Then
       Call LoadCashierAccounts
    End If
    
End Sub

Private Sub CashierCheckIn(AccBadge As String)

    'Call SetWindowContext(mc_CASHIER_CHK_IN)
    'Me.QuickStats.Visible = False
    Call gObjAccountMngr.ShowCheckInOut(gcCashIN, AccBadge)
    If gObjAccountMngr.mLastError = "" Then
       Call LoadCashierAccounts
    End If

End Sub

Private Sub Cashier_AccountFunding()
    'Call SetWindowContext(mc_ACCOUNT_STATUS)
    'Me.QuickStats.Visible = False
    gObjFormEvent.Cancelled = False
    Call gObjAccountMngr.ShowAccountFund
    If ((gObjAccountMngr.mLastError = "") And (gObjFormEvent.Cancelled = False)) Then
        Call LoadCashierAccounts
    End If
End Sub


Private Sub Cashier_View_Accounts()
    
    If CurrentAccountsViewFilter <> AccountsViewFilter Then
        CurrentAccountsViewFilter = AccountsViewFilter
        Call LoadCashierAccounts
    End If
    
    If mContextStr <> mc_ACCOUNT_STATUS Then
        Call LoadCashierAccounts
    End If
    
    If MainGrid.Rows > 0 And MainGrid.SelectedRow > 0 Then
        Call gObjAccountMngr.ShowAccountDetail(gcViewRecord, MainGrid.CellText(MainGrid.SelectedRow, 1))
    End If
  
End Sub

Private Sub MainExplorer_ItemClick(itm As vbalExplorerBarLib6.cExplorerBarItem)

     Me.QuickStats.Visible = False
     Call RecordMainGridSelectedRow

     Select Case itm.Key
              
        Case "CASHIER_CHECKOUT"
             Call CashierCheckInOut(gcCashOUT)
             
        Case "CASHIER_DOPRINTCOPY"
             Call CashierCheckInOut(gcCashDoPrintCopyJobs)
              
        Case "CASHIER_CHECKIN"
             Call CashierCheckInOut(gcCashIN)
        
        Case "CASHIER_ACCOUNT_ADD"
            Call Cashier_Add_Accounts
            
        Case "CASHIER_ACTIVESESSION"
              Call Admin_ActiveSession
            
        '//31/03/2008
        'Case "CASHIER_ACCOUNT_VIEW"
        '    Call Cashier_View_Accounts
        Case "CASHIER_ACCOUNT_VIEW_WALKIN"
            AccountsViewFilter = "WHERE ACC_TYPE = 'WALK-IN'"
            Call Cashier_View_Accounts
            
        Case "CASHIER_ACCOUNT_VIEW_PERM"
            AccountsViewFilter = "WHERE ACC_TYPE = 'PERMANENT'"
            Call Cashier_View_Accounts
        '// end of changes
            
        Case "CASHIER_FUNDING"
            Call Cashier_AccountFunding
              
        Case "CASHIER_PRINT_RECEIPT"
            Call CashierCheckInOut(gcCashINPrintReceipt)
            
        Case "REPORTS_PRCPY"
              Call LoadReports(0)
              
        Case "REPORTS_CASHIER"
              Call LoadReports(1)
              
        Case "CUSTOM_REPORTS"
              Call LoadReports(2)
              
        Case "CONSOLE-STATS"
            Call LoadConsoleStats
              
        Case "DATABASE-STATS"
            Call SetWindowContext("Database Stats")
            Me.QuickStats.Visible = False
            SecondaryGrid.Visible = False
            Call Mod_MainGrid.GridReset(Me.MainGrid)
            Call Mod_MainGrid.GridDBStatsSetup(Me.MainGrid)
            Call MDIForm_Resize
     
        Case "USER-CONN"
            Call SetWindowContext("User Connections")
            Me.QuickStats.Visible = False
            SecondaryGrid.Visible = False
            Call Mod_MainGrid.GridReset(Me.MainGrid)
            Call Mod_MainGrid.GridUserConnSetup(Me.MainGrid, "all", "", "")
            Call MDIForm_Resize
     
        Case "QUICKSTATS"
            Call LoadQuickStats

     End Select

     Call SetMainGridSelectedRow
End Sub

Private Sub SetMonthlyDateRange()
    Dim StartDtVar As Variant
    Dim EndDtVar As Variant
    
    StartDtVar = DateSerial(Year(Date), Month(Date), 1)
    EndDtVar = DateSerial(Year(Date), Month(Date) + 1, 0)
    
    mStartDtStr = SQLDate(StartDtVar)
    mEndDtStr = SQLDate(EndDtVar)
    
   ' mStartDtStr = "'2008-01-01'"
   ' mEndDtStr = "'2008-01-31'"
End Sub


Private Sub ShowReports(TypeOfReport As Integer)

    Dim ReportId As Integer
    Dim ReportTitle As String
    Dim DisplayReportId As String
    
    If MainGrid.Rows > 0 Then
        If MainGrid.SelectedRow = 0 Then
           ReportId = MainGrid.CellText(1, 1)
           DisplayReportId = MainGrid.CellText(1, 2)
           ReportTitle = MainGrid.CellText(1, 3)
        Else
           ReportId = MainGrid.CellText(MainGrid.SelectedRow, 1)
           DisplayReportId = MainGrid.CellText(MainGrid.SelectedRow, 2)
           ReportTitle = MainGrid.CellText(MainGrid.SelectedRow, 3)
        End If
    Else
        ReportId = 0
    End If
    
    If ReportId > 0 And ReportId < 17 Then
        Call gClsReports.ShowPrintCopyReports(TypeOfReport, ReportId, ReportTitle, DisplayReportId)
        If gClsReports.mLastError <> "" Then
            MsgBox gClsReports.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Sub
        End If
    End If
End Sub


Private Sub LoadAllAccountsReport()

End Sub


Private Sub LoadReports(TypeOfReports As Integer)
    If TypeOfReports = 0 Then
       Call SetWindowContext(mc_PRINTCOPY_REPORTS)
    ElseIf TypeOfReports = 1 Then
       Call SetWindowContext(mc_CASHIER_REPORTS)
    ElseIf TypeOfReports = 2 Then
       Call SetWindowContext(mc_CUSTOM_REPORTS)
    End If
    
    QuickStats.Visible = False
    SecondaryGrid.Visible = False
    
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridReportsSetUp(Me.MainGrid, TypeOfReports)
    Call MDIForm_Resize
End Sub

Private Sub picRes_Click()

End Sub

Private Sub QuickStatsTimer_Timer()
    If Me.QuickStats.Visible = True Then
         Call gObjConsoleTasks.GetQuickStats(Me)
     End If
End Sub

Private Sub SecondaryGrid_DblClick(ByVal lRow As Long, ByVal lCol As Long)
    If mContextStr = mc_CLIENTMATTERS Then
       Call Edit_Matters
    End If
End Sub

Private Sub Timer1_Timer()

On Error GoTo Err_Handler
     
     Timer1.Enabled = False
     
     If (Logon = False) Then
         Mod_Main.UnloadApp
     End If
     
     Me.Show
     
   '  Call SetupMainExplorer
     Call SetupOUExplorer
     Call SetupMenuToUserProfile
     Call SetMainGridSelectedRow
     Call SetupQuickStats
     QuickStatsTimer.Enabled = True
     Exit Sub
     
Err_Handler:
    MsgBox Err.Description
End Sub

Private Sub SetupMenuToUserProfile()

     
     If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
         
         Me.ouExplorer.Visible = True
         Me.ouExplorer.Align = vbAlignLeft
         
         Me.mnuTasksCashier.Visible = True
         Me.mnuReports.Visible = True
         
         Me.muTools.Visible = False
         Me.mnuConfiguration.Visible = False
         Me.mnuTasks.Visible = False
         Me.mnuReportsPrintAndCopy.Visible = False
         
     Else
        
         Me.ouExplorer.Visible = True
         Me.ouExplorer.Align = vbAlignLeft
         
         Me.mnuTasksCashier.Visible = False
         
         Me.muTools.Visible = True
         Me.mnuConfiguration.Visible = True
         Me.mnuTasks.Visible = True
         Me.mnuReports.Visible = True
         Me.mnuReportsPrintAndCopy.Visible = True
         
         If CurrentDatabase.MSDE <> "1" Then
            Me.muDBBackup.Visible = True 'Enable backup form- Mike Young 12/9/2011
            'Me.muDBRestore.Visible = True 'Removing restore form till debugged- Mike Young 12/9/2011
            Me.muDBScriptSchema.Visible = True
            mnuToolsDummy2.Visible = False
         End If
     
     End If
    
       
    
     Me.StatusBar1.Panels(1).Text = "Login: " & gObjLogonMngr.mBadge
     
     Select Case gObjLogonMngr.mLevel
     Case ADMIN_LEVEL
         Me.StatusBar1.Panels(2).Text = "Security Level: Administrator"
         Call MDIForm_Resize
       '' remove for startup speed
       ''  Call LoadAccounts
     Case CASHIER_LEVEL
         Me.StatusBar1.Panels(2).Text = "Security Level: Cashier"
         Call MDIForm_Resize
     '    Call LoadCashierAccounts
     '    Me.mnuGlobals.Visible = False
     '    Me.muTools.Visible = False
     '    Me.mnuConfiguration.Visible = False
     End Select
     
     Me.QuickStats.Visible = True
     Call SetWindowContext("Quick Stats")

End Sub

Private Sub SetupMainGrid()
   
   With MainGrid
      .Redraw = False
      .ImageList = ilsIcons
      .RowMode = True
      .MultiSelect = True
      .DefaultRowHeight = 18
      .HeaderFlat = True
      .SetHeaders
      .Redraw = True
   End With
   
   With SecondaryGrid
      .Redraw = False
      .ImageList = ilsIcons
      .RowMode = True
      .MultiSelect = True
      .DefaultRowHeight = 18
      .HeaderFlat = True
      .SetHeaders
      .Redraw = True
   End With

End Sub

Private Sub PanelTimer_Timer()
    Me.StatusBar1.Panels(3).Text = Format(Now, "dddd, mmm d yyyy - hh:mm:ss")
    Me.StatusBar1.Panels(4).Text = "Context: " & mContextStr

End Sub

Private Function Logon() As Boolean
   
    Load Frm_Login
    Frm_Login.Show 1, Me
    
    If (gObjLogonMngr.mTerminate = True) Then
        Logon = False
    Else
        Logon = True
    End If
    
    If gDevMode = True Then LogTrace ("frm_Main.Logon()")
    
End Function

Private Sub MDIForm_Initialize()

 '   Call CentreForm(Me)
    DoEvents
    
    SkinOb.InitLicenKeys "Network Printing Solutions", "Network Printing Solutions", "peterd@printstudy.com", "IV9ID7B49QT6WBDA0C4TMJZ15FUS2"
    SkinOb.DefineLanguage 2
    SkinOb.InitDecoration 1
    SkinOb.LoadSkinFromFile App.Path & "\docugate.skf"
    SkinOb.ApplySkin
    
    mnuFileLogin.Visible = False
    Timer1.Interval = 50
    Timer1.Enabled = True
    SecondaryGrid.Visible = False
    
    
End Sub

Private Sub LoadConsoleStats()
    Call SetWindowContext("Console Stats")
    Me.QuickStats.Visible = False
    Call SetMonthlyDateRange
    SecondaryGrid.Visible = False
    Call Mod_MainGrid.GridReset(Me.MainGrid)
    Call Mod_MainGrid.GridConsoleStatsSetup(Me.MainGrid, mStartDtStr, mEndDtStr)
    Call MDIForm_Resize
End Sub

Private Sub SetupQuickStats()
    
    Dim LastMonthDt As Variant
    LastMonthDt = DateAdd("m", -1, Now())
    
    Me.cboDtPeriod.Clear
    Me.cboDtPeriod.AddItem "For today " & Format(Date, "mm/dd/yyyy")
    Me.cboDtPeriod.AddItem "For this month " & GetMonthName(Month(Date)) & " " & Format(Date, "yyyy")
    Me.cboDtPeriod.AddItem "For the previous month " & GetMonthName(Month(LastMonthDt)) & " " & Format(LastMonthDt, "yyyy")
    Me.cboDtPeriod.AddItem "For this year " & Format(Date, "YYYY")
    DoEvents
    
    Me.cboDtPeriod.ListIndex = 0
    
    Me.cmdQuickStatsMax.Visible = True
    Me.cmdQuickStatsMin.Visible = True
    Call gObjConsoleTasks.GetQuickStats(Me)
    
End Sub

Private Sub LoadQuickStats()
    Call SetWindowContext("Quick Stats")
    Me.QuickStats.Visible = True
    SecondaryGrid.Visible = False
    cmdQuickStatsMin.Visible = True
    Call SetWindowContext("Quick Stats")
    Call gObjConsoleTasks.GetQuickStats(Me)
    Call MDIForm_Resize
End Sub

Private Sub MDIForm_Resize()
    On Error GoTo handler

    '// admin view
    If ouExplorer.Visible = True Then
        MainPicture.Width = Me.Width - ouExplorer.Width - 120
    
    '// cashier view
'    ElseIf MainExplorer.Visible = True Then
 '       MainPicture.Width = Me.Width - MainExplorer.Width - 120
    
    '// quick stats view
    ElseIf ouExplorer.Visible = False Then
        MainPicture.Width = Me.Width - 120
    End If
    
    Call MainPicture_Resize
    Call gClsReports.SetFrmSize(Me.Top, Me.Left, Me.Height, Me.Width)
        
handler:
    '//MsgBox "MDIForm_Reaize(): " & Err.Description
End Sub

Private Sub MainPicture_Resize()
 On Error GoTo handler

 TabStrip.Top = 0
 TabStrip.Left = 0
 TabStrip.Height = MainPicture.Height
 TabStrip.Width = MainPicture.Width
 
 'Me.xpPanel1.Width = TabStrip.Width + 1000
 'xpPanel1.Left = TabStrip.Left
 'xpPanel1.Top = 0
 
 MainGrid.Left = TabStrip.Left + 50
 'MainGrid.Top = xpPanel1.Top + xpPanel1.Height
 MainGrid.Top = 0
 MainGrid.Width = TabStrip.Width - 120

 'Const diff = 1200
 Const diff = 100
 
  If (SecondaryGrid.Visible = False) And MainGrid.Visible = True Then
        MainGrid.Height = TabStrip.Height - diff
        
  Else
        MainGrid.Height = (TabStrip.Height - diff) * 0.7
        SecondaryGrid.Top = MainGrid.Top + MainGrid.Height
        SecondaryGrid.Left = MainGrid.Left
        SecondaryGrid.Width = MainGrid.Width
        SecondaryGrid.Height = (TabStrip.Height - 200) * 0.3
  
  End If
  
  QuickStats.Left = MainGrid.Left
  QuickStats.Width = MainPicture.Width
  QuickStats.Top = MainGrid.Top
  QuickStats.Height = TabStrip.Height
  Me.cmdQuickStatsMax.Left = QuickStats.Width - 615
  Me.cmdQuickStatsMin.Left = cmdQuickStatsMax.Left
  
  Exit Sub
    
handler:
    '//MsgBox "MainPicture_Resize(): " & Err.Description
End Sub

Private Sub muExit_Click()
    Mod_Main.UnloadApp
End Sub

Private Sub MDIForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    'Close #55
    Call Mod_Main.UnloadApp
End Sub

Private Sub MainGrid_ColumnClick(ByVal lCol As Long)
Dim sTag As String
Dim i As Long

   With MainGrid.SortObject
      .Clear
      .SortColumn(1) = lCol
      
      sTag = MainGrid.ColumnTag(lCol)
      If (sTag = "") Then
         sTag = "DESC"
         .SortOrder(1) = CCLOrderAscending
      Else
         sTag = ""
         .SortOrder(1) = CCLOrderDescending
      End If
      MainGrid.ColumnTag(lCol) = sTag
   
      Select Case MainGrid.ColumnKey(lCol)
      Case "file", "col8"
         ' sort by icon:
         .SortType(1) = CCLSortIcon
      Case "date"
         ' sort by date:
         .SortType(1) = CCLSortDate
      Case Else
         ' sort by text:
         .SortType(1) = CCLSortString
      End Select
   End With
   
   Screen.MousePointer = vbHourglass
   MainGrid.Sort
   Screen.MousePointer = vbDefault
   
End Sub

Private Sub SetMainGridSelectedRow()
    If MainGrid.Rows > 0 Then
        If mMainGridSelectedRow = 0 Or mMainGridSelectedRow > MainGrid.Rows Then
            mMainGridSelectedRow = 1
        End If
        '// set the selected row !!!! it will be gray but not yet highlighted!!!
        MainGrid.CellSelected(mMainGridSelectedRow, 1) = True
    End If
    
    MainGrid.Redraw = True
        
    '// by doing a .setfocus, the selected row is highlighted!!!
    MainGrid.SetFocus
End Sub

Private Sub RecordMainGridSelectedRow()
Dim iRow As Long, iCol As Long

   mMainGridSelectedRow = 0
   
   If MainGrid.Rows > 0 Then
        With MainGrid
           For iRow = 1 To .Rows
              If .RowMode Then
                 If .CellSelected(iRow, 1) Then
                    'MsgBox "SELECTED:" & iRow
                    mMainGridSelectedRow = iRow
                 End If
              Else
                 'For iCol = 1 To .Columns
                 '   If .CellSelected(iRow, iCol) Then
                 '      'MsgBox "SELECTED:" & iRow, iCol
                 '   End If
                 'Next iCol
              End If
           Next iRow
        End With
   
        If mMainGridSelectedRow = 0 Then mMainGridSelectedRow = 1
   End If
   DoEvents

End Sub

Private Sub SecondaryGrid_ColumnClick(ByVal lCol As Long)
Dim sTag As String
Dim i As Long
      
   With SecondaryGrid.SortObject
      .Clear
      .SortColumn(1) = lCol
   
      sTag = SecondaryGrid.ColumnTag(lCol)
      If (sTag = "") Then
         sTag = "DESC"
         .SortOrder(1) = CCLOrderAscending
      Else
         sTag = ""
         .SortOrder(1) = CCLOrderDescending
      End If
      SecondaryGrid.ColumnTag(lCol) = sTag
   
      Select Case SecondaryGrid.ColumnKey(lCol)
      Case "file", "col8"
         ' sort by icon:
         .SortType(1) = CCLSortIcon
      Case "date"
         ' sort by date:
         .SortType(1) = CCLSortDate
      Case Else
         ' sort by text:
         .SortType(1) = CCLSortString
      End Select
   End With
   Screen.MousePointer = vbHourglass
   SecondaryGrid.Sort
   Screen.MousePointer = vbDefault
   
End Sub

Private Sub Timer2_Timer(Index As Integer)
    If QuickStats.Visible = True Then
    End If
End Sub

