VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CLIENT_Add 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Add Client"
   ClientHeight    =   3390
   ClientLeft      =   4980
   ClientTop       =   4005
   ClientWidth     =   5985
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3390
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
      Default         =   -1  'True
      Height          =   375
      Left            =   4590
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   2850
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3300
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   2850
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   2595
      Left            =   60
      TabIndex        =   5
      Top             =   90
      Width           =   5805
      Begin VB.TextBox txt_CC_CUSTOM 
         Height          =   330
         Left            =   2010
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   1980
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_EMAIL 
         Height          =   330
         Left            =   2010
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   1590
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_DESC 
         Height          =   330
         Left            =   2010
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   1170
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_CODE 
         Height          =   330
         Left            =   2010
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   780
         Width           =   3405
      End
      Begin VB.TextBox txt_CC_NAME 
         Height          =   330
         Left            =   2010
         TabIndex        =   0
         TabStop         =   0   'False
         Top             =   360
         Width           =   3435
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   270
         TabIndex        =   6
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
         Caption         =   "Client Name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   270
         TabIndex        =   7
         Top             =   780
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
         Caption         =   "Client Code:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   2
         Left            =   270
         TabIndex        =   8
         Top             =   1200
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
         Caption         =   "Description:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   270
         TabIndex        =   9
         Top             =   1590
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
         Caption         =   "Email:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   270
         TabIndex        =   10
         Top             =   1980
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
         Caption         =   "Custom:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
End
Attribute VB_Name = "Frm_CLIENT_Add"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_Cancel_Click()
Unload Me
End Sub

Private Sub Cmd_Process_Click()
Unload Me
End Sub
