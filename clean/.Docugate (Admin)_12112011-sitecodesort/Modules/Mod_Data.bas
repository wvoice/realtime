Attribute VB_Name = "Mod_Data"
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

Public gInitialized As Boolean
Public gAppVersion As String
Public gApplication As String
Public gAppName As String
Public gVersion As String
Public gAppIniPath As String
Public gMcrIniPath As String
Public gAvsIniPath As String

'//17/06/2008
Public gAppTraceFolder As String

Public gObjDBConn As obj_DBConnection
Public gObjAccountMngr As obj_AccountMngr
Public gObjOuMngr As obj_OUMngr
Public gObjClientMngr As obj_ClientMngr
Public gObjMatterMngr As obj_MatterMngr
Public gObjLogonMngr As obj_LogonMngr


'//Lynette
Public gObjIni As obj_IniSettings
Public gObjCtrlParams As obj_CtrlParams
Public gObjCtrlUnitMngr As obj_CtrlUnitMngr
Public gClsReports As obj_Reports
Public gObjGlobals As obj_Globals
Public gObjSpc As obj_spc
Public gObjConsoleTasks As obj_ConsoleTasks
'//
                
        
'// ver 3.0.4
Public gObjFormEvent As obj_FormEvent
'.//

Public gConn As ADODB.Connection

Public Type CURRENT_ACCOUNT
    m_BADGE As String
    m_PASSWORD As String
    m_FIRSTNAME As String
    m_LASTNAME As String
    m_FULLNAME As String
    m_EMAIL As String
    m_ACCESS_LEVEL As String
    m_OU_GUID As String
    m_ACCOUNT_GUID As String
    m_TERMINATE As String
    m_CMETHOD As String
    m_FUNDS As String
    m_VALID As Boolean
End Type

Type CURRENT_DATABASE
    servername As String
    DBName As String
    DBLogin As String
    Password As String
    MSDE As String
    CONNSTR As String
End Type

Enum Access_Level
    USER_LEVEL = 1 ' USER
    CASHIER_LEVEL = 2 ' CASHER
    ADMIN_LEVEL = 3 ' ADMIN
End Enum

'// Lynette - read from the ini file and allow
'// the user to specify 1 = show picture icons and 0 = hide picture icons
'// when 1 then the pictures in the image view will be displayed
'// when 0 then the default icon that Peter originally had is displayed
'// my pictures may be a bit over the top for a very corporate company
'// this feature allows us to switch the icons between customers

Public Type TITLEBAR_ICONS_SHOW
    m_OU As String
    m_Accounts As String
    m_CLIENTS As String
    m_CTRLUNIT As String
    m_REPORTS As String
    m_CASHIER As String
    m_CONSOLE As String
End Type

Public CurrentDatabase   As CURRENT_DATABASE

'//Lynette
Public MyTitleBarIconsShow As TITLEBAR_ICONS_SHOW

'//Added by Lynette Austin
Public gComputername As String
Public gDevMode As Boolean
Public gRs As ADODB.Recordset

'//Added by Lynette Austin
Public Const gcAddRecord = 1
Public Const gcUpdateRecord = 2
Public Const gcDeleteRecord = 3
Public Const gcViewRecord = 4

'//Added by Lynette Austin
Public Const gReport_PO_RightMargin = 800
Public Const gReport_LS_LeftMargin = 200
Public Const gReport_LS_RightMargin = 200
Public Const gReport_LS_TopMargin = 800
Public Const gReport_LS_BottomMargin = 500
Public gReceiptNo As String
Public gTerminalTypes(10) As String
Public MyStationsPath As String
Public gReportsGUIDWidth As Integer

'//
Public Const gcCashNoInstr = -1
Public Const gcCashIN = 0
Public Const gcCashOUT = 1
Public Const gcCashINPrintReceipt = 2
Public Const gcCashDoPrintCopyJobs = 3

Public Const gcOperCodeLoadDetail = "001-"
Public Const gcOperCodeAddNew = "002-"
Public Const gcOperCodeUpdate = "003-"
Public Const gcOperCodeDelete = "004-"
Public Const gcOperCodeShowDetail = "005-"
Public Const gcOperCodeExists = "006-"
Public Const gcOperCodeSetDefaults = "007-"
Public Const gcOperCodeAdjustFunds = "008-"
Public Const gcOperCodeCheckOut = "009-"
Public Const gcOperCodeCheckIn = "010-"
Public Const gcOperCodeDBConnect = "011-"
Public Const gcOperCodeDBDrop = "012-"
Public Const gcOperCodeDBBackup = "013-"
Public Const gcOperCodeDBAddBackupFolder = "014-"
Public Const gcOperCodeDBDelBackupFolder = "015-"
Public Const gcOperCodeDBRestore = "016-"
Public Const gcOperCodeDBScript = "017-"
Public Const gcOperCodeDBDataExport = "018-"
Public Const gcOperCodeUnloadDetail = "019-"
Public Const gcOperCodeRefreshGridView = "020-"
Public Const gcOperCodeAdhocQuery = "021-"
Public Const gcOperCodeKillProcess = "022-"

Public gMonitorStats As Boolean
'//
Public Const gcFeatureNotAvailable = "This feature is not yet enabled!"

Public Function SQLDate(DtValue As Variant) As String
    SQLDate = "'" & Format(Year(DtValue), "0000") + "-" + Format(Month(DtValue), "00") + "-" & Format(Day(DtValue), "00") & "'"
End Function

Public Function RemoveQuotes(InputVar As String) As String
    '// remove single and double quotes from a string used as a search clause in SQL
    '// ADO does not like quotes
    RemoveQuotes = Replace(Replace(InputVar, Chr(39), Chr(96)), Chr(34), Chr(96))
End Function

Public Function LoadChargeType(combo As Control)
    combo.Clear
    combo.AddItem "CREDIT"
    combo.AddItem "DEBIT"
    '10272008 - changed to remove the space between the NO CHARGE item.
    combo.AddItem "NOCHARGE"
End Function

Public Function LoadAccountType(combo As Control)
    combo.Clear
    combo.AddItem "PERMANENT"
    combo.AddItem "WALK-IN"
End Function

Public Function LoadComboFromSQL(sql As String, combo As Control)
    
    combo.Clear
    Dim rs As New ADODB.Recordset
    rs.Open sql, gConn, adOpenForwardOnly, adLockReadOnly
    While rs.EOF = False
        combo.AddItem UCase(Trim(nchk(rs(0))))
        rs.MoveNext
    Wend
    rs.Close
    
End Function

Public Function GetSQLDateTime() As Variant

    Dim rs As New ADODB.Recordset
    rs.Open "SELECT SysDateTime=getdate()", gConn, adOpenForwardOnly, adLockReadOnly
    GetSQLDateTime = rs(0)
    rs.Close
    
    Set rs = Nothing
End Function

Public Function GetSQLValue(sql As String) As Variant

    Dim rs As New ADODB.Recordset
    rs.Open sql, gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = True Then
        GetSQLValue = Null
    Else
        GetSQLValue = rs(0)
    End If
    rs.Close

End Function

Public Function RunSQL(sql As String) As Boolean

    On Error GoTo handler
    RunSQL = True
    gConn.Execute sql
    
handler:
    
    If (Err.Number <> 0) Then
        RunSQL = False
        Err.Clear
    End If
    
End Function


Public Function nchk(InputVar As Variant) As String
    If IsNull(InputVar) Then
        nchk = ""
    Else
        nchk = InputVar
    End If
End Function

Public Function unchk(InputVar As Variant) As String
    If IsNull(InputVar) Then
        unchk = ""
    Else
        unchk = UCase(Trim(InputVar))
    End If
End Function

Public Function numchk(InputVar As Variant) As Variant
    If IsNull(InputVar) Then
        numchk = 0
    Else
        numchk = InputVar
    End If
End Function

Public Function uct(InputVar As String) As String
    uct = UCase(Trim(InputVar))
End Function

Public Function RemoveCurrency(InputVar As String) As String
    Dim t As String
    t = Trim(InputVar)
    
    'MsgBox "input value = " & Trim(InputVar)
    
    t = Replace(t, "$", "")
    
    'MsgBox "removing $ sign = " & t
    
    RemoveCurrency = Replace(t, ",", "")
    
    'MsgBox "removing ,'s & .'s = " & RemoveCurrency
    
End Function

Sub HighLightField(cControl As Control)
'-- On the gotfocus() event of a text box, call this routine to highlight the text.
     cControl.SelStart = 0
     cControl.SelLength = Len(Trim(cControl.Text))
End Sub

Public Function nchkYesNo(InputVar As Variant) As Boolean
    
    If IsNull(InputVar) Then
       nchkYesNo = False
    Else
       Dim t As String
       t = Trim(UCase(InputVar))
       If t = "1" Then
          nchkYesNo = True
       ElseIf Mid(t, 1, 1) = "Y" Then
          nchkYesNo = True
       ElseIf Mid(t, 1, 4) = "TRUE" Then
          nchkYesNo = True
       Else
          nchkYesNo = False
       End If
    End If
       
End Function

Public Function BoolToYesNo(InputVar As Boolean) As String
'//17/06/2008 - added this function
    If InputVar = True Then
        BoolToYesNo = "Yes"
    Else
        BoolToYesNo = "No"
    End If
End Function
