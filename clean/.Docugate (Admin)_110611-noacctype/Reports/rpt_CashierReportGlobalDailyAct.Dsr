VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_CashierReportGlobalDailyAct 
   Caption         =   "DocuGate - rpt_CashierReportGlobalDailyAct (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   18405
   Icon            =   "rpt_CashierReportGlobalDailyAct.dsx":0000
   _ExtentX        =   32464
   _ExtentY        =   18494
   SectionData     =   "rpt_CashierReportGlobalDailyAct.dsx":5872
End
Attribute VB_Name = "rpt_CashierReportGlobalDailyAct"
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
Dim rs As New ADODB.Recordset
Dim PrevControlChk As String
Const cwidth = 32

Private Sub ActiveReport_Initialize()

    Me.WindowState = 2
    Me.Caption = "DETAILED " & gClsReports.ReportTitle
    If gDevMode = True Then
        Me.txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") " & Me.Name
    Else
        txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") "
    End If
    
    Me.txtAppInfo.Text = gAppVersion
    Me.txtTitle.Text = "DETAILED " & gClsReports.ReportTitle & Chr(10) & Space(10) & uct(gClsReports.DateFilterTitle)
    
End Sub

Private Sub ActiveReport_ReportEnd()
    rs.Close
End Sub

Private Sub ActiveReport_ReportStart()

On Error GoTo Err_Handler
    DoEvents

    rs.Open gClsReports.ReportSQL, gConn, adOpenForwardOnly, adLockReadOnly
    
    If rs.EOF = False Then
        Me.GroupHeader1.GroupValue = Format(rs!TRANDATE, "MM/DD/YYYY")
        PrevControlChk = Format(rs!TRANDATE, "MM/DD/YYYY")
        
        Me.txtGRDebit.Tag = 0
        txtGRDebit.Text = "$" & Format(Me.txtGRDebit.Tag, "#,##0.00")
        
        Me.txtGRCredit.Tag = 0
        txtGRCredit.Text = "$" & Format(Me.txtGRCredit.Tag, "#,##0.00")
        
        Me.txtGRANDDebit.Tag = 0
        txtGRANDDebit.Text = "$" & Format(Me.txtGRANDDebit.Tag, "#,##0.00")
        
        Me.txtGRANDCredit.Tag = 0
        txtGRANDCredit.Text = "$" & Format(Me.txtGRANDCredit.Tag, "#,##0.00")
        
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub Detail_AfterPrint()
    If rs.EOF = True Then Exit Sub
    GroupHeader1.GroupValue = Format(rs!TRANDATE, "MM/DD/YYYY")
    'Me.txtControlChk.Text = Format(rs!TRANDATE, "MM/DD/YYYY")
End Sub

Private Sub Detail_BeforePrint()
    If rs.EOF = True Then Exit Sub
    If PrevControlChk <> Format(rs!TRANDATE, "MM/DD/YYYY") Then
        PrevControlChk = Format(rs!TRANDATE, "MM/DD/YYYY")
    End If
End Sub

Private Sub GroupHeader1_Format()
    If rs.EOF = False Then
        Me.txtGRDebit.Tag = 0
        txtGRDebit.Text = "$" & Format(Me.txtGRDebit.Tag, "#,##0.00")
        
        Me.txtGRCredit.Tag = 0
        txtGRCredit.Text = "$" & Format(Me.txtGRCredit.Tag, "#,##0.00")
   
        Me.txtGroupFooter.Text = UCase("TOTAL FOR " & GroupHeader1.GroupValue & Space(1))
        GroupHeader1.PrintSection
    End If
End Sub

Private Sub Detail_Format()

On Error GoTo Err_Handler
    
    If rs.EOF = False Then
        Me.txtAcc = rs!acc_badge
        Me.txtAccName = Space(1) & rs!ACC_FULLNAME
        Me.txtOU = Space(1) & rs!OU_NAME
        Me.txtType = rs!TRANTYPE
                
        'If rs!TRANTYPE = "SALE" Then
        '    Me.txtDtTran = "OUT: " & Format(rs!DT_CHKOUT, "mm/dd/yyyy hh:mm")
        '    Me.txtCashierOut = space(1) & "OUT: " & Mid(nchk(Trim(rs!CHKOUT_CASHIER_NAME)), 1, cwidth)
        '    If Not IsNull(rs!DT_CHKIN) Then
        '        Me.txtDtTran = Me.txtDtTran.Text & vbCrLf & "IN: " & Format(rs!DT_CHKIN, "mm/dd/yyyy hh:mm")
        '        Me.txtCashierOut.Text = Me.txtCashierOut.Text & vbCrLf & "  IN: " _
        '            & Mid(nchk(Trim(rs!CHKOUT_CASHIER_NAME)), 1, cwidth)
        '    End If
        'Else
            Me.txtDtTran = Format(rs!ACC_TRAN_DT, "mm/dd/yyyy hh:mm")
            Me.txtCashierOut = Space(1) & Space(1) & Mid(nchk(Trim(rs!CASHIER_NAME)), 1, cwidth)
            Me.txtCashierBadge.Text = LTrim(Trim(rs!CASHIER_BADGE))
        'End If
        
        '//Me.txtOpenBal = "$" & Format(rs!ACC_OPENING_FUNDBAL, "#,##0.00")
        
        '--
        Dim DebitAmt As Double
        Dim CreditAmt As Double
    
        DebitAmt = Abs(rs!DEBIT_SALE)
        CreditAmt = Abs(rs!CREDIT_SALE)
          
        Me.txtDebit = "$" & Format(DebitAmt, "#,##0.00")
        Me.txtCredit = "$" & Format(CreditAmt, "#,##0.00")
        '--
        Me.txtGRDebit.Tag = Val(txtGRDebit.Tag) + DebitAmt
        txtGRDebit.Text = "$" & Format(Me.txtGRDebit.Tag, "#,##0.00")
        
        Me.txtGRCredit.Tag = Val(txtGRCredit.Tag) + CreditAmt
        txtGRCredit.Text = "$" & Format(Me.txtGRCredit.Tag, "#,##0.00")
        
        '--
        Me.txtGRANDDebit.Tag = Val(txtGRANDDebit.Tag) + DebitAmt
        txtGRANDDebit.Text = "$" & Format(Me.txtGRANDDebit.Tag, "#,##0.00")
        
        Me.txtGRANDCredit.Tag = Val(txtGRANDCredit.Tag) + CreditAmt
        txtGRANDCredit.Text = "$" & Format(Me.txtGRANDCredit.Tag, "#,##0.00")
        
        Me.Detail.PrintSection
        rs.MoveNext
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub ReportHeader_Format()
    Me.lblReportDt.Caption = Format(Now(), "mm/dd/yyyy hh:mm")
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub

