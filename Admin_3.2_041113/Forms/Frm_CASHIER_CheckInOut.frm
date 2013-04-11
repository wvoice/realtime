VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CASHIER_CheckInOut 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Cashier Check In/Out"
   ClientHeight    =   7230
   ClientLeft      =   3375
   ClientTop       =   2430
   ClientWidth     =   6645
   Icon            =   "Frm_CASHIER_CheckInOut.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7230
   ScaleWidth      =   6645
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox txt_REFUND_REFUND_AMT 
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
      Left            =   2280
      Locked          =   -1  'True
      TabIndex        =   44
      Top             =   7200
      Visible         =   0   'False
      Width           =   2570
   End
   Begin VB.CommandButton Cmd_CC_Close 
      Caption         =   "Close"
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
      Left            =   9000
      TabIndex        =   41
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_CC_Authorize 
      Caption         =   "&Authorize"
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
      Left            =   7680
      TabIndex        =   40
      Top             =   5160
      Width           =   1215
   End
   Begin VB.Frame CC_Frame 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4932
      Left            =   6720
      TabIndex        =   39
      Top             =   120
      Width           =   3525
   End
   Begin VB.Frame fraTranDets 
      Caption         =   "Checked out:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   120
      TabIndex        =   33
      Top             =   5400
      Width           =   6315
      Begin VB.CommandButton cmd_CloseChkIn 
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
         Left            =   4920
         TabIndex        =   20
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton cmd_PrintReceipt 
         Caption         =   "&Receipt"
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
         Left            =   4920
         TabIndex        =   19
         Top             =   720
         Width           =   1215
      End
      Begin VB.CommandButton cmd_CheckIn 
         Caption         =   "Check &IN"
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
         Height          =   375
         Left            =   4920
         TabIndex        =   18
         Top             =   240
         Width           =   1215
      End
      Begin VB.TextBox txt_TOTAL_TRAN_AMT 
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
         Left            =   2160
         Locked          =   -1  'True
         TabIndex        =   38
         Top             =   1200
         Width           =   2570
      End
      Begin VB.TextBox txt_CHKOUT_CASHIER_NAME 
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
         Left            =   2160
         Locked          =   -1  'True
         TabIndex        =   35
         Top             =   780
         Width           =   2570
      End
      Begin VB.TextBox txt_DT_CHKOUT 
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
         Left            =   2160
         Locked          =   -1  'True
         TabIndex        =   34
         Top             =   360
         Width           =   2570
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   120
         TabIndex        =   36
         Top             =   780
         Width           =   1935
         _Version        =   65536
         _ExtentX        =   3413
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Checked out by:"
         Alignment       =   3
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   5
         Left            =   120
         TabIndex        =   37
         Top             =   1200
         Width           =   1935
         _Version        =   65536
         _ExtentX        =   3413
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Total Transactions: $ "
         Alignment       =   3
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   120
         TabIndex        =   42
         Top             =   360
         Width           =   1935
         _Version        =   65536
         _ExtentX        =   3413
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Date checked out:"
         Alignment       =   3
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame Cash_Frame 
      Height          =   1750
      Left            =   120
      TabIndex        =   24
      Top             =   3600
      Width           =   6315
      Begin VB.CommandButton ccCmd 
         Caption         =   "&CC"
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
         Left            =   5280
         TabIndex        =   16
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
         Left            =   5280
         TabIndex        =   17
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
         Left            =   4440
         TabIndex        =   15
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
         Left            =   3600
         TabIndex        =   14
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
         Left            =   2760
         TabIndex        =   13
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
         Left            =   1920
         TabIndex        =   12
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
         Left            =   1080
         TabIndex        =   11
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
         Left            =   240
         TabIndex        =   10
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
         Left            =   2760
         TabIndex        =   9
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
         Left            =   1920
         TabIndex        =   8
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
         Left            =   1080
         TabIndex        =   7
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
         Left            =   240
         TabIndex        =   6
         Top             =   240
         Width           =   795
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "  Account Badge/ID:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2415
      Left            =   120
      TabIndex        =   22
      Top             =   120
      Width           =   6345
      Begin VB.CommandButton cmd_CheckOutReceipt 
         Caption         =   "&Receipt"
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
         Left            =   4920
         TabIndex        =   43
         Top             =   1200
         Width           =   1215
      End
      Begin VB.CommandButton Cmd_CloseChkOut 
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
         Left            =   4920
         TabIndex        =   2
         Top             =   1680
         Width           =   1215
      End
      Begin VB.CommandButton cmd_CheckOut 
         Caption         =   "Check &OUT"
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
         Height          =   375
         Left            =   4920
         TabIndex        =   1
         Top             =   720
         Width           =   1215
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
         TabIndex        =   28
         Top             =   480
         Width           =   2685
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
         TabIndex        =   27
         Top             =   876
         Width           =   2685
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
         TabIndex        =   26
         Top             =   1270
         Width           =   2685
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
         TabIndex        =   25
         Top             =   1680
         Width           =   2685
      End
      Begin VB.CommandButton Command1 
         Caption         =   "&S"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   380
         Left            =   4920
         TabIndex        =   23
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
         Left            =   2040
         TabIndex        =   0
         Top             =   0
         Width           =   2685
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   240
         TabIndex        =   29
         Top             =   480
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         TabIndex        =   30
         Top             =   840
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
         Index           =   4
         Left            =   240
         TabIndex        =   31
         Top             =   1260
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
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
      Begin SCLABELLib.SCLabel lblFundBalance 
         Height          =   315
         Left            =   240
         TabIndex        =   32
         Top             =   1680
         Width           =   1815
         _Version        =   65536
         _ExtentX        =   3201
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Running Balance: $"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame fraAdjustAmt 
      Caption         =   "Adjust Fund Balance with:"
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
      TabIndex        =   21
      Top             =   2640
      Width           =   6315
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
         TabIndex        =   4
         ToolTipText     =   "Reduce the current Fund Balance"
         Top             =   240
         Width           =   1215
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
         Left            =   4920
         TabIndex        =   5
         ToolTipText     =   "Add to the current Fund Balance"
         Top             =   240
         Width           =   1215
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
         Left            =   2040
         TabIndex        =   3
         Top             =   240
         Width           =   1365
      End
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   6360
      Top             =   2160
   End
   Begin SCLABELLib.SCLabel SCLabel1 
      Height          =   315
      Index           =   6
      Left            =   360
      TabIndex        =   45
      Top             =   7200
      Visible         =   0   'False
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   556
      _StockProps     =   13
      ForeColor       =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Refund $ -"
      Alignment       =   3
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
End
Attribute VB_Name = "Frm_CASHIER_CheckInOut"
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

