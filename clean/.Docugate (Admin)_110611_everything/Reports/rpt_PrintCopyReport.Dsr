VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_PrintCopyReport 
   Caption         =   "rpt_PrintCopyReport (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   12525
   Icon            =   "rpt_PrintCopyReport.dsx":0000
   _ExtentX        =   22093
   _ExtentY        =   18494
   SectionData     =   "rpt_PrintCopyReport.dsx":5872
End
Attribute VB_Name = "rpt_PrintCopyReport"
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
Dim PrevJobType As String
Dim PrevControlKey As String
Dim TotWidth As Integer
Dim TotLeft As Integer

Private Sub ActiveReport_Initialize()

    If gDevMode Then Call LogTrace("ActiveReport_Initialize()")
    
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

Private Sub ReportHeader_Format()
    Me.lblReportDt.Caption = Format(Now(), "mm/dd/yyyy hh:mm")
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub

Private Sub ActiveReport_ReportStart()

If gDevMode Then Call LogTrace("ActiveReport_ReportStart()")

On Error GoTo Err_Handler
    rs.Open gClsReports.ReportSQL, gConn, adOpenForwardOnly, adLockReadOnly
    
    If rs.EOF = False Then
        Me.GroupHeader1.GroupValue = rs(gClsReports.ControlKey)
        Me.GroupHeader2.GroupValue = rs!JobType
        
        DoEvents
        
        Me.txtJobType.Text = rs!JobType + " JOBS"
        Me.txtGr1FooterPages.Text = UCase("Total " & rs!JobType & " JOBS: ")
        Me.txtControlKey.Text = UCase(Space(2) & gClsReports.ControlHdg & ": " & Space(2) & rs(gClsReports.ControlKey))
        
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & rs(gClsReports.ControlKey) & Space(1) & Me.GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & rs(gClsReports.ControlKey) & Space(1) & Me.GroupHeader2.GroupValue & " COST")
        
        PrevJobType = rs!JobType
        PrevControlKey = nchk(rs(gClsReports.ControlKey))
        
        txtGr1Pages.Text = 0
        txtGr1Cost.Tag = 0
        txtGr1Cost.Text = "$" & Format(txtGr1Cost.Tag, "#,##0.00")
        
        txtGr2Pages.Text = 0
        txtGr2Cost.Tag = 0
        txtGr2Cost.Text = "$" & Format(txtGr2Cost.Tag, "#,##0.00")
        
        txtGrandPagesPrint.Text = 0
        txtGrandCostPrint.Tag = 0
        txtGrandCostPrint.Text = "$" & Format(txtGrandCostPrint.Tag, "#,##0.00")
        
        txtGrandPagesCopy.Text = 0
        txtGrandCostCopy.Tag = 0
        txtGrandCostCopy.Text = "$" & Format(txtGrandCostCopy.Tag, "#,##0.00")
        
        txtGrandPagesPrintCopy.Text = 0
        txtGrandCostPrintCopy.Tag = 0
        txtGrandCostPrintCopy.Text = "$" & Format(txtGrandCostPrintCopy.Tag, "#,##0.00")

    End If
    
    TotWidth = 2692
    TotLeft = 4110
    
    If gClsReports.ReportId = 1 Then
        Me.lblDesc = "  Description"
        Call SetDescFields(1)
    ElseIf gClsReports.ReportId = 2 Then
        Me.lblDesc = "  OU Name"
        Call SetDescFields(1)
        
    ElseIf gClsReports.ReportId = 3 Then
        Me.lblDesc = "  Full Name"
        Me.lblDesc2 = "  Account"
        Call SetDescFields(2)
        
    ElseIf gClsReports.ReportId = 4 Then
        Me.lblDesc = "  Client"
        Call SetDescFields(1)
    ElseIf gClsReports.ReportId = 5 Then
        Me.lblDesc2 = "  Client"
        Me.lblDesc = "  Matter"
        Call SetDescFields(2)
    'added by Jeff, 08202008
    ElseIf gClsReports.ReportId = 13 Then
        Me.lblDesc = "  Location"
        Call SetDescFields(1)
    End If
    
    If gClsReports.ReportId = 1 Then
        Me.GroupFooter1.Visible = False
    End If
    Exit Sub

Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

