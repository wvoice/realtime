VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CTLUNIT_detail 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Control Unit"
   ClientHeight    =   4788
   ClientLeft      =   3624
   ClientTop       =   1608
   ClientWidth     =   7164
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.6
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000E&
   Icon            =   "Frm_CTLUNIT_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4788
   ScaleWidth      =   7164
   ShowInTaskbar   =   0   'False
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
      Left            =   3120
      TabIndex        =   11
      ToolTipText     =   "11"
      Top             =   4200
      Width           =   1215
   End
   Begin VB.Frame fraTerminalType 
      Caption         =   "<Terminal Type=1>"
      Height          =   3972
      Left            =   240
      TabIndex        =   12
      Top             =   120
      Width           =   6732
      Begin VB.CheckBox chk_CTLUNIT_SPECIAL 
         Caption         =   "Special"
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   2160
         TabIndex        =   8
         Top             =   3360
         Width           =   2172
      End
      Begin VB.ComboBox Cbm_Dev 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         ItemData        =   "Frm_CTLUNIT_detail.frx":6852
         Left            =   2160
         List            =   "Frm_CTLUNIT_detail.frx":685F
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   6
         ToolTipText     =   "8"
         Top             =   2520
         Width           =   4332
      End
      Begin VB.TextBox txt_CTLUNIT_DESCRIPTION 
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
         ToolTipText     =   "5"
         Top             =   720
         Width           =   4332
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
         Height          =   300
         ItemData        =   "Frm_CTLUNIT_detail.frx":6878
         Left            =   2160
         List            =   "Frm_CTLUNIT_detail.frx":687A
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   7
         ToolTipText     =   "8"
         Top             =   2880
         Width           =   4332
      End
      Begin VB.TextBox txt_CTLUNIT_TERMINALNAME 
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
         ToolTipText     =   "3"
         Top             =   1440
         Width           =   4332
      End
      Begin VB.TextBox txt_CTLUNIT_TERMINALID 
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
         Top             =   360
         Width           =   4332
      End
      Begin VB.TextBox txt_CTLUNIT_MODEL 
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
         ToolTipText     =   "2"
         Top             =   1080
         Width           =   4332
      End
      Begin VB.TextBox txt_CTLUNIT_STATUS 
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
         TabIndex        =   5
         ToolTipText     =   "7"
         Top             =   2160
         Width           =   4332
      End
      Begin VB.TextBox txt_CTLUNIT_LOCATION 
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
         TabIndex        =   4
         ToolTipText     =   "4"
         Top             =   1800
         Width           =   4332
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   240
         TabIndex        =   13
         Top             =   360
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Terminal ID:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   2
         Left            =   240
         TabIndex        =   14
         Top             =   1080
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Model:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   240
         TabIndex        =   15
         Top             =   1800
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Location:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   7
         Left            =   240
         TabIndex        =   16
         Top             =   1440
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Terminal Name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   5
         Left            =   240
         TabIndex        =   17
         Top             =   2880
         Width           =   1728
         _Version        =   65536
         _ExtentX        =   3043
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
         Height          =   312
         Index           =   12
         Left            =   240
         TabIndex        =   18
         Top             =   720
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
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
         Height          =   312
         Index           =   9
         Left            =   240
         TabIndex        =   19
         Top             =   2160
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Status:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   3
         Left            =   240
         TabIndex        =   20
         Top             =   2520
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Device:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2160
      Top             =   6960
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   4440
      TabIndex        =   10
      ToolTipText     =   "10"
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
      Default         =   -1  'True
      Height          =   375
      Left            =   5760
      TabIndex        =   9
      ToolTipText     =   "9"
      Top             =   4200
      Width           =   1215
   End
End
Attribute VB_Name = "Frm_CTLUNIT_detail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private m_Entity As String

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    
    If gClsCtrlUnitManager.DeleteUnit(gClsCtrlUnitManager.RecordGUID) = False Then
        Caption = gClsCtrlUnitManager.mLastError
    Else
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()
    
    If Validate() = False Then Exit Sub
    If gClsCtrlUnitManager.SaveUnit(Me) = False Then
        Caption = gClsCtrlUnitManager.mLastError
    Else
        Unload Me
    End If
End Sub

Private Function Validate() As Boolean
    If Trim(txt_CTLUNIT_TERMINALID.Text) = "" Then
        MsgBox "Specify the Terminate ID of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_CTLUNIT_TERMINALID.SetFocus
        Exit Function
    End If
    
    If Trim(Cbm_OU.Text) = "" Then
        MsgBox "Specify the Organizational Unit " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        Cbm_OU.SetFocus
        Exit Function
    End If
    Validate = True
End Function

Private Sub Form_Load()
    Call CentreForm(Me)
    '// The list of terminal types are in the ini file
    gClsConfig.Get_ini ("TYPE-OF-TERMINAL")
    
    m_Entity = gTerminalTypes(1)
End Sub

Private Sub Reset_Timer()
    Reset.Enabled = False
    Me.Caption = "&Add Unit"
End Sub



