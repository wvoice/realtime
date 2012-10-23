VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_Cashier_SalesReceipt 
   Caption         =   "rpt_Cashier_SalesReceipt (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   15360
   Icon            =   "rpt_Cashier_Receipt.dsx":0000
   _ExtentX        =   27093
   _ExtentY        =   18494
   SectionData     =   "rpt_Cashier_Receipt.dsx":5872
End
Attribute VB_Name = "rpt_Cashier_SalesReceipt"
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

Dim SysDate As Variant
Dim TranRs As New ADODB.Recordset
Dim UserAccBadge As String

Private Sub ActiveReport_Initialize()
    Me.WindowState = 2
    Me.Caption = UCase("Sales Receipt")
    Me.txtAppInfo.Text = gAppVersion
    txtDtReceiptPrint.Text = Format(Date, "mm/dd/yyyy") & " " & Format(Time, "hh:mm")
End Sub

Private Sub ActiveReport_ReportEnd()
    TranRs.Close
    Set TranRs = Nothing
End Sub

Private Sub ActiveReport_ReportStart()

On Error GoTo Err_Handler
    Me.lblReceipt.Caption = Format(gReceiptNo, "000000")
    
    Dim CheckedIn As Boolean
    TranRs.Open "Select * from docugate_receipt_number where Receipt_no = '" & gReceiptNo & "'", gConn, adOpenForwardOnly, adLockReadOnly
    If TranRs.EOF = True Then
        MsgBox "Receipt could not be located!", vbExclamation + vbOKOnly, "Error"
        Exit Sub
    Else
        UserAccBadge = TranRs!RECEIPT_ACC_BADGE
    End If
    TranRs.Close
    
    Me.txtRunningBalance.Text = "$" & Format(numchk(GetSQLValue("select ACC_FUNDS from docugate_general_acc " _
        & " where acc_badge='" & UserAccBadge & "'")), "#,##0.00")
    
    CheckedIn = False
    TranRs.Open "select * from docugate_tran_acc_funds where ACC_TRAN_RECEIPT_NO= " & gReceiptNo _
        & " AND ACC_TRAN_TYPE = 'CHECKED OUT'", gConn, adOpenForwardOnly, adLockReadOnly
    If TranRs.EOF = False Then
       Me.txtBadgeID = TranRs!ACC_TRAN_ACC_BADGE & " / " & TranRs!ACC_TRAN_ACC_FULLNAME
       Me.txtDateChkOut = Format(TranRs!ACC_TRAN_DT, "mm/dd/yyyy hh:mm")
       Me.txtChkOutBy = Space(2) & Trim(nchk(TranRs!ACC_TRAN_DOER_BADGE)) & " / " & Trim(nchk(TranRs!ACC_TRAN_DOER_FULLNAME))
       Me.txtFundBal = "$" & Format(numchk(TranRs!ACC_TRAN_FUND_OPEN_BAL), "#,##0.00")
    End If
    TranRs.Close
    
    '// get the check in details
    TranRs.Open "select * from docugate_tran_acc_funds where ACC_TRAN_RECEIPT_NO= " & gReceiptNo _
        & " AND ACC_TRAN_TYPE = 'CHECKED IN'", gConn, adOpenForwardOnly, adLockReadOnly
    If TranRs.EOF = False Then
        CheckedIn = True
        Me.txtDateChkIn = Format(TranRs!ACC_TRAN_DT, "mm/dd/yyyy hh:mm")
        Me.txtChkInBy = Space(2) & Trim(nchk(TranRs!ACC_TRAN_DOER_BADGE)) _
            & " / " & Trim(nchk(TranRs!ACC_TRAN_DOER_FULLNAME))
        Me.txtTotalSales = "$" & Format(numchk(TranRs!ACC_TRAN_AMT_DEBIT), "#,##0.00")
        '//Me.txtRefund = "$" & Format(numchk(TranRs!ACC_TRAN_AMT_CREDIT), "#,##0.00")
    Else
        '//Get the total sum of activities for this card since the date it was last checked out
        Me.txtTotalSales = "$" & Format(numchk(GetSQLValue("SELECT dbo.udf_GetTranTotal('" & UserAccBadge & "','" & gReceiptNo & "')")), "#,##0.00")
    End If
    TranRs.Close
    
    '// get the activities
    Dim sql As String
    sql = "SELECT Dt_Requested,  ComputerName, PrinterName, Copies, PageCount, JobCost " _
        & " FROM dbo.docugate_general_activity "
        
    '// when the transaction is checked in, the activities associated with this cashier tranaction
    '// is marked with the cashier tran guid, so that they excluded from any future billing
    '// and invoices.
    If CheckedIn = True Then
        sql = sql & " WHERE RECEIPT_NO = '" + gReceiptNo + "'"
    Else
    '// whilst the trasaction is still checked out, the invoice will show will activities
    '// for the ACC_BADGE user, which are not yet invoiced.
        sql = sql & " WHERE ACC_BADGE = '" & UserAccBadge & "' AND RECEIPT_NO IS NULL" _
            & " AND DT_REQUESTED >= " _
            & "(SELECT MAX(ACC_TRAN_DT) FROM dbo.docugate_tran_acc_funds " _
            & " WHERE ACC_TRAN_RECEIPT_NO = " & gReceiptNo _
            & " AND ACC_TRAN_ACC_BADGE = '" & UserAccBadge & "' AND ACC_TRAN_TYPE = 'CHECKED OUT')"
    End If
    
    sql = sql & " ORDER BY DT_REQUESTED, JOBTYPE, COMPUTERNAME, PRINTERNAME "

    If gDevMode = True Then
        Open gAppTraceFolder & "\SQLReceipt.txt" For Output As #1
        Print #1, sql
        Close #1
    End If
        
    TranRs.Open sql, gConn, adOpenForwardOnly, adLockReadOnly
     
    Me.txtTOTCopies.Text = 0
    Me.txtTOTPagesPrinted.Text = 0
    
    Me.txtTOTCost.Tag = 0
    txtTOTCost.Text = "$" & Format(Me.txtTOTCost.Tag, "#,##0.00")

    
    Exit Sub
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub Detail_Format()

On Error GoTo Err_Handler
     
    If TranRs.EOF = False Then
       Me.txtDate = Format(TranRs!DT_REQUESTED, "mm/dd/yyyy hh:mm")
       Me.txtComputer = Space(1) & nchk(TranRs!COMPUTERNAME)
       Me.txtPrinter = Space(1) & nchk(TranRs!PRINTERNAME)
       Me.txtCopies = numchk(TranRs!Copies)
       Me.txtPagesPrinted = numchk(TranRs!PageCount)
       Me.txtCost = "$" & Format(numchk(TranRs!jobcost), "#,##0.00")
       
       Me.txtTOTCopies.Text = Val(Me.txtTOTCopies.Text) + numchk(TranRs!Copies)
       Me.txtTOTPagesPrinted.Text = Val(Me.txtTOTPagesPrinted.Text) + numchk(TranRs!PageCount)
        
       Me.txtTOTCost.Tag = Val(Me.txtTOTCost.Tag) + numchk(TranRs!jobcost)
       txtTOTCost.Text = "$" & Format(Me.txtTOTCost.Tag, "#,##0.00")
       
       Me.Detail.PrintSection
       TranRs.MoveNext
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub

