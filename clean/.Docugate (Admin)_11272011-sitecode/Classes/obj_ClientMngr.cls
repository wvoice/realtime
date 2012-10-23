VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_ClientMngr"
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
Const ErrCodePrefix = "003-"

Public Property Get TranOper() As Integer
    TranOper = m_TranOper
End Property

Public Property Get RecordGUID() As String
    RecordGUID = m_RecordGUID
End Property

Private Sub Class_Initialize()
    m_Classname = "obj_ClientMngr"
End Sub
Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Function VerifyCC_Exists(CC_CODE As String) As Boolean

On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   Dim sql As String
   
   sql = "SELECT * FROM dbo.docugate_general_cc WHERE CC_CODE ='" & CC_CODE & "'"
   If m_TranOper = gcUpdateRecord Then
        sql = sql & " and CC_GUID <> '" & m_RecordGUID & "'"
   End If
   
   m_rs.Open sql, gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = True Then
        VerifyCC_Exists = False
   Else
        VerifyCC_Exists = True
   End If
   m_rs.Close
   Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeExists + Err.Description
End Function

Public Function ShowClientDetail(TranOper As Integer, RecordGUID As String)
On Error GoTo Err_Handler
   m_LastError = ""
   m_TranOper = TranOper
    If m_TranOper = gcAddRecord Then
        m_RecordGUID = ""
    Else
        m_RecordGUID = RecordGUID
    End If
    
    With Frm_CLIENT_detail
        .Caption = TranDesc(TranOper) & " Client Detail"
        
        If m_TranOper = gcAddRecord Then
            .Cmd_Delete.Visible = False
            .txt_CC_CPY_MULTIPLR.Text = "1.00"
            .txt_CC_PRN_MULTIPLR.Text = "1.00 "
        Else
            .Cmd_Delete.Visible = True
        End If
        
        If TranOper = gcUpdateRecord Then
            Call LoadClient(Frm_CLIENT_detail)
        End If
        .Show vbModal
    End With
    ShowClientDetail = True
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Function

Public Function LoadClient(MyForm As Frm_CLIENT_detail)

On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   
   m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_CC WHERE CC_GUID='" & m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   With MyForm
        .txt_CC_CODE = nchk(m_rs!CC_CODE)
        .txt_CC_DESC = nchk(m_rs!CC_DESC)
        .txt_CC_EMAIL = nchk(m_rs!CC_EMAIL)
        .txt_CC_CUSTOM = nchk(m_rs!CC_CUSTOM)
        
        '.txt_CC_OVERIDE = nchk(m_rs!CC_OVERIDE)
        .chkPriceOverride.Value = Val(numchk(m_rs!CC_OVERIDE))
        
        .txt_CC_CONTACT = nchk(m_rs!CC_CONTACT)
        .txt_CC_PHONE_NUM = nchk(m_rs!CC_PHONE_NUM)
        .txt_CC_FAX_NUM = nchk(m_rs!CC_FAX_NUM)
        .txt_CC_FAX_COST = nchk(m_rs!CC_FAX_COST)
        .txt_CC_EMAIL_COST = nchk(m_rs!CC_EMAIL_COST)
        .txt_CC_COPY_COST = nchk(m_rs!CC_COPY_COST)
        .txt_CC_PRINT_COST = nchk(m_rs!CC_PRINT_COST)
        .txt_CC_EMAILPP = nchk(m_rs!CC_EMAILPP)
        .txt_CC_FAXPP = nchk(m_rs!CC_FAXPP)
        .txt_CC_COPYPP = nchk(m_rs!CC_COPYPP)
        .txt_CC_PRINTPP = nchk(m_rs!CC_PRINTPP)
        .txt_CC_NAME = nchk(m_rs!CC_NAME)
        
        .txt_CC_PRN_MULTIPLR = Format(numchk(m_rs!CC_PRN_MULTIPLR), "0.00")
        .txt_CC_CPY_MULTIPLR = Format(numchk(m_rs!CC_CPY_MULTIPLR), "0.00")
        
   End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   LoadClient = True
   Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
End Function

Public Function SaveClient(MyForm As Frm_CLIENT_detail) As Boolean
   
On Error GoTo Err_Handler
   m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM DOCUGATE_GENERAL_CC where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_CC WHERE CC_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    m_rs!CC_CODE = UCase(Mid(MyForm.txt_CC_CODE, 1, 50))
    m_rs!CC_DESC = UCase(Mid(MyForm.txt_CC_DESC, 1, 50))
    m_rs!CC_EMAIL = UCase(Mid(MyForm.txt_CC_EMAIL, 1, 50))
    m_rs!CC_CUSTOM = UCase(Mid(MyForm.txt_CC_CUSTOM, 1, 50))
    
    m_rs!CC_OVERIDE = MyForm.chkPriceOverride.Value
    
    m_rs!CC_CONTACT = UCase(Mid(MyForm.txt_CC_CONTACT, 1, 50))
    m_rs!CC_PHONE_NUM = UCase(Mid(MyForm.txt_CC_PHONE_NUM, 1, 50))
    m_rs!CC_FAX_NUM = UCase(Mid(MyForm.txt_CC_FAX_NUM, 1, 50))
    m_rs!CC_FAX_COST = UCase(Mid(MyForm.txt_CC_FAX_COST, 1, 50))
    m_rs!CC_EMAIL_COST = UCase(Mid(MyForm.txt_CC_EMAIL_COST, 1, 50))
    m_rs!CC_COPY_COST = UCase(Mid(MyForm.txt_CC_COPY_COST, 1, 50))
    m_rs!CC_PRINT_COST = UCase(Mid(MyForm.txt_CC_PRINT_COST, 1, 50))
    m_rs!CC_EMAILPP = UCase(Mid(MyForm.txt_CC_EMAILPP, 1, 50))
    m_rs!CC_FAXPP = UCase(Mid(MyForm.txt_CC_FAXPP, 1, 50))
    m_rs!CC_COPYPP = UCase(Mid(MyForm.txt_CC_COPYPP, 1, 50))
    m_rs!CC_PRINTPP = UCase(Mid(MyForm.txt_CC_PRINTPP, 1, 50))
    m_rs!CC_NAME = UCase(Mid(MyForm.txt_CC_NAME, 1, 50))
    
    m_rs!CC_PRN_MULTIPLR = MyForm.txt_CC_PRN_MULTIPLR.Text
    m_rs!CC_CPY_MULTIPLR = MyForm.txt_CC_CPY_MULTIPLR.Text
    

    m_rs.Update
    m_rs.Close
   
    '//m_rs!ou_guid = mod_guid.GetGuid()
   Set m_rs = Nothing
   SaveClient = True
   Exit Function
   
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
End Function

Public Function DeleteClient(guid As String) As Boolean

On Error GoTo Err_Handler
   m_LastError = ""
   gConn.Execute ("Delete from DOCUGATE_GENERAL_CC WHERE CC_GUID='" & guid & "'")
   DeleteClient = True
   Exit Function
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeDelete + Err.Description

End Function



