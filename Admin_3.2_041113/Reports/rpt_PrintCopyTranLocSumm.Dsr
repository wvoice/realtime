VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_PrintCopyTranLocSumm 
   Caption         =   "DocuGate - rpt_PrintCopyTranAccSumm (ActiveReport)"
   ClientHeight    =   10995
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   11280
   Icon            =   "rpt_PrintCopyTranLocSumm.dsx":0000
   _ExtentX        =   27331
   _ExtentY        =   19420
   SectionData     =   "rpt_PrintCopyTranLocSumm.dsx":5872
End
Attribute VB_Name = "rpt_PrintCopyTranLocSumm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
    
        Me.txtLoc.Text = Space(2) & rs!COMPUTERNAME 'ACC_BADGE
        'commented out by Jeff 08152008
        'Me.txtFullname.Text = Space(2) & rs!ACC_FULLNAME
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



