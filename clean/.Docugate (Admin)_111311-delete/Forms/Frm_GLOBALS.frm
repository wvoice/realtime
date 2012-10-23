VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_GLOBALS 
   BackColor       =   &H8000000A&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "DocuGate - Global Pricing Values"
   ClientHeight    =   7725
   ClientLeft      =   3090
   ClientTop       =   1860
   ClientWidth     =   12930
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm_GLOBALS.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7725
   ScaleWidth      =   12930
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame3 
      Caption         =   "Unit Model -"
      ForeColor       =   &H8000000E&
      Height          =   1455
      Left            =   6600
      TabIndex        =   41
      Top             =   1440
      Width           =   6255
      Begin VB.PictureBox Picture5 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   120
         Picture         =   "Frm_GLOBALS.frx":08CA
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   44
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox txt_unitvalue 
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
         Left            =   4920
         TabIndex        =   43
         Top             =   0
         Width           =   1095
      End
      Begin VB.CheckBox chkUnitvalue 
         Alignment       =   1  'Right Justify
         Caption         =   "On/Off toggle"
         Height          =   255
         Left            =   2400
         TabIndex        =   42
         Top             =   0
         Width           =   1815
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   795
         Index           =   13
         Left            =   840
         TabIndex        =   45
         Top             =   480
         Width           =   5205
         _Version        =   65536
         _ExtentX        =   9181
         _ExtentY        =   1402
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "* This is the Amount of currency a single(1) unit is worth. this is used when sites want to see units displayed."
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   14
         Left            =   4560
         TabIndex        =   46
         Top             =   0
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
   Begin VB.Frame Frame1 
      Caption         =   "Max Spend Limit -"
      ForeColor       =   &H8000000E&
      Height          =   1215
      Left            =   6600
      TabIndex        =   35
      Top             =   120
      Width           =   6255
      Begin VB.CheckBox chkMaxSpend 
         Alignment       =   1  'Right Justify
         Caption         =   "On/Off toggle"
         Height          =   255
         Left            =   2400
         TabIndex        =   40
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
         Left            =   4920
         TabIndex        =   37
         Top             =   0
         Width           =   1095
      End
      Begin VB.PictureBox Picture4 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   120
         Picture         =   "Frm_GLOBALS.frx":0EC7
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   36
         Top             =   480
         Width           =   615
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   555
         Index           =   12
         Left            =   840
         TabIndex        =   38
         Top             =   480
         Width           =   5205
         _Version        =   65536
         _ExtentX        =   9181
         _ExtentY        =   979
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "* This is the Max spend limit that any single account can accumlate before they will be logged off. this is  site wide."
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   4560
         TabIndex        =   39
         Top             =   0
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Caption         =   "Global Multiplier -"
      ForeColor       =   &H8000000E&
      Height          =   1695
      Left            =   240
      TabIndex        =   26
      Top             =   5880
      Width           =   6255
      Begin VB.PictureBox Picture3 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   240
         Picture         =   "Frm_GLOBALS.frx":14C4
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   34
         Top             =   840
         Width           =   615
      End
      Begin VB.TextBox txt_GLOBALS_PRN_MULTIPLIER 
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
         Left            =   4440
         TabIndex        =   7
         Top             =   480
         Width           =   1575
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   3
         Left            =   480
         TabIndex        =   27
         Top             =   480
         Width           =   3165
         _Version        =   65536
         _ExtentX        =   5583
         _ExtentY        =   556
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Site Multiplier"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   7
         Left            =   4200
         TabIndex        =   28
         Top             =   480
         Width           =   405
         _Version        =   65536
         _ExtentX        =   714
         _ExtentY        =   556
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "% "
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   555
         Index           =   9
         Left            =   840
         TabIndex        =   29
         Top             =   960
         Width           =   5205
         _Version        =   65536
         _ExtentX        =   9181
         _ExtentY        =   979
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "* This multiplier is used in order to get a standard markup on all output activity across the site."
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
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
      Left            =   11280
      TabIndex        =   8
      Top             =   7200
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
      Left            =   9720
      TabIndex        =   9
      Top             =   7200
      Width           =   1455
   End
   Begin VB.Frame Frame5 
      Caption         =   "Global Printing and Copying Prices -"
      ForeColor       =   &H8000000E&
      Height          =   3015
      Left            =   240
      TabIndex        =   12
      Top             =   120
      Width           =   6255
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   240
         Picture         =   "Frm_GLOBALS.frx":1AC1
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   32
         Top             =   1920
         Width           =   615
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
         Left            =   4440
         TabIndex        =   3
         Top             =   1560
         Width           =   1575
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
         Left            =   4440
         TabIndex        =   2
         Top             =   1200
         Width           =   1575
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
         Left            =   4440
         TabIndex        =   1
         Top             =   840
         Width           =   1575
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
         Index           =   0
         Left            =   4440
         TabIndex        =   0
         Top             =   480
         Width           =   1575
      End
      Begin SCLABELLib.SCLabel lblPP 
         Height          =   315
         Index           =   0
         Left            =   480
         TabIndex        =   13
         Top             =   480
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Cost for Small Format Black and White"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblPP 
         Height          =   315
         Index           =   1
         Left            =   480
         TabIndex        =   14
         Top             =   840
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Cost for Large Format Black and White"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblPP 
         Height          =   315
         Index           =   2
         Left            =   480
         TabIndex        =   15
         Top             =   1200
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Cost for Small Format Color"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblPP 
         Height          =   315
         Index           =   3
         Left            =   480
         TabIndex        =   16
         Top             =   1560
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Cost for Large Format Color"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   8
         Left            =   4200
         TabIndex        =   19
         Top             =   480
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   4200
         TabIndex        =   20
         Top             =   840
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   4200
         TabIndex        =   21
         Top             =   1200
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   2
         Left            =   4200
         TabIndex        =   22
         Top             =   1560
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   675
         Index           =   11
         Left            =   840
         TabIndex        =   31
         Top             =   2040
         Width           =   5205
         _Version        =   65536
         _ExtentX        =   9181
         _ExtentY        =   1191
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.01
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   $"Frm_GLOBALS.frx":20BE
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Additional Global Charges -"
      ForeColor       =   &H8000000E&
      Height          =   2535
      Left            =   240
      TabIndex        =   10
      Top             =   3240
      Width           =   6255
      Begin VB.PictureBox Picture2 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   240
         Picture         =   "Frm_GLOBALS.frx":215D
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   33
         Top             =   1560
         Width           =   615
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
         Left            =   4440
         TabIndex        =   4
         Top             =   480
         Width           =   1575
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
         Left            =   4440
         TabIndex        =   5
         Top             =   840
         Width           =   1575
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
         Left            =   4440
         TabIndex        =   6
         Top             =   1200
         Width           =   1575
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   0
         Left            =   480
         TabIndex        =   11
         Top             =   480
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Associated with Scans"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   1
         Left            =   480
         TabIndex        =   17
         Top             =   840
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Associated with Faxes"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblCPY 
         Height          =   315
         Index           =   2
         Left            =   480
         TabIndex        =   18
         Top             =   1200
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Associated with Emails"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   4200
         TabIndex        =   23
         Top             =   480
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   5
         Left            =   4200
         TabIndex        =   24
         Top             =   840
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   6
         Left            =   4200
         TabIndex        =   25
         Top             =   1200
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   675
         Index           =   10
         Left            =   960
         TabIndex        =   30
         Top             =   1680
         Width           =   4965
         _Version        =   65536
         _ExtentX        =   8758
         _ExtentY        =   1191
         _StockProps     =   13
         BackColor       =   -2147483633
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.01
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   $"Frm_GLOBALS.frx":275A
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
   End
