VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_Reports"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private m_TypeOfReport As Integer
Private m_ReportId As Integer
Private m_ReportIdStr As String
Private m_LastError As String

Private m_CancelledPressed As Boolean
Private m_DateFilterIndex As Integer
Private m_DateFilter As String
Private m_DateFilterTitle As String
Private m_DetailLevel As Integer
Private m_DateField As String

Private m_ReportTitle As String
Private m_ReportSQL As String
Private m_SelectedEntityList As String
Private m_EntityFieldname As String

Private m_ControlKey As String
Private m_ControlHdg As String
Private m_DescKey As String
Private m_DescHdg As String
Const ErrCodePrefix = "011-"

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Property Let mLastError(InputVar As String)
   m_LastError = InputVar
End Property

Public Property Get ControlKey() As String
    ControlKey = m_ControlKey
End Property

Public Property Get ControlHdg() As String
    ControlHdg = m_ControlHdg
End Property

Public Property Get DescKey() As String
    DescKey = m_DescKey
End Property

Public Property Get DescHdg() As String
    DescHdg = m_DescHdg
End Property

Public Property Let CancelledPressed(InputVar As Boolean)
    m_CancelledPressed = InputVar
End Property

Public Property Let DateFilter(InputVar As String)
    m_DateFilter = InputVar
End Property

Public Property Let DateFilterTitle(InputVar As String)
    m_DateFilterTitle = InputVar
End Property

Public Property Get DateFilterTitle() As String
    DateFilterTitle = m_DateFilterTitle
End Property

Public Property Let DetailLevel(InputVar As Integer)
    m_DetailLevel = InputVar
End Property

Public Property Get DateField() As String
    DateField = m_DateField
End Property

Public Property Get ReportSQL() As String
    ReportSQL = m_ReportSQL
End Property

Public Property Get ReportTitle() As String
    ReportTitle = m_ReportTitle
End Property

Public Property Get ReportId() As Integer
    ReportId = m_ReportId
End Property

Public Property Get ReportStr() As String
    ReportStr = m_ReportIdStr
End Property

Public Property Let SelectedEntityList(InputVar As String)
    m_SelectedEntityList = InputVar
End Property

Public Property Get EntityFieldname() As String
    EntityFieldname = m_EntityFieldname
End Property

Public Sub ShowPrintCopyReports(TypeOfReport As Integer, ReportId As Integer, ReportTitle As String)

On Error GoTo Err_Handler
   m_LastError = ""

    m_TypeOfReport = TypeOfReport
    m_ReportId = ReportId
    m_ReportIdStr = Trim(Str(ReportId))
    m_ReportTitle = ReportTitle
    
    If m_TypeOfReport = 0 Then
        m_DateField = "DT_REQUESTED"
    Else
        '//05/03/2008 - added report 12
        If m_ReportId = 6 Or m_ReportId = 9 Or m_ReportId = 11 Or m_ReportId = 12 Then
            m_DateField = "TRANDATE"
        ElseIf m_ReportId = 10 Then
            m_DateField = "DT_CHKIN"
        Else
            m_DateField = "DT_FUNDS_ADJUST"
        End If
    End If
    
    Dim SQL As String
    Dim Entity As String
    
    m_SelectedEntityList = ""
    
    '//05/03/2008 - added report 12
    If m_ReportId = 1 Or m_ReportId = 11 Or m_ReportId = 12 Then
        '//
    Else
        frm_Reports_Data.optData(0).Value = True
        
        If m_ReportId = 2 Then
            Entity = "Organizational Units"
            SQL = "Select distinct OU_Name from dbo.docugate_activity_view where isnull(OU_Name,'') <> ''"
            m_EntityFieldname = "OU_NAME"
        ElseIf m_ReportId = 3 Then
            Entity = "Users"
            SQL = "Select distinct ACC_BADGE from dbo.docugate_activity_view"
            m_EntityFieldname = "ACC_BADGE"
        ElseIf m_ReportId = 4 Then
            Entity = "Clients"
            SQL = "Select distinct CC_NAME from dbo.docugate_activity_view where CC_NAME <> ''"
            m_EntityFieldname = "CC_NAME"
        ElseIf m_ReportId = 5 Then
            Entity = "Clients"
            SQL = "Select distinct CC_NAME from dbo.docugate_activity_view where CC_NAME <> ''"
            m_EntityFieldname = "CC_NAME"
            
        ElseIf m_ReportId = 6 Or m_ReportId = 9 Then
            Entity = "Cashiers"
            SQL = "Select distinct CHKOUT_CASHIER_BADGE from dbo.docugate_cashier_tran_view"
            m_EntityFieldname = "CHKOUT_CASHIER_BADGE"
            
        ElseIf m_ReportId = 10 Then
            Entity = "Cashiers"
            SQL = "Select distinct CHKIN_CASHIER_BADGE from dbo.docugate_cashier_tran_view"
            m_EntityFieldname = "CHKIN_CASHIER_BADGE"
            
        ElseIf m_ReportId = 7 Then
            Entity = "Users"
            SQL = "Select distinct ACC_BADGE from dbo.docugate_cashier_acc_funds_view"
            m_EntityFieldname = "ACC_BADGE"
            
        ElseIf m_ReportId = 8 Then
            Entity = "Users"
            SQL = "Select distinct ACC_BADGE from dbo.docugate_cashier_acc_funds_view"
            m_EntityFieldname = "ACC_BADGE"
        End If
        
        frm_Reports_Data.optData(0).Caption = "ALL " & Entity
        frm_Reports_Data.optData(1).Caption = "Selected " & Entity
        Call LoadComboFromSQL(SQL, frm_Reports_Data.cboDataValue)
        
        '// set the account badge to the person logged in
        If m_ReportId = 9 Or m_ReportId = 10 Then
            If InStr(1, m_EntityFieldname, "BADGE") > 0 Then
                frm_Reports_Data.optData(1).Value = True
                If frm_Reports_Data.cboDataValue.ListCount > 0 Then
                    Call SetComboListItem(gObjLogonMngr.mBadge, frm_Reports_Data.cboDataValue)
                End If
            End If
        End If
        
        frm_Reports_Data.Show vbModal
        If m_CancelledPressed = True Then Exit Sub
        
    End If
    
    Dim f As New frm_Reports_Date
    
    '// daily reports
          
    '//05/04/2008
    If m_ReportId = 9 Or m_ReportId = 10 Or m_ReportId = 11 Or m_ReportId = 12 Then
        f.optDates(3).Value = True
        f.dtDate(3).Value = Date
    End If
    
    f.Show vbModal
    If m_CancelledPressed = True Then Exit Sub
    
    If m_TypeOfReport = 0 Then
        Call ShowPrintCopyReport
    Else
        Call ShowCashierReport
    End If
    Exit Sub
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Sub

Private Sub ShowCashierReport()
    
