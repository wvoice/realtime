VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CASHIER_CheckOut 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Cashier Check Out"
   ClientHeight    =   7212
   ClientLeft      =   1920
   ClientTop       =   1980
   ClientWidth     =   6936
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7212
   ScaleWidth      =   6936
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Command2 
      Caption         =   "Check &IN"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   425
      Left            =   5520
      TabIndex        =   30
      Top             =   5760
      Width           =   1212
   End
   Begin VB.CommandButton cmd_CheckOut 
      Caption         =   "Check &Out"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   425
      Left            =   5520
      TabIndex        =   29
      Top             =   5280
      Width           =   1212
   End
   Begin VB.Frame Frame2 
      Caption         =   "Frame2"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1812
      Left            =   120
      TabIndex        =   28
      Top             =   5160
      Width           =   5292
   End
   Begin VB.Frame Cash_Frame 
      Height          =   1750
      Left            =   120
      TabIndex        =   18
      Top             =   3324
      Width           =   5268
      Begin VB.CommandButton cmdReset 
         Caption         =   "&Reset"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Left            =   4320
         TabIndex        =   19
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$100.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   9
         Left            =   4320
         TabIndex        =   11
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$50.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   8
         Left            =   3480
         TabIndex        =   10
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$20.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   7
         Left            =   2640
         TabIndex        =   9
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$10.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   6
         Left            =   1800
         TabIndex        =   8
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$5.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   5
         Left            =   960
         TabIndex        =   7
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$1.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   4
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$.25"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   3
         Left            =   2640
         TabIndex        =   5
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.10"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   2
         Left            =   1800
         TabIndex        =   4
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.05"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   1
         Left            =   960
         TabIndex        =   3
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.01"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   795
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Account Badge/ID:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2172
      Left            =   120
      TabIndex        =   16
      Top             =   120
      Width           =   6110
      Begin VB.TextBox txt_Firstname 
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
         Left            =   1956
         Locked          =   -1  'True
         TabIndex        =   23
         Top             =   480
         Width           =   3888
      End
      Begin VB.TextBox txt_LastName 
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
         Left            =   1956
         Locked          =   -1  'True
         TabIndex        =   22
         Top             =   876
         Width           =   3888
      End
      Begin VB.TextBox txt_Email 
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
         Left            =   1956
         Locked          =   -1  'True
         TabIndex        =   21
         Top             =   1260
         Width           =   3885
      End
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
         Left            =   1956
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   1656
         Width           =   3885
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&S"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   380
         Left            =   5520
         TabIndex        =   17
         Top             =   0
         Width           =   435
      End
      Begin VB.TextBox txt_Badge 
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
         Left            =   1920
         TabIndex        =   0
         Top             =   0
         Width           =   3468
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   1
         Left            =   240
         TabIndex        =   24
         Top             =   480
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
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
         Height          =   312
         Index           =   2
         Left            =   240
         TabIndex        =   25
         Top             =   876
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
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
         Height          =   312
         Index           =   4
         Left            =   240
         TabIndex        =   26
         Top             =   1260
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
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
         Height          =   312
         Index           =   0
         Left            =   240
         TabIndex        =   27
         Top             =   1596
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
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
         Caption         =   "Balance of Funds:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Adjustment Amount:"
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
      TabIndex        =   13
      Top             =   2400
      Width           =   6108
      Begin VB.CommandButton cmdCredit 
         Caption         =   "C&redit"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   425
         Left            =   4800
         TabIndex        =   15
         Top             =   270
         Width           =   1068
      End
      Begin VB.CommandButton cmdDebit 
         Caption         =   "&Debit"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   425
         Left            =   3600
         TabIndex        =   14
         Top             =   270
         Width           =   1095
      End
      Begin VB.TextBox txt_Amount 
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
         Left            =   1956
         TabIndex        =   1
         Top             =   300
         Width           =   1488
      End
   End
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
      Left            =   5520
      TabIndex        =   12
      Top             =   6240
      Width           =   1215
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   5640
      Top             =   3720
   End
End
Attribute VB_Name = "Frm_CASHIER_CheckOut"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private RunningTotal As Single

Private Sub CashCmd_Click(Index As Integer)
    Select Case Index
    Case 0
            RunningTotal = RunningTotal + 0.01
    Case 1
            RunningTotal = RunningTotal + 0.05
    Case 2
            RunningTotal = RunningTotal + 0.1
    Case 3
            RunningTotal = RunningTotal + 0.25
    Case 4
            RunningTotal = RunningTotal + 1#
    Case 5
            RunningTotal = RunningTotal + 5#
    Case 6
            RunningTotal = RunningTotal + 10#
    Case 7
            RunningTotal = RunningTotal + 20#
    Case 8
            RunningTotal = RunningTotal + 50#
    Case 9
            RunningTotal = RunningTotal + 100#
    End Select
    
    txt_Amount = "$" & CCur(RunningTotal)
  
End Sub

Private Sub cmd_CheckOut_Click()

    Dim rs As New ADODB.Recordset
    rs.Open "Select * from dbo.docugate_cashier_tran where 0=1", gConn, adOpenDynamic, adLockOptimistic
    rs.AddNew
    rs!ACC_BADGE = gClsAccountManager.mBadge
    rs!DT_CHECKEDOUT = Mod_Data.GetSQLDateTime()
    rs!CASHIER_OUT_ACC_BADGE = gClsLogonManager.mBadge
    rs.Update
    rs.Close
    
    Unload Me

End Sub

Private Sub Cmd_Close_Click()
    Unload Me
End Sub

Private Sub cmdCredit_Click()
    If gClsAccountManager.AdjustFunds(gClsAccountManager.mValidAccGUID, Val(RemoveCurrency(Me.txt_Amount))) = True Then
        RunningTotal = 0
        Call LookupAccount
    End If
End Sub

Private Sub cmdDebit_Click()
    If gClsAccountManager.AdjustFunds(gClsAccountManager.mValidAccGUID, -1 * Val(RemoveCurrency(Me.txt_Amount))) = True Then
        RunningTotal = 0
        Call LookupAccount
    End If
End Sub

Private Sub CmdReset_Click()
    RunningTotal = 0#
    txt_Amount = "$" & CCur(RunningTotal)
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    Call SetButtons(False)
End Sub

Private Sub SetButtons(InputVar As Boolean)
    Dim i As Integer
    For i = 0 To 9
        CashCmd(i).Enabled = InputVar
    Next i
    cmdDebit.Enabled = InputVar
    cmdCredit.Enabled = InputVar
    cmdReset.Enabled = InputVar
End Sub

Private Sub Reset_Timer()
    Reset.Enabled = False
    Me.Caption = "Fund Account"
End Sub

Private Sub txt_Badge_LostFocus()
    If Me.txt_Badge.Text <> "" Then Call LookupAccount
End Sub

Private Sub LookupAccount()

    Call gClsAccountManager.VerifyBadge(Me.txt_Badge)
    If gClsAccountManager.mValid = False Then
        MsgBox "Invalid Badge/ID!", vbExclamation + vbOKOnly, "Invalid"
        Call SetButtons(False)
        Exit Sub
    End If
    Me.txt_Firstname = gClsAccountManager.mFirstname
    Me.txt_LastName = gClsAccountManager.mLastname
    Me.txt_Email = gClsAccountManager.mEmail
    Me.txt_ACC_FUNDS = "$" & Format(gClsAccountManager.mFunds, "0.00")
    Me.txt_Amount.SetFocus
    Call SetButtons(True)
End Sub
