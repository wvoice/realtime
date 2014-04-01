VERSION 5.00
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Begin VB.Form Frm_TransactionCodes 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Transaction Codes:"
   ClientHeight    =   5205
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5850
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5205
   ScaleWidth      =   5850
   ShowInTaskbar   =   0   'False
   Begin vbAcceleratorGrid6.vbalGrid mGridsystem 
      Height          =   1335
      Left            =   240
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   120
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   2355
      BackgroundPictureHeight=   0
      BackgroundPictureWidth=   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DisableIcons    =   -1  'True
   End
   Begin vbAcceleratorGrid6.vbalGrid mGrid 
      Height          =   3135
      Left            =   240
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   1560
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   5530
      MultiSelect     =   -1  'True
      BackgroundPictureHeight=   0
      BackgroundPictureWidth=   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderStyle     =   2
      ScrollBarStyle  =   1
      DisableIcons    =   -1  'True
   End
End
Attribute VB_Name = "Frm_TransactionCodes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private objTransactionCodes As obj_TransactionCodes

Private Sub Form_Load()
     
     Set objTransactionCodes = New obj_TransactionCodes
     Call CentreForm(Me)
     Me.Caption = "DocuGate - Transaction Codes"
     
     With mGrid
      .Redraw = False
      .AddColumn "CODE", "Code", ecgHdrTextALignLeft
      .AddColumn "REASON", "Reason", ecgHdrTextALignLeft
      .Redraw = True
    End With
   
     With mGridsystem
      .Redraw = False
      .AddColumn "CODE", "Code", ecgHdrTextALignLeft
      .AddColumn "REASON", "Reason", ecgHdrTextALignLeft
      .Redraw = True
    End With
       
    With mGridsystem
        .AddRow
        .CellDetails .Rows, 1, "00000"
        .CellDetails .Rows, 2, "Unspecified"
    End With
    
    With mGridsystem
        .AddRow
        .CellDetails .Rows, 1, "00001"
        .CellDetails .Rows, 2, "Standard Debit"
    End With
    
    With mGridsystem
        .AddRow
        .CellDetails .Rows, 1, "00002"
        .CellDetails .Rows, 2, "Standard Credit"
    End With
  
   
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Set objTransactionCodes = Nothing
End Sub