On Error GoTo Err_Handler
    m_LastError = ""
   
    Dim SelectStr As String
    Dim Fields As String
    
    If m_DetailLevel = 0 Then
        
        If m_ReportId = 6 Or m_ReportId = 9 Then
            '--SUMMARISED TOTAL SALES BY DATE AND CASHIER
            m_ReportSQL = "Select CHKOUT_CASHIER_BADGE AS DESC2, CHKOUT_CASHIER_NAME AS DESC1, " _
                & " convert(char(10),DT_CHKOUT,121) AS TRANDATE,SUM(TOTAL_TRAN_AMT) AS TOTALSALES,COUNT(*) AS TOTALTRAN " _
                & " from dbo.docugate_cashier_tran_view WHERE " & m_DateFilter & m_SelectedEntityList _
                & " GROUP BY convert(char(10),DT_CHKOUT,121),CHKOUT_CASHIER_BADGE, CHKOUT_CASHIER_NAME " _
                & " ORDER BY convert(char(10),DT_CHKOUT,121),CHKOUT_CASHIER_BADGE, CHKOUT_CASHIER_NAME "

        ElseIf m_ReportId = 10 Then
            '--SUMMARISED TOTAL SALES BY DATE AND CASHIER
            m_ReportSQL = "Select CHKIN_CASHIER_BADGE AS DESC2, CHKIN_CASHIER_NAME AS DESC1, " _
                & " convert(char(10),DT_CHKIN,121) AS TRANDATE,SUM(TOTAL_TRAN_AMT) AS TOTALSALES,COUNT(*) AS TOTALTRAN " _
                & " from dbo.docugate_cashier_tran_view WHERE " & m_DateFilter & m_SelectedEntityList _
                & " GROUP BY convert(char(10),DT_CHKIN,121), CHKIN_CASHIER_BADGE, CHKIN_CASHIER_NAME " _
                & " ORDER BY convert(char(10),DT_CHKIN,121), CHKIN_CASHIER_BADGE, CHKIN_CASHIER_NAME "
                
        ElseIf m_ReportId = 7 Then
            m_ReportSQL = "Select ACC_BADGE AS DESC3, ACC_FULLNAME AS DESC2, OU_NAME AS DESC1, convert(char(10),DT_FUNDS_ADJUST,121) AS TRANDATE, " _
                & " SUM(AMT_ADJUSTMENT) AS TOTALSALES,COUNT(*) AS TOTALTRAN " _
                & " From dbo.docugate_cashier_acc_funds_view WHERE " & m_DateFilter & m_SelectedEntityList _
                & " GROUP BY convert(char(10),DT_FUNDS_ADJUST,121), OU_NAME, ACC_BADGE, ACC_FULLNAME  " _
                & " ORDER BY convert(char(10),DT_FUNDS_ADJUST,121), OU_NAME, ACC_BADGE, ACC_FULLNAME  "
                
        '//26/03/2008
        ElseIf m_ReportId = 11 Or m_ReportId = 12 Then
            m_ReportSQL = "Select CASHIER_BADGE AS DESC2, CASHIER_NAME AS DESC1, " _
                & " TRANDATE,TRANTYPE,SUM(CREDIT_SALE) AS TOTAL_CREDIT,SUM(DEBIT_SALE) AS TOTAL_DEBIT" _
                & " from dbo.docugate_cashier_all_activities  " _
                & " WHERE " & m_DateFilter
                
                If m_ReportId = 11 Then
                    m_ReportSQL = m_ReportSQL & " AND CASHIER_BADGE = '" & gObjLogonMngr.mBadge & "') "
                End If
                
                m_ReportSQL = m_ReportSQL & m_SelectedEntityList _
                & " GROUP BY TRANDATE, TRANTYPE, CASHIER_BADGE, CASHIER_NAME " _
                & " ORDER BY TRANDATE, TRANTYPE, CASHIER_BADGE, CASHIER_NAME"
        
        End If
        
        If gDevMode = True Then
            Open App.Path & "\SummarizedCashierReportID" & Format(m_ReportId, "00") & ".txt" For Output As #7
            Print #7, "SUMMARIZED CASHIER REPORT ID: " & Trim(Str(m_ReportId))
            Print #7, ""
            Print #7, m_ReportTitle
            Print #7, ""
            Print #7, m_ReportSQL
            Close #7
        End If

        If m_ReportId = 11 Or m_ReportId = 12 Then
            Dim oRep12 As New rpt_CashierReportGlobalDailySum
            With oRep12
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOPortrait
               .WindowState = 2
               .Show vbModal
            End With
            Set oRep12 = Nothing
               
        Else
        
            Dim oRep As New rpt_CashierReportSales
            With oRep
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOPortrait
               .WindowState = 2
               .Show vbModal
            End With
            Set oRep = Nothing
        End If
        
    End If
    
    Dim OrderClause As String
    Dim ExtendedDateFilter As String
    
    If m_DetailLevel = 1 Then
    
        If m_ReportId = 6 Or m_ReportId = 9 Then
            SelectStr = "Select CONVERT(CHAR(10),DT_CHKOUT ,121) AS TRANDATE, * from dbo.docugate_cashier_tran_view where "
            OrderClause = " ORDER BY convert(char(10),DT_CHKOUT,121), CHKOUT_CASHIER_NAME, OU_NAME, ACC_BADGE"
            
        ElseIf m_ReportId = 10 Then
            SelectStr = "Select CONVERT(CHAR(10),DT_CHKIN ,121) AS TRANDATE,  * from dbo.docugate_cashier_tran_view where "
            OrderClause = " ORDER BY convert(char(10),DT_CHKIN,121), CHKIN_CASHIER_NAME, OU_NAME, ACC_BADGE"
            
        ElseIf m_ReportId = 7 Then
            SelectStr = "Select CONVERT(CHAR(10),DT_FUNDS_ADJUST ,121) AS TRANDATE, * from dbo.docugate_cashier_acc_funds_view where "
            OrderClause = " ORDER BY DT_FUNDS_ADJUST, OU_NAME, ACC_BADGE, ACC_FULLNAME"

        ElseIf m_ReportId = 11 Or m_ReportId = 12 Then
            SelectStr = "SELECT * FROM dbo.docugate_cashier_all_activities WHERE "
            If m_ReportId = 11 Then SelectStr = SelectStr & " CASHIER_BADGE = '" & gObjLogonMngr.mBadge & "' AND "
            OrderClause = " ORDER BY TRANDATE, CASHIER_NAME, CASHIER_OU_NAME, ACC_BADGE, ACC_TRAN_DT"
        End If
        
        m_ReportSQL = SelectStr & m_DateFilter & m_SelectedEntityList & OrderClause

        If gDevMode = True Then
            Open App.Path & "\DetailedPrintCopyReportID" & Format(m_ReportId, "00") & ".txt" For Output As #7
            Print #7, "DETAILED CASHIER REPORT ID: " & Trim(Str(m_ReportId))
            Print #7, ""
            Print #7, m_ReportTitle
            Print #7, ""
            Print #7, m_ReportSQL
            Close #7
        End If
        
        If m_ReportId = 6 Or m_ReportId = 9 Or m_ReportId = 10 Then
            Dim oRepDet As New rpt_CashierReportSalesDetail
            With oRepDet
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               .Show vbModal
            End With
            Set oRep = Nothing
            
        ElseIf m_ReportId = 7 Then
            Dim oRepDet1 As New rpt_CashierReportFundAcc
            With oRepDet1
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               .Show vbModal
            End With
            Set oRepDet1 = Nothing
                 
        ElseIf m_ReportId = 11 Or m_ReportId = 12 Then
             Dim oRepDet2 As New rpt_CashierReportGlobalDailyAct
                 With oRepDet2
                    .PageLeftMargin = gReport_PO_RightMargin
                    .PageRightMargin = gReport_LS_RightMargin
                    .PageTopMargin = gReport_LS_TopMargin
                    .PageBottomMargin = gReport_LS_BottomMargin
                    .Printer.Orientation = ddOLandscape
                    .WindowState = 2
                    .Show vbModal
                 End With
              Set oRepDet2 = Nothing
          End If
          
    End If
    Exit Sub
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Sub

