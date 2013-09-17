Attribute VB_Name = "Mod_MainGrid"
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

Public Sub GridReset(ByRef mgrid As vbalGrid)
    mgrid.Clear (True)
End Sub

Public Sub GridFilter(ByRef mgrid As vbalGrid)

Dim a, i As Integer

For a = 1 To mgrid.Rows
Next a


End Sub


Public Sub GridConsoleStatsSetup(ByRef mgrid As vbalGrid, StartDtStr As String, EndDtStr As String)

   With mgrid
      .Redraw = False
      .AddColumn "rowid", "rowid", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "statsid", "set", ecgHdrTextALignCentre, , 32
      .AddColumn "description", "statistic / measurement", ecgHdrTextALignLeft, , 200
      .AddColumn "startdate", "start dt", ecgHdrTextALignCentre, , 72
      .AddColumn "enddate", "end dt", ecgHdrTextALignCentre, , 72
      
      If (gObjLogonMngr.mLevel = CASHIER_LEVEL) Then
         .AddColumn "datadesc1", "description", ecgHdrTextALignLeft, , 240
      Else
         .AddColumn "datadesc1", "description", ecgHdrTextALignLeft, , 120
      End If
      
      
      .AddColumn "datavalue1", "value", ecgHdrTextALignRight, , 80
      .SetHeaders
      
      GridConsoleStatsPopulate mgrid, StartDtStr, EndDtStr
      
      .KeySearchColumn = .ColumnIndex("statsid")
      .Redraw = True
    End With
    
End Sub

Private Sub GridConsoleStatsPopulate(ByRef mgrid As vbalGrid, StartDtStr As String, EndDtStr As String)

On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
   
   Dim PrevStatsId As Long
   Dim CurColor As Variant
   
   Screen.MousePointer = vbHourglass
   Call gConn.Execute("exec dbo.get_console_stats '" & gObjLogonMngr.mBadge & "'," & StartDtStr & "," & EndDtStr & ",1")
   
   Set gRs = New ADODB.Recordset
   gRs.Open "Select * from dbo.docugate_report_consolestats where SessionName = '" & gObjLogonMngr.mBadge & "' " _
    & " order by statsid, rowid", gConn, adOpenStatic, adLockOptimistic
    
    PrevStatsId = gRs!statsid
        
    While Not gRs.EOF
        With mgrid
            If gRs!statsid <> PrevStatsId Then
                PrevStatsId = gRs!statsid
                If CurColor = vbWhite Then
                   CurColor = vbBlue
                Else
                   CurColor = vbWhite
                End If
            End If
            .AddRow
            .CellDetails .Rows, 1, gRs!RowId, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!statsid, DT_CENTER
            .CellDetails .Rows, 3, gRs!Description
            .CellDetails .Rows, 4, Format(nchk(gRs!StartDate), "mm/dd/yyyy"), , DT_CENTER
            .CellDetails .Rows, 5, Format(nchk(gRs!EndDate), "mm/dd/yyyy"), DT_CENTER
            .CellDetails .Rows, 6, nchk(gRs!DataDesc1)
            .CellDetails .Rows, 7, Format(numchk(gRs!DataValue1), "#,##0.00"), DT_RIGHT
        End With
        lRow = lRow + 1
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True

   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub

Public Sub GridUserConnSetup(ByRef mgrid As vbalGrid, Status As String, SType As String, Filter As String)

   With mgrid
      .Redraw = False
      .AddColumn "spid", "spid", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "sp_id", "spid", ecgHdrTextALignCentre, , 0
      .AddColumn "loginame", "login", ecgHdrTextALignLeft, , 0
      .AddColumn "hostname", "workstation", ecgHdrTextALignLeft, , 112
      .AddColumn "dbname", "dbname", ecgHdrTextALignLeft, , 80
      .AddColumn "status", "status", ecgHdrTextALignLeft, , 80
      .AddColumn "CPUTime", "CPU time", ecgHdrTextALignCentre, , 64
      .AddColumn "DiskIO", "disk IO", ecgHdrTextALignCentre, , 64
      .AddColumn "ProgramName", "application", ecgHdrTextALignLeft, , 256
      .SetHeaders
      
      GridUserConnPopulate mgrid, Status, SType, Filter
      
      .KeySearchColumn = .ColumnIndex("ProgramName")
      .Redraw = True
    End With
    
End Sub

Private Sub GridUserConnPopulate(ByRef mgrid As vbalGrid, Status As String, SType As String, Filter As String)
On Error GoTo Err_Handler
   
   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
   
   Call gConn.Execute("exec admin.dbo.Gsp_nrInfo '" & gObjLogonMngr.mBadge & "','" & Status & "','" & SType & "'")
   
   Set gRs = New ADODB.Recordset
   gRs.Open "Select * from admin.dbo.CurrentProcesses where SessionName = '" & gObjLogonMngr.mBadge & "' " _
    & Filter & " order by dbname desc, hostname", gConn, adOpenStatic, adLockOptimistic

    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!spid, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!spid, DT_CENTER
            .CellDetails .Rows, 3, gRs!loginame
            .CellDetails .Rows, 4, gRs!HostName
            .CellDetails .Rows, 5, gRs!DBName
            .CellDetails .Rows, 6, gRs!Status
            .CellDetails .Rows, 7, gRs!CPUTime, DT_CENTER
            .CellDetails .Rows, 8, gRs!DiskIO, DT_CENTER
            .CellDetails .Rows, 9, gRs!ProgramName
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub

Public Sub GridDBStatsSetup(ByRef mgrid As vbalGrid)
   With mgrid
      .Redraw = False
      .AddColumn "Table", "database table", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "Tablename", "database table", ecgHdrTextALignLeft, , 160
      .AddColumn "Rows", "record count", ecgHdrTextALignCentre, , 80
      .AddColumn "Reserved", "reserved(KB)", ecgHdrTextALignCentre, , 80
      .AddColumn "Data", "utilized(KB)", ecgHdrTextALignCentre, , 80
      .AddColumn "index_size", "index size(KB)", ecgHdrTextALignCentre, , 96
      .AddColumn "unused", "unused(KB)", ecgHdrTextALignCentre, , 80
      .SetHeaders
      
      GridDBStatsPopulate mgrid
      
      .KeySearchColumn = .ColumnIndex("Tablename")
      .Redraw = True
    End With
    
End Sub

Private Sub GridDBStatsPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
   
   Call gConn.Execute("exec admin.dbo.Gsp_SpaceUsed '" & gObjLogonMngr.mBadge & "','" & CurrentDatabase.DBName & "'")
   
   Set gRs = New ADODB.Recordset
   gRs.Open "Select * from admin.dbo.TableSpaceUsed where SessionName = '" & gObjLogonMngr.mBadge & "' order by data desc", gConn, adOpenStatic, adLockOptimistic

    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!Name, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!Name
            .CellDetails .Rows, 3, gRs!Rows, DT_CENTER
            .CellDetails .Rows, 4, gRs!reserved, DT_CENTER
            .CellDetails .Rows, 5, gRs!Data, DT_CENTER
            .CellDetails .Rows, 6, gRs!index_size, DT_CENTER
            .CellDetails .Rows, 7, gRs!unused, DT_CENTER
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub

Public Sub GridDBBackupLogSetup(ByRef mgrid As vbalGrid)
   With mgrid
      .Redraw = False
      .AddColumn "backup_set_id", "", ecgHdrTextALignCentre, , 32
      .AddColumn "backup_start_date", "backup date", ecgHdrTextALignLeft, , 140
      .AddColumn "database_name", "database", ecgHdrTextALignCentre, , 96
      .AddColumn "user_name", "user name", ecgHdrTextALignLeft, , 112
      .AddColumn "physical_device_name", "physical device name", ecgHdrTextALignLeft, , 480
      .SetHeaders
      
      GridDBBackupLogPopulate mgrid
      
      .KeySearchColumn = .ColumnIndex("database_name")
      .Redraw = True
    End With

    
End Sub

Private Sub GridDBBackupLogPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "Select backup_set_id, backup_start_date, database_name, user_name, physical_device_name" _
        & " from admin.dbo.v_BackupLog " _
        & " where database_name = '" & CurrentDatabase.DBName & "'" _
        & " ORDER BY database_name, backup_start_date desc ", gConn, adOpenStatic, adLockOptimistic
      
    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, "", DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!backup_start_date
            .CellDetails .Rows, 3, gRs!database_name, DT_CENTER
            .CellDetails .Rows, 4, gRs!user_name
            .CellDetails .Rows, 5, gRs!physical_device_name
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub




