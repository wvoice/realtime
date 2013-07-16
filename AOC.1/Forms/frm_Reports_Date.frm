VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form frm_Reports_Date 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Reports Date Selection"
   ClientHeight    =   6645
   ClientLeft      =   5460
   ClientTop       =   2535
   ClientWidth     =   10575
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_Reports_Date.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6645
   ScaleWidth      =   10575
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Level of Detail:"
      Height          =   2415
      Left            =   240
      TabIndex        =   15
      Top             =   3120
      Width           =   8655
      Begin VB.CommandButton cmd_Deselect 
         Caption         =   "<"
         Height          =   375
         Left            =   5160
         TabIndex        =   20
         Top             =   1320
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.CommandButton cmd_Select 
         Caption         =   ">"
         Height          =   375
         Left            =   5160
         TabIndex        =   19
         Top             =   960
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.TextBox list_SelectedCashiers 
         Height          =   1455
         Left            =   6000
         TabIndex        =   18
         Text            =   "Sorted Names"
         Top             =   720
         Visible         =   0   'False
         Width           =   2295
      End
      Begin VB.ListBox list_CashierFilter 
         Height          =   1410
         Left            =   2880
         TabIndex        =   17
         Top             =   720
         Visible         =   0   'False
         Width           =   2175
      End
      Begin VB.CheckBox chk_CashierFilter 
         Caption         =   "Sub-Filter by Cashier"
         Height          =   255
         Left            =   480
         TabIndex        =   16
         Top             =   720
         Width           =   2055
      End
      Begin VB.OptionButton optDetail 
         Caption         =   "Totals (Summarized)"
         Height          =   255
         Index           =   0
         Left            =   480
         TabIndex        =   9
         Top             =   360
         Value           =   -1  'True
         Width           =   2175
      End
      Begin VB.OptionButton optDetail 
         Caption         =   "Detail Transactions"
         Height          =   255
         Index           =   1
         Left            =   3000
         TabIndex        =   10
         Top             =   360
         Width           =   2175
      End
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Next"
      Default         =   -1  'True
      Height          =   375
      Left            =   4680
      TabIndex        =   11
      Top             =   5760
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   12
      Top             =   5760
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Filter on date range, all activites which:"
      Height          =   2895
      Left            =   240
      TabIndex        =   13
      Top             =   120
      Width           =   8655
      Begin VB.OptionButton optDates 
         Caption         =   "Occurred on the date:"
         Height          =   255
         Index           =   3
         Left            =   360
         TabIndex        =   7
         Top             =   2280
         Width           =   2535
      End
      Begin VB.OptionButton optDates 
         Caption         =   "Occurred before and including:"
         Height          =   255
         Index           =   2
         Left            =   360
         TabIndex        =   5
         Top             =   1800
         Width           =   2895
      End
      Begin VB.OptionButton optDates 
         Caption         =   "Occurred after and including:"
         Height          =   255
         Index           =   1
         Left            =   360
         TabIndex        =   3
         Top             =   1320
         Width           =   2775
      End
      Begin VB.OptionButton optDates 
         Caption         =   "Occurred between:"
         Height          =   255
         Index           =   0
         Left            =   360
         TabIndex        =   0
         Top             =   480
         Value           =   -1  'True
         Width           =   2175
      End
      Begin MSComCtl2.DTPicker dtDate 
         Height          =   330
         Index           =   0
         Left            =   1320
         TabIndex        =   1
         Top             =   840
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   582
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CheckBox        =   -1  'True
         DateIsNull      =   -1  'True
         Format          =   61603841
         CurrentDate     =   39480
      End
      Begin MSComCtl2.DTPicker dtDateEnd 
         Height          =   330
         Left            =   3600
         TabIndex        =   2
         Top             =   840
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   582
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CheckBox        =   -1  'True
         CustomFormat    =   "mm/dd/yyyy"
         DateIsNull      =   -1  'True
         Format          =   61603841
         CurrentDate     =   39475
      End
      Begin MSComCtl2.DTPicker dtDate 
         Height          =   330
         Index           =   1
         Left            =   3600
         TabIndex        =   4
         Top             =   1320
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   582
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CheckBox        =   -1  'True
         DateIsNull      =   -1  'True
         Format          =   61603841
         CurrentDate     =   39475
      End
      Begin MSComCtl2.DTPicker dtDate 
         Height          =   330
         Index           =   2
         Left            =   3600
         TabIndex        =   6
         Top             =   1800
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   582
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CheckBox        =   -1  'True
         CustomFormat    =   "mm/dd/yyyy"
         DateIsNull      =   -1  'True
         Format          =   61603841
         CurrentDate     =   39475
      End
      Begin MSComCtl2.DTPicker dtDate 
         Height          =   330
         Index           =   3
         Left            =   3600
         TabIndex        =   8
         Top             =   2280
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   582
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "mm/dd/yyyy"
         DateIsNull      =   -1  'True
         Format          =   61603841
         CurrentDate     =   39475
      End
      Begin VB.Label Label1 
         Caption         =   "and"
         Height          =   255
         Left            =   3120
         TabIndex        =   14
         Top             =   840
         Width           =   375
      End
   End