Private Sub ShowPrintCopyReport()

On Error GoTo Err_Handler
   m_LastError = ""
    
    Dim SelectStr As String
    Dim Fields As String
    
    Fields = "convert(char(10),DT_REQUESTED,121) AS TRANDATE,SUM(COPIES) AS SUMCOPIES, " _
            & " SUM(PAGECOUNT) AS SUMPAGECNT, SUM(JOBCOST) AS SUMJOBCOST From dbo.docugate_activity_view"
    
    '--SUMMARISED levels
    
    If m_DetailLevel = 0 Then
        SelectStr = "Select CASE JOBTYPE WHEN 1 THEN 'PRINT' ELSE 'COPY' END AS JOBTYPE,"
            
        If m_ReportId = 1 Then
            '--SUMMARISED GLOBAL DOLLAR SALES AND VOLUME
            m_ReportSQL = SelectStr & " OU_NAME AS DESC1, " & Fields _
                & " WHERE " & m_DateFilter & " GROUP BY JOBTYPE, OU_NAME, convert(char(10),DT_REQUESTED,121) " _
                & " order by JOBTYPE DESC, OU_NAME, convert(char(10),DT_REQUESTED,121)"
                
            m_ControlKey = "DESC1"
            m_ControlHdg = "OU Name"
            
        ElseIf m_ReportId = 2 Then
            '--SUMMARISED OU DOLLAR SALES AND VOLUME
            m_ReportSQL = SelectStr & " OU_NAME AS DESC1, " & Fields _
                & " WHERE " & m_DateFilter & m_SelectedEntityList & " GROUP BY OU_NAME, JOBTYPE, convert(char(10),DT_REQUESTED,121) " _
                & " order by OU_NAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "DESC1"
            m_ControlHdg = "OU Name"
        
        ElseIf m_ReportId = 3 Then
            '--SUMMARISED USER DOLLAR SALES AND VOLUME
            m_ReportSQL = SelectStr & " ACC_BADGE AS DESC2, ACC_FULLNAME AS DESC1, " & Fields _
                & " WHERE " & m_DateFilter & m_SelectedEntityList _
                & " GROUP BY ACC_BADGE, ACC_FULLNAME, JOBTYPE, convert(char(10),DT_REQUESTED,121) " _
                & " order by ACC_BADGE, ACC_FULLNAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "DESC1"
            m_ControlHdg = "Account Badge/Name"
        
        ElseIf m_ReportId = 4 Then
            '--SUMMARISED CLIENT DOLLAR SALES AND VOLUME
            m_ReportSQL = SelectStr & " LTRIM(RTRIM(ISNULL(CC_CODE,'') + ' ' +  CC_NAME)) AS DESC1, " & Fields _
                & " WHERE " & m_DateFilter & m_SelectedEntityList & " GROUP BY CC_CODE, CC_NAME, JOBTYPE, convert(char(10),DT_REQUESTED,121) " _
                & " order by CC_CODE, CC_NAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "DESC1"
            m_ControlHdg = "Client"
            
        ElseIf m_ReportId = 5 Then
            '--SUMMARISED CLIENT and MATTER DOLLAR SALES AND VOLUME
            m_ReportSQL = SelectStr & " LTRIM(RTRIM(ISNULL(CC_CODE,'') + ' ' +  CC_NAME)) AS DESC2, " _
                & " LTRIM(RTRIM(ISNULL(CM_MATTER,'') + ' ' +  CM_DESC)) AS DESC1, " & Fields _
                & " WHERE " & m_DateFilter & m_SelectedEntityList & " GROUP BY CC_CODE, CC_NAME, CM_MATTER, JOBTYPE, CM_DESC, convert(char(10),DT_REQUESTED,121) " _
                & " order by CC_CODE, CC_NAME, CM_MATTER, JOBTYPE DESC, CM_DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "DESC1"
            m_ControlHdg = "Client"
            
        ElseIf m_ReportId = 8 Then
            '--TRANSACTIONS SUMMARY PER ACCOUNT AND DATE
            m_ReportSQL = "Select * FROM DBO.view_activity_acc_dt_jobtype_transposed " _
                & " WHERE " & m_DateFilter & m_SelectedEntityList & " ORDER BY OU_NAME, ACC_BADGE, ACC_FULLNAME,DT_REQUESTED"
        
        End If

        If gDevMode = True Then
            Open App.Path & "\SummarizedPrintCopyReportID" & Format(m_ReportId, "00") & ".txt" For Output As #7
            Print #7, "SUMMARIZED PRINT COPY REPORT ID: " & Trim(Str(m_ReportId))
            Print #7, ""
            Print #7, m_ReportTitle
            Print #7, ""
            Print #7, m_ReportSQL
            Close #7
        End If
        
        If m_ReportId <= 5 Then
            Dim oRep As New rpt_PrintCopyReport
            With oRep
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOPortrait
               .WindowState = 2
               .Show vbModal
            End With
            Set oRep = Nothing
            
        ElseIf m_ReportId = 8 Then
            Dim oRepTranSum As New rpt_PrintCopyTranAccSumm
            With oRepTranSum
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               .Show vbModal
            End With
            Set oRepTranSum = Nothing
        End If
        
    End If '//end of the summarised reports
    
    '-- DETAIL LEVELS
    
    Dim OrderClause As String
    If m_DetailLevel = 1 Then
        If m_ReportId = 1 Then
            '--SUMMARISED GLOBAL DOLLAR SALES AND VOLUME
            OrderClause = " ORDER BY JOBTYPE DESC, OU_NAME, convert(char(10),DT_REQUESTED,121), ACC_FULLNAME"
            m_ControlKey = "OU_NAME"
            m_ControlHdg = "OU Name"
            
            m_DescKey = "ACC_BADGE_FULLNAME"
            m_DescHdg = "Account Badge/Name"
            
        ElseIf m_ReportId = 2 Then
            '--SUMMARISED OU DOLLAR SALES AND VOLUME
            OrderClause = " order by OU_NAME, JOBTYPE DESC,convert(char(10),DT_REQUESTED,121), ACC_FULLNAME"
            m_ControlKey = "OU_NAME"
            m_ControlHdg = "OU Name"
            
            m_DescKey = "ACC_BADGE_FULLNAME"
            m_DescHdg = "Account Badge/Name"
            
        ElseIf m_ReportId = 3 Then
            '--SUMMARISED USER DOLLAR SALES AND VOLUME
            OrderClause = " order by OU_NAME, ACC_FULLNAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "ACC_FULLNAME"
            m_ControlHdg = "Account Badge/Name"
            
            m_DescKey = "OU_NAME"
            m_DescHdg = "OU Name"
            
        ElseIf m_ReportId = 4 Then
            '--SUMMARISED CLIENT DOLLAR SALES AND VOLUME
            OrderClause = " order by CC_CODE, CC_NAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121), ACC_FULLNAME"
            m_ControlKey = "CC_CODE"
            m_ControlHdg = "Client"
            m_DescKey = "ACC_BADGE_FULLNAME"
            m_DescHdg = "Account/Badge/Name"
           
        ElseIf m_ReportId = 5 Then
            '--SUMMARISED CLIENT and MATTER DOLLAR SALES AND VOLUME
            OrderClause = " order by CC_CODE, CC_NAME,CM_MATTER, JOBTYPE DESC, CM_DESC,  " _
                & " convert(char(10),DT_REQUESTED,121), ACC_FULLNAME"
            m_ControlKey = "CC_CODE"
            m_ControlHdg = "Client"
            m_DescKey = "ACC_BADGE_FULLNAME"
            m_DescHdg = "Account/Badge/Name"
            
        ElseIf m_ReportId = 8 Then
            '--TRANSACTION DETAIL PER ACCOUNT AND DATE
            OrderClause = " order by OU_NAME, ACC_BADGE_FULLNAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "ACC_BADGE_FULLNAME"
            m_ControlHdg = "Account/Badge/Name"
            
            m_DescKey = "OU_NAME"
            m_DescHdg = "OU Name"
        End If
        
        m_ReportSQL = "Select * from dbo.docugate_activity_view where " & m_DateFilter & m_SelectedEntityList & OrderClause
        
        'If m_ReportId = 8 Then
            '--TRANSACTION DETAIL PER ACCOUNT AND DATE
            'm_ReportSQL = "Select CASE JOBTYPE WHEN 1 THEN 'PRINT' ELSE 'COPY' END AS JOBTYPE, " _
            '    & " ACC_BADGE, ACC_FULLNAME, " & Fields _
            '    & " WHERE " & m_DateFilter & m_SelectedEntityList _
            '    & " GROUP BY ACC_BADGE, ACC_FULLNAME, JOBTYPE, convert(char(10),DT_REQUESTED,121) " _
            '    & " order by ACC_BADGE, ACC_FULLNAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
        'End If
        
        If gDevMode = True Then
            Open App.Path & "\DetailedPrintCopyReportID" & Format(m_ReportId, "00") & ".txt" For Output As #7
            Print #7, "DETAILED PRINT COPY REPORT ID: " & Trim(Str(m_ReportId))
            Print #7, ""
            Print #7, m_ReportTitle
            Print #7, ""
            Print #7, m_ReportSQL
            Close #7
        End If

        If m_ReportId <= 5 Or m_ReportId = 8 Then
            Dim oRepDet As New rpt_PrintCopyDetail
            With oRepDet
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               .Show vbModal
            End With
            Set oRep = Nothing
        
        End If
        
    End If '// end of detailed reports
    Exit Sub
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Sub