Public Sub GridReportsSetUp(ByRef mgrid As vbalGrid, TypeOfReports As Integer)
   
   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
   
   With mgrid
      .Redraw = False
      .AddColumn "DBId", "DBId", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "ReportId", "Report #", ecgHdrTextALignCentre, , 64
      .AddColumn "ReportDesc", "Description", ecgHdrTextALignLeft, , 384
      .SetHeaders
      
      '//Print and Copy reports
'      If TypeOfReports = 0 Then
'        GridReportsPrintCopyPopulate mgrid
'      ElseIf TypeOfReports = 1 Then
'          GridReportsCashierPopulate mgrid
'      ElseIf TypeOfReports = 2 Then
'          GridReportsCustomPopulate mgrid
'      End If
      If TypeOfReports = 0 Then
        GridReportsCashierPopulate mgrid
      ElseIf TypeOfReports = 1 Then
          GridReportsCashierPopulate mgrid
      ElseIf TypeOfReports = 2 Then
          GridReportsCashierPopulate mgrid
      End If
      
      .KeySearchColumn = .ColumnIndex("ReportId")
      .Redraw = True
    End With

End Sub

Private Sub GridReportsPrintCopyPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   With mgrid
        .AddRow
        .CellDetails .Rows, 1, 1, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "1", DT_CENTER
        .CellDetails .Rows, 3, uct("Global Dollar Sales and Volume by date")
        
        .AddRow
        .CellDetails .Rows, 1, 2, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "2", DT_CENTER
        .CellDetails .Rows, 3, uct("OU Dollar Sales and Volume by date")
        
        .AddRow
        .CellDetails .Rows, 1, 3, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "3", DT_CENTER
        .CellDetails .Rows, 3, uct("User Dollar Sales and Volume by date")
        
        .AddRow
        .CellDetails .Rows, 1, 4, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "4", DT_CENTER
        .CellDetails .Rows, 3, uct("Client Dollar Sales and Volume by date")
        
        .AddRow
        .CellDetails .Rows, 1, 5, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "5", DT_CENTER
        .CellDetails .Rows, 3, uct("Client with Matter Dollar Sales and Volume by date")
        
        .AddRow
        .CellDetails .Rows, 1, 8, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "6", DT_CENTER
        .CellDetails .Rows, 3, uct("Cost & Page Count Totals per Account by date")
       
       'Added 08142008, by Jeff to insert a new report into the grid
       .AddRow
        .CellDetails .Rows, 1, 13, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "7", DT_CENTER
        .CellDetails .Rows, 3, uct("Activity Location by date")
       
       'Added 06032009, by Jeff to insert a new report into the grid - Account Credit Transaction History
       .AddRow
        .CellDetails .Rows, 1, 14, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "8", DT_CENTER
        .CellDetails .Rows, 3, uct("Transaction History By Account")
       
       'Added 06082009, by Jeff to insert a new report in the grid  - Account Debit Transaction History
     '  .AddRow
     '   .CellDetails .Rows, 1, 15, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
     '   .CellDetails .Rows, 2, "9", DT_CENTER
     '   .CellDetails .Rows, 3, uct("Debit Transaction History By Account")
       
       'Added 01142010, by Peter to insert a new report in the grid  - Account Debit Transaction History
     '  .AddRow
     '   .CellDetails .Rows, 1, 16, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
     '   .CellDetails .Rows, 2, "10", DT_CENTER
     '   .CellDetails .Rows, 3, uct("Account/s Badge ID and Balance")
      
       
        .KeySearchColumn = .ColumnIndex("ReportDesc")
       .Redraw = True
   End With

   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub

Private Sub GridReportsCashierPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   With mgrid
   
        .AddRow
        .CellDetails .Rows, 1, 11, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "1", DT_CENTER
        .CellDetails .Rows, 3, uct("My daily activities")
        
        '.AddRow
        '.CellDetails .Rows, 1, 6, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        '.CellDetails .Rows, 2, "2", DT_CENTER
        '.CellDetails .Rows, 3, uct("Cashier Dollar Sales by date") 'Removed this report by Mike Young on 9/16/13
        'Commented out to remove defective cashier report by Mike Young on 8/18/13
'        .AddRow
'        .CellDetails .Rows, 1, 7, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
'        .CellDetails .Rows, 2, "3", DT_CENTER
'        .CellDetails .Rows, 3, uct("Cashier Adjusted Account Funds by date")
        
      '  .AddRow
      '  .CellDetails .Rows, 1, 9, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
      '  .CellDetails .Rows, 2, "4", DT_CENTER
      '  .CellDetails .Rows, 3, uct("Cashier Daily Cash-out Report")
        
    '    .AddRow
    '    .CellDetails .Rows, 1, 10, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
    '    .CellDetails .Rows, 2, "5", DT_CENTER
    '    .CellDetails .Rows, 3, uct("Cashier Daily Cash-in Report")
        
        .AddRow
        .CellDetails .Rows, 1, 12, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "6", DT_CENTER
        .CellDetails .Rows, 3, uct("Global Cashier Activity Report")
        
   End With
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
   
End Sub


Private Sub GridReportsCustomPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   With mgrid
        .AddRow
        .CellDetails .Rows, 1, 1, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "1", DT_CENTER
        .CellDetails .Rows, 3, uct("All Activity with Date Selection, Summarized by Client Code")
        
        .AddRow
        .CellDetails .Rows, 1, 2, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "2", DT_CENTER
        .CellDetails .Rows, 3, uct("All Accounts with current balance")
    
        .AddRow
        .CellDetails .Rows, 1, 3, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
        .CellDetails .Rows, 2, "3", DT_CENTER
        .CellDetails .Rows, 3, uct("All Activity with Date selection, Summarized by Account #")
      
   End With
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
   
End Sub


Public Sub GridClientSetUp(ByRef mgrid As vbalGrid)
  
   With mgrid
      .Redraw = False
      .AddColumn "ccGUID", "ccGUID", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "ccName", "Client name", ecgHdrTextALignLeft, , 160
      .AddColumn "ccCode", "Client code", ecgHdrTextALignCentre, , 96
      .AddColumn "ccDescription", "Description", ecgHdrTextALignLeft, , 192
      .AddColumn "ccEmail", "Email", ecgHdrTextALignLeft, , 160
      .SetHeaders
       GridClientPopulate mgrid
      .KeySearchColumn = .ColumnIndex("ccName")
      .Redraw = True
    End With

End Sub

Public Sub GridClientPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "SELECT * FROM dbo.docugate_general_cc", gConn, adOpenStatic, adLockOptimistic
      
    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!CC_GUID, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!CC_NAME
            .CellDetails .Rows, 3, gRs!CC_CODE, DT_CENTER
            .CellDetails .Rows, 4, gRs!CC_DESC
            .CellDetails .Rows, 5, gRs!CC_EMAIL
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub
Public Sub GridCashierAccSetUp(ByRef mgrid As vbalGrid, Filter As String)
  
   With mgrid
      .Redraw = False
      .AddColumn "accGUID", "accGUID", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "accAccount", "Account", ecgHdrTextALignLeft, , 72
      .AddColumn "accAccountFirstname", "First Name", ecgHdrTextALignLeft, , 82
      .AddColumn "accAccountLastName", "Last Name", ecgHdrTextALignLeft, , 82
      .AddColumn "accFullname", "Full name", ecgHdrTextALignLeft, , 132
      .AddColumn "accOU", "OU name", ecgHdrTextALignLeft, , 132
'      .AddColumn "accAccType", "Acc type", ecgHdrTextALignCentre, , 80
'      .AddColumn "accAccType", "", ecgHdrTextALignCentre, , 0
      .AddColumn "accSiteCode", "Site code", ecgHdrTextALignCentre, , 80
      .AddColumn "accBalance", "Balance", ecgHdrTextALignRight, , 80
      .AddColumn "accAvailability", "Availabiity", ecgHdrTextALignCentre, , 85
   '   .AddColumn "accDtCheckedOut", "Date Checked OUT", ecgHdrTextALignLeft, , 10
      .SetHeaders
      
       GridCashierAccPopulate mgrid, Filter
      .KeySearchColumn = .ColumnIndex("accAccount")
      .Redraw = True
    End With

End Sub


Public Sub GridAccountSetUp(ByRef mgrid As vbalGrid)
  
   With mgrid
      .Redraw = False
      .AddColumn "accGUID", "accGUID", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "accAccount", "Account", ecgHdrTextALignLeft, , 80
      .AddColumn "accFirstname", "First name", ecgHdrTextALignLeft, , 96
      .AddColumn "accLastname", "Last name", ecgHdrTextALignLeft, , 96
      .AddColumn "accOU", "OU name", ecgHdrTextALignLeft, , 96
      .AddColumn "accStatus", "Status", ecgHdrTextALignLeft, , 80