Private mFormLoading As Boolean
Private mRunningTotal As Single
Private mJobCost As Double
Private mRefund As Double
Const cHideWidth = 6765
Const cShowWidth = 105603
Private m_Acctype As String

Private Sub CashCmd_Click(Index As Integer)
    Select Case Index
    Case 0
            mRunningTotal = mRunningTotal + 0.01
    Case 1
            mRunningTotal = mRunningTotal + 0.05
    Case 2
            mRunningTotal = mRunningTotal + 0.1
    Case 3
            mRunningTotal = mRunningTotal + 0.25
    Case 4
            mRunningTotal = mRunningTotal + 1#
    Case 5
            mRunningTotal = mRunningTotal + 5#
    Case 6
            mRunningTotal = mRunningTotal + 10#
    Case 7
            mRunningTotal = mRunningTotal + 20#
    Case 8
            mRunningTotal = mRunningTotal + 50#
    Case 9
            mRunningTotal = mRunningTotal + 100#
    End Select
    
    txt_Amount = "$" & CCur(mRunningTotal)
  
End Sub

Private Sub ccCmd_Click()
    Me.Width = cShowWidth
    Call CentreForm(Me)
    MsgBox gcFeatureNotAvailable, vbInformation + vbOKOnly, "Information"
End Sub

Private Sub cmd_CheckOut_Click()

    If gObjAccountMngr.CashierCheckOut(gObjAccountMngr.mBadge) = True Then
        Unload Me
    End If
    
End Sub

Private Sub cmd_CheckIn_Click()

    If gObjAccountMngr.CashierCheckIn(gObjAccountMngr.mBadge, _
        Format(mJobCost, "0.00"), Format(mRefund, "0.00")) = False Then Exit Sub
    
    '// show the fund balance as it is on the accounts table
    lblFundBalance.Caption = "Fund Balance: "
    Me.txt_ACC_FUNDS = gObjAccountMngr.mFunds
    
    Me.cmd_CheckIn.Enabled = False
    Me.cmd_PrintReceipt.Enabled = True
    cmd_CloseChkIn.Caption = "&Close"
End Sub

Private Sub cmd_CheckOutReceipt_Click()
    
    If gReceiptNo = "" Then
        MsgBox "There are no previous receipts!", vbInformation + vbOKOnly, "Receipt"
        Exit Sub
    End If
    
    Dim oReceipt As New rpt_Cashier_SalesReceipt
    With oReceipt
       .PageLeftMargin = gReport_PO_RightMargin
       .PageRightMargin = gReport_LS_RightMargin
       .PageTopMargin = gReport_LS_TopMargin
       .PageBottomMargin = gReport_LS_BottomMargin
       .Printer.Orientation = ddOPortrait
       .Show vbModal
    End With
End Sub

Private Sub cmd_CloseChkIn_Click()
    
    Unload Me
End Sub

Private Sub Cmd_CloseChkOut_Click()
    Unload Me
End Sub

Private Sub cmd_PrintReceipt_Click()

    If gReceiptNo = "" Then
        MsgBox "There are no previous receipts!", vbInformation + vbOKOnly, "Receipt"
        Exit Sub
    End If
    
    Dim oReceipt As New rpt_Cashier_SalesReceipt
    With oReceipt
       .PageLeftMargin = gReport_PO_RightMargin
       .PageRightMargin = gReport_LS_RightMargin
       .PageTopMargin = gReport_LS_TopMargin
       .PageBottomMargin = gReport_LS_BottomMargin
       .Printer.Orientation = ddOPortrait
       .Show vbModal
    End With
        
End Sub


Private Sub cmdCloseChkIn_Click()
    Unload Me
End Sub

Private Sub cmdCredit_Click()
    If MsgBox("Are you sure you would like to credit the account with " & Format(Me.txt_Amount, "#,##0.00") & "?", vbYesNo, "Verify") = vbNo Then Exit Sub
    If gObjAccountMngr.CashierAdjustFunds(gObjAccountMngr.mBadge, Val(RemoveCurrency(Me.txt_Amount))) = True Then
        mRunningTotal = 0
        Call LookupAccount
    End If
End Sub

Private Sub cmdDebit_Click()
    If MsgBox("Are you sure you would like to debit the account with " & Format(Me.txt_Amount, "#,##0.00") & "?", vbYesNo, "Verify") = vbNo Then Exit Sub
    If gObjAccountMngr.CashierAdjustFunds(gObjAccountMngr.mBadge, -1 * Val(RemoveCurrency(Me.txt_Amount))) = True Then
        mRunningTotal = 0
        Call LookupAccount
    End If
End Sub

Private Sub Cmd_CC_Authorize_Click()
    Me.Width = cHideWidth
    Call CentreForm(Me)
End Sub

Private Sub Cmd_CC_Close_Click()
    Me.Width = cHideWidth
    Call CentreForm(Me)
End Sub

Private Sub cmdReset_Click()
    mRunningTotal = 0#
    txt_Amount = "$" & CCur(mRunningTotal)
End Sub

Private Sub Form_Activate()
    Me.Width = cHideWidth
    If mFormLoading = True Then
        If Me.txt_Badge.Text <> "" Then Me.txt_Amount.SetFocus
        mFormLoading = False
    End If
End Sub

Private Sub Form_Load()
    mFormLoading = True
    Call CentreForm(Me)
    Call SetButtons(False)
End Sub

Private Sub SetButtons(InputVar As Boolean)
    If m_Acctype = "PERMANENT" Then
        cmd_CheckOut.Visible = False
        cmd_CheckOutReceipt.Visible = False
        Cmd_CloseChkOut.Visible = False
        cmd_CheckIn.Visible = False
        cmd_PrintReceipt.Visible = False
    End If

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

Private Sub txt_Amount_LostFocus()
    If Not IsNumeric(RemoveCurrency(txt_Amount.Text)) Then txt_Amount.Text = ""
End Sub

Private Sub txt_Badge_LostFocus()
    If Me.txt_Badge.Text <> "" Then Call LookupAccount
End Sub

Public Sub LookupAccount()

