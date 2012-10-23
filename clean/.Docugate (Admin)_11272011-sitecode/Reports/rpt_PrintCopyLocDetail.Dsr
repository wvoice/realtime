VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_PrintCopyLocDetail 
   Caption         =   "rpt_PrintCopyLocDetail (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   -255
   ClientTop       =   315
   ClientWidth     =   14865
   Icon            =   "rpt_PrintCopyLocDetail.dsx":0000
   _ExtentX        =   26220
   _ExtentY        =   18494
   SectionData     =   "rpt_PrintCopyLocDetail.dsx":5872
End
Attribute VB_Name = "rpt_PrintCopyLocDetail"
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

Private Sub ActiveReport_Initialize()
    Me.WindowState = 2
    Me.Caption = "DETAILED " & gClsReports.ReportTitle
    If gDevMode = True Then
        Me.txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") " & Me.Name
    End If
    Me.txtAppInfo.Text = gAppVersion
    Me.txtTitle.Text = "DETAILED " & gClsReports.ReportTitle & Chr(10) & Space(10) & uct(gClsReports.DateFilterTitle)
    
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
    
    Me.lblDesc.Caption = Space(2) & gClsReports.DescHdg
    Me.lblControlKey.Caption = gClsReports.ControlHdg
    
    If rs.EOF = False Then
        Me.GroupHeader1.GroupValue = rs(gClsReports.ControlKey)
        Me.GroupHeader2.GroupValue = rs!jobtype_desc
        
        Me.txtJobType.Text = UCase(Space(2) & rs!jobtype_desc & " JOBS")
        
        Me.txtControlKey.Text = UCase(Space(2) & gClsReports.ControlHdg & ": " & Space(2) & rs(gClsReports.ControlKey))
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & rs(gClsReports.ControlKey) & Space(1) & Me.GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & rs(gClsReports.ControlKey) & Space(1) & Me.GroupHeader2.GroupValue & " COST")
        
        PrevJobType = rs!jobtype_desc
        PrevControlKey = nchk(rs(gClsReports.ControlKey))
        
        txtGr2Pages.Text = 0
        txtGr2Cost.Tag = 0
        txtGr2Cost.Text = "$" & Format(txtGr2Cost.Tag, "#,##0.00")
        
        Me.txtG1Pages.Text = 0
        Me.txtG1Cost.Tag = 0
        txtG1Cost.Text = "$" & Format(txtG1Cost.Tag, "#,##0.00")
        
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
    
    If gClsReports.ReportId = 1 Then
        Me.GroupFooter1.Visible = False
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

Private Sub GroupHeader2_Format()
    If rs.EOF = False Then
        DoEvents
        Me.txtJobType.Text = UCase(Space(2) & rs!jobtype_desc & " JOBS")
        GroupHeader2.PrintSection
        
        
        '//////// 17/06/2008
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COST")
        '///////////////////
        
        txtGr2Pages.Text = 0
        txtGr2Cost.Tag = 0
        txtGr2Cost.Text = "$" & Format(txtGr2Cost.Tag, "#,##0.00")
    End If
End Sub

Private Sub GroupHeader1_Format()
    If rs.EOF = False Then
        DoEvents
        Me.txtControlKey.Text = UCase(Space(2) & gClsReports.ControlHdg & ": " & Space(2) & rs(gClsReports.ControlKey))
        GroupHeader1.PrintSection
        
        '////////// 17/06/2008
        Me.txtGr1FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COUNT")
        Me.txtGr1FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COST")
        '//////////
        
        txtG1Pages.Text = 0
        txtG1Cost.Tag = 0
        txtG1Cost.Text = "$" & Format(txtG1Cost.Tag, "#,##0.00")
    End If
End Sub

Private Sub Detail_AfterPrint()
'//Header
    If rs.EOF = True Then Exit Sub
    Me.GroupHeader2.GroupValue = rs!jobtype_desc
    Me.GroupHeader1.GroupValue = rs(gClsReports.ControlKey)
        
    Me.txtJobType.Text = UCase(Space(2) & rs!jobtype_desc & " JOBS")
    Me.txtControlKey.Text = UCase(Space(2) & gClsReports.ControlHdg & ": " & Space(2) & rs(gClsReports.ControlKey))
    DoEvents