Private Sub SetDescFields(CntDesc As Integer)
    DoEvents
    
    If CntDesc < 3 Then
        Me.txtDesc3.Visible = False
        Me.lblDesc3.Visible = False
        Me.txtJobType.Left = Me.lblDesc3.Left
       
    End If
    
    If CntDesc < 2 Then
        Me.txtDesc2.Visible = False
        Me.lblDesc2.Visible = False
        Me.txtJobType.Left = Me.lblDesc2.Left
    End If
    
     Me.txtControlKey.Left = Me.txtJobType.Left + Me.txtJobType.Width
     
End Sub

Private Sub Detail_BeforePrint()

On Error GoTo Err_Handler

    Static CntMe As Integer
    CntMe = CntMe + 1
    
    DoEvents
    
    If gDevMode Then Call LogTrace("Detail_BeforePrint(start: rs.eof=" + BoolToYesNo(rs.EOF) + ") #:" + Format(CntMe, "###"), True)
    If gDevMode Then Call LogTrace("Detail_BeforePrint(txtGr2FooterPages.Text=" & txtGr2FooterPages.Text & ")", True)
    If gDevMode Then Call LogTrace("Detail_BeforePrint(txtGr2FooterPages ###### updated in this section)", True)
    
    If rs.EOF = True Then Exit Sub

    '/////////////// UPDATE FOOTERS
    If PrevControlKey <> rs(gClsReports.ControlKey) Then
        Me.txtGr1FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COUNT")
        Me.txtGr1FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COST")
        PrevControlKey = rs(gClsReports.ControlKey)
        
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COST")
        PrevJobType = rs!JobType
   End If
        
    If PrevJobType <> rs!JobType Then
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COST")
        PrevJobType = rs!JobType
    End If
    
    If gDevMode Then Call LogTrace("Detail_BeforePrint(txtGr2FooterPages.Text=" & txtGr2FooterPages.Text, True)
    If gDevMode Then Call LogTrace("Detail_BeforePrint(end: rs.eof=" + BoolToYesNo(rs.EOF) + ")", True)
    
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

Private Sub Detail_AfterPrint()

    If gDevMode Then Call LogTrace("Detail_AfterPrint(start: rs.eof=" + BoolToYesNo(rs.EOF) + ")", True)
    If gDevMode Then Call LogTrace("Detail_AfterPrint(txtGr2FooterPages.Text=" & txtGr2FooterPages.Text, True)
    If gDevMode Then Call LogTrace("Detail_BeforePrint(txtGr2FooterPages ###### updated in this section)", True)

    DoEvents
   
    If rs.EOF = True Then Exit Sub
    
    '//////////// LOOK HERE FOR THE BUG
    Me.GroupHeader2.GroupValue = rs!JobType
    Me.GroupHeader1.GroupValue = rs(gClsReports.ControlKey)
        
    Me.txtJobType.Text = UCase(Space(2) & rs!JobType & " JOBS")
    Me.txtControlKey.Text = UCase(Space(2) & gClsReports.ControlHdg & ": " & Space(2) & rs(gClsReports.ControlKey))
    
    '////////////
    DoEvents
    
    If gDevMode Then Call LogTrace("Detail_AfterPrint(txtGr2FooterPages.Text=" & txtGr2FooterPages.Text, True)
    If gDevMode Then Call LogTrace("Detail_AfterPrint(end: rs.eof=" + BoolToYesNo(rs.EOF) + ")", True)

End Sub

Private Sub Detail_Format()