End
Attribute VB_Name = "frm_Reports_Date"
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

Private m_FormLoaded As Boolean


Private Sub chk_CashierFilter_Click() 'Added 7/15/13 by Mike so that we can sub-filter by Cashier name
On Error GoTo Err_Handler
    
    If chk_CashierFilter.Value = 1 Then
    list_CashierFilter.Visible = True
    list_SelectedCashiers.Visible = True
    cmd_Select.Visible = True
    cmd_Deselect.Visible = True
    'Need to get all cashier names and load the combo box
    Call Mod_Data.LoadComboFromSQL("select ACC_FULLNAME from docugate_general_acc where ACC_ACCESS_LEVEL=2", list_CashierFilter)
        
    Else
        list_CashierFilter.Visible = False
        list_SelectedCashiers.Visible = False
        cmd_Select.Visible = False
        cmd_Deselect.Visible = False
        
    End If
    
    If m_FormLoaded = True Then Me.list_CashierFilter.SetFocus
    Dim i As Integer

    For i = 1 To 2
        Me.list_CashierFilter.Selected(i) = True
    Next i
    Exit Sub
Err_Handler:
End Sub
Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()
    
    Dim i As Integer
    
    If Me.optDates(0).Value = True Then
        If IsNull(Me.dtDate(i).Value) Then
            MsgBox "Specify the start date!", vbExclamation + vbOKOnly, "Missing"
            Exit Sub
        End If
        If IsNull(Me.dtDateEnd.Value) Then
            MsgBox "Specify the end date!", vbExclamation + vbOKOnly, "Missing"
            Exit Sub
        End If
    End If
        
    For i = 1 To 3
        If Me.optDates(i).Value = True Then
            If IsNull(Me.dtDate(i).Value) Then
                MsgBox "Specify the date!", vbExclamation + vbOKOnly, "Missing"
                Exit Sub
            End If
        End If
    Next i

    If Me.optDates(0).Value = True Then
       gClsReports.DateFilter = "DATEDIFF(DAY," & gClsReports.DateField & "," & SQLDateStart(Me.dtDate(0).Value) & ") <= 0" _
        & " AND DATEDIFF(DAY," & gClsReports.DateField & "," & SQLDateEnd(Me.dtDateEnd) & ") >= 0"
       gClsReports.DateFilterTitle = "between " & Format(Me.dtDate(0).Value, "mm/dd/yyyy") _
        & " and " & Format(Me.dtDateEnd.Value, "mm/dd/yyyy")
       
    ElseIf Me.optDates(1).Value = True Then
       gClsReports.DateFilter = "DATEDIFF(DAY," & gClsReports.DateField & "," & SQLDateStart(Me.dtDate(1).Value) & ") <= 0"
       gClsReports.DateFilterTitle = "after and including " & Format(Me.dtDate(1).Value, "mm/dd/yyyy")
       
    ElseIf Me.optDates(2).Value = True Then
       gClsReports.DateFilter = "DATEDIFF(DAY," & gClsReports.DateField & "," & SQLDateEnd(Me.dtDate(2).Value) & ") >= 0"
       gClsReports.DateFilterTitle = "before and including " & Format(Me.dtDate(2).Value, "mm/dd/yyyy")
       
    ElseIf Me.optDates(3).Value = True Then
       gClsReports.DateFilter = "DATEDIFF(DAY," & gClsReports.DateField & "," & SQLDate(Me.dtDate(3).Value) & ") = 0"
       gClsReports.DateFilterTitle = "as at " & Format(Me.dtDate(3).Value, "mm/dd/yyyy")
    End If
        
    If Me.optDetail(0).Value = True Then
        gClsReports.DetailLevel = 0
    Else
        gClsReports.DetailLevel = 1
    End If
    

    
    gClsReports.CancelledPressed = False
    Unload Me
    