End Sub

Private Sub Detail_BeforePrint()
On Error GoTo Err_Handler

    DoEvents
    
    If rs.EOF = True Then Exit Sub
    
    If PrevControlKey <> rs(gClsReports.ControlKey) Then
        Me.txtGr1FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COUNT")
        Me.txtGr1FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & " PRINT & COPY COST")
        PrevControlKey = rs(gClsReports.ControlKey)
        
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COST")
        PrevJobType = rs!jobtype_desc
   End If
        
    If PrevJobType <> rs!jobtype_desc Then
        Me.txtGr2FooterPages.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COUNT")
        Me.txtGr2FooterCost.Text = UCase("TOTAL " & GroupHeader1.GroupValue & Space(1) & GroupHeader2.GroupValue & " COST")
        PrevJobType = rs!jobtype_desc
    End If

    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
 End Sub

Private Sub Detail_Format()

On Error GoTo Err_Handler

    DoEvents
    If rs.EOF = False Then
        Me.txtDesc.Text = Space(2) & nchk(rs(gClsReports.DescKey))
        Me.txtTranDt = Format(rs!DT_REQUESTED, "mm/dd/yyyy")
        Me.txtDocument = Space(2) & rs!DOCNAME
        Me.txtComputer = Space(2) & rs!COMPUTERNAME
        
        '10292008- added by Jeff to handle OU name requirements
        Me.txt_OU_Name = Space(2) & rs!OU_NAME
        If rs!CM_DESC = "" Then
            Me.txtClient = Space(2) & rs!CC_NAME
        Else
            Me.txtClient = Space(2) & rs!CC_NAME & " \ " & rs!CM_DESC
        End If
        
        DoEvents
        Me.txtPages = rs("PAGECOUNT")
        Me.txtCost = "$" & Format(numchk(rs!jobcost), "#,##0.00")
        
        txtGr2Pages.Text = Val(txtGr2Pages.Text) + numchk(rs!PageCount)
        txtGr2Cost.Tag = Val(txtGr2Cost.Tag) + numchk(rs!jobcost)
        txtGr2Cost.Text = "$" & Format(txtGr2Cost.Tag, "#,##0.00")
        
        DoEvents
        txtG1Pages.Text = Val(Me.txtG1Pages.Text) + numchk(rs!PageCount)
        txtG1Cost.Tag = Val(Me.txtG1Cost.Tag) + numchk(rs!jobcost)
        txtG1Cost.Text = "$" & Format(txtG1Cost.Tag, "#,##0.00")
        
        DoEvents
        If rs!jobtype_desc = "PRINT" Then
            txtGrandPagesPrint.Text = Val(txtGrandPagesPrint.Text) + numchk(rs!PageCount)
            txtGrandCostPrint.Tag = Val(txtGrandCostPrint.Tag) + numchk(rs!jobcost)
            txtGrandCostPrint.Text = "$" & Format(txtGrandCostPrint.Tag, "#,##0.00")
        End If
        
        If rs!jobtype_desc = "COPY" Then
            txtGrandPagesCopy.Text = Val(txtGrandPagesCopy.Text) + numchk(rs!PageCount)
            txtGrandCostCopy.Tag = Val(txtGrandCostCopy.Tag) + numchk(rs!jobcost)
            txtGrandCostCopy.Text = "$" & Format(txtGrandCostCopy.Tag, "#,##0.00")
        End If
        
        txtGrandPagesPrintCopy.Text = Val(txtGrandPagesPrintCopy.Text) + numchk(rs!PageCount)
        txtGrandCostPrintCopy.Tag = Val(txtGrandCostPrintCopy.Tag) + numchk(rs!jobcost)
        txtGrandCostPrintCopy.Text = "$" & Format(txtGrandCostPrintCopy.Tag, "#,##0.00")
        
        Me.Detail.PrintSection
        rs.MoveNext
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub



