VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_CashierReportGlobalDailySum 
   Caption         =   "DocuGate - rpt_CashierReportGlobalDailySum (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   15360
   Icon            =   "rpt_CashierReportGlobalDailySum.dsx":0000
   _ExtentX        =   27093
   _ExtentY        =   18494
   SectionData     =   "rpt_CashierReportGlobalDailySum.dsx":5872
End
Attribute VB_Name = "rpt_CashierReportGlobalDailySum"
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
Dim TotWidth As Integer
Dim TotLeft As Integer

Private Sub ActiveReport_Initialize()

    DoEvents
    Me.WindowState = 2
    Me.Caption = "SUMMARIZED " & gClsReports.ReportTitle
    If gDevMode = True Then
        Me.txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") " & Me.Name
    End If
    Me.txtAppInfo.Text = gAppVersion
    Me.txtTitle.Text = "SUMMARIZED " & gClsReports.ReportTitle & Chr(10) & Space(10) & uct(gClsReports.DateFilterTitle)
    
End Sub

Private Sub ActiveReport_ReportEnd()
    rs.Close
End Sub

Private Sub Detail_AfterPrint()
    If rs.EOF = True Then Exit Sub
    GroupHeader1.GroupValue = Format(rs!TRANDATE, "MM/DD/YYYY")
    Me.txtControlChk.Text = Format(rs!TRANDATE, "MM/DD/YYYY")
End Sub

Private Sub Detail_BeforePrint()
    If rs.EOF = True Then Exit Sub
    If PrevControlChk <> Format(rs!TRANDATE, "MM/DD/YYYY") Then
        PrevControlChk = Format(rs!TRANDATE, "MM/DD/YYYY")
    End If
End Sub

Private Sub GroupHeader1_Format()
    If rs.EOF = False Then
        Me.txtGRCountSales.Text = 0
        Me.txtGRSumSales.Tag = 0
        txtGRSumSales.Text = "$" & Format(Me.txtGRSumSales.Tag, "#,##0.00")
        
        Me.txtGrFooter.Text = UCase("TOTAL FOR " & PrevControlChk & Space(2))
        GroupHeader1.PrintSection
    End If
End Sub

Private Sub ReportFooter_Format()
    If gClsReports.ReportId = 7 Then
        Me.txtGrandFooter1.Text = Replace(Me.txtGrandFooter1.Text, "# OF SALES", "# OF TRANSFERS")
        Me.txtGrandFooter2.Text = Replace(Me.txtGrandFooter2.Text, "AMOUNT OF SALES", "AMOUNT OF TRANSFERS")
    End If
End Sub

Private Sub ReportHeader_Format()
    Me.lblReportDt.Caption = Format(Now(), "mm/dd/yyyy hh:mm")
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub

Private Sub ActiveReport_ReportStart()

On Error GoTo Err_Handler

    rs.Open gClsReports.ReportSQL, gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
        Me.GroupHeader1.GroupValue = Format(rs!TRANDATE, "MM/DD/YYYY")
        PrevControlChk = Format(rs!TRANDATE, "MM/DD/YYYY")
        
        Me.txtGRCountSales.Text = 0
        Me.txtGRSumSales.Tag = 0
        txtGRSumSales.Text = "$" & Format(Me.txtGRSumSales.Tag, "#,##0.00")
        
        Me.txtGRANDCountSales.Text = 0
        Me.txtGRANDSumSales.Tag = 0
        txtGRANDSumSales.Text = "$" & Format(Me.txtGRANDSumSales.Tag, "#,##0.00")
        
    End If
    
    TotWidth = 2692
    TotLeft = 4110
    
    'If gClsReports.ReportId = 6 Or gClsReports.ReportId = 9 Or gClsReports.ReportId = 10 Or gClsReports.ReportId = 11 Then
        'Me.lblDesc3 = ""
        Me.lblDesc2 = "  Cashier Badge"
        Me.lblDesc1 = "  Cashier Name"
        Call SetDescFields(2)
        
    'ElseIf gClsReports.ReportId = 7 Then
    '    Me.lblDesc3 = "Account"
    '    Me.lblDesc2 = "  Account name"
     '   Me.lblDesc1 = "  OU name"
    '    Me.lblSales = "Total Amount"
    '    Me.lblCount = "# Transfers"
    '    Call SetDescFields(3)
    'End If
    Exit Sub
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

Private Sub SetDescFields(CntDesc As Integer)

    If CntDesc = 3 Then
      ' Me.lblDesc2.Alignment = ddTXLeft
      ' Me.txtDesc2.Alignment = ddTXLeft
    End If
    
    If CntDesc < 3 Then
       ' Me.lblDesc3.Visible = False
       ' Me.txtDesc3.Visible = False
       ' txtGrFooter3.Visible = False
     '  Me.lblDesc2.Alignment = ddTXLeft
     '  Me.txtDesc2.Alignment = ddTXLeft
    End If
        
    If CntDesc < 2 Then
        Me.lblDesc2.Visible = False
        Me.txtDesc2.Visible = False
     '  Me.lblDesc1.Alignment = ddTXLeft
     '  Me.txtDesc1.Alignment = ddTXLeft
   End If
        
        
End Sub

Private Sub Detail_Format()

On Error GoTo Err_Handler
    
    DoEvents
    
    If rs.EOF = False Then
       ' If Me.txtDesc3.Visible = True Then txtDesc3.Text = rs!DESC3
        If Me.txtDesc2.Visible = True Then txtDesc2.Text = Space(2) & rs!DESC2
        Me.txtDesc1.Text = Space(2) & rs!DESC1
        
        Me.txtType.Text = rs!TRANTYPE
        Me.txtTranDt = Format(rs!TRANDATE, "mm/dd/yyyy")
        
        Me.txtSumSales = "$" & Format(numchk(rs!TOTAL_CREDIT), "#,##0.00")
        Me.txtCountSales = "$" & Format(numchk(rs!TOTAL_DEBIT), "#,##0.00")
        
        Me.txtGRSumSales.Tag = Val(txtGRSumSales.Tag) + numchk(rs!TOTAL_CREDIT)
        txtGRSumSales.Text = "$" & Format(Me.txtGRSumSales.Tag, "#,##0.00")
        
        Me.txtGRCountSales.Tag = Val(txtGRCountSales.Tag) + numchk(rs!TOTAL_DEBIT)
        txtGRCountSales.Text = "$" & Format(Me.txtGRCountSales.Tag, "#,##0.00")
        
        '--
        Me.txtGRANDSumSales.Tag = Val(txtGRANDSumSales.Tag) + numchk(rs!TOTAL_CREDIT)
        txtGRANDSumSales.Text = "$" & Format(Me.txtGRANDSumSales.Tag, "#,##0.00")
        
        Me.txtGRANDCountSales.Tag = Val(txtGRANDCountSales.Tag) + numchk(rs!TOTAL_DEBIT)
        txtGRANDCountSales.Text = "$" & Format(Me.txtGRANDCountSales.Tag, "#,##0.00")
                
        Me.Detail.PrintSection
        rs.MoveNext
    End If
    Exit Sub
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub
