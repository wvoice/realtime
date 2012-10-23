VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_PrintCopyTranAccSumm 
   Caption         =   "DocuGate - rpt_PrintCopyTranAccSumm (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   17310
   Icon            =   "rpt_PrintCopyTranAccSumm.dsx":0000
   _ExtentX        =   30533
   _ExtentY        =   18494
   SectionData     =   "rpt_PrintCopyTranAccSumm.dsx":5872
End
Attribute VB_Name = "rpt_PrintCopyTranAccSumm"
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

Dim PrevControlKey As String

Private Sub ActiveReport_Initialize()

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

Private Sub GroupHeader1_Format()

    '/////////// added this to fix - 17/06/2008
    Me.txtGrFooterPages.Text = "OU: " & UCase(GroupHeader1.GroupValue & " TOTALS")
    '/////////// added this to fix - 17/06/2008
    GroupHeader1.PrintSection
    ResetSubTotals
    
End Sub

Private Sub ResetSubTotals()

    '/////////// reset subtotals on group change - 17/06/2008
    Me.txtGRPrintCount.Text = 0
    Me.txtGRPrintCost.Tag = 0
    Me.txtGRCopyCount.Text = 0
    Me.txtGRCopyCost.Tag = 0
    Me.txtGRPrintCopyCount.Text = 0
    Me.txtGRPrintCopyCost.Tag = 0

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
        Me.GroupHeader1.GroupValue = nchk(rs!OU_NAME)
        Me.txtControlKey.Text = UCase(Space(2) & Me.GroupHeader1.GroupValue)
        PrevControlKey = nchk(rs!OU_NAME)
    End If
    
    Me.txtGRPrintCount.Text = 0
    Me.txtGRPrintCost.Tag = 0
    txtGRPrintCost.Text = "$" & Format(txtGRPrintCost.Tag, "#,##0.00")
    
    Me.txtGRCopyCount.Text = 0
    Me.txtGRCopyCost.Tag = 0
    txtGRCopyCost.Text = "$" & Format(txtGRCopyCost.Tag, "#,##0.00")
    
    Me.txtGRPrintCopyCount.Text = 0
    Me.txtGRPrintCopyCost.Tag = 0
    txtGRPrintCopyCost.Text = "$" & Format(txtGRPrintCopyCost.Tag, "#,##0.00")
    
    txtGrandPagesPrint.Text = 0
    txtGrandCostPrint.Tag = 0
    txtGrandCostPrint.Text = "$" & Format(txtGrandCostPrint.Tag, "#,##0.00")
    
    txtGrandPagesCopy.Text = 0
    txtGrandCostCopy.Tag = 0
    txtGrandCostCopy.Text = "$" & Format(txtGrandCostCopy.Tag, "#,##0.00")
    
    txtGrandPagesPrintCopy.Text = 0
    txtGrandCostPrintCopy.Tag = 0
    txtGrandCostPrintCopy.Text = "$" & Format(txtGrandCostPrintCopy.Tag, "#,##0.00")
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub Detail_Format()
    
On Error GoTo Err_Handler
    If rs.EOF = False Then
    
        Me.txtAcc.Text = Space(2) & rs!acc_badge
        Me.txtFullname.Text = Space(2) & rs!ACC_FULLNAME
        Me.txtTranDt = Format(rs!DT_REQUESTED, "mm/dd/yyyy")
                       
        Me.txtPrintCount.Text = numchk(rs!PRINTPAGECNT)
        Me.txtPrintCost.Text = "$" & Format(numchk(rs!PRINTJOBCOST), "#,##0.00")
        Me.txtCopyCount.Text = numchk(rs!COPYPAGECNT)
        Me.txtCopyCost.Text = "$" & Format(numchk(rs!COPYJOBCOST), "#,##0.00")
        Me.txtPrintCopyCount.Text = numchk(rs!TOTSUMPAGECNT)
        Me.txtPrintCopyCost.Text = "$" & Format(numchk(rs!TOTSUMJOBCOST), "#,##0.00")

        
        DoEvents
        Me.txtGRPrintCount.Text = Val(Me.txtGRPrintCount.Text) + numchk(rs!PRINTPAGECNT)
        Me.txtGRPrintCost.Tag = Val(Me.txtGRPrintCost.Tag) + numchk(rs!PRINTJOBCOST)
        txtGRPrintCost.Text = "$" & Format(txtGRPrintCost.Tag, "#,##0.00")
        
        DoEvents
        
        '/////////////////////////// Sub Totals ////////////////////////////
        Me.txtGRCopyCount.Text = Val(Me.txtGRCopyCount.Text) + numchk(rs!COPYPAGECNT)
        Me.txtGRCopyCost.Tag = Val(Me.txtGRCopyCost.Tag) + numchk(rs!COPYJOBCOST)
        txtGRCopyCost.Text = "$" & Format(txtGRCopyCost.Tag, "#,##0.00")
        
        Me.txtGRPrintCopyCount.Text = Val(Me.txtGRPrintCopyCount.Text) _
            + numchk(rs!PRINTPAGECNT) + numchk(rs!COPYPAGECNT)
        
        Me.txtGRPrintCopyCost.Tag = Val(Me.txtGRPrintCopyCost.Tag) _
            + numchk(rs!PRINTJOBCOST) + numchk(rs!COPYJOBCOST)
        txtGRPrintCopyCost.Text = "$" & Format(txtGRPrintCopyCost.Tag, "#,##0.00")
        '//////////////////////// End of Sub Totals ////////////////////////
        

        '//////////////////////////// Grand Totals /////////////////////////
        txtGrandPagesPrint.Text = Val(txtGrandPagesPrint.Text) + numchk(rs!PRINTPAGECNT)
        txtGrandCostPrint.Tag = Val(txtGrandCostPrint.Tag) + numchk(rs!PRINTJOBCOST)
        txtGrandCostPrint.Text = "$" & Format(txtGrandCostPrint.Tag, "#,##0.00")
        
        txtGrandPagesCopy.Text = Val(txtGrandPagesCopy.Text) + numchk(rs!COPYPAGECNT)
        txtGrandCostCopy.Tag = Val(txtGrandCostCopy.Tag) + numchk(rs!COPYJOBCOST)
        txtGrandCostCopy.Text = "$" & Format(txtGrandCostCopy.Tag, "#,##0.00")

        txtGrandPagesPrintCopy.Text = Val(txtGrandPagesPrintCopy.Text) + numchk(rs!PRINTPAGECNT) + numchk(rs!COPYPAGECNT)
        txtGrandCostPrintCopy.Tag = Val(txtGrandCostPrintCopy.Tag) + numchk(rs!PRINTJOBCOST) + numchk(rs!COPYJOBCOST)
        txtGrandCostPrintCopy.Text = "$" & Format(txtGrandCostPrintCopy.Tag, "#,##0.00")
        '//////////////////////// End of Grand Totals ////////////////////////
        
        Me.Detail.PrintSection

        rs.MoveNext
    End If
    Exit Sub

Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub Detail_AfterPrint()
'//Header
    If rs.EOF = True Then Exit Sub
    Me.GroupHeader1.GroupValue = rs!OU_NAME
    Me.txtControlKey.Text = UCase(Space(2) & Me.GroupHeader1.GroupValue)
    DoEvents

End Sub

Private Sub Detail_BeforePrint()
'// footer
    DoEvents
    
    If rs.EOF = True Then Exit Sub
    
    If PrevControlKey <> rs!OU_NAME Then
        Me.txtGrFooterPages.Text = "OU: " & UCase(GroupHeader1.GroupValue & " TOTALS")
        PrevControlKey = rs!OU_NAME
   End If
        
End Sub



