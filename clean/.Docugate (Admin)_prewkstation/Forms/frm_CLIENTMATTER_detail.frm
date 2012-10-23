VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_CLIENTMATTER_detail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Client Matter"
   ClientHeight    =   3210
   ClientLeft      =   6675
   ClientTop       =   2040
   ClientWidth     =   6540
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_CLIENTMATTER_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   6540
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Client:"
      Height          =   735
      Left            =   120
      TabIndex        =   12
      Top             =   120
      Width           =   6255
      Begin SCLABELLib.SCLabel lblClientName 
         Height          =   315
         Left            =   240
         TabIndex        =   13
         Top             =   300
         Width           =   5805
         _Version        =   65536
         _ExtentX        =   10239
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.01
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "ABC CLIENT"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
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
      Left            =   2520
      TabIndex        =   11
      Top             =   2640
      Width           =   1095
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
      Left            =   5280
      TabIndex        =   10
      Top             =   2640
      Width           =   1095
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
      Left            =   3720
      TabIndex        =   9
      Top             =   2640
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
      Left            =   1320
      TabIndex        =   8
      Top             =   2640
      Width           =   1095
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
      Left            =   120
      TabIndex        =   7
      Top             =   2640
      Width           =   1095
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
      Height          =   1635
      Left            =   120
      TabIndex        =   3
      Top             =   920
      Width           =   6285
      Begin VB.TextBox txt_CM_MATTER 
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
         Left            =   1650
         TabIndex        =   0
         Top             =   360
         Width           =   4395
      End
      Begin VB.TextBox txt_CM_DESCRIPTION 
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
         Left            =   1650
         TabIndex        =   1
         Top             =   720
         Width           =   4395
      End
      Begin VB.TextBox txt_CM_CUSTOM 
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
         Left            =   1650
         TabIndex        =   2
         Top             =   1080
         Width           =   4395
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   2
         Left            =   240
         TabIndex        =   4
         Top             =   720
         Width           =   1608
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
         Caption         =   "Description:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   4
         Left            =   240
         TabIndex        =   5
         Top             =   1080
         Width           =   1608
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
         Caption         =   "Custom:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   0
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   1608
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
         Caption         =   "Matter Code:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
End
Attribute VB_Name = "FRM_CLIENTMATTER_detail"
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
    
    If gClsMatterManager.DeleteOU(gClsMatterManager.RecordGUID) = False Then
        Caption = gClsMatterManager.mLastError
    Else
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()
    If Validate() = False Then Exit Sub
    If gClsMatterManager.SaveOU(Me) = False Then
        Caption = gClsMatterManager.mLastError
    Else
        Unload Me
    End If
End Sub

Private Function Validate() As Boolean
    If Trim(Me.txt_CM_MATTER.Text) = "" Then
        MsgBox "Specify the Matter of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_CM_MATTER.SetFocus
        Exit Function
    End If
    
    If gClsMatterManager.TranOper = gcAddRecord Then
        If gClsMatterManager.VerifyCM_Exists(Me.txt_CM_MATTER.Text) = True Then
            MsgBox "Attempt to create a duplicate " & m_Entity & " for this client!", vbExclamation + vbOKOnly, "Error"
            txt_CM_MATTER.SetFocus
            Exit Function
        End If
    End If
    
    Validate = True
End Function

Private Sub Form_Load()
    m_Entity = "Client Matter"
    Call CentreForm(Me)
End Sub

Private Sub txt_CM_CUSTOM_GotFocus()
    Call HighLightField(txt_CM_CUSTOM)
End Sub

Private Sub txt_CM_DESCRIPTION_GotFocus()
    Call HighLightField(txt_CM_DESCRIPTION)
End Sub

Private Sub txt_CM_MATTER_GotFocus()
    Call HighLightField(txt_CM_MATTER)
End Sub

Private Sub txt_CM_MATTER_LostFocus()
    txt_CM_MATTER.Text = RemoveQuotes(txt_CM_MATTER.Text)
End Sub
