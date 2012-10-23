VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Begin VB.Form frm_OU_fund 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Fund OU Members"
   ClientHeight    =   7275
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6420
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7275
   ScaleWidth      =   6420
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer GridUpdate 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   120
      Top             =   6720
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
      Height          =   375
      Left            =   4920
      TabIndex        =   17
      Top             =   240
      Width           =   1455
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
      Height          =   375
      Left            =   4920
      TabIndex        =   16
      Top             =   720
      Width           =   1425
   End
   Begin VB.Frame Frame2 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   120
      TabIndex        =   15
      Top             =   120
      Width           =   4545
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   21
         Top             =   240
         Width           =   3135
         _Version        =   65536
         _ExtentX        =   5530
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
         Caption         =   "# of OU Members:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin VB.TextBox txt_PostBalance 
         BackColor       =   &H00C0FFFF&
         Height          =   285
         Left            =   3360
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   960
         Width           =   1095
      End
      Begin VB.TextBox txt_preBalance 
         BackColor       =   &H00C0FFFF&
         Height          =   285
         Left            =   3360
         Locked          =   -1  'True
         TabIndex        =   19
         Top             =   600
         Width           =   1095
      End
      Begin VB.TextBox txt_NoMembers 
         BackColor       =   &H00C0FFFF&
         Height          =   285
         Left            =   3360
         Locked          =   -1  'True
         TabIndex        =   18
         Top             =   240
         Width           =   1095
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   22
         Top             =   600
         Width           =   3135
         _Version        =   65536
         _ExtentX        =   5530
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
         Caption         =   "Members Balance Pre transaction :"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   23
         Top             =   960
         Width           =   3135
         _Version        =   65536
         _ExtentX        =   5530
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
         Caption         =   "Members Balance Post transaction :"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
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
      Left            =   5040
      TabIndex        =   13
      Top             =   6750
      Width           =   1215
   End
   Begin VB.Frame Frame1 
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
      TabIndex        =   12
      Top             =   3960
      Width           =   6110
      Begin VB.TextBox txt_transdesc 
         BackColor       =   &H80000011&
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
         Height          =   330
         Left            =   2265
         TabIndex        =   26
         Top             =   360
         Width           =   3720
      End
      Begin VB.CheckBox chk_enableTransDesc 
         Height          =   255
         Left            =   1920
         TabIndex        =   25
         Top             =   390
         Width           =   270
      End
      Begin VB.TextBox txt_Amount 
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
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   14
         Text            =   "0.00"
         Top             =   360
         Width           =   1485
      End
   End
   Begin VB.Frame Cash_Frame 
      Height          =   1750
      Left            =   120
      TabIndex        =   0
      Top             =   4920
      Width           =   6105
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
         TabIndex        =   11
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
         TabIndex        =   10
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
         TabIndex        =   9
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
         TabIndex        =   8
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
         TabIndex        =   7
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
         TabIndex        =   6
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
         TabIndex        =   5
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
         TabIndex        =   4
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
         TabIndex        =   3
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
         TabIndex        =   2
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
         TabIndex        =   1
         Top             =   240
         Width           =   795
      End
   End
   Begin vbAcceleratorGrid6.vbalGrid oumembersgrid 
      Height          =   2310
      Left            =   120
      TabIndex        =   24
      Top             =   1545
      Width           =   6120
      _ExtentX        =   10795
      _ExtentY        =   4075
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
Attribute VB_Name = "frm_OU_fund"
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

Private RunningTotal As Single
Public ouguid As String

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
    
    txt_Amount = "$" & Format(RunningTotal, "0.00")

End Sub

Private Sub chk_enableTransDesc_Click()
If (chk_enableTransDesc.Value = 1) Then
    txt_transdesc.Enabled = True
    txt_transdesc.BackColor = &H8000000E
    txt_transdesc.SetFocus
Else
    txt_transdesc.Text = ""
    txt_transdesc.Enabled = False
    txt_transdesc.BackColor = &H80000011
End If
    
End Sub

Private Sub Cmd_Close_Click()
Unload Me
End Sub

Private Sub cmdCredit_Click()
 
   On Error GoTo handler
 
   If (RunningTotal = 0) Then
         Exit Sub
     End If
   
 Dim m_SQL As String
 m_SQL = "UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = ACC_FUNDS + " & Format(RunningTotal, "0.00") & " WHERE ACC_OU_GUID = '" & ouguid & "'"
 If (RunSQL(m_SQL) = True) Then
     m_SQL = "SELECT sum(ACC_FUNDS) FROM DOCUGATE_GENERAL_ACC WHERE ACC_OU_GUID = '" & ouguid & "'"
     txt_PostBalance = "$" & Format(GetSQLValue(m_SQL), "0.00")
 End If
    
    Dim Amount As String
    Dim Accguid As String
    Dim a As Integer
    Call Mod_SecondaryGrid.GridOUPopuplate(Me.oumembersgrid, ouguid)
    
    For a = 1 To oumembersgrid.Rows
         Amount = FormatCurrency(txt_Amount, 2, True, False, True)
         Accguid = oumembersgrid.CellText(a, 1)
         Call gObjAccountMngr.AddCashierJournel(Amount, Accguid, Me.txt_transdesc, "OU CREDIT")
    Next a
    
handler:
  If (Err.Number <> 0) Then
      MsgBox (Err.Description)
      Err.Clear
  End If
    
End Sub

Private Sub cmdDebit_Click()
   
   On Error GoTo handler
    
     If (RunningTotal = 0) Then
         Exit Sub
     End If
     
  Dim m_SQL As String
  m_SQL = "UPDATE DOCUGATE_GENERAL_ACC SET ACC_FUNDS = ACC_FUNDS - " & Format(RunningTotal, "0.00") & " WHERE ACC_OU_GUID = '" & ouguid & "'"
  If (RunSQL(m_SQL) = True) Then
     m_SQL = "SELECT sum(ACC_FUNDS) FROM DOCUGATE_GENERAL_ACC WHERE ACC_OU_GUID = '" & ouguid & "'"
     txt_PostBalance = "$" & Format(GetSQLValue(m_SQL), "0.00")
 End If
  Call Mod_SecondaryGrid.GridOUPopuplate(Me.oumembersgrid, ouguid)

    Dim Amount As String
    Dim Accguid As String
    Dim a As Integer
  
  For a = 1 To oumembersgrid.Rows
         Amount = FormatCurrency(txt_Amount, 2, True, False, True)
         Accguid = oumembersgrid.CellText(a, 1)
         Call gObjAccountMngr.AddCashierJournel(Amount, Accguid, Me.txt_transdesc, "OU DEBIT")
    Next a
  
handler:
  If (Err.Number <> 0) Then
      MsgBox (Err.Description)
      Err.Clear
  End If
  

End Sub

Private Sub cmdReset_Click()
    RunningTotal = 0#
    txt_Amount = FormatCurrency(RunningTotal, 2, True, False, True)
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    RunningTotal = 0#
    txt_Amount = "$" & Format(RunningTotal, "0.00")
    GridUpdate.Enabled = True
    
End Sub

Private Sub GridUpdate_Timer()
    GridUpdate.Enabled = False
    Call Mod_SecondaryGrid.GridOUSetUp(Me.oumembersgrid)
    Call Mod_SecondaryGrid.GridOUPopuplate(Me.oumembersgrid, ouguid)
End Sub
