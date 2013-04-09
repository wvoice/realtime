VERSION 5.00
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Begin VB.Form frm_Active_Session 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   7740
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   7740
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Cmd_Close 
      Cancel          =   -1  'True
      Caption         =   "&Close"
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
      Left            =   6360
      TabIndex        =   1
      Top             =   2760
      Width           =   1215
   End
   Begin vbAcceleratorGrid6.vbalGrid oumembersgrid 
      Height          =   2535
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7440
      _ExtentX        =   13123
      _ExtentY        =   4471
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
End
Attribute VB_Name = "frm_Active_Session"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'SELECT     dbo.docugate_general_active_session.ACC_GUID AS guid, dbo.docugate_general_acc.ACC_BADGE AS badge,dbo.docugate_general_acc.ACC_FULLNAME AS fullname
'FROM       dbo.docugate_general_active_session INNER JOIN dbo.docugate_general_acc ON dbo.docugate_general_active_session.ACC_GUID = dbo.docugate_general_acc.ACC_ACC_GUID

Private Sub Cmd_Close_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
End Sub

Private Sub GridUpdate_Timer()
'    GridUpdate.Enabled = False
'    Call Mod_SecondaryGrid.GridOUSetUp(Me.oumembersgrid)
'    Call Mod_SecondaryGrid.GridOUPopuplate(Me.oumembersgrid, ouguid)
End Sub

