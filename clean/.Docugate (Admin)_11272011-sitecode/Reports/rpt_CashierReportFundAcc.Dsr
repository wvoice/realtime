VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_CashierReportFundAcc 
   Caption         =   "rpt_CashierReportFundAcc (ActiveReport)"
   ClientHeight    =   10485
   ClientLeft      =   -45
   ClientTop       =   2265
   ClientWidth     =   15360
   Icon            =   "rpt_CashierReportFundAcc.dsx":0000
   _ExtentX        =   27093
   _ExtentY        =   18494
   SectionData     =   "rpt_CashierReportFundAcc.dsx":5872
End
Attribute VB_Name = "rpt_CashierReportFundAcc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim rs As New ADODB.Recordset
Dim PrevControlChk As String

Private Sub ActiveReport_Initialize()

'On Error GoTo Err_Handler

    Me.WindowState = 2
    Me.Caption = "DETAILED " & gClsReports.ReportTitle
    If gDevMode = True Then
        Me.txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") " & Me.Name
    Else
        txtDebugTitle.Text = "report (" & gClsReports.ReportStr & ") "
    End If
    
    Me.txtAppInfo.Text = gAppVersion
    Me.txtTitle.Text = "DETAILED " & gClsReports.ReportTitle & Chr(10) & Space(10) & uct(gClsReports.DateFilterTitle)
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

Private Sub ActiveReport_ReportEnd()
    rs.Close
End Sub

Private Sub ActiveReport_ReportStart()

'On Error GoTo Err_Handler

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
   
        Me.txtGroupFooter.Text = UCase("TOTAL FOR " & GroupHeader1.GroupValue & Space(2))
        GroupHeader1.PrintSection
    End If
End Sub

Private Sub Detail_Format()

'On Error GoTo Err_Handler
    
    If rs.EOF = False Then
        Me.txtAcc = rs!ACC_BADGE
        Me.txtAccName = rs!ACC_FULLNAME
        Me.txtOU = rs!OU_NAME
        Me.txtDtTran = Format(rs!ACC_TRAN_DT, "mm/dd/yyyy hh:mm")
        Me.txtCashierOut = Space(1) & Trim(rs!CASHIER_BADGE) & " " & Trim(rs!CASHIER_NAME)

            Me.txtDebit = "$" & Format(Abs(rs!DEBIT_SALE), "#,##0.00")
            Me.txtCredit = "$" & Format(Abs(rs!CREDIT_SALE), "#,##0.00")
        
            Me.txtGRDebit.Tag = Val(txtGRDebit.Tag) + Abs(numchk(rs!DEBIT_SALE))
            txtGRDebit.Text = "$" & Format(Me.txtGRDebit.Tag, "#,##0.00")
            
            Me.txtGRANDDebit.Tag = Val(txtGRANDDebit.Tag) + Abs(numchk(rs!DEBIT_SALE))
            txtGRANDDebit.Text = "$" & Format(Me.txtGRANDDebit.Tag, "#,##0.00")
             
            Me.txtGRCredit.Tag = Val(txtGRCredit.Tag) + Abs(numchk(rs!CREDIT_SALE))
            txtGRCredit.Text = "$" & Format(Me.txtGRCredit.Tag, "#,##0.00")
            
            Me.txtGRANDCredit.Tag = Val(txtGRANDCredit.Tag) + Abs(numchk(rs!CREDIT_SALE))
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