On Error GoTo Err_Handler

    If mFormLoading = True Then Exit Sub

    gReceiptNo = ""
    
    Call gObjAccountMngr.VerifyBadge(Me.txt_Badge)
    If gObjAccountMngr.mValid = False Then
        MsgBox "Invalid Badge/ID!", vbExclamation + vbOKOnly, "Invalid"
        Call SetButtons(False)
        Exit Sub
    End If
    Me.txt_Firstname = gObjAccountMngr.mFirstname
    Me.txt_LastName = gObjAccountMngr.mLastname
    Me.txt_Email = gObjAccountMngr.mEmail
    
    cmd_CheckOut.Enabled = cmd_CheckOut.Visible
    cmd_CheckIn.Enabled = cmd_CheckIn.Visible
    
    '// To check in the card, find the transaction that was created when the card was checked out
    Dim rs As New ADODB.Recordset
    Dim OpenBal As Double
    
    '//31/03/2008
    Dim AccStatus As String
    Dim RunningBalance As Variant
    
    '// check the accounts availability status to see if the account has been checked out or still available
    rs.Open "select isnull(acc_funds,0) as acc_funds, acc_availability, ACC_TYPE " _
        & " from dbo.docugate_acc_view where acc_badge='" & Me.txt_Badge & "'", gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = True Then
        MsgBox "Invalid Badge/ID!", vbExclamation + vbOKOnly, "Invalid"
        Call SetButtons(False)
        Exit Sub
    End If
    AccStatus = uct(rs!acc_availability)
    RunningBalance = numchk(rs!acc_funds)
    m_Acctype = uct(rs!ACC_TYPE)
    
    rs.Close
    
    '// Attempt to fetch the most recent check out transaction
    rs.Open "SELECT * FROM dbo.docugate_tran_acc_funds " _
        & " WHERE ACC_TRAN_RECEIPT_NO = (SELECT MAX(RECEIPT_NO) FROM dbo.docugate_receipt_number " _
        & " WHERE RECEIPT_ACC_BADGE ='" & Me.txt_Badge & "'" _
        & " AND ACC_TRAN_TYPE = 'CHECKED OUT')", gConn, adOpenForwardOnly, adLockReadOnly
   
    If gObjAccountMngr.CashierInstruction = gcCashOUT Then
        Me.cmd_PrintReceipt.Visible = False
        
        '// show the fund balance as it is on the accounts table
        Me.txt_ACC_FUNDS = "$" & Format(gObjAccountMngr.mFunds, "0.00")

        If rs.EOF = False Then
            If AccStatus = "2" Then
                MsgBox "This card is currently checked out!", vbExclamation, "Error"
                Me.cmd_CheckOut.Enabled = False
                gReceiptNo = rs!ACC_TRAN_RECEIPT_NO
                txt_DT_CHKOUT = rs!ACC_TRAN_DT
                txt_CHKOUT_CASHIER_NAME = rs!ACC_TRAN_DOER_FULLNAME
                OpenBal = rs!ACC_TRAN_FUND_OPEN_BAL
                
                '//Get the total sum of activities for this card since the date it was last checked out
                mJobCost = numchk(GetSQLValue("SELECT dbo.udf_GetTranTotal('" & Me.txt_Badge & "','" & gReceiptNo & "')"))
                
                mRefund = OpenBal - mJobCost
                Me.txt_TOTAL_TRAN_AMT = Format(mJobCost, "0.00")
                Me.txt_REFUND_REFUND_AMT = Format(mRefund, "0.00")
                Exit Sub
            End If
        End If
    
    ElseIf gObjAccountMngr.CashierInstruction = gcCashIN Then
    
        If rs.EOF = True Then
            MsgBox "This card has not been checked out!", vbExclamation, "Error"
            Me.cmd_CheckIn.Enabled = False
            Me.cmd_PrintReceipt.Enabled = False
            Exit Sub
        End If
        
        gReceiptNo = rs!ACC_TRAN_RECEIPT_NO
        '// show the fund balance as it WAS at the time of the check out, and NOT as it is currently on the accounts table
        '// because after the checkout, the auditor would have adjusted the ACC_FUNDS value on the accounts table by the
        '// JOBCOST field on the activity table.  We need to show the fund balance as a snapshot of how it was at the
        '// time of the checkout, before the cost of any activities affected its value.
        '//
        'lblFundBalanceDt.Caption = "as at the date checked out"
        'Me.txt_ACC_FUNDS = "$" & Format(rs!ACC_TRAN_FUND_OPEN_BAL, "0.00")
        '//
        '//31/03/2008 - rather show the running balance
        Me.txt_ACC_FUNDS = "$" & Format(RunningBalance, "0.00")
        
        
        txt_DT_CHKOUT = rs!ACC_TRAN_DT
        txt_CHKOUT_CASHIER_NAME = rs!ACC_TRAN_DOER_FULLNAME

        OpenBal = rs!ACC_TRAN_FUND_OPEN_BAL
        
        '//Get the total sum of activities for this card since the date it was last checked out
        mJobCost = numchk(GetSQLValue("SELECT dbo.udf_GetTranTotal('" & Me.txt_Badge & "','" & gReceiptNo & "')"))
            
        mRefund = OpenBal - mJobCost
        Me.txt_TOTAL_TRAN_AMT = Format(mJobCost, "0.00")
        Me.txt_REFUND_REFUND_AMT = Format(mRefund, "0.00")
        
        rs.Close
    End If
    
    Call SetButtons(True)
    Exit Sub
    
Err_Handler:
   If gObjAccountMngr.CashierInstruction = gcCashOUT Then
       MsgBox "002-" + gcOperCodeCheckOut + Err.Description, vbExclamation + vbOKOnly, "Error"
   ElseIf gObjAccountMngr.CashierInstruction = gcCashIN Then
       MsgBox "002-" + gcOperCodeCheckIn + Err.Description, vbExclamation + vbOKOnly, "Error"
   End If
   Unload Me
    
End Sub