'      .AddColumn "accAccType", "Account type", ecgHdrTextALignLeft, , 96
'      .AddColumn "accAccType", "", ecgHdrTextALignLeft, , 0
      .AddColumn "accSiteCode", "Site code", ecgHdrTextALignLeft, , 96
      .AddColumn "accBalance", "Balance", ecgHdrTextALignLeft, , 112
      .SetHeaders
       GridAccountsPopulate mgrid
      .KeySearchColumn = .ColumnIndex("accAccount")
      .Redraw = True
    End With
End Sub


Private Sub GridCashierAccPopulate(ByRef mgrid As vbalGrid, Filter As String)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "SELECT * FROM dbo.docugate_cashier_acc_view join dbo.docugate_general_acc " & "ON ACC_GUID=ACC_ACC_GUID " & "WHERE ACC_ACCESS_LEVEL !=3 " & Filter, gConn, adOpenStatic, adLockOptimistic
      
    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!ACC_GUID, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!acc_badge
            .CellDetails .Rows, 3, gRs!acc_firstname
            .CellDetails .Rows, 4, gRs!acc_lastname
            .CellDetails .Rows, 5, gRs!ACC_FULLNAME
            .CellDetails .Rows, 6, gRs!OU_NAME
'            .CellDetails .Rows, 7, uct(gRs!ACC_TYPE), DT_CENTER
            .CellDetails .Rows, 7, gRs!ACC_SITECODE & " "
            .CellDetails .Rows, 8, "$" & Format(gRs!acc_funds, "#,##0.00"), DT_RIGHT
            .CellDetails .Rows, 9, gRs!ACC_AVAIL_STATUS, DT_CENTER
        '    If Not IsNull(gRs!DT_CHKOUT) Then .CellDetails .Rows, 10, gRs!DT_CHKOUT, DT_CENTER
        
        
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
    
End Sub


Public Sub GridAccountsPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "SELECT * FROM dbo.docugate_acc_view JOIN dbo.docugate_general_acc ON docugate_acc_view.ACC_ACC_GUID = docugate_general_acc.ACC_ACC_GUID ORDER BY docugate_acc_view.ACC_BADGE", gConn, adOpenStatic, adLockOptimistic
      
   While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!ACC_GUID, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!acc_badge
            .CellDetails .Rows, 3, gRs!acc_firstname
            .CellDetails .Rows, 4, gRs!acc_lastname
            .CellDetails .Rows, 5, gRs!OU_NAME
            .CellDetails .Rows, 6, nchk(gRs!ACC_STATUS), DT_CENTER
'            .CellDetails .Rows, 7, uct(gRs!ACC_TYPE), DT_CENTER
            .CellDetails .Rows, 7, gRs!ACC_SITECODE & " "
            .CellDetails .Rows, 8, "$" & Format(gRs!acc_funds, "#,##0.00"), DT_RIGHT
        End With
        gRs.MoveNext
        DoEvents
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub




Public Sub GridCtrlUnitSetUp(ByRef mgrid As vbalGrid)
    
   With mgrid
      .Redraw = False
      .AddColumn "CtrlUnitGUID", "CtrlUnit GUID", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "SerialNo", "Nickname", ecgHdrTextALignLeft, , 132
      .AddColumn "Description", "Description", ecgHdrTextALignLeft, , 160
      .AddColumn "Location", "Location", ecgHdrTextALignLeft, , 132
      .AddColumn "Status", "Status", ecgHdrTextALignLeft, , 132
      .AddColumn "TerminalType", "Terminal type", ecgHdrTextALignLeft, , 100
      .AddColumn "TerminalTypeID", "Terminal Type ID", ecgHdrTextALignLeft, , 0
      .SetHeaders
      GridCtrlUnitPopulate mgrid
      .KeySearchColumn = .ColumnIndex("Description")
      .Redraw = True
    End With

End Sub

