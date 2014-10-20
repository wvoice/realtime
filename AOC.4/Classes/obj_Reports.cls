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
''
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

Private m_TypeOfReport As Integer
Private m_ReportId As Integer
Private m_ReportIdStr As String
Private m_LastError As String
Private m_DisplayReportId As String

Private m_CancelledPressed As Boolean
Private m_DateFilterIndex As Integer
Private m_DateFilter As String
Private m_DateFilterTitle As String
Private m_DetailLevel As Integer
Private m_DateField As String
Private m_ChkCashier As Integer
Private m_CbmCashier As String

Private m_ReportTitle As String
Private m_ReportSQL As String
Private m_SelectedEntityList As String
Private m_EntityFieldname As String

Private m_ControlKey As String
Private m_ControlHdg As String
Private m_DescKey As String
Private m_DescHdg As String
Const ErrCodePrefix = "011-"

Private m_MainFrmTop As Integer
Private m_MainFrmLeft As Integer
Private m_MainFrmHeight As Integer
Private m_MainFrmWidth As Integer


Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Property Let mLastError(InputVar As String)
   m_LastError = InputVar
End Property

Public Sub SetFrmSize(Top As Integer, Left As Integer, Height As Integer, Width As Integer)
    m_MainFrmTop = Top
    m_MainFrmLeft = Left
    m_MainFrmHeight = Height
    m_MainFrmWidth = Width
End Sub

Public Property Get ControlKey() As String
    ControlKey = m_ControlKey
End Property

' Added 8/15/13 by Mike Young to obtain acc_badge associated with the login, so that we can then get the default site code
Public Property Get DefaultSC() As String
    DefaultSC = "SELECT acc_sc_index FROM dbo.docugate_general_acc WHERE acc_badge = '" & gObjLogonMngr.mBadge & "'"
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
Public Property Let ChkCashier(InputVar As Integer)
    m_ChkCashier = InputVar
End Property
Public Property Let CbmCashier(InputVar As String)
    m_CbmCashier = InputVar
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

Public Sub ShowPrintCopyReports(TypeOfReport As Integer, ReportId As Integer, ReportTitle As String, DisplayReportId As String)

On Error GoTo Err_Handler
   m_LastError = ""

    m_TypeOfReport = TypeOfReport
    m_ReportId = ReportId
    m_ReportIdStr = Trim(Str(ReportId))
    m_ReportTitle = ReportTitle
    m_DisplayReportId = DisplayReportId
    
    'added 06032009 - To handle Transaction Report
    If m_TypeOfReport = 0 And ReportId = 14 Then
        m_DateField = "ACC_TRAN_DT"
    Else
        m_DateField = "DT_REQUESTED"
    End If
            
    If m_TypeOfReport = 1 Then
        m_DateField = "TRANDATE"
    End If
    
    
    Dim sql As String
    Dim Entity As String
    
    m_SelectedEntityList = ""
    
    '//05/03/2008 - added report 12
    If (m_TypeOfReport <> 2) Then '' only is this is not a custom report
    
    If m_ReportId = 1 Or m_ReportId = 11 Or m_ReportId = 12 Then
        '//
    Else
        frm_Reports_Data.optData(0).Value = True
        
        If m_ReportId = 2 Then
            Entity = "Organizational Units"
            sql = "Select distinct OU_Name from dbo.docugate_activity_view where isnull(OU_Name,'') <> ''"
            m_EntityFieldname = "OU_NAME"
        
        ElseIf m_ReportId = 3 Or m_ReportId = 8 Then
            Entity = "Users"
            sql = "Select distinct ACC_BADGE from dbo.docugate_activity_view"
            m_EntityFieldname = "ACC_BADGE"
        
        ElseIf m_ReportId = 4 Or m_ReportId = 5 Then
            Entity = "Clients"
            sql = "Select distinct CC_CODE from dbo.docugate_activity_view where CC_CODE <> ''"
            m_EntityFieldname = "CC_CODE"
           ' PJD Modified July 12th 2010
           ' SQL = "Select distinct CC_NAME from dbo.docugate_activity_view where CC_NAME <> ''"
           ' m_EntityFieldname = "CC_NAME"
            
        ElseIf m_ReportId = 6 Or m_ReportId = 7 Or m_ReportId = 9 Or m_ReportId = 10 Then
            Entity = "Cashiers"
            sql = "SELECT DISTINCT CASHIER_BADGE FROM dbo.docugate_cashier_all_activities"
            m_EntityFieldname = "CASHIER_BADGE"
        
        ElseIf m_ReportId = 13 Then
            Entity = "COMPUTERNAME"
            sql = "Select distinct COMPUTERNAME from dbo.docugate_activity_view"
            m_EntityFieldname = "COMPUTERNAME"
        
        ElseIf m_ReportId = 14 Then
            Entity = "Users"
            sql = "Select distinct ACC_TRAN_ACC_BADGE from dbo.docugate_tran_acc_funds"
            m_EntityFieldname = "ACC_TRAN_ACC_BADGE"
            
        ElseIf m_ReportId = 15 Then
            Entity = "Users"
            sql = "Select distinct ACC_TRAN_ACC_BADGE from dbo.docugate_tran_acc_funds"
            m_EntityFieldname = "ACC_TRAN_ACC_BADGE"
        End If
        
        
        frm_Reports_Data.optData(0).Caption = "All " & Entity
        frm_Reports_Data.optData(1).Caption = "Selected " & Entity
        frm_Reports_Data.Entity = Entity
        
      '/  Call LoadComboFromSQL(sql, frm_Reports_Data.cboDataValue)
        
        '// set the account badge to the person logged in
        If m_ReportId = 9 Or m_ReportId = 10 Then
            If InStr(1, m_EntityFieldname, "BADGE") > 0 Then
              '  frm_Reports_Data.optData(1).Value = True
              '  If frm_Reports_Data.cboDataValue.ListCount > 0 Then
             '       Call SetComboListItem(gObjLogonMngr.mBadge, frm_Reports_Data.cboDataValue)
             '   End If
            End If
        End If
        
        frm_Reports_Data.Show vbModal
        If m_CancelledPressed = True Then Exit Sub
        
    End If
   
   End If ' only if not a custom report
   
   
        Dim f As New frm_Reports_Date
        If m_ReportId = 9 Or m_ReportId = 10 Or m_ReportId = 11 Or m_ReportId = 12 Then
             f.optDates(3).Value = True
             f.dtDate(3).Value = Date
        End If
    
    If m_TypeOfReport = 0 Then
        f.Show vbModal
        If m_CancelledPressed = True Then Exit Sub
        Call ShowPrintCopyReport
    
    ElseIf m_TypeOfReport = 1 Then
        f.Show vbModal
        If m_CancelledPressed = True Then Exit Sub
        Call ShowCashierReport
    
    ElseIf m_TypeOfReport = 2 Then
        
        If m_ReportId = 1 Or m_ReportId = 3 Then
            f.Show vbModal
            If m_CancelledPressed = True Then Exit Sub
        End If
        Call ShowCustomReport
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
        
        m_ReportSQL = "Select CASHIER_BADGE AS DESC2, CASHIER_NAME AS DESC1, " _
                & " TRANDATE,TRANTYPE, COUNT(*) AS TRANCOUNT, SUM(CREDIT_SALE) AS TOTAL_CREDIT," _
                & " SUM(DEBIT_SALE) AS TOTAL_DEBIT" _
                & " from dbo.docugate_cashier_all_activities  " _
                & " WHERE " & m_DateFilter & m_SelectedEntityList

        ' Added by Mike Young on 9/16/13, need to add sitecode filter here
'        m_ReportSQL = "Select CASHIER_BADGE AS DESC2, CASHIER_NAME AS DESC1, " _
'                & " TRANDATE,TRANTYPE, COUNT(*) AS TRANCOUNT, SUM(CREDIT_SALE) AS TOTAL_CREDIT," _
'                & " SUM(DEBIT_SALE) AS TOTAL_DEBIT" _
'                & " from dbo.docugate_cashier_all_activities inner join dbo.docugate_general_acc on CASHIER_BADGE = dbo.docugate_general_acc.ACC_BADGE " _
'                & " WHERE " & m_DateFilter & m_SelectedEntityList & "dbo.docugate_general_acc.acc_sc_index = '" & gObjLogonMngr.mSiteCode & "'"
                
        If m_ReportId = 11 Then m_ReportSQL = m_ReportSQL & " AND CASHIER_BADGE = '" & gObjLogonMngr.mBadge & "' "
        
        If m_ReportId = 7 Then m_ReportSQL = m_ReportSQL & " AND TRANTYPE = 'FUND ADJ' "
        
        If m_ReportId = 9 Then m_ReportSQL = m_ReportSQL & " AND TRANTYPE = 'CHECKED OUT' "
        
        If m_ReportId = 10 Then m_ReportSQL = m_ReportSQL & " AND TRANTYPE = 'CHECKED IN' "
                
        m_ReportSQL = m_ReportSQL & m_SelectedEntityList _
                & " GROUP BY TRANDATE, TRANTYPE, CASHIER_BADGE, CASHIER_NAME " _
                & " ORDER BY TRANDATE, TRANTYPE DESC, CASHIER_BADGE, CASHIER_NAME"
        
        If gDevMode = True Then
            Open gAppTraceFolder & "\SummarizedCashierReportID" & Format(m_DisplayReportId, "00") & ".txt" For Output As #7
            Print #7, "/*" & Chr(9) & "SUMMARIZED CASHIER REPORT ID: " & Trim(m_DisplayReportId)
            Print #7, ""
            Print #7, m_ReportTitle & "  */"
            Print #7, ""
            'Print #7, m_ReportSQL
            'Print #7, ""
            Print #7, gObjDBConn.FormatSQL(m_ReportSQL)
            Close #7
        End If

        Dim oRep12 As New rpt_CashierReportGlobalDailySum
        With oRep12
           .PageLeftMargin = gReport_PO_RightMargin
           .PageRightMargin = gReport_LS_RightMargin
           .PageTopMargin = gReport_LS_TopMargin
           .PageBottomMargin = gReport_LS_BottomMargin
           .Printer.Orientation = ddOPortrait
           .WindowState = 2
           
           If gDevMode = True Then LogTrace ("Invoked report: rpt_CashierReportGlobalDailySum")
           .Show vbModal
        End With
        Set oRep12 = Nothing
        
    End If
    
    Dim OrderClause As String
    Dim ExtendedDateFilter As String
    
    If m_DetailLevel = 1 Then
    
       ' Added on 9/4/13 by Mike Young to take drop down cashier input as a conditional
       If m_ChkCashier = False Then
        SelectStr = "SELECT * FROM dbo.docugate_cashier_all_activities inner join dbo.docugate_general_acc on CASHIER_BADGE = dbo.docugate_general_acc.ACC_BADGE WHERE docugate_general_acc.acc_sc_index = '" & gObjLogonMngr.mSiteCode & "' AND "
       Else
        SelectStr = "SELECT * FROM dbo.docugate_cashier_all_activities inner join dbo.docugate_general_acc on CASHIER_BADGE = dbo.docugate_general_acc.ACC_BADGE WHERE CASHIER_NAME='" & m_CbmCashier & "' AND docugate_general_acc.acc_sc_index = '" & gObjLogonMngr.mSiteCode & "' AND "
       End If
        If m_ReportId = 11 Then SelectStr = SelectStr & " CASHIER_BADGE = '" & gObjLogonMngr.mBadge & "' AND "
        If m_ReportId = 7 Then SelectStr = SelectStr & " TRANTYPE = 'FUND ADJ' AND "
        If m_ReportId = 9 Then SelectStr = SelectStr & " TRANTYPE = 'CHECKED OUT' AND "
        If m_ReportId = 10 Then SelectStr = SelectStr & " TRANTYPE = 'CHECKED IN' AND "
            
        OrderClause = " ORDER BY TRANDATE, CASHIER_NAME, CASHIER_OU_NAME, docugate_cashier_all_activities.ACC_BADGE, ACC_TRAN_DT"
        m_ReportSQL = SelectStr & m_DateFilter & m_SelectedEntityList & OrderClause

        If gDevMode = True Then
            Open gAppTraceFolder & "\DetailedPrintCopyReportID" & Format(m_DisplayReportId, "00") & ".txt" For Output As #7
            Print #7, "/*" & Chr(9) & "DETAILED CASHIER REPORT ID: " & Trim(m_DisplayReportId)
            Print #7, ""
            Print #7, m_ReportTitle & "  */"
            Print #7, ""
            
            
            'Print #7, m_ReportSQL
            'Print #7, ""
            Print #7, gObjDBConn.FormatSQL(m_ReportSQL)
            Close #7
        End If
                 
        Dim oRepDet2 As New rpt_CashierReportGlobalDailyAct
            With oRepDet2
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               
               If gDevMode = True Then LogTrace ("Invoked report: rpt_CashierReportGlobalDailyAct")
               .Show vbModal
            End With
         Set oRepDet2 = Nothing
          
    End If
    Exit Sub
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Sub


