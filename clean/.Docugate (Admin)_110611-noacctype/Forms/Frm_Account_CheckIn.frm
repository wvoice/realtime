VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CASHIER_CheckIn 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "DocuGate Account Checkin"
   ClientHeight    =   4356
   ClientLeft      =   4296
   ClientTop       =   2760
   ClientWidth     =   6180
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4356
   ScaleWidth      =   6180
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Walkin ID:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      TabIndex        =   16
      Top             =   2880
      Width           =   5925
      Begin VB.TextBox Text2 
         Height          =   330
         Left            =   150
         Locked          =   -1  'True
         TabIndex        =   0
         Top             =   270
         Width           =   5535
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Selected Account:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2655
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   5925
      Begin VB.TextBox Text1 
         Height          =   330
         Left            =   2250
         Locked          =   -1  'True
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   2160
         Width           =   3405
      End
      Begin VB.TextBox txt_Badge 
         Height          =   330
         Left            =   2250
         Locked          =   -1  'True
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   360
         Width           =   3435
      End
      Begin VB.TextBox txt_Firstname 
         Height          =   330
         Left            =   2250
         Locked          =   -1  'True
         TabIndex        =   9
         TabStop         =   0   'False
         Top             =   720
         Width           =   3405
      End
      Begin VB.TextBox txt_LastName 
         Height          =   330
         Left            =   2250
         Locked          =   -1  'True
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   1080
         Width           =   3405
      End
      Begin VB.TextBox txt_Password 
         Height          =   330
         Left            =   2250
         Locked          =   -1  'True
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   1440
         Width           =   3405
      End
      Begin VB.TextBox txt_Email 
         Height          =   330
         Left            =   2250
         Locked          =   -1  'True
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   1800
         Width           =   3405
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   1968
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   240
         TabIndex        =   10
         Top             =   720
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   2
         Left            =   240
         TabIndex        =   11
         Top             =   1080
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
         Left            =   240
         TabIndex        =   12
         Top             =   1440
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
         Left            =   240
         TabIndex        =   13
         Top             =   1800
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
         Index           =   6
         Left            =   240
         TabIndex        =   15
         Top             =   2160
         Width           =   1965
         _Version        =   65536
         _ExtentX        =   3466
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Organizational Unit"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
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
      Left            =   4800
      TabIndex        =   3
      Top             =   3870
      Width           =   1215
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
      Left            =   3540
      TabIndex        =   2
      Top             =   3870
      Width           =   1215
   End
End
Attribute VB_Name = "Frm_CASHIER_CheckIn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Cmd_Cancel_Click()
Unload Me
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
End Sub
