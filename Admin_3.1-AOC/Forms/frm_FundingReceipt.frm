VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_FundingReceipt 
   Appearance      =   0  'Flat
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   14415
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11775
   Icon            =   "frm_FundingReceipt.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   14415
   ScaleWidth      =   11775
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin SCLABELLib.SCLabel lbl_AccountName 
      Height          =   255
      Left            =   4680
      TabIndex        =   1
      Top             =   1440
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_CurBalance 
      Height          =   375
      Left            =   2520
      TabIndex        =   2
      Top             =   1920
      Width           =   1695
      _Version        =   65536
      _ExtentX        =   2990
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Account Balance:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_Account 
      Height          =   255
      Left            =   2520
      TabIndex        =   3
      Top             =   1440
      Width           =   1695
      _Version        =   65536
      _ExtentX        =   2990
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Account Name:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_curbalance 
      Height          =   255
      Left            =   4680
      TabIndex        =   4
      Top             =   1920
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_FinalBalance 
      Height          =   375
      Left            =   2760
      TabIndex        =   5
      Top             =   4080
      Width           =   2535
      _Version        =   65536
      _ExtentX        =   4471
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Final Balance:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_Balance 
      Height          =   375
      Left            =   2760
      TabIndex        =   6
      Top             =   3120
      Width           =   2535
      _Version        =   65536
      _ExtentX        =   4471
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Beginning Balance:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_TransAmount 
      Height          =   375
      Left            =   2760
      TabIndex        =   7
      Top             =   3600
      Width           =   2535
      _Version        =   65536
      _ExtentX        =   4471
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Transaction Amount:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_BeginBalance 
      Height          =   255
      Left            =   5640
      TabIndex        =   8
      Top             =   3120
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_TransAmount 
      Height          =   255
      Left            =   5640
      TabIndex        =   9
      Top             =   3600
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_FinalBalance 
      Height          =   255
      Left            =   5640
      TabIndex        =   10
      Top             =   4080
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_TransDate 
      Height          =   375
      Left            =   2760
      TabIndex        =   11
      Top             =   5280
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Transaction Date - "
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel2 
      Height          =   375
      Left            =   2760
      TabIndex        =   12
      Top             =   5760
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Transaction Time - "
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel3 
      Height          =   375
      Left            =   2760
      TabIndex        =   13
      Top             =   6240
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Cashier Name:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transDate 
      Height          =   255
      Left            =   5640
      TabIndex        =   14
      Top             =   5280
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "lbl_transDate"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transTime 
      Height          =   255
      Left            =   5640
      TabIndex        =   15
      Top             =   5760
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "lbl_transTime"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_Cashier 
      Height          =   255
      Left            =   5640
      TabIndex        =   16
      Top             =   6240
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Lbl_Cashier"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transdetails 
      Height          =   255
      Left            =   3360
      TabIndex        =   17
      Top             =   4800
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.01
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel15 
      Height          =   255
      Left            =   2520
      TabIndex        =   18
      Top             =   8520
      Width           =   1695
      _Version        =   65536
      _ExtentX        =   2990
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Account Name:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel14 
      Height          =   375
      Left            =   2520
      TabIndex        =   19
      Top             =   9000
      Width           =   1695
      _Version        =   65536
      _ExtentX        =   2990
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Account Balance:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_accountname2 
      Height          =   255
      Left            =   4800
      TabIndex        =   20
      Top             =   8520
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "lbl_AccountName2"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_curBalance2 
      Height          =   255
      Left            =   4800
      TabIndex        =   21
      Top             =   9000
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "lbl_AccountBalance2"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel10 
      Height          =   375
      Left            =   2760
      TabIndex        =   22
      Top             =   11160
      Width           =   2535
      _Version        =   65536
      _ExtentX        =   4471
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Final Balance:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel11 
      Height          =   375
      Left            =   2760
      TabIndex        =   23
      Top             =   10200
      Width           =   2535
      _Version        =   65536
      _ExtentX        =   4471
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Beginning Balance:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel12 
      Height          =   375
      Left            =   2760
      TabIndex        =   24
      Top             =   10680
      Width           =   2535
      _Version        =   65536
      _ExtentX        =   4471
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Transaction Amount:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_BeginBalance2 
      Height          =   255
      Left            =   5640
      TabIndex        =   25
      Top             =   10200
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   "lbl_BeginBalance2"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transamount2 
      Height          =   255
      Left            =   5640
      TabIndex        =   26
      Top             =   10680
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   "lbl_transamount2"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_finalBalance2 
      Height          =   255
      Left            =   5640
      TabIndex        =   27
      Top             =   11160
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   "lbl_finalBalance2"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transaction 
      Height          =   255
      Left            =   3360
      TabIndex        =   28
      Top             =   2520
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.01
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transaction2 
      Height          =   255
      Left            =   3480
      TabIndex        =   29
      Top             =   9600
      Width           =   5295
      _Version        =   65536
      _ExtentX        =   9340
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel5 
      Height          =   375
      Left            =   2760
      TabIndex        =   30
      Top             =   12360
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Transaction Date - "
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel6 
      Height          =   375
      Left            =   2760
      TabIndex        =   31
      Top             =   12840
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Transaction Time - "
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel SCLabel8 
      Height          =   375
      Left            =   2760
      TabIndex        =   32
      Top             =   13320
      Width           =   1815
      _Version        =   65536
      _ExtentX        =   3201
      _ExtentY        =   661
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Cashier Name:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transDate2 
      Height          =   255
      Left            =   5640
      TabIndex        =   33
      Top             =   12360
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   "lbl_transDate"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transTime2 
      Height          =   255
      Left            =   5640
      TabIndex        =   34
      Top             =   12840
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   "lbl_transTime"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel Lbl_Cashier2 
      Height          =   255
      Left            =   5640
      TabIndex        =   35
      Top             =   13320
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   "Lbl_Cashier"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lbl_transdetails2 
      Height          =   255
      Left            =   3360
      TabIndex        =   36
      Top             =   11880
      Width           =   5775
      _Version        =   65536
      _ExtentX        =   10186
      _ExtentY        =   450
      _StockProps     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Comic Sans MS"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin VB.Image Image2 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   1155
      Left            =   2520
      Picture         =   "frm_FundingReceipt.frx":08CA
      Top             =   7200
      Width           =   7635
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   1155
      Left            =   2400
      Picture         =   "frm_FundingReceipt.frx":A1E0
      Top             =   120
      Width           =   7635
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "_________________________________________________________________________________________________________________________________"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   6840
      Width           =   11535
   End