Private Sub ShowCustomReport()
    
On Error GoTo Err_Handler
        
      m_LastError = ""
      Dim SelectStr As String
      Dim Fields As String
      
      Dim oRep As Object
      
      If m_ReportId = 1 Then
            Set oRep = New rpt_MonthlySummaryReport
            oRep.title = "Client Summary Report - "
            m_ReportSQL = "SELECT CC_CODE as code,CC_NAME as name,JOBTYPE_DESC,SUM(JOBCOST)AS jobcost,SUM(PAGECOUNT) AS pagecount " _
                        & "FROM dbo.docugate_activity_view " _
                        & "WHERE " & m_DateFilter & " " _
                        & "GROUP BY cc_code, cc_name, JOBTYPE_DESC " _
                        & "ORDER BY cc_code"

         With oRep
                .PageLeftMargin = gReport_PO_RightMargin
                .PageRightMargin = gReport_LS_RightMargin
                .PageTopMargin = gReport_LS_TopMargin
                .PageBottomMargin = gReport_LS_BottomMargin
                .Printer.Orientation = ddOPortrait
                 .WindowState = 2
                .Show vbModal
         End With
    
     End If
        
     If m_ReportId = 2 Then
            Set oRep = New rpt_ActiveAccounts
            With oRep
                .PageLeftMargin = gReport_PO_RightMargin
                .PageRightMargin = gReport_LS_RightMargin
                .PageTopMargin = gReport_LS_TopMargin
                .PageBottomMargin = gReport_LS_BottomMargin
                .Printer.Orientation = ddOPortrait
                 .WindowState = 2
                .Show vbModal
            End With
      End If
      
      
      If m_ReportId = 3 Then
            Set oRep = New rpt_MonthlySummaryReport
            oRep.title = "Account Summary Report - "
            
            
            m_ReportSQL = "SELECT acc_badge as code,ACC_FULLNAME as name,JOBTYPE_DESC,SUM(JOBCOST)AS jobcost, SUM(PAGECOUNT) AS pagecount " _
                        & "FROM dbo.docugate_activity_view " _
                        & "WHERE " & m_DateFilter & " " _
                        & "GROUP BY acc_badge, acc_fullname, JOBTYPE_DESC " _
                        & "ORDER BY acc_badge"

         With oRep
                .PageLeftMargin = gReport_PO_RightMargin
                .PageRightMargin = gReport_LS_RightMargin
                .PageTopMargin = gReport_LS_TopMargin
                .PageBottomMargin = gReport_LS_BottomMargin
                .Printer.Orientation = ddOPortrait
                 .WindowState = 2
                .Show vbModal
         End With
    
     End If
      
      
      
      Set oRep = Nothing
    
    
    
    
    
