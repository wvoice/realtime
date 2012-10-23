VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_CashierReportSales 
   Caption         =   "DocuGate - rpt_CashierReportSales (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   15360
   Icon            =   "rpt_CashierReportSales.dsx":0000
   _ExtentX        =   27093
   _ExtentY        =   18494
   SectionData     =   "rpt_CashierReportSales.dsx":5872
End
Attribute VB_Name = "rpt_CashierReportSales"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
        Me.txtGRSumSalesDT.Tag = 0
        Me.txtGRSumSalesCR.Tag = 0
        txtGRSumSalesDT.Text = "$" & Format(Me.txtGRSumSalesDT.Tag, "#,##0.00")
        txtGRSumSalesCR.Text = "$" & Format(Me.txtGRSumSalesCR.Tag, "#,##0.00")
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

'On Error GoTo Err_Handler

    rs.Open gClsReports.ReportSQL, gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
        Me.GroupHeader1.GroupValue = Format(rs!TRANDATE, "MM/DD/YYYY")
        PrevControlChk = Format(rs!TRANDATE, "MM/DD/YYYY")
        
        Me.txtGRCountSales.Text = 0
        Me.txtGRSumSalesDT.Tag = 0
        Me.txtGRSumSalesCR.Tag = 0
        txtGRSumSalesDT.Text = "$" & Format(Me.txtGRSumSalesDT.Tag, "#,##0.00")
        txtGRSumSalesCR.Text = "$" & Format(Me.txtGRSumSalesCR.Tag, "#,##0.00")
        
        Me.txtGRANDCountSales.Text = 0
        Me.txtGRANDSumSalesDT.Tag = 0
        Me.txtGRANDSumSalesCR.Tag = 0
        txtGRANDSumSalesDT.Text = "$" & Format(Me.txtGRANDSumSalesDT.Tag, "#,##0.00")
        txtGRANDSumSalesCR.Text = "$" & Format(Me.txtGRANDSumSalesCR.Tag, "#,##0.00")
    End If
    
    TotWidth = 2692
    TotLeft = 4110
    
    If gClsReports.ReportId = 6 Or gClsReports.ReportId = 9 Or gClsReports.ReportId = 10 Or gClsReports.ReportId = 11 Then
        Me.lblDesc3 = ""
        Me.lblDesc2 = "  Cashier Badge"
        Me.lblDesc1 = "  Cashier Name"
        Call SetDescFields(2)
        
    ElseIf gClsReports.ReportId = 7 Then
        Me.lblDesc3 = "Account"
        Me.lblDesc2 = "  Account name"
        Me.lblDesc1 = "  OU name"
       'Me.lblSales = "Total Amount"
       ' Me.lblCount = "# Transfers"
        Call SetDescFields(3)
    End If
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
        Me.lblDesc3.Visible = False
        Me.txtDesc3.Visible = False
        txtGrFooter3.Visible = False
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
'On Error GoTo Err_Handler
    
    DoEvents
    
    If rs.EOF = False Then
        If Me.txtDesc3.Visible = True Then txtDesc3.Text = rs!DESC3
        If Me.txtDesc2.Visible = True Then txtDesc2.Text = Space(2) & rs!DESC2
        Me.txtDesc1.Text = Space(2) & rs!DESC1
        
        Me.txtTranDt = Format(rs!TRANDATE, "mm/dd/yyyy")
        
        Me.txtSumSalesDT = "$" & Format(numchk(rs!TOTAL_DEBIT_SALES), "#,##0.00")
        Me.txtSumSalesCR = "$" & Format(numchk(rs!TOTAL_CREDIT_SALES), "#,##0.00")
        
        Me.txtCountSales = Format(numchk(rs!TOTALTRAN), "#,##0")
        Me.txtGRCountSales.Text = Val(txtGRCountSales.Text) + numchk(rs!TOTALTRAN)
        
        Me.txtGRSumSalesDT.Tag = Val(txtGRSumSalesDT.Tag) + numchk(rs!TOTAL_DEBIT_SALES)
        txtGRSumSalesDT.Text = "$" & Format(Me.txtGRSumSalesDT.Tag, "#,##0.00")
        
        Me.txtGRSumSalesCR.Tag = Val(txtGRSumSalesCR.Tag) + numchk(rs!TOTAL_CREDIT_SALES)
        txtGRSumSalesCR.Text = "$" & Format(Me.txtGRSumSalesCR.Tag, "#,##0.00")
        
        Me.txtGRANDCountSales.Text = Val(txtGRANDCountSales.Text) + numchk(rs!TOTALTRAN)
        
        Me.txtGRANDSumSalesDT.Tag = Val(txtGRANDSumSalesDT.Tag) + numchk(rs!TOTAL_DEBIT_SALES)
        txtGRANDSumSalesDT.Text = "$" & Format(Me.txtGRANDSumSalesDT.Tag, "#,##0.00")
                
        Me.txtGRANDSumSalesCR.Tag = Val(txtGRANDSumSalesCR.Tag) + numchk(rs!TOTAL_CREDIT_SALES)
        txtGRANDSumSalesCR.Text = "$" & Format(Me.txtGRANDSumSalesCR.Tag, "#,##0.00")
                
        Me.Detail.PrintSection
        rs.MoveNext
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub
