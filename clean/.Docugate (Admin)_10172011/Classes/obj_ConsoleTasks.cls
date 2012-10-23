VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_ConsoleTasks"
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
Private m_LastError As String
Const ErrCodePrefix = "012-"
Private m_rs As ADODB.Recordset
Private m_Classname As String

Private Sub Class_Initialize()
    m_Classname = "obj_ConsoleTasks"
End Sub

Public Function GetLastBackupDate() As Variant
On Error GoTo Err_Handler
    GetLastBackupDate = GetSQLValue("select max(backup_start_date) from admin.dbo.v_BackupLog " _
        & " where database_name = '" & CurrentDatabase.DBName & "'")
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
End Function

Public Function GetLastBackupFile() As Variant

    GetLastBackupFile = GetSQLValue("Select physical_device_name from admin.dbo.v_BackupLog " _
        & " where database_name = '" & CurrentDatabase.DBName & "'" _
        & " and backup_start_date = (" _
        & " select max(backup_start_date) from admin.dbo.v_BackupLog where database_name " _
        & " = '" + CurrentDatabase.DBName & "')")
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
        
End Function

Public Function GetDBVersion() As String
    GetDBVersion = Replace(GetSQLValue("Select @@Version"), Chr(10), vbCrLf)
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description

End Function

Public Function GetServername() As String
    GetServername = Replace(GetSQLValue("Select @@Servername"), Chr(10), vbCrLf)
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description

End Function

Public Function GetAvailDiskSpace(cbo As ListBox)
    cbo.Clear
    Dim rs As New ADODB.Recordset
    rs.Open "exec master.dbo.xp_fixeddrives", gConn, adOpenForwardOnly, adLockReadOnly
    While rs.EOF = False
        cbo.AddItem "Drive [" & rs(0) & ":\]   " & rs(1) & " MB free"
        rs.MoveNext
    Wend
    rs.Close
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
    
End Function

Public Function GetDBInfo() As String
On Error GoTo Err_Handler

    Dim rs As New ADODB.Recordset
    rs.Open "exec sp_helpdb " & CurrentDatabase.DBName, gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
        GetDBInfo = GetDBInfo & vbCrLf & "Server:  " & GetServername & "  Database: " & rs("name") & vbCrLf _
            & "Size: " & Trim(rs("db_size")) & "  Created: " & Trim(rs("created")) & vbCrLf _
            & vbCrLf & rs("status")
    End If
    rs.Close
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
    
End Function

Public Function GetQuickStats(f As Frm_Main)

If gMonitorStats = False Then Exit Function

On Error GoTo Err_Handler

    Dim StartDtVar As Variant
    Dim EndDtVar As Variant
    
    If f.cboDtPeriod.ListIndex <= 0 Then
        '//today
        StartDtVar = Now()
        EndDtVar = Now()
        
    ElseIf f.cboDtPeriod.ListIndex = 1 Then
        '//this month
        StartDtVar = DateSerial(Year(Date), Month(Date), 1)
        EndDtVar = Now()
    
    ElseIf f.cboDtPeriod.ListIndex = 2 Then
        '//previous month
        StartDtVar = DateAdd("m", -1, Date)
        StartDtVar = DateSerial(Year(StartDtVar), Month(StartDtVar), 1)
        EndDtVar = DateSerial(Year(StartDtVar), Month(StartDtVar) + 1, 0)
    
    ElseIf f.cboDtPeriod.ListIndex = 3 Then
        '//this year
        StartDtVar = DateSerial(Year(Date), 1, 1)
        EndDtVar = Now()
    End If
    
    Screen.MousePointer = vbHourglass
    Call gConn.Execute("exec dbo.get_quick_stats '" & gObjLogonMngr.mBadge & "'," & SQLDate(StartDtVar) & "," & SQLDate(EndDtVar))
   
    Set gRs = New ADODB.Recordset
    gRs.Open "Select * from dbo.docugate_report_quickstats where SessionName = '" & gObjLogonMngr.mBadge & "' " _
      & " order by RowId", gConn, adOpenStatic, adLockOptimistic
    While gRs.EOF = False
        With f
            Select Case gRs!RowId
               Case 1 '0=Total Sales Count
                .lbQVal(0) = Format(gRs!DataValue1, "#,##0")
                            
               Case 2 '1=Total Sales Dollar Value
                .lbQVal(1) = "$" & Format(gRs!DataValue1, "#,##0.00")
                
               Case 3 '2=Top Cashier Sales
                .lblQStat(2).Caption = "Top Cashier at Sales: " & gRs!DataDesc1
                .lbQVal(2) = "$" & Format(gRs!DataValue1, "#,##0.00")
                
               Case 4 '3=Top OU Cost
                .lblQStat(7).Caption = "Top Client at Cost: " & gRs!DataDesc1
                .lbQVal(7) = "$" & Format(gRs!DataValue1, "#,##0.00")
               
               Case 5 '4=
                 .lblQStat(8).Caption = "Top OU at Cost: " & gRs!DataDesc1
                .lbQVal(8) = "$" & Format(gRs!DataValue1, "#,##0.00")
               
               Case 6
                .lbQVal(9) = gRs!DataValue1
                
               Case 7
                .lbQVal(12) = gRs!DataValue1
                                
               Case 8
                .lbQVal(3) = gRs!DataValue1
                
               Case 9
                .lbQVal(4) = gRs!DataValue1
                
               Case 10 'walkin-accounts'
                .lbQVal(6) = gRs!DataValue1
                
               Case 11 'permanent'
                .lbQVal(5) = gRs!DataValue1
              
               Case 12 'Client Highest Avg Dollar Sales
                .lblQStat(16) = "Top Client Highest Avg Cost: " & gRs!DataDesc1
                .lbQVal(16) = "$" & Format(gRs!DataValue1, "#,##0.00")
                
               Case 13 '# OF USERS
                .lbQVal(13) = gRs!DataValue1
                
               Case 14 '# OF CASHIERS
                .lbQVal(14) = gRs!DataValue1
                
               Case 15 '# OF ADMINISTRATORS
                .lbQVal(15) = gRs!DataValue1
                
            End Select
        End With
        gRs.MoveNext
   Wend
   gRs.Close
   
   Dim dtBackup As Variant
   dtBackup = GetLastBackupDate()
   f.lbQVal(10).Caption = Format(dtBackup, "mm/dd/yyyy hh:mm")
   f.lbQVal(11).Caption = Format(DateAdd("d", 7, dtBackup), "mm/dd/yyyy")
   
   Screen.MousePointer = vbNormal
   Exit Function
     
Err_Handler:
   Screen.MousePointer = vbNormal
   m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description

End Function