End Sub

Private Sub dtDate_Change(Index As Integer)
    Me.optDates(Index).Value = 1
End Sub

Private Sub optDates_Click(Index As Integer)
    If optDates(0).Value = True Then
        Me.dtDate(0).Value = GetDefaultStartDate()
        dtDateEnd.Value = Date
        Me.dtDate(1).Value = Null
        Me.dtDate(2).Value = Null
        Me.dtDate(3).Value = Null
        
    ElseIf optDates(1).Value = True Then
        Me.dtDate(1).Value = GetDefaultStartDate()
        dtDateEnd.Value = Null
        Me.dtDate(0).Value = Null
        Me.dtDate(2).Value = Null
        Me.dtDate(3).Value = Null
        
    ElseIf optDates(2).Value = True Then
        Me.dtDate(2).Value = GetDefaultStartDate()
        dtDateEnd.Value = Null
        Me.dtDate(0).Value = Null
        Me.dtDate(1).Value = Null
        Me.dtDate(3).Value = Null
        
    ElseIf optDates(3).Value = True Then
        Me.dtDate(3).Value = GetDefaultStartDate()
        dtDateEnd.Value = Null
        Me.dtDate(0).Value = Null
        Me.dtDate(1).Value = Null
        Me.dtDate(2).Value = Null
    End If
End Sub

Private Sub dtDate_CloseUp(Index As Integer)
    Me.optDates(Index).Value = True
End Sub

Private Sub dtDateEnd_Change()
    Me.optDates(0).Value = True
End Sub

Private Sub dtDateEnd_CloseUp()
    Me.optDates(0).Value = True
End Sub

Private Function GetDefaultStartDate() As Variant
    GetDefaultStartDate = DateSerial(Year(Date), Month(Date), 1)
End Function

Private Sub Form_Load()
    Call CentreForm(Me)
    gClsReports.CancelledPressed = True
    
    Dim Dt As Variant
    Dt = GetDefaultStartDate()
    Me.dtDate(0).Value = DateSerial(Year(Dt), Month(Dt), 1)
    Me.dtDateEnd.Value = Date
    
    If Me.optDates(0).Value = False Then
        Me.dtDate(0).Value = Null
        Me.dtDateEnd.Value = Null
    End If
    
'// Added 06042009
'   Added to only allow detailed transaction history reports {ReportID 14}
    If gClsReports.ReportId = 14 Then
        Me.optDetail(0).Enabled = False
        Me.optDetail(1).Value = True
    Else
        Me.optDetail(0).Enabled = True
    End If
' finished new code section
    
    
    'If gDevMode = True Then
    '    Me.dtDate(0).Value = DateSerial(2007, 12, 1)
    '    Me.dtDateEnd.Value = DateSerial(2007, 12, 31)
    'End If
End Sub

Private Function SQLDateStart(DtValue As Date)
    SQLDateStart = "'" & Format(Year(DtValue), "0000") + "-" + Format(Month(DtValue), "00") + "-" + Format(Day(DtValue), "00") + " 00:00:00.000" & "'"
End Function

Private Function SQLDateEnd(DtValue As Date)
    'SQLDateEnd = "'" & Format(Year(DtValue), "0000") + "-" + Format(Month(DtValue), "00") + "-" & Format(Day(DtValue), "00") + " 23:59:59.999" & "'"
    SQLDateEnd = "'" & Format(Year(DtValue), "0000") + "-" _
        & Format(Month(DtValue), "00") + "-" & Format(Day(DtValue), "00") + " 00:00:00.000" & "'"
End Function