End
Attribute VB_Name = "Frm_GLOBALS"
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

Private Function ValidatePosNumTxt(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If Not IsNumeric(NumericTxt.Text) Then
        NumericTxt.Text = "1.00"
        MsgBox "Specify a positive numeric or zero value!", vbExclamation + vbOKOnly, "Data Error"
        NumericTxt.SetFocus
    Else
        If Val(NumericTxt.Text) < 0 Then
            NumericTxt.Text = "1.00"
            MsgBox "Specify a positive numeric or zero value!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
        Else
            NumericTxt.Text = Format(NumericTxt, "#,##0.00")
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


Private Sub chkUnitvalue_Click()

If (chkUnitvalue.Value = 0) Then
    txt_unitvalue.Enabled = False
    txt_unitvalue.BackColor = &H80000011
Else
    txt_unitvalue.Enabled = True
    txt_unitvalue.BackColor = &HFFFFFF
    
    On Error Resume Next
        txt_unitvalue.SetFocus
End If

End Sub

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()
    If gObjGlobals.SaveGlobals(Me) = True Then
        If gObjGlobals.mLastError <> "" Then
            MsgBox gObjGlobals.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    Me.Caption = "DocuGate - Global Pricing Values"
End Sub

Private Sub PrintPriceLine_GotFocus(Index As Integer)
    Call HighLightField(PrintPriceLine(Index))
End Sub

Private Sub CopyPriceLine_GotFocus(Index As Integer)
    Call HighLightField(CopyPriceLine(Index))
End Sub

Private Sub PrintPriceLine_LostFocus(Index As Integer)
    Call ValidatePosNumTxt(PrintPriceLine(Index))
End Sub

Private Sub CopyPriceLine_LostFocus(Index As Integer)
    Call ValidatePosNumTxt(CopyPriceLine(Index))
End Sub

Private Sub txt_GLOBALS_PRN_MULTIPLIER_LostFocus()
    Call ValidatePosNumTxt(txt_GLOBALS_PRN_MULTIPLIER)
End Sub

Private Sub txt_GLOBALS_PRN_MULTIPLIER_GotFocus()
    Call HighLightField(txt_GLOBALS_PRN_MULTIPLIER)
End Sub