Err_Handler:
    If (Err.Number <> 0) Then
        m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
    End If
    
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
        
        'added 08142008, by Jeff in order to have a report based upon the computer name field - This field will be used as a office deliminator
        ElseIf m_ReportId = 13 Then
            '--TRANSACTIONS SUMMARY PER LOCATION AND DATE
              m_ReportSQL = SelectStr & " COMPUTERNAME AS DESC1, " & Fields _
                & " WHERE " & m_DateFilter & m_SelectedEntityList & " GROUP BY JOBTYPE, COMPUTERNAME, convert(char(10),DT_REQUESTED,121) " _
                & " order by JOBTYPE DESC, COMPUTERNAME, convert(char(10),DT_REQUESTED,121)"
                
        'added06032009, by Jeff
        '// added to handle the account transactions
        'ElseIf m_ReportId = 14 Then
        '--ACCOUNT TRANSACTIONS SUMMARY AND DATE
              'm_ReportSQL = SelectStr & " User_Badge AS DESC1, " & Fields _
                '& " WHERE " & m_DateFilter & m_SelectedEntityList & " GROUP BY JOBTYPE, COMPUTERNAME, convert(char(10),DT_REQUESTED,121) " _
                '& " order by JOBTYPE DESC, COMPUTERNAME, convert(char(10),DT_REQUESTED,121)"
            ' MsgBox m_ReportSQL
             
            'SelectStr = "Select CASE Tran_Type WHEN 'Fund Adj' THEN 'Transaction' ELSE 'New Account' END AS Tran_Type,"
            'm_ReportSQL = SelectStr & " User_Badge AS DESC1, " & Fields _
            '    & " WHERE " & m_DateFilter & m_SelectedEntityList & " GROUP BY JOBTYPE, COMPUTERNAME, convert(char(10),DT_REQUESTED,121) " _
            '    & " order by JOBTYPE DESC, COMPUTERNAME, convert(char(10),DT_REQUESTED,121)"
                   
           ' MsgBox m_ReportSQL
             
             
        
            m_ControlKey = "DESC1"
            m_ControlHdg = "Location"
        
        End If

        If gDevMode = True Then
            Open gAppTraceFolder & "\SummarizedPrintCopyReportID" & Format(m_DisplayReportId, "00") & ".txt" For Output As #7
            Print #7, "/*" & Chr(9) & "SUMMARIZED PRINT COPY REPORT ID: " & Trim(m_DisplayReportId)
            Print #7, ""
            Print #7, m_ReportTitle & "  */"
            Print #7, ""
            'Print #7, m_ReportSQL
            'Print #7, ""
            Print #7, gObjDBConn.FormatSQL(m_ReportSQL)
            Close #7
        End If
        
        'Added by Jeff - the report 13 to handle the location request at a detailed level
        '06032009 added by Jeff - increased the number to a >=
        If m_ReportId <= 5 Or m_ReportId >= 13 Then
            Dim oRep As New rpt_PrintCopyReport
            With oRep
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOPortrait
               .WindowState = 2
               
               If gDevMode = True Then LogTrace ("Invoked report: rpt_PrintCopyReport")
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
               
               If gDevMode = True Then LogTrace ("Invoked report: rpt_PrintCopyTranAccSumm")
               .Show vbModal
            End With
            Set oRepTranSum = Nothing
        End If
            
        End If
        
    '//end of the summarised reports
    
    
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
        
        ElseIf m_ReportId = 13 Then
        'Added 08142008, by Jeff to handle the new report
              '--TRANSACTION DETAIL PER Location AND DATE
            OrderClause = " order by COMPUTERNAME, OU_NAME, ACC_BADGE_FULLNAME, JOBTYPE DESC, convert(char(10),DT_REQUESTED,121)"
            m_ControlKey = "COMPUTERNAME"   '"OU_Name"    '
            m_ControlHdg = "Location"       '"OU Name" '
            
            m_DescKey = "OU_Name"   '"COMUTERNAME"   '  'Location
            m_DescHdg = "OU Name"   '"Location"      '  'Location
        
        
        '//06032008
        ' added by Jeff to handle the transactions
        ElseIf m_ReportId = 14 Then
        'Added 08142008, by Jeff to handle the new report
              '--TRANSACTION DETAIL PER Location AND DATE
            OrderClause = " order by ACC_TRAN_ACC_BADGE, convert(char(10),ACC_TRAN_DT,121), ACC_TRAN_ACC_OU_NAME, ACC_TRAN_ACC_FullName"
            m_ControlKey = "ACC_TRAN_ACC_BADGE"   '"OU_Name"    '
            m_ControlHdg = "User Badge"       '"OU Name" '
            
        ElseIf m_ReportId = 15 Then
              '--TRANSACTION DETAIL PER Location AND DATE
            OrderClause = " order by ACC_TRAN_ACC_BADGE, convert(char(10),ACC_TRAN_DT,121), ACC_TRAN_ACC_OU_NAME, ACC_TRAN_ACC_FullName"
            m_ControlKey = "ACC_TRAN_ACC_BADGE"   '"OU_Name"    '
            m_ControlHdg = "User Badge"       '"OU Name" '
            m_DescKey = "ACC_TRAN_ACC_OU_NAME"   '"COMUTERNAME"   '  'Location
            m_DescHdg = "User OU"   '"Location"      '  'Location
        
        End If
        
        '//06032009
        'added by Jeff to handle the transaction
        If m_ReportId = 14 Then
            m_ReportSQL = "Select * from dbo.docugate_tran_acc_funds where " & m_DateFilter & m_SelectedEntityList & OrderClause
        Else
            m_ReportSQL = "Select * from dbo.docugate_activity_view where " & m_DateFilter & m_SelectedEntityList & OrderClause
        End If
        'MsgBox m_ReportSQL
        
        If gDevMode = True Then
            Open gAppTraceFolder & "\DetailedPrintCopyReportID" & Format(m_DisplayReportId, "00") & ".txt" For Output As #7
            Print #7, "/*" & Chr(9) & "DETAILED PRINT COPY REPORT ID: " & Trim(m_DisplayReportId)
            Print #7, ""
            Print #7, m_ReportTitle & "  */"
            Print #7, ""
            'Print #7, m_ReportSQL
            'Print #7, ""
            Print #7, gObjDBConn.FormatSQL(m_ReportSQL)
            Close #7
        End If

        'calls to initalize the active report
        If m_ReportId <= 5 Or m_ReportId = 8 Then
            Dim oRepDet As New rpt_PrintCopyDetail
            With oRepDet
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               
               If gDevMode = True Then LogTrace ("Invoked report: rpt_PrintCopyDetail")
               .Show vbModal
            End With
            Set oRep = Nothing
       'End If
       
       'added 08212008, by Jeff for detailed report callout
       ElseIf m_ReportId = 13 Then
            Dim oRepDet13 As New rpt_PrintCopyLocDetail
            With oRepDet13
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               
               If gDevMode = True Then LogTrace ("Invoked report: rpt_PrintCopyLocDetail")
               .Show vbModal
            End With
            Set oRep = Nothing
         
         '//06032009
         ' added by Jeff to handle the transaction report request
            ElseIf m_ReportId = 14 Then
            Dim oRepDet14 As New rpt_TranDetail
            With oRepDet14
               .PageLeftMargin = gReport_PO_RightMargin
               .PageRightMargin = gReport_LS_RightMargin
               .PageTopMargin = gReport_LS_TopMargin
               .PageBottomMargin = gReport_LS_BottomMargin
               .Printer.Orientation = ddOLandscape
               .WindowState = 2
               
               If gDevMode = True Then LogTrace ("Invoked report: rpt_TranDetail")
               .Show vbModal
            End With
            Set oRep = Nothing
            
         '//06092009
         ' added by Jeff to handle the transaction report request
            'ElseIf m_ReportId = 15 Then
            'Dim oRepDet15 As New rpt_TranDebitDetail
            'With oRepDet15
               '.PageLeftMargin = gReport_PO_RightMargin
               '.PageRightMargin = gReport_LS_RightMargin
               '.PageTopMargin = gReport_LS_TopMargin
               '.PageBottomMargin = gReport_LS_BottomMargin
               '.Printer.Orientation = ddOLandscape
               '.WindowState = 2
               
               'If gDevMode = True Then LogTrace ("Invoked report: rpt_TranDebitDetail")
               '.Show vbModal
            'End With
            'Set oRep = Nothing
                       
       End If
            
        'End If
        
    End If '// end of detailed reports
    Exit Sub
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Sub

