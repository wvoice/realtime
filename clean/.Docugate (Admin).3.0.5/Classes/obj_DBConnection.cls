VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_DBConnection"
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
        
Private m_Classname As String
Private m_LastError As String
Const ErrCodePrefix = "009-"

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Private Sub Class_Initialize()
    m_Classname = "obj_DBConnection"
End Sub

Public Function GetConnStrForRestore() As String
 With CurrentDatabase
   GetConnStrForRestore = "Provider=SQLOLEDB" & ";SERVER=" & .servername & ";DATABASE=ADMIN" _
                & ";UID=" & .DBLogin & ";PWD=" & .Password & ";"
 End With
End Function

Public Function FormatSQL(JumbledSql As String) As String

  Dim sPurtySql As String
  sPurtySql = JumbledSql

  '//find and replace all the "," with carriage returns & commas
  sPurtySql = Replace(sPurtySql, ", ", ",")
  sPurtySql = Replace(sPurtySql, ",", "," & vbCrLf & vbTab)

  '//move FROM, WHERE, ORDER BY, GROUP BY down by 2 lines
  sPurtySql = Replace(sPurtySql, " FROM ", vbCrLf & "FROM ")
  sPurtySql = Replace(sPurtySql, " WHERE ", vbCrLf & "WHERE ")
  sPurtySql = Replace(sPurtySql, " ORDER BY ", vbCrLf & "ORDER BY ")
  sPurtySql = Replace(sPurtySql, " GROUP BY ", vbCrLf & "GROUP BY ")
  sPurtySql = Replace(sPurtySql, " VALUES", vbCrLf & "VALUES")
  sPurtySql = Replace(sPurtySql, " SET ", vbCrLf & "SET ")

  sPurtySql = Replace(sPurtySql, " AND ", vbCrLf & vbTab & "AND ")
  sPurtySql = Replace(sPurtySql, " or ", vbCrLf & vbTab & " OR ")

'//change keywords to upper case
  sPurtySql = Replace(sPurtySql, "SELECT ", "SELECT ")
  sPurtySql = Replace(sPurtySql, "UPDATE ", "UPDATE ")
  sPurtySql = Replace(sPurtySql, "DELETE ", "DELETE ")
  sPurtySql = Replace(sPurtySql, "INSERT ", "INSERT ")

  FormatSQL = uct(sPurtySql)
End Function

Public Function ConnectDB() As Boolean
             
On Error GoTo Err_Handler

    gMonitorStats = False
    
    ConnectDB = False
    
    If gConn Is Nothing Then
        Set gConn = New ADODB.Connection
    End If
        
    If gConn.State = adStateClosed Then
        gConn.CursorLocation = adUseClient
        With CurrentDatabase

            '// 23/05/2008 - mostly login with the credentials below some sites may not want a vendor application to be running under the sa account
            '// 04292009
            '// commented out by Jeff to support the RTT login
            '.DBLogin = "DocuGate"
            .DBLogin = "RTT"
            .Password = "Qwerty#1"

            gObjIni.ReadIniSetting ("DATABASE")
            
            '// 08/04/2008 - allow for a user defined connection string in case
            '// there are problems connecting with the default provider
            
            gObjIni.ReadIniSetting ("CONNECTION")
            
            '// if no connection string was provided in the ini file, then use the
            '// default SQLOLEDB provider and build the connection string below
            '// the entry in the ini file does not include the password
            If .CONNSTR = "" Then
                .CONNSTR = "Provider=SQLOLEDB" & ";SERVER=" & .servername & ";DATABASE=" & .DBName & ";UID=" & .DBLogin
            End If
         
            gConn.ConnectionString = .CONNSTR & ";PWD=" & .Password & ";"
            
        End With
        gConn.Open
        
        '// 23/05/2008 - once connected, determine the edition of the sql server database server
        '// specifically whether the backup database is an msde edition.
        '// For MSDE the user needs to make backups and have rights to do so
        '    If Trim(.MSDE) = "1" Then
        '        .DBLogin = "sa"
        '        .Password = "Qwerty#1"
        '    Else
    End If
    

       
    gMonitorStats = True
    ConnectDB = True
    Exit Function

Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeDBConnect + Err.Description
End Function

Public Function CloseDB() As String

On Error Resume Next
    
    If gConn Is Nothing Then Exit Function
    If gConn.State = adStateOpen Then
        gConn.Close
    End If
    
    gMonitorStats = False
    Set gConn = Nothing

End Function

Private Sub Class_Terminate()
    Call CloseDB
End Sub


Private Sub Admin303Schema()

Dim sql As String
sql = "CREATE VIEW DOCUGATE_COMPUTERNAME AS SELECT DISTINCT(COMPUTERNAME) FROM DOCUGATE_GENERAL_ACTIVITY ORDER BY COMPUTERNAME"

End Sub

