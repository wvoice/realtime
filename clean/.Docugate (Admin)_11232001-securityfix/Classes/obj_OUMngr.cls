VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_OUMngr"
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

Private m_rs As ADODB.Recordset
Private m_cmd As ADODB.Command
Private m_LastError As String
Private m_Classname As String
Private m_TranOper As Integer
Private m_RecordGUID As String
Const ErrCodePrefix = "001-"

Public Property Get TranOper() As Integer
    TranOper = m_TranOper
End Property

Public Property Get RecordGUID() As String
    RecordGUID = m_RecordGUID
End Property

Private Sub Class_Initialize()
    m_Classname = "obj_OUMngr"
End Sub

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Function VerifyOU_Exists(OU_NAME As String) As Boolean
          
On Error GoTo Err_Handler
   m_LastError = ""
   
   Set m_rs = New ADODB.Recordset
   Dim sql As String
   sql = "SELECT * FROM dbo.docugate_general_ou WHERE OU_NAME ='" & OU_NAME & "'"
   If m_TranOper = gcUpdateRecord Then
        sql = sql & " and OU_GUID <> '" & m_RecordGUID & "'"
   End If
   
   m_rs.Open sql, gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = True Then
        VerifyOU_Exists = False
   Else
        VerifyOU_Exists = True
   End If
   m_rs.Close
   Exit Function
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeExists + Err.Description
 
End Function

Public Function ShowOUDetail(TranOper As Integer, RecordGUID As String)
    
On Error GoTo Err_Handler
    m_LastError = ""
   
    m_TranOper = TranOper
    If m_TranOper = gcAddRecord Then
        m_RecordGUID = ""
    Else
        m_RecordGUID = RecordGUID
    End If
    
    With Frm_OU_detail
        .Caption = TranDesc(TranOper) & " Organizational Unit"
        
        If m_TranOper = gcAddRecord Then
            .Cmd_Delete.Visible = False
        Else
            .Cmd_Delete.Visible = True
        End If
        Call Mod_Data.LoadComboFromSQL("select CC_CODE from docugate_general_cc", .Cbm_OU_DEFAULT_CLIENT)
        
        Call LoadChargeType(.Cbm_OU_CHARGE)
        If m_TranOper = gcAddRecord Then
            If .Cbm_OU_CHARGE.ListCount > 0 Then .Cbm_OU_CHARGE.ListIndex = 0
            .txt_OU_CPY_MULTIPLR.Text = "1.00"
            .txt_OU_PRN_MULTIPLR.Text = "1.00"
            .Cmd_Delete.Visible = False
        Else
            .Cmd_Delete.Visible = True
        End If
        
        If TranOper = gcUpdateRecord Then
            Call LoadOU(Frm_OU_detail)
        End If
        .Show vbModal
    End With
    ShowOUDetail = True
    Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
    
End Function


Public Function FundOU(RecordGUID As String)
    
On Error GoTo Err_Handler
    m_LastError = ""
    m_RecordGUID = RecordGUID
    Dim m_SQL As String
    m_SQL = "SELECT OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '" & m_RecordGUID & "'"
    
    With frm_OU_fund
           
            m_SQL = "SELECT OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '" & m_RecordGUID & "'"
           .Caption = "Fund : " & GetSQLValue(m_SQL) & " Organizational Unit"
            
            m_SQL = "SELECT count(*) FROM DOCUGATE_GENERAL_ACC WHERE ACC_OU_GUID = '" & m_RecordGUID & "'"
           .txt_NoMembers = GetSQLValue(m_SQL)
                      
            m_SQL = "SELECT sum(ACC_FUNDS) FROM DOCUGATE_GENERAL_ACC WHERE ACC_OU_GUID = '" & m_RecordGUID & "'"
           .txt_preBalance = "$" & Format(GetSQLValue(m_SQL), "0.00")
           
           .txt_PostBalance = "$0.00"
           
           .ouguid = m_RecordGUID
           
           .Show vbModal
    End With
    FundOU = True
    Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
    
End Function


Public Function LoadOU(MyForm As Frm_OU_detail)
   
On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   
   m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_OU WHERE OU_GUID='" & m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
    With MyForm
         .txt_OU_Name = nchk(m_rs!OU_NAME)
         .txt_OU_DESCRIPTION = nchk(m_rs!OU_DESCRIPTION)
         .txt_OU_SUPERVISOR = nchk(m_rs!OU_SUPERVISOR)
         .txt_OU_SUPERVISOR_EMAIL = nchk(m_rs!OU_SUPERVISOR_EMAIL)
         Call SetComboListItem(nchk(m_rs!OU_CHARGE), .Cbm_OU_CHARGE)
         
         .chk_OU_LOWBALANCE = numchk(m_rs!OU_LOWBALANCE)
         .txt_OU_THRESHOLD = numchk(m_rs!OU_THRESHOLD)
         .txt_OU_LOWBAL_TITLE = nchk(m_rs!OU_LOWBAL_TITLE)
         .txt_OU_LOWBAL_MSGTXT = nchk(m_rs!OU_LOWBAL_MSGTXT)
         .chk_OU_LOCKED = numchk(m_rs!OU_LOCKED)
         .chk_OU_CODES = numchk(m_rs!OU_CODES)
         .chk_OU_ALLOWNEG = numchk(m_rs!OU_ALLOWNEG)
         
         .txt_OU_PRN_MULTIPLR = Format(numchk(m_rs!OU_PRN_MULTIPLR), "0.00")
         .txt_OU_CPY_MULTIPLR = Format(numchk(m_rs!OU_CPY_MULTIPLR), "0.00")
         
         If nchk(m_rs!OU_DEFAULT_CLIENT) <> "" Then
            Call SetComboListItem(m_rs!OU_DEFAULT_CLIENT, .Cbm_OU_DEFAULT_CLIENT)
         End If
         If nchk(m_rs!OU_DEFAULT_MATTER) <> "" Then
            Call SetComboListItem(m_rs!OU_DEFAULT_MATTER, .Cbm_OU_DEFAULT_MATTER)
         End If
    
    End With
   End If
   m_rs.Close
   Set m_rs = Nothing
      
   MyForm.txt_maxSpend = numchk(GetSQLValue("Select AMOUNT FROM DBO.DOCUGATE_GENERAL_OU_MAXSPEND WHERE OU_GUID = '" & m_RecordGUID & "'"))
   MyForm.chkMaxSpend.Value = numchk(GetSQLValue("Select ENABLED FROM DBO.DOCUGATE_GENERAL_OU_MAXSPEND WHERE OU_GUID = '" & m_RecordGUID & "'"))
   
   LoadOU = True
   Exit Function
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function

Public Function SaveOU(MyForm As Frm_OU_detail) As Boolean
   
On Error GoTo Err_Handler
    m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM DOCUGATE_GENERAL_OU where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_OU WHERE OU_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    m_rs!OU_NAME = UCase(Mid(MyForm.txt_OU_Name, 1, 50))
    m_rs!OU_SUPERVISOR = UCase(Mid(MyForm.txt_OU_SUPERVISOR, 1, 50))
    m_rs!OU_SUPERVISOR_EMAIL = UCase(Mid(MyForm.txt_OU_SUPERVISOR_EMAIL, 1, 50))
    m_rs!OU_DESCRIPTION = UCase(Mid(MyForm.txt_OU_DESCRIPTION, 1, 50))
    m_rs!OU_CHARGE = UCase(MyForm.Cbm_OU_CHARGE)
    m_rs!OU_LOWBALANCE = MyForm.chk_OU_LOWBALANCE.Value
    m_rs!OU_THRESHOLD = Mid(MyForm.txt_OU_THRESHOLD.Text, 1, 10)
    m_rs!OU_LOWBAL_TITLE = UCase(Mid(MyForm.txt_OU_LOWBAL_TITLE, 1, 50))
    m_rs!OU_LOWBAL_MSGTXT = UCase(Mid(MyForm.txt_OU_LOWBAL_MSGTXT, 1, 255))
    m_rs!OU_LOCKED = MyForm.chk_OU_LOCKED.Value
    m_rs!OU_CODES = MyForm.chk_OU_CODES.Value
    m_rs!OU_ALLOWNEG = MyForm.chk_OU_ALLOWNEG.Value
    m_rs!OU_DEFAULT_CLIENT = MyForm.Cbm_OU_DEFAULT_CLIENT.Text
    m_rs!OU_DEFAULT_MATTER = MyForm.Cbm_OU_DEFAULT_MATTER.Text
    m_rs!OU_PRN_MULTIPLR = MyForm.txt_OU_PRN_MULTIPLR.Text
    m_rs!OU_CPY_MULTIPLR = MyForm.txt_OU_CPY_MULTIPLR.Text
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
    SaveOU = True
      
    If m_TranOper = gcAddRecord Then
       m_RecordGUID = GetSQLValue("Select OU_GUID FROM DBO.DOCUGATE_GENERAL_OU WHERE OU_NAME = '" & MyForm.txt_OU_Name.Text & "'")
    End If
      
    ' Peterd - so that a new account or a saved account is added to the accounts maxspend table
    ' 03/35/2010
    ' ver 2.0.7
       gConn.Execute "DELETE FROM dbo.docugate_general_OU_MAXSPEND WHERE OU_GUID = '" & m_RecordGUID & "'"
       gConn.Execute "INSERT INTO dbo.docugate_general_OU_MAXSPEND (OU_GUID) VALUES ('" & m_RecordGUID & "')"
       gConn.Execute "UPDATE dbo.docugate_general_OU_MAXSPEND SET ENABLED = " & MyForm.chkMaxSpend.Value & " WHERE OU_GUID = '" & m_RecordGUID & "'"
       gConn.Execute "UPDATE dbo.docugate_general_OU_MAXSPEND SET AMOUNT  = '" & MyForm.txt_maxSpend & "' WHERE OU_GUID = '" & m_RecordGUID & "'"
    ' end update
      
   Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
   
End Function

Public Function DeleteOU(guid As String) As Boolean
On Error GoTo Err_Handler
   m_LastError = ""
   gConn.Execute ("Delete from DOCUGATE_GENERAL_OU WHERE OU_GUID='" & guid & "'")
   DeleteOU = True
   Exit Function
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeDelete + Err.Description
End Function