End
Attribute VB_Name = "frm_FundingReceipt"
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

    Dim cmd As ADODB.Command
    Dim ParamRetVal As ADODB.Parameter
    Dim ParamAccBadge As ADODB.Parameter
    Dim ParamCashierBadge As ADODB.Parameter
    Dim ParamCashierFull As ADODB.Parameter
    Dim ParamAmtAdjustment As ADODB.Parameter
    Dim Dt As Variant

Private Sub Form_Load()

     On Error GoTo handler
     
     Dim test As String
     
        
     test = Dir$(App.Path & "\receiptHeader.bmp")
     
     If (Len(test) > 0) Then
        Image1.Picture = LoadPicture(App.Path & "\receiptHeader.bmp")
        Image2.Picture = LoadPicture(App.Path & "\receiptHeader.bmp")
    Else
        Image1.Picture = Nothing
        Image2.Picture = Nothing
    End If
    
            
    Me.Caption = "Account Funding Receipt"
    
    lbl_AccountName.Caption = gObjAccountMngr.mFirstname & " " & "," & " " & gObjAccountMngr.mLastname
    Me.lbl_accountname2.Caption = gObjAccountMngr.mFirstname & " " & "," & " " & gObjAccountMngr.mLastname
    Me.lbl_curbalance.Caption = "$" & Format(gObjAccountMngr.mFunds, "0.00")
    lbl_curBalance2.Caption = "$" & Format(gObjAccountMngr.mFunds, "0.00")
        
    '09122008 - setup the transaction detial section for the receipt
    'need lable for the beinning balance
    lbl_BeginBalance.Caption = Frm_ACCOUNT_fund.txt_BeginningBalance
    lbl_BeginBalance2.Caption = Frm_ACCOUNT_fund.txt_BeginningBalance
    lbl_TransAmount.Caption = Format(Frm_ACCOUNT_fund.txt_TransAmount, "Currency")
    lbl_transamount2.Caption = Format(Frm_ACCOUNT_fund.txt_TransAmount, "Currency")
    lbl_FinalBalance.Caption = "$" & Format(gObjAccountMngr.mFunds, "0.00")
    lbl_finalBalance2.Caption = "$" & Format(gObjAccountMngr.mFunds, "0.00")
    
    
    lbl_transaction.Caption = Frm_ACCOUNT_fund.scl_ActivityType.Caption
    lbl_transaction2.Caption = Frm_ACCOUNT_fund.scl_ActivityType.Caption
    
    
    lbl_transdetails.Caption = "The time and date of this transaction was as follows:"
    lbl_transdetails2.Caption = "The time and date of this transaction was as follows:"
    lbl_transDate.Caption = Format(Now, "dd-MMM-yyyy")
    lbl_transDate2.Caption = Format(Now, "dd-MMM-yyyy")
    lbl_transTime.Caption = Format(Now, "Long Time")
    lbl_transTime2.Caption = Format(Now, "Long Time")
    lbl_Cashier.Caption = gObjLogonMngr.mFullname
    Lbl_Cashier2.Caption = gObjLogonMngr.mFullname
       
    
handler:
    If (Err.Number <> 0) Then
        MsgBox ("Receipt failed to print (" & Err.Description & ")")
    End If
    
End Sub