On Error GoTo Err_Handler
    
    If gDevMode Then Call LogTrace("Detail_Format(start: rs.eof=" + BoolToYesNo(rs.EOF) + ")")
    
    DoEvents
    
    If rs.EOF = False Then

        If gDevMode Then Call LogTrace("Detail_Format(eof=false)")
        
        Me.txtTranDt = Format(rs!TRANDATE, "mm/dd/yyyy")
        
        If Me.txtDesc2.Visible = True Then txtDesc2.Text = Space(2) + rs!DESC2
        Me.txtDetailLine.Text = Space(2) & rs!DESC1
        
        Me.txtSumPageCnt = numchk(rs!SumPageCnt)
        Me.txtSumCost = "$" & Format(numchk(rs!SumJobCost), "#,##0.00")
        
        txtGr1Pages.Text = Val(txtGr1Pages.Text) + numchk(rs!SumPageCnt)
        txtGr1Cost.Tag = Val(txtGr1Cost.Tag) + numchk(rs!SumJobCost)
        txtGr1Cost.Text = "$" & Format(txtGr1Cost.Tag, "#,##0.00")
        
        txtGr2Pages.Text = Val(txtGr2Pages.Text) + numchk(rs!SumPageCnt)
        txtGr2Cost.Tag = Val(txtGr2Cost.Tag) + numchk(rs!SumJobCost)
        txtGr2Cost.Text = "$" & Format(txtGr2Cost.Tag, "#,##0.00")
        
       DoEvents
       
       If rs!JobType = "PRINT" Then
            txtGrandPagesPrint.Text = Val(txtGrandPagesPrint.Text) + numchk(rs!SumPageCnt)
            txtGrandCostPrint.Tag = Val(txtGrandCostPrint.Tag) + numchk(rs!SumJobCost)
            txtGrandCostPrint.Text = "$" & Format(txtGrandCostPrint.Tag, "#,##0.00")
        End If
        
        If rs!JobType = "COPY" Then
            txtGrandPagesCopy.Text = Val(txtGrandPagesCopy.Text) + numchk(rs!SumPageCnt)
            txtGrandCostCopy.Tag = Val(txtGrandCostCopy.Tag) + numchk(rs!SumJobCost)
            txtGrandCostCopy.Text = "$" & Format(txtGrandCostCopy.Tag, "#,##0.00")
        End If
        
        txtGrandPagesPrintCopy.Text = Val(txtGrandPagesPrintCopy.Text) + numchk(rs!SumPageCnt)
        txtGrandCostPrintCopy.Tag = Val(txtGrandCostPrintCopy.Tag) + numchk(rs!SumJobCost)
        txtGrandCostPrintCopy.Text = "$" & Format(txtGrandCostPrintCopy.Tag, "#,##0.00")

        If gDevMode Then Call LogTrace("Detail_Format(before PrintSection(): rs!JobType = " & rs!JobType & " )")
        
        Me.Detail.PrintSection
        
        If gDevMode Then Call LogTrace("Detail_Format(after PrintSection(): rs!JobType = " & rs!JobType & " )")
       
        rs.MoveNext
        If gDevMode Then Call LogTrace("Detail_Format(<<< rs.movenext >>>)")
    End If
    
    If gDevMode Then Call LogTrace("Detail_Format(end: rs.eof=" + BoolToYesNo(rs.EOF) + ")")
    
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
    
End Sub

Private Sub GroupHeader1_Format()

    If gDevMode Then Call LogTrace("GroupHeader1_Format(start: rs.eof=" + BoolToYesNo(rs.EOF) + ")")
    
    If rs.EOF = False Then
        
        If gDevMode Then Call LogTrace("GroupHeader1_Format(before PrintSection(): rs!JobType = " & rs!JobType & " )")
        
        '/////////// added this to fix - 17/06/2008
        Me.txtGr1FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COUNT")
        Me.txtGr1FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COST")
        '/////////// added this to fix - 17/06/2008
               
        DoEvents
        Me.txtJobType.Text = UCase(rs!JobType & " JOBS")
        GroupHeader1.PrintSection
        
        If gDevMode Then Call LogTrace("GroupHeader1_Format(after PrintSection(): rs!JobType = " & rs!JobType & " )")
        
        txtGr1Pages.Text = 0
        txtGr1Cost.Tag = 0
        txtGr1Cost.Text = "$" & Format(txtGr1Cost.Tag, "#,##0.00")
    End If
    
    If gDevMode Then Call LogTrace("GroupHeader1_Format(end: rs.eof=" + BoolToYesNo(rs.EOF) + ")")
End Sub

Private Sub GroupHeader2_Format()

    If gDevMode Then Call LogTrace("GroupHeader2_Format(start: rs.eof=" + BoolToYesNo(rs.EOF) + ")")
    
    If rs.EOF = False Then
        DoEvents
        
        If gDevMode Then Call LogTrace("GroupHeader2_Format(before PrintSection(): rs!JobType = " & rs!JobType & " )")
       
        '/////////// added this to fix - 17/06/2008
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COST")
        '/////////// added this to fix - 17/06/2008
        
        GroupHeader2.PrintSection
        
        If gDevMode Then Call LogTrace("GroupHeader2_Format(after PrintSection(): rs!JobType = " & rs!JobType & " )")
        
        txtGr2Pages.Text = 0
        txtGr2Cost.Tag = 0
        txtGr2Cost.Text = "$" & Format(txtGr2Cost.Tag, "#,##0.00")
    End If
    
    If gDevMode Then Call LogTrace("GroupHeader2_Format(end: rs.eof=" + BoolToYesNo(rs.EOF) + ")")
End Sub

