VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_PrintCopyTranAccDet 
   Caption         =   "DocuGate - rpt_PrintCopyTranAccDet (ActiveReport)"
   ClientHeight    =   8535
   ClientLeft      =   570
   ClientTop       =   1815
   ClientWidth     =   12975
   _ExtentX        =   22886
   _ExtentY        =   15055
   SectionData     =   "rpt_PrintCopyTranAccDet.dsx":0000
End
Attribute VB_Name = "rpt_PrintCopyTranAccDet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim rs As New ADODB.Recordset

Dim PrevJobType As String
Dim TotGroupCnt As Long
Dim TotGroupCost As Double
Dim TotGrandCnt As Long
Dim TotGrandCost As Double

Private Sub ActiveReport_ReportEnd()
    rs.Close
End Sub

Private Sub ActiveReport_ReportStart()

    Me.Caption = "Print / Copy Report"
    Me.txtTitle.Text = "DETAILED " & gClsReports.ReportTitle
    rs.Open gClsReports.ReportSQL, gConn, adOpenForwardOnly, adLockReadOnly
    
    TotGroupCnt = 0
    TotGroupCost = 0
    TotGrandCnt = 0
    TotGrandCost = 0
    
    If rs.EOF = False Then
        Me.GroupHeader1.GrpKeepTogether = ddGrpFirstDetail
        Me.GroupHeader1.GroupValue = rs!JobType
        txtJobType.Text = rs!JobType & " JOBS"
        PrevJobType = rs!JobType
    End If
    
End Sub

Private Sub Detail_Format()
    
    If rs.EOF = False Then
    
        If PrevJobType <> rs!JobType Then
            Me.GroupHeader1.GrpKeepTogether = ddGrpFirstDetail
            Me.GroupHeader1.GroupValue = rs!JobType
            txtJobType.Text = rs!JobType & " JOBS"
            PrevJobType = rs!JobType
            
            Me.txtLabelTotalGroupCount.Text = Replace(txtLabelTotalGroupCount.Text, "<Job Type>", rs!JobType)
            Me.txtLabelTotalGroupCost.Text = Replace(txtLabelTotalGroupCost.Text, "<Job Type>", rs!JobType)
            
            Me.txtTotalGroupCount.Text = numchk(TotGroupCnt)
            Me.txtTotalGroupCost.Text = "$" & Format(numchk(TotGroupCost), "#,##0.00")
    
            TotGroupCnt = 0
            TotGroupCost = 0
            
        End If
    
        Me.txtAcc.Text = rs!ACC_BADGE
        Me.txtFullname.Text = rs!ACC_FULLNAME
        Me.txtTranDt = Format(rs!TranDate, "mm/dd/yyyy")
        Me.txtPages = rs!SumPageCnt
        Me.txtCost = "$" & Format(numchk(rs!SumJobCost), "#,##0.00")
        Me.Detail.PrintSection
        
        TotGroupCnt = TotGroupCnt + rs!SumPageCnt
        TotGroupCost = TotGroupCost + rs!SumJobCost
        TotGrandCnt = TotGrandCnt + rs!SumPageCnt
        TotGrandCost = TotGrandCost + rs!SumJobCost
                
        rs.MoveNext
    End If
    
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub

Private Sub ReportFooter_Format()
    Me.txtTotalGrandCount.Text = numchk(TotGrandCnt)
    Me.txtTotalGrandCost.Text = "$" & Format(numchk(TotGrandCost), "#,##0.00")
End Sub

Private Sub ReportHeader_Format()
    Me.lblReportDt.Caption = Format(Now(), "mm/dd/yyyy hh:mm")
End Sub