Public Sub GridCtrlUnitPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "SELECT * FROM dbo.docugate_ctlunit_view", gConn, adOpenStatic, adLockOptimistic
      
    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!CTLUNIT_GUID, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, nchk(gRs!CTLUNIT_SERIAL_NO)
            .CellDetails .Rows, 3, nchk(gRs!CTLUNIT_DESCRIPTION)
            .CellDetails .Rows, 4, nchk(gRs!CTLUNIT_LOCATION)
            .CellDetails .Rows, 5, uct(nchk(gRs!CTLUNIT_STATUS))
             
             Select Case nchk(gRs!CTLUNIT_TERMINALTYPE)
             Case "1"
                   .CellDetails .Rows, 6, "Smart Type 1"
             Case "2"
                   .CellDetails .Rows, 6, "SmartDCS"
             Case "3"
                   .CellDetails .Rows, 6, "Smart Type 2"
             Case "4"
                   .CellDetails .Rows, 6, "Smart Type 3"
             End Select
        
             .CellDetails .Rows, 7, nchk(gRs!CTLUNIT_TERMINALTYPE)
                
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub

Public Sub GridOUSetUp(ByRef mgrid As vbalGrid)
    
   With mgrid
      .Redraw = False
      
      .AddColumn "ouGUID", "OU GUID", ecgHdrTextALignLeft, , gReportsGUIDWidth
      .AddColumn "ouNAME", "OU Name", ecgHdrTextALignLeft, , 96
      .AddColumn "ouDESCRIPTION", "Description", ecgHdrTextALignLeft, , 128
      .AddColumn "ouCHARGE", "Charge", ecgHdrTextALignCentre, , 64
      .AddColumn "ouDEFAULT_CLIENT", "Default Client", ecgHdrTextALignLeft, , 128
      .AddColumn "ouDEFAULT_MATTER", "Default Matter", ecgHdrTextALignLeft, , 128
      
      .AddColumn "ouPRN_MULTIPLR", "Print Multiplier", ecgHdrTextALignRight, , 112
      .AddColumn "ouCPY_MULTIPLR", "Copy Multiplier", ecgHdrTextALignRight, , 96
      
      .AddColumn "ouLOWBALANCE", "Low Bal", ecgHdrTextALignRight, , 64
      .AddColumn "ouTHRESHOLD", "Threshold", ecgHdrTextALignLeft, , 64
      .AddColumn "ouLOWBAL_TITLE", "Low Bal Title", ecgHdrTextALignLeft, , 128
      .AddColumn "ouLOWBAL_MSGTXT", "Low Bal Msg", ecgHdrTextALignLeft, , 128
      .AddColumn "ouLOCKED", "Locked", ecgHdrTextALignCentre, , 72
      .AddColumn "ouCODES", "Allow Codes", ecgHdrTextALignCentre, , 80
      .AddColumn "ouALLOWNEG", "Allow Neg", ecgHdrTextALignCentre, , 72
      
      .SetHeaders
      GridOUPopulate mgrid
      .KeySearchColumn = .ColumnIndex("ouNAME")
      .Redraw = True
    End With

End Sub


Public Sub GridOUPopulate(ByRef mgrid As vbalGrid)
On Error GoTo Err_Handler

   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Arial Narrow"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "SELECT * FROM dbo.DOCUGATE_OU_VIEW order by OU_NAME", gConn, adOpenStatic, adLockOptimistic
      
    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!OU_GUID, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!OU_NAME
            .CellDetails .Rows, 3, gRs!OU_DESCRIPTION
            .CellDetails .Rows, 4, gRs!OU_CHARGE, DT_CENTER
            .CellDetails .Rows, 5, gRs!OU_DEFAULT_CLIENT
            .CellDetails .Rows, 6, gRs!OU_DEFAULT_MATTER
            
            .CellDetails .Rows, 7, Format(gRs!OU_PRN_MULTIPLR, "#,##0.00"), DT_RIGHT
            .CellDetails .Rows, 8, Format(gRs!OU_CPY_MULTIPLR, "#,##0.00"), DT_RIGHT
            
            .CellDetails .Rows, 9, "$" & Format(gRs!OU_LOWBALANCE, "#,##0.00"), DT_RIGHT
            .CellDetails .Rows, 10, gRs!OU_THRESHOLD
            .CellDetails .Rows, 11, gRs!OU_LOWBAL_TITLE
            .CellDetails .Rows, 12, gRs!OU_LOWBAL_MSGTXT
            .CellDetails .Rows, 13, gRs!OU_LOCKED, DT_CENTER
            .CellDetails .Rows, 14, gRs!OU_CODES, DT_CENTER
            .CellDetails .Rows, 15, gRs!OU_ALLOWNEG, DT_CENTER
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub


