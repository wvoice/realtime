VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_CashierReportSalesDetail 
   Caption         =   "DocuGate - rpt_CashierReportSalesDetail (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   0
   ClientTop       =   540
   ClientWidth     =   15360
   Icon            =   "rpt_CashierReportSalesDetail.dsx":0000
   _ExtentX        =   27093
   _ExtentY        =   18494
   SectionData     =   "rpt_CashierReportSalesDetail.dsx":5872
End
Attribute VB_Name = "rpt_CashierReportSalesDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim rs As New ADODB.Recordset
Dim PrevControlChk As String

Private Sub ActiveReport_Initialize()
    Me.WindowState = 2
    Me.Caption = "DETAILED " & gClsReports.ReportTitle
    If gDevMode = True Then
        Me.txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") " & Me.Name
    End If
    Me.txtAppInfo.Text = gAppVersion
    Me.txtTitle.Text = "DETAILED " & gClsReports.ReportTitle & " " & uct(gClsReports.DateFilterTitle)
    
End Sub

Private Sub ActiveReport_ReportEnd()
    rs.Close
End Sub

Private Sub ActiveReport_ReportStart()

    rs.Open gClsReports.ReportSQL, gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
        Me.GroupHeader1.GroupValue = Format(rs!TRANDATE, "MM/DD/YYYY")
        PrevControlChk = Format(rs!TRANDATE, "MM/DD/YYYY")
         
        Me.txtGRSumSales.Tag = 0
        txtGRSumSales.Text = "$" & Format(txtGRSumSales.Tag, "#,##0.00")
        
        '//Me.txtGRANDRefund.Tag = 0
        '//txtGRANDRefund.Text = "$" & Format(txtGRANDRefund.Tag, "#,##0.00")
    End If
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
        DoEvents
        Me.txtControlChk.Text = Format(rs!TRANDATE, "MM/DD/YYYY")
        Me.txtGrFooter.Text = UCase("TOTAL FOR " & PrevControlChk & Space(2))
        GroupHeader1.PrintSection
        
        txtGRSumSales.Tag = 0
        txtGRSumSales.Text = "$" & Format(txtGRSumSales.Tag, "#,##0.00")
        
        '//txtGRRefund.Tag = 0
        '//txtGRRefund.Text = "$" & Format(txtGRRefund.Tag, "#,##0.00")
    End If
End Sub

Private Sub ReportHeader_Format()
    Me.lblReportDt.Caption = Format(Now(), "mm/dd/yyyy hh:mm")
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub

Private Sub Detail_Format()

On Error GoTo Err_Handler
    
    If rs.EOF = False Then
        Me.txtAcc = Space(2) & rs!ACC_BADGE
        Me.txtFullname = Space(2) & rs!ACC_FULLNAME
        Me.txtOU = Space(2) & rs!OU_NAME

        Me.txtDtCheckedOut = Format(rs!DT_CHKOUT, "mm/dd/yyyy")
        Me.txtCashierOut = Space(2) & rs!CHKOUT_CASHIER
        
        If IsNull(rs!DT_CHKIN) Then
            Me.txtDtCheckedIn.Text = ""
            Me.txtCashierIn.Text = ""
        Else
            Me.txtDtCheckedIn = Format(rs!DT_CHKIN, "mm/dd/yyyy")
            Me.txtCashierIn.Text = Space(2) & rs!CHKIN_CASHIER
        End If
        
        Me.txtOpenBal = "$" & Format(rs!ACC_OPENING_FUNDBAL, "#,##0.00")
        Me.txtSumSales = "$" & Format(rs!TOTAL_TRAN_AMT, "#,##0.00")
        '//Me.txtRefund = "$" & Format(rs!REFUND_AMT, "#,##0.00")
        
        
        txtGRSumSales.Tag = Val(txtGRSumSales.Tag) + numchk(rs!TOTAL_TRAN_AMT)
        txtGRSumSales.Text = "$" & Format(txtGRSumSales.Tag, "#,##0.00")
        '//txtGRRefund.Tag = Val(txtGRRefund.Tag) + numchk(rs!REFUND_AMT)
        '//txtGRRefund.Text = "$" & Format(txtGRRefund.Tag, "#,##0.00")
         
        txtGRANDSumSales.Tag = Val(txtGRANDSumSales.Tag) + numchk(rs!TOTAL_TRAN_AMT)
        txtGRANDSumSales.Text = "$" & Format(txtGRANDSumSales.Tag, "#,##0.00")
        '//txtGRANDRefund.Tag = Val(txtGRANDRefund.Tag) + numchk(rs!REFUND_AMT)
        '//txtGRANDRefund.Text = "$" & Format(txtGRANDRefund.Tag, "#,##0.00")
         
        Me.Detail.PrintSection
        rs.MoveNext
    End If
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

