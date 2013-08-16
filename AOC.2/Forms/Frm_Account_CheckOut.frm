VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CASHIER_CheckOut 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "DocuGate Account Check Out"
   ClientHeight    =   4968
   ClientLeft      =   2760
   ClientTop       =   2100
   ClientWidth     =   11136
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.6
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4968
   ScaleWidth      =   11136
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame3 
      Caption         =   "Adjustment Amount:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   10.2
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   5640
      TabIndex        =   26
      Top             =   120
      Width           =   5268
      Begin VB.CommandButton cmd_Close 
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
         Height          =   425
         Left            =   4200
         TabIndex        =   30
         Top             =   270
         Width           =   948
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
         Left            =   240
         TabIndex        =   29
         Top             =   300
         Width           =   1212
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
         Left            =   1560
         TabIndex        =   28
         Top             =   270
         Width           =   972
      End
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
         Left            =   2640
         TabIndex        =   27
         Top             =   270
         Width           =   948
      End
   End
   Begin VB.Frame Cash_Frame 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   7.8
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1785
      Left            =   5640
      TabIndex        =   13
      Top             =   1080
      Width           =   5292
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
         TabIndex        =   24
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
         TabIndex        =   23
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
         TabIndex        =   22
         Top             =   240
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
         TabIndex        =   21
         Top             =   240
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
         TabIndex        =   20
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
         TabIndex        =   19
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
         TabIndex        =   18
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
         TabIndex        =   17
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
         TabIndex        =   16
         Top             =   960
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
         TabIndex        =   15
         Top             =   960
         Width           =   795
      End
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
         TabIndex        =   14
         Top             =   240
         Width           =   795
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Card Status:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   10.2
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1788
      Left            =   120
      TabIndex        =   12
      Top             =   3000
      Width           =   10848
      Begin VB.TextBox Text2 
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
         Left            =   7320
         Locked          =   -1  'True
         TabIndex        =   33
         Top             =   360
         Width           =   3132
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   32
         Top             =   360
         Width           =   3132
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   5
         Left            =   240
         TabIndex        =   31
         Top             =   360
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   0
         Left            =   5520
         TabIndex        =   34
         Top             =   360
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
   Begin VB.Frame Frame1 
      Caption         =   "Account Badge/ID:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   10.2
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2772
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   5412
      Begin VB.CommandButton Command1 
         Caption         =   "&S"
         Height          =   380
         Left            =   4800
         TabIndex        =   25
         Top             =   0
         Width           =   435
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   1560
         Width           =   3132
      End
      Begin VB.TextBox txt_Password 
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
         Locked          =   -1  'True
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   1200
         Width           =   3132
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   840
         Width           =   3132
      End
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   3
         TabStop         =   0   'False
         Top             =   480
         Width           =   3132
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
         Left            =   2040
         TabIndex        =   0
         TabStop         =   0   'False
         Top             =   0
         Width           =   2652
      End
      Begin VB.TextBox Text1 
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
         Locked          =   -1  'True
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   1920
         Width           =   3132
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   1
         Left            =   156
         TabIndex        =   7
         Top             =   480
         Width           =   1848
         _Version        =   65536
         _ExtentX        =   3254
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
         Left            =   156
         TabIndex        =   8
         Top             =   840
         Width           =   1848
         _Version        =   65536
         _ExtentX        =   3254
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
         Index           =   3
         Left            =   156
         TabIndex        =   9
         Top             =   1200
         Width           =   1848
         _Version        =   65536
         _ExtentX        =   3254
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
         Height          =   312
         Index           =   4
         Left            =   156
         TabIndex        =   10
         Top             =   1560
         Width           =   1848
         _Version        =   65536
         _ExtentX        =   3254
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
         Index           =   6
         Left            =   156
         TabIndex        =   11
         Top             =   1920
         Width           =   1848
         _Version        =   65536
         _ExtentX        =   3254
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.7
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
    Me.Caption = "Fund Account"
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

