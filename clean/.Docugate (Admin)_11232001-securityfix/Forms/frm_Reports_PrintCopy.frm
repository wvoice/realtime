VERSION 5.00
Object = "{9E55279C-1471-426E-8110-B0978497054C}#5.0#0"; "ctDEdit.ocx"
Begin VB.Form frm_Reports_PrintCopyQry 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Print and Copy Reports"
   ClientHeight    =   4164
   ClientLeft      =   1716
   ClientTop       =   1764
   ClientWidth     =   9240
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4164
   ScaleWidth      =   9240
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame4 
      Caption         =   "Activities:"
      Height          =   1332
      Left            =   240
      TabIndex        =   17
      Top             =   2160
      Width           =   3852
      Begin VB.OptionButton optAct 
         Caption         =   "All Jobs"
         Height          =   252
         Index           =   0
         Left            =   1080
         TabIndex        =   20
         Top             =   240
         Value           =   -1  'True
         Width           =   1692
      End
      Begin VB.OptionButton optAct 
         Caption         =   "Copy Jobs Only"
         Height          =   252
         Index           =   2
         Left            =   1080
         TabIndex        =   19
         Top             =   960
         Width           =   1692
      End
      Begin VB.OptionButton optAct 
         Caption         =   "Print Jobs Only"
         Height          =   252
         Index           =   1
         Left            =   1080
         TabIndex        =   18
         Top             =   600
         Width           =   1692
      End
   End
   Begin VB.CommandButton cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   6480
      TabIndex        =   12
      Top             =   3600
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Next 
      Caption         =   "&Next"
      Default         =   -1  'True
      Height          =   375
      Left            =   7800
      TabIndex        =   11
      Top             =   3600
      Width           =   1215
   End
   Begin VB.Frame Frame3 
      Caption         =   "Detail Level:"
      Height          =   852
      Left            =   4200
      TabIndex        =   16
      Top             =   2640
      Width           =   4812
      Begin VB.OptionButton optLevelOfDetail 
         Caption         =   "Detailed Jobs"
         Height          =   252
         Index           =   1
         Left            =   3000
         TabIndex        =   6
         Top             =   360
         Width           =   1572
      End
      Begin VB.OptionButton optLevelOfDetail 
         Caption         =   "Summarised at Group Level"
         Height          =   252
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Value           =   -1  'True
         Width           =   2532
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Group By:"
      Height          =   2412
      Left            =   4200
      TabIndex        =   14
      Top             =   120
      Width           =   4812
      Begin VB.CommandButton cmd_GroupAddAll 
         Caption         =   "Add ALL >>"
         Height          =   372
         Left            =   240
         TabIndex        =   8
         Top             =   720
         Width           =   1212
      End
      Begin VB.CommandButton cmd_GroupDelAll 
         Caption         =   "< ALL"
         Height          =   372
         Left            =   3600
         TabIndex        =   10
         Top             =   1920
         Width           =   972
      End
      Begin VB.CommandButton cmd_GroupDel 
         Caption         =   "< Remove"
         Height          =   372
         Left            =   2400
         TabIndex        =   9
         Top             =   1920
         Width           =   1092
      End
      Begin VB.ListBox lstGroupBy 
         Height          =   1476
         Left            =   2400
         TabIndex        =   15
         Top             =   360
         Width           =   2172
      End
      Begin VB.ComboBox cboGroupBy 
         Height          =   300
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   360
         Width           =   2052
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Activity Date:"
      Height          =   1932
      Left            =   240
      TabIndex        =   13
      Top             =   120
      Width           =   3852
      Begin VB.CommandButton cboOperEndClear 
         Caption         =   ".."
         Height          =   252
         Left            =   240
         TabIndex        =   23
         ToolTipText     =   "Clear"
         Top             =   1560
         Width           =   252
      End
      Begin VB.CommandButton cboOperStartClear 
         Caption         =   ".."
         Height          =   252
         Left            =   240
         TabIndex        =   22
         ToolTipText     =   "Clear"
         Top             =   600
         Width           =   252
      End
      Begin VB.CommandButton cmdClearJoin 
         Caption         =   ".."
         Height          =   252
         Left            =   1200
         TabIndex        =   21
         ToolTipText     =   "Clear"
         Top             =   960
         Width           =   252
      End
      Begin VB.ComboBox cboJoin 
         Height          =   300
         Left            =   1440
         Style           =   2  'Dropdown List
         TabIndex        =   2
         Top             =   840
         Width           =   852
      End
      Begin VB.ComboBox cboOperEnd 
         Height          =   300
         Left            =   480
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   1320
         Width           =   1812
      End
      Begin VB.ComboBox cboOperStart 
         Height          =   300
         Left            =   480
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   360
         Width           =   1812
      End
      Begin CTDEDITLibCtl.ctDEdit ctDtStart 
         Height          =   324
         Left            =   2400
         TabIndex        =   1
         ToolTipText     =   "mm/dd/yyyy"
         Top             =   360
         Width           =   1212
         _Version        =   327680
         _ExtentX        =   2138
         _ExtentY        =   572
         _StockProps     =   92
         Text            =   "__/__/____"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DropPicture     =   "frm_Reports_PrintCopy.frx":0000
         Text            =   "__/__/____"
      End
      Begin CTDEDITLibCtl.ctDEdit ctDtEnd 
         Height          =   324
         Left            =   2400
         TabIndex        =   4
         ToolTipText     =   "mm/dd/yyyy"
         Top             =   1320
         Width           =   1212
         _Version        =   327680
         _ExtentX        =   2138
         _ExtentY        =   572
         _StockProps     =   92
         Text            =   "__/__/____"
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         DropPicture     =   "frm_Reports_PrintCopy.frx":001C
         Text            =   "__/__/____"
      End
   End
End
Attribute VB_Name = "frm_Reports_PrintCopyQry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cboGroupBy_Click()
    Call MoveItemBetweenLists(Me.cboGroupBy, Me.lstGroupBy)
    Call ChkSummaryLevels
End Sub

Private Sub ChkSummaryLevels()
    If Me.lstGroupBy.ListCount > 0 Then
        optLevelOfDetail(0).Value = True
        optLevelOfDetail(1).Enabled = False
        optLevelOfDetail(0).Enabled = True
    Else
        optLevelOfDetail(1).Value = True
        optLevelOfDetail(1).Enabled = True
        optLevelOfDetail(0).Enabled = False
    End If
End Sub

Private Sub cboJoin_GotFocus()
    If cboJoin.ListIndex = -1 Then cboJoin.ListIndex = 0
End Sub

Private Sub cboOperEndClear_Click()
    cboOperEnd.ListIndex = 1
End Sub

Private Sub cboOperStartClear_Click()
    cboOperStart.ListIndex = 1
End Sub

Private Sub cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub cmd_GroupAddAll_Click()
    Call CopyListBox(Me.cboGroupBy, Me.lstGroupBy, "")
    Call ChkSummaryLevels
End Sub

Private Sub cmd_GroupDel_Click()
    Call MoveItemBetweenLists(Me.lstGroupBy, Me.cboGroupBy)
    Call ChkSummaryLevels
End Sub

Private Sub cmd_GroupDelAll_Click()
    Call CopyListBox(Me.lstGroupBy, Me.cboGroupBy, "")
    Call ChkSummaryLevels
End Sub

Private Sub Cmd_Next_Click()
    MsgBox "Under construction!"
    Call gClsReports.GenerateSQL(Me)
End Sub

Private Sub cmdClearJoin_Click()
    Me.cboJoin.ListIndex = 1
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    ctDtStart.Text = Format(Date, "mm/dd/yyyy")
End Sub

