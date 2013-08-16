VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_AccountMngr"
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
Private m_Accounts As Collection
Private m_Loaded As Boolean
Private m_rs As ADODB.Recordset
Private m_cmd As ADODB.Command
Private m_LastError As String
Private m_TranOper As Integer
Private m_RecordGUID As String
Private m_CurrentAcc As CURRENT_ACCOUNT
Private m_CashierInstruction As Integer
Const ErrCodePrefix = "002-"
Private defaultSC As String
Private scIndex As Integer

Public Property Get CashierInstruction() As Integer
    CashierInstruction = m_CashierInstruction
End Property

Public Property Get RecordGUID() As String
    RecordGUID = m_RecordGUID
End Property

Public Property Get mValid() As Boolean
   mValid = m_CurrentAcc.m_VALID
End Property

Public Property Get mBadge() As String
   mBadge = m_CurrentAcc.m_BADGE

    'MsgBox "Badge = " & m_CurrentAcc.m_BADGE

End Property

Public Property Get mValidAccGUID() As String
   mValidAccGUID = m_CurrentAcc.m_ACCOUNT_GUID
End Property

Public Property Get mFirstname() As String
   mFirstname = m_CurrentAcc.m_FIRSTNAME
End Property

Public Property Get mLastname() As String
   mLastname = m_CurrentAcc.m_LASTNAME
End Property

Public Property Get mEmail() As String
   mEmail = m_CurrentAcc.m_EMAIL
End Property

Public Property Get mFunds() As String
   mFunds = m_CurrentAcc.m_FUNDS
End Property

Private Sub Class_Initialize()
    m_Classname = "obj_AccountMngr"
    m_Loaded = False
End Sub

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Property Get TranOper() As Integer
    TranOper = m_TranOper
End Property

Public Function ShowAccountFund()
    Frm_ACCOUNT_fund.Show vbModal
End Function

Public Function ShowOUFund()
    frm_OU_fund.Show vbModal
End Function


Public Function SetOUDefaults(f As Frm_ACCOUNT_detail) As Boolean
On Error GoTo Err_Handler
   m_LastError = ""
   
    If f.Cbm_OU.Text = "" Then Exit Function
        
    
    Dim rs As New ADODB.Recordset
    rs.Open "select ou_name, ou_default_client, ou_default_matter, ou_charge From docugate_general_ou " _
        & " where ou_name = '" & f.Cbm_OU.Text & "'", gConn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = False Then
        Call SetComboListItem(Trim(rs!OU_NAME), f.Cbm_OU)
        Call SetComboListItem(Trim(rs!OU_CHARGE), f.Cbm_OU_CHARGE)
        Call SetComboListItem(Trim(rs!OU_DEFAULT_CLIENT), f.Cbm_OU_DEFAULT_CLIENT)
        Call SetComboListItem(Trim(rs!OU_DEFAULT_MATTER), f.Cbm_OU_DEFAULT_MATTER)
    End If
    rs.Close
    SetOUDefaults = True
    Exit Function
    
Err_Handler:
    m_LastError = ErrCodePrefix + gcOperCodeSetDefaults + Err.Description
End Function

Public Function ShowAccountDetail(TranOper As Integer, RecordGUID As String) As Boolean
On Error GoTo Err_Handler
    m_LastError = ""
   
   
    With Frm_ACCOUNT_detail
    
        m_TranOper = TranOper
        
        .Caption = TranDesc(TranOper) & " Account"
        Call LoadChargeType(.Cbm_OU_CHARGE)
'        Call LoadAccountType(.Cbm_ACC_TYPE)
        
        If m_TranOper = gcAddRecord Then
            m_RecordGUID = ""
            .cmd_Encrypt.Caption = "&Encrypt"
            .Cmd_Fund.Visible = False
        Else
            m_RecordGUID = RecordGUID
            .Cmd_Fund.Visible = True
        End If
        
        Call Mod_Data.LoadComboFromSQL("select CC_CODE from docugate_general_cc", .Cbm_OU_DEFAULT_CLIENT)
        Call Mod_Data.LoadComboFromSQL("select OU_NAME from docugate_general_ou", .Cbm_OU)
        ' Sort the site code combo box by ID - Mike Young 11/25/2011
        Call Mod_Data.LoadComboFromSQL("select NAME from docugate_sitecode " & "order by ID ", .Cbm_SITECODE)
        '// set defaults for a new record
        If m_TranOper = gcAddRecord Then
            If .Cbm_SITECODE.ListCount > 0 Then
                ' Default site code value for NEW records based on log in ID- Mike Young 11/25/2011
                Dim m_SQL As String
                m_SQL = "SELECT acc_sc_index FROM dbo.docugate_general_acc WHERE acc_badge = '" & gObjLogonMngr.mBadge & "'"
                If GetSQLValue(m_SQL) > 0 Then
                    .Cbm_SITECODE.ListIndex = GetSQLValue(m_SQL) - 1
                End If
            End If
            
            If .Cbm_OU.ListCount > 0 Then
                If .Cbm_OU.ListCount = 1 Then .Cbm_OU.ListIndex = 0
            End If
            If .Cbm_OU_CHARGE.ListCount > 0 Then .Cbm_OU_CHARGE.ListIndex = 0
                .txt_ACC_FUNDS.Text = "0.00"
            End If
        
        If TranOper = gcUpdateRecord Or TranOper = gcViewRecord Then
            Call LoadAccount(Frm_ACCOUNT_detail)
            ' Default site code value for EXISTING records based on RecordGUID- Mike Young 11/25/2011
            m_SQL = "SELECT acc_sc_index FROM dbo.docugate_general_acc WHERE acc_acc_guid = '" & m_RecordGUID & "'"
            If GetSQLValue(m_SQL) > 0 Then
                .Cbm_SITECODE.ListIndex = GetSQLValue(m_SQL) - 1
            Else
                m_SQL = "SELECT acc_sc_index FROM dbo.docugate_general_acc WHERE acc_badge = '" & gObjLogonMngr.mBadge & "'"
                If GetSQLValue(m_SQL) > 0 Then
                    .Cbm_SITECODE.ListIndex = GetSQLValue(m_SQL) - 1
                End If
            End If
        End If
                
        If gObjLogonMngr.mLevel = CASHIER_LEVEL Then
            
            .Cmd_Delete.Visible = True
            .Frame2.Enabled = False
            .Frame4.Enabled = False
            .Frame5.Enabled = False
            
            If m_TranOper = gcAddRecord Then
                .Cmd_Process.Enabled = True
                .optAccLevel(2).Enabled = False
                .optAccLevel(1).Enabled = False
                .cmd_Encrypt.Visible = True
            Else
                .Cmd_Cancel.Caption = "&Close"
                .cmd_Encrypt.Visible = True
            End If
        Else
            If m_TranOper = gcAddRecord Then
                .Cmd_Delete.Visible = False
            Else
                .Cmd_Delete.Visible = True
            End If
        End If
        
        .Show vbModal
        
    End With
    
    ShowAccountDetail = True
    Exit Function
    
Err_Handler:
    m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Function


Public Function ShowAvsDetail(TranOper As Integer, RecordGUID As String) As Boolean
On Error GoTo Err_Handler
    m_LastError = ""
   
    With frm_AVS_detail
    
        m_TranOper = TranOper
        If m_TranOper = gcAddRecord Then
             .Caption = TranDesc(TranOper) & " AVS Unit"
             .txt_avs_funds = 0
             m_RecordGUID = ""
        Else
            .Caption = TranDesc(TranOper) & " AVS Unit"
            .txt_AVS_IDENTIFIER.Locked = True
            m_RecordGUID = RecordGUID
        End If
        
        Call Mod_Data.LoadComboFromSQL("select OU_NAME from docugate_general_ou", .Cbm_OU)
        If TranOper = gcUpdateRecord Or TranOper = gcViewRecord Then
            Call LoadAVS(frm_AVS_detail)
        End If
        
        .Show vbModal
    End With
    
    ShowAvsDetail = True
    Exit Function
    
Err_Handler:
    m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Function



Public Sub ShowAccountFilter()

    On Error GoTo Err_Handler
    m_LastError = ""
   
    
Err_Handler:
    If (Err.Number <> 0) Then
        MsgBox (Err.Description)
        Err.Clear
        m_LastError = Err.Description
    End If
    
End Sub

Public Sub VerifyBadge(badge As String)
          
On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset

   m_rs.Open "SELECT * FROM dbo.DOCUGATE_GENERAL_ACC WHERE ACC_BADGE='" & badge & "'", _
    gConn, adOpenStatic, adLockOptimistic
    
   With m_CurrentAcc
     If Not m_rs.EOF Then
      
          .m_VALID = True
          .m_ACCOUNT_GUID = m_rs!acc_acc_guid
          .m_BADGE = m_rs!acc_badge
          .m_FIRSTNAME = nchk(m_rs!acc_firstname)
          .m_LASTNAME = nchk(m_rs!acc_lastname)
          .m_EMAIL = nchk(m_rs!ACC_EMAIL)
          .m_FUNDS = numchk(m_rs!acc_funds)
          
     Else
          .m_VALID = False
          .m_ACCOUNT_GUID = ""
          .m_BADGE = ""
          .m_FIRSTNAME = ""
          .m_LASTNAME = ""
          .m_EMAIL = ""
          .m_FUNDS = ""
          
     End If
   End With
    
    
    
   m_rs.Close
   Exit Sub
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeExists + Err.Description
 
End Sub



Public Function IsLoggedOn() As Boolean
          
On Error GoTo Err_Handler
   
   m_LastError = ""
   IsLoggedOn = False
   
   Set m_rs = New ADODB.Recordset
   m_rs.Open "SELECT count(*) as mcount FROM dbo.DOCUGATE_GENERAL_ACTIVE_SESSION WHERE ACC_GUID = '" & m_CurrentAcc.m_ACCOUNT_GUID & "'", gConn, adOpenStatic, adLockOptimistic
    If (m_rs!mcount > 0) Then
       IsLoggedOn = True
   End If
    
   m_rs.Close
   Set m_rs = Nothing
   
Err_Handler:
   
   If (Err.Number <> 0) Then
      m_LastError = "obj_accountMngr::IsLoggedOn(" & ErrCodePrefix + gcOperCodeExists + Err.Description & ")"
      MsgBox m_LastError
      Err.Clear
      
    End If
   
    
End Function


Public Function VerifyAccBadge_Exists(badge As String) As Boolean
          
On Error GoTo Err_Handler
   m_LastError = ""
    
   Dim sql As String
   
   Set m_rs = New ADODB.Recordset
   sql = "SELECT * FROM dbo.DOCUGATE_GENERAL_ACC WHERE ACC_BADGE='" & badge & "'"
   If m_TranOper = gcUpdateRecord Then
        sql = sql & " and ACC_ACC_GUID <> '" & m_RecordGUID & "'"
   End If
        
   m_rs.Open sql, gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = True Then
        VerifyAccBadge_Exists = False
   Else
        VerifyAccBadge_Exists = True
   End If
   m_rs.Close
   Exit Function
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeExists + Err.Description
 
End Function

Public Function DeleteAccount(guid As String) As Boolean
    
On Error GoTo Err_Handler
   m_LastError = ""
   gConn.Execute ("Delete from dbo.DOCUGATE_GENERAL_ACC WHERE ACC_ACC_GUID='" & guid & "'")
   DeleteAccount = True
   Exit Function
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeDelete + Err.Description
 
End Function


Public Function DeleteActiveSession(guid As String) As Boolean
    
   DeleteActiveSession = False
    
On Error GoTo Err_Handler
   m_LastError = ""
   gConn.Execute ("DELETE FROM dbo.DOCUGATE_GENERAL_ACTIVE_SESSION WHERE ACC_GUID='" & guid & "'")
   DeleteActiveSession = True
   Exit Function
    
Err_Handler:
  MsgBox ErrCodePrefix + gcOperCodeDelete + Err.Description, vbExclamation
 
End Function

Public Function LoadAccount(MyForm As Frm_ACCOUNT_detail) As Boolean
On Error GoTo Err_Handler
    m_LastError = ""
   
   
   Set m_rs = New ADODB.Recordset
   m_rs.Open "SELECT * FROM dbo.docugate_acc_view WHERE acc_guid='" & m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   With MyForm
         If m_TranOper <> gcAddRecord Then
            .txt_ACC_BADGE.PasswordChar = "*"
            .txt_ACC_PASSWORD.PasswordChar = "*"
            .txt_ACC_COPYID.PasswordChar = "*"
            .txt_ACC_COPYPIN.PasswordChar = "*"
            .cmd_Encrypt.Caption = "&Decrypt"
         Else
            .txt_ACC_BADGE.PasswordChar = ""
            .txt_ACC_PASSWORD.PasswordChar = ""
            .txt_ACC_COPYID.PasswordChar = ""
            .txt_ACC_COPYPIN.PasswordChar = ""
            .cmd_Encrypt.Caption = "&Encrypt"
         End If

         .chk_ACC_LOCKED = numchk(m_rs!ACC_LOCKED)
          
         .txt_ACC_BADGE = nchk(m_rs!acc_badge)
         .txt_ACC_PASSWORD = nchk(m_rs!ACC_PASSWORD)
         .chk_ACC_PASSWORD_ENABLED.Value = numchk(m_rs!ACC_PASSWORD_ENABLED)
         '.txt_ACC_PIN = nchk(m_rs!ACC_PIN)
         'chk_ACC_PIN_ENABLED.Value = numchk(m_rs!ACC_PIN_ENABLED)
         
         .txt_ACC_FIRSTNAME = nchk(m_rs!acc_firstname)
         .txt_ACC_LASTNAME = nchk(m_rs!acc_lastname)
         .txt_ACC_FULLNAME = nchk(m_rs!ACC_FULLNAME)
         Call SetComboListItem(nchk(m_rs!acc_charge), .Cbm_OU_CHARGE)
'         Call SetComboListItem(nchk(m_rs!ACC_TYPE), .Cbm_ACC_TYPE)
         
         .optAccLevel(m_rs!acc_level - 1).Value = True

         .txt_ACC_EMAIL = nchk(m_rs!ACC_EMAIL)
         .txt_ACC_COPYID = nchk(m_rs!ACC_COPYID)
         .txt_ACC_COPYPIN = nchk(m_rs!ACC_COPYPIN)
         .chk_ACC_COPYPIN_ENABLED.Value = numchk(m_rs!ACC_COPYPIN_ENABLED)
         
         ' 12102008 - Modified display format was just 0.00 {Jeff}
         .txt_ACC_FUNDS = Format(numchk(m_rs!acc_funds), "###0.00")
         '.chk_DEFAULT_ONLY.Value = numchk(m_rs!ACC_DEFAULT_ONLY)
         
         If nchk(m_rs!ACC_DEFAULT_CLIENT) <> "" Then
            Call SetComboListItem(m_rs!ACC_DEFAULT_CLIENT, .Cbm_OU_DEFAULT_CLIENT)
         End If
         If nchk(m_rs!ACC_DEFAULT_MATTER) <> "" Then
            Call SetComboListItem(m_rs!ACC_DEFAULT_MATTER, .Cbm_OU_DEFAULT_MATTER)
         End If
         If nchk(m_rs!OU_NAME) <> "" Then
            Call SetComboListItem(m_rs!OU_NAME, .Cbm_OU)
         End If
         
         m_CurrentAcc.m_VALID = False
         m_CurrentAcc.m_BADGE = nchk(m_rs!acc_badge)
         m_CurrentAcc.m_ACCOUNT_GUID = m_rs!ACC_GUID
         m_CurrentAcc.m_FIRSTNAME = nchk(m_rs!acc_firstname)
         m_CurrentAcc.m_LASTNAME = nchk(m_rs!acc_lastname)
         m_CurrentAcc.m_EMAIL = nchk(m_rs!ACC_EMAIL)
         m_CurrentAcc.m_FUNDS = numchk(m_rs!acc_funds)
         
  
    End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   
    MyForm.txt_maxSpend = numchk(GetSQLValue("Select AMOUNT FROM DBO.DOCUGATE_GENERAL_ACC_MAXSPEND WHERE ACC_GUID = '" & m_RecordGUID & "'"))
    MyForm.chkMaxSpend.Value = numchk(GetSQLValue("Select ENABLED FROM DBO.DOCUGATE_GENERAL_ACC_MAXSPEND WHERE ACC_GUID = '" & m_RecordGUID & "'"))
    
   LoadAccount = True
   Exit Function
    
 
    
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function


Public Function LoadAVS(MyForm As frm_AVS_detail) As Boolean
On Error GoTo Err_Handler
    m_LastError = ""
      
   Set m_rs = New ADODB.Recordset
   m_rs.Open "SELECT * FROM dbo.docugate_acc_view WHERE acc_guid='" & m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   
   With MyForm
         .txt_AVS_IDENTIFIER = nchk(m_rs!acc_badge)
         .txt_AVS_ADDRESS = nchk(m_rs!acc_firstname)
         .txt_AVS_LOCATION = nchk(m_rs!acc_lastname)
         .txt_AVS_INSTITUTION = nchk(m_rs!ACC_EMAIL)
         .txt_avs_funds = nchk(m_rs!acc_funds)
         .chk_Pin_Required.Value = numchk(m_rs!ACC_PASSWORD_ENABLED)
         .chk_Enable_Acct_AVS.Value = numchk(m_rs!ACC_COPYPIN_ENABLED)
         
'         Call SetComboListItem(nchk(m_rs!ACC_TYPE), .Cbm_ACC_TYPE)
         If nchk(m_rs!OU_NAME) <> "" Then
            Call SetComboListItem(m_rs!OU_NAME, .Cbm_OU)
         End If
    End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   Exit Function
    
 
    
    
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function

Public Function SaveAVS(MyForm As frm_AVS_detail) As Boolean

On Error GoTo Err_Handler
    m_LastError = ""
    
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM DOCUGATE_GENERAL_ACC where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACC WHERE ACC_ACC_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    m_rs!acc_badge = UCase(MyForm.txt_AVS_IDENTIFIER.Text)
    m_rs!acc_firstname = UCase(Mid(MyForm.txt_AVS_ADDRESS, 1, 50))
    m_rs!acc_lastname = UCase(Mid(MyForm.txt_AVS_LOCATION, 1, 50))
    m_rs!ACC_PASSWORD_ENABLED = MyForm.chk_Pin_Required.Value
    m_rs!ACC_EMAIL = MyForm.txt_AVS_INSTITUTION
    m_rs!ACC_COPYPIN_ENABLED = MyForm.chk_Enable_Acct_AVS.Value
'    m_rs!ACC_TYPE = MyForm.Cbm_ACC_TYPE
    m_rs!ACC_OU_GUID = GetSQLValue("Select OU_GUID from dbo.docugate_general_ou where OU_Name = '" & MyForm.Cbm_OU.Text & "'")
    m_rs!ACC_CMETHOD = "CREDIT"
    m_rs!acc_funds = CSng(MyForm.txt_avs_funds)
    m_rs.Update
    m_rs.Close
        
    If m_TranOper = gcAddRecord Then
       m_RecordGUID = GetSQLValue("Select ACC_ACC_GUID FROM DBO.DOCUGATE_GENERAL_ACC WHERE ACC_BADGE = '" & MyForm.txt_AVS_IDENTIFIER.Text & "'")
    End If
    
    Set m_rs = Nothing
    
    SaveAVS = True
    Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
End Function

Public Function AddCashierJournel(jamount As String, Accguid As String, jdesc As String, jtype As String) As Boolean
    
   On Error GoTo handler
   
    Set m_rs = New ADODB.Recordset
    m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACTIVITY_JOURNEL WHERE 1=0", gConn, adOpenDynamic, adLockOptimistic
    m_rs.AddNew
    m_rs!j_guid = Accguid
    m_rs!j_amount = jamount
    m_rs!j_type = jtype
    m_rs!j_desc = jdesc
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing

handler:
   
   If (Err.Number <> 0) Then
       MsgBox (Err.Description)
       Err.Clear
   End If
    
End Function


Public Function SaveAccount(MyForm As Frm_ACCOUNT_detail) As Boolean

On Error GoTo Err_Handler
    m_LastError = ""
    
    Dim PrevFundBal As Double
    m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        PrevFundBal = 0
    Else
        m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACC WHERE ACC_ACC_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
        If m_rs.EOF = False Then
            PrevFundBal = numchk(m_rs!acc_funds)
        Else
            PrevFundBal = 0
        End If
        m_rs.Close
    End If
   
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM DOCUGATE_GENERAL_ACC where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACC WHERE ACC_ACC_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    'This is where we update the database information- Mike Young 11/25/2011
    m_rs!acc_badge = UCase(MyForm.txt_ACC_BADGE.Text)
    m_rs!acc_firstname = UCase(Mid(MyForm.txt_ACC_FIRSTNAME, 1, 50))
    m_rs!acc_lastname = UCase(Mid(MyForm.txt_ACC_LASTNAME, 1, 50))
    m_rs!ACC_FULLNAME = UCase(Mid(MyForm.txt_ACC_FULLNAME, 1, 100))
    m_rs!ACC_CMETHOD = UCase(MyForm.Cbm_OU_CHARGE)
    m_rs!ACC_SITECODE = UCase(MyForm.Cbm_SITECODE)
    m_rs!ACC_SC_INDEX = GetSQLValue("Select ID from dbo.docugate_sitecode where NAME = '" & MyForm.Cbm_SITECODE.Text & "'")
    
    m_rs!ACC_PASSWORD = MyForm.txt_ACC_PASSWORD
    m_rs!ACC_PASSWORD_ENABLED = MyForm.chk_ACC_PASSWORD_ENABLED.Value
    'm_rs!ACC_PIN = MyForm.txt_ACC_PIN
    '_rs!ACC_PIN_ENABLED = MyForm.chk_ACC_PIN_ENABLED.Value
    
    m_rs!ACC_EMAIL = MyForm.txt_ACC_EMAIL
   
    Dim i As Integer
    For i = 0 To 2
        If MyForm.optAccLevel(i).Value = True Then
            m_rs!ACC_ACCESS_LEVEL = i + 1
        End If
    Next i
    m_rs!ACC_COPYID = UCase(MyForm.txt_ACC_COPYID)
    m_rs!ACC_COPYPIN = MyForm.txt_ACC_COPYPIN
    m_rs!ACC_COPYPIN_ENABLED = MyForm.chk_ACC_COPYPIN_ENABLED.Value
    m_rs!ACC_LOCKED = MyForm.chk_ACC_LOCKED.Value
    m_rs!ACC_DEFAULT_CLIENT = MyForm.Cbm_OU_DEFAULT_CLIENT.Text
    m_rs!ACC_DEFAULT_MATTER = MyForm.Cbm_OU_DEFAULT_MATTER.Text
'    m_rs!ACC_TYPE = MyForm.Cbm_ACC_TYPE
    m_rs!ACC_OU_GUID = GetSQLValue("Select OU_GUID from dbo.docugate_general_ou where OU_Name = '" & MyForm.Cbm_OU.Text & "'")
    m_rs.Update
    m_rs.Close
        
    If m_TranOper = gcAddRecord Then
       m_RecordGUID = GetSQLValue("Select ACC_ACC_GUID FROM DBO.DOCUGATE_GENERAL_ACC WHERE ACC_BADGE = '" & MyForm.txt_ACC_BADGE.Text & "'")
    End If
       
    ' Peterd - so that a new account or a saved account is added to the accounts maxspend table
    ' 03/35/2010
    ' ver 2.0.7
       gConn.Execute "DELETE FROM dbo.docugate_general_ACC_MAXSPEND WHERE ACC_GUID = '" & m_RecordGUID & "'"
       gConn.Execute "INSERT INTO dbo.docugate_general_ACC_MAXSPEND (ACC_GUID) VALUES ('" & m_RecordGUID & "')"
       gConn.Execute "UPDATE dbo.docugate_general_ACC_MAXSPEND SET ENABLED = " & MyForm.chkMaxSpend.Value & " WHERE ACC_GUID = '" & m_RecordGUID & "'"
       gConn.Execute "UPDATE dbo.docugate_general_ACC_MAXSPEND SET AMOUNT  = '" & MyForm.txt_maxSpend & "' WHERE ACC_GUID = '" & m_RecordGUID & "'"
    ' end update
        
    
    
    '12102008 - Added to handle a comma in the fund field {Jeff}
    MyForm.txt_ACC_FUNDS.Text = Format(MyForm.txt_ACC_FUNDS.Text, "###0.00")
    
    
    '// Create a transaction for the change in fund balance
    If PrevFundBal <> CDbl(Val(MyForm.txt_ACC_FUNDS)) Then
        Dim AmtAdjustment As Double
        AmtAdjustment = CDbl(Val(MyForm.txt_ACC_FUNDS)) - PrevFundBal
        
        '12102008 - changed format to remove the comma {Jeff}
        Call CashierAdjustFunds(MyForm.txt_ACC_BADGE.Text, Format(AmtAdjustment, "###0.00"))
    End If
    
    gConn.Execute ("UPDATE dbo.docugate_general_acc set ACC_FUNDS = " & MyForm.txt_ACC_FUNDS.Text _
        & " WHERE ACC_ACC_GUID = '" & m_RecordGUID & "'")
     
    Set m_rs = Nothing
    
    SaveAccount = True
    Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
End Function


Public Function CashierAdjustFunds(AccBadge As String, Amount As String) As Boolean

On Error GoTo Err_Handler
    m_LastError = ""

    Dim cmd As ADODB.Command
    Dim ParamRetVal As ADODB.Parameter
    Dim ParamAccBadge As ADODB.Parameter
    Dim ParamCashierBadge As ADODB.Parameter
    Dim ParamCashierFull As ADODB.Parameter
    Dim ParamAmtAdjustment As ADODB.Parameter

    Set cmd = New ADODB.Command

    cmd.ActiveConnection = gConn
    
    'MsgBox "db string = " & cmd.ActiveConnection
    
    cmd.CommandType = adCmdStoredProc
    
    'MsgBox "Commandtype = " & cmd.CommandType
    
    '07012009 - Error is around here!
    Set ParamRetVal = cmd.CreateParameter("RetVal", adDouble, adParamReturnValue, , 0)
    cmd.Parameters.Append ParamRetVal
    
   'rs.Open "select * from information_schema.parameters where specific_name = 'cashier_adjust_acc_funds'", gConn, adOpenForwardOnly, adLockReadOnly
    'MsgBox "ParamRetVal = " & ParamRetVal
    
    Set ParamAccBadge = cmd.CreateParameter("AccBadge", adChar, adParamInput, 50, AccBadge)
    cmd.Parameters.Append ParamAccBadge
    
    'MsgBox "Acc Badge = " & ParamAccBadge
    
    Set ParamCashierBadge = cmd.CreateParameter("Doer_Badge", adChar, adParamInput, 50, gObjLogonMngr.mBadge)
    cmd.Parameters.Append ParamCashierBadge
    
    'MsgBox "login Badge = " & ParamCashierBadge
    
    'Set ParamCashierFull = cmd.CreateParameter("Cashier_Name", adChar, adParamInput, 50, gObjLogonMngr.mFullname)
    'cmd.Parameters.Append ParamCashierFull
    
    Set ParamAmtAdjustment = cmd.CreateParameter("Amt_Adjustment", adChar, adParamInput, 20, Format(Amount, "###0.00"))
    cmd.Parameters.Append ParamAmtAdjustment
    
    'MsgBox "amount = " & ParamAmtAdjustment
    
    cmd.CommandText = "dbo.cashier_adjust_acc_funds"
    cmd.Execute
    
    'MsgBox "to db for cashier_adjust_acc_funds"
    
    If ParamRetVal.Value = 0 Then
        CashierAdjustFunds = True
    Else
        m_LastError = "Error: " & Trim(Str(ParamRetVal.Value)) & ". The Account's Balance remains unchanged!"
        
        MsgBox m_LastError
    
    End If
    
    Set cmd = Nothing
    CashierAdjustFunds = True
    Exit Function
    
Err_Handler:
    m_LastError = ErrCodePrefix + gcOperCodeAdjustFunds + Err.Description
End Function

Public Function CashierCheckOut(AccBadge As String) As Boolean

On Error GoTo Err_Handler
    m_LastError = ""

    Dim cmd As ADODB.Command
    Dim ParamRetVal As ADODB.Parameter
    Dim ParamAccBadge As ADODB.Parameter
    Dim ParamCashierBadge As ADODB.Parameter
    Dim ParamCashierFull As ADODB.Parameter

    Set cmd = New ADODB.Command

    cmd.ActiveConnection = gConn
    cmd.CommandType = adCmdStoredProc

    Set ParamRetVal = cmd.CreateParameter("RetVal", adDouble, adParamReturnValue, , 0)
    cmd.Parameters.Append ParamRetVal
    
    Set ParamAccBadge = cmd.CreateParameter("AccBadge", adChar, adParamInput, 50, AccBadge)
    cmd.Parameters.Append ParamAccBadge
    
    Set ParamCashierBadge = cmd.CreateParameter("Doer_Badge", adChar, adParamInput, 50, gObjLogonMngr.mBadge)
    cmd.Parameters.Append ParamCashierBadge
    
    'Set ParamCashierFull = cmd.CreateParameter("Cashier_Name", adChar, adParamInput, 50, gObjLogonMngr.mFullname)
    'cmd.Parameters.Append ParamCashierFull
    
    cmd.CommandText = "dbo.cashier_check_out"
    cmd.Execute
    
    If ParamRetVal.Value = 0 Then
        CashierCheckOut = True
    Else
        m_LastError = ErrCodePrefix + gcOperCodeCheckOut + Err.Description & ". The card failed to check out!"
    End If
    
    Set cmd = Nothing
    CashierCheckOut = True
    Exit Function
    
Err_Handler:
    m_LastError = ErrCodePrefix + gcOperCodeCheckOut + Err.Description & ". The card failed to check out!"
End Function

Public Function CashierCheckIn(AccBadge As String, TranAmt As String, RefundAmt As String) As Boolean

On Error GoTo Err_Handler
    m_LastError = ""

    Dim cmd As ADODB.Command
    Dim ParamRetVal As ADODB.Parameter
    Dim ParamAccBadge As ADODB.Parameter
    Dim ParamCashierBadge As ADODB.Parameter
    Dim ParamCashierFull As ADODB.Parameter
    Dim ParamTranAmt As ADODB.Parameter
    Dim ParamRefundAmt As ADODB.Parameter
    
    Set cmd = New ADODB.Command

    cmd.ActiveConnection = gConn
    cmd.CommandType = adCmdStoredProc
    
    Set ParamAccBadge = cmd.CreateParameter("Acc_Badge", adChar, adParamInput, 50, AccBadge)
    cmd.Parameters.Append ParamAccBadge
    
    Set ParamCashierBadge = cmd.CreateParameter("Doer_Badge", adChar, adParamInput, 50, gObjLogonMngr.mBadge)
    cmd.Parameters.Append ParamCashierBadge
    
    Set ParamTranAmt = cmd.CreateParameter("TranAmt", adChar, adParamInput, 20, TranAmt)
    cmd.Parameters.Append ParamTranAmt
    
    Set ParamRefundAmt = cmd.CreateParameter("RefundAmt", adChar, adParamInput, 20, RefundAmt)
    cmd.Parameters.Append ParamRefundAmt
    
    cmd.CommandText = "dbo.cashier_check_in"
    cmd.Execute
    
    'If ParamRetVal.Value = 0 Then
    '    CashierCheckIn = True
    'Else
    '    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeCheckIn + Err.Description & ". The card failed to check in!"
    'End If
    
    Set cmd = Nothing
    CashierCheckIn = True
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + gcOperCodeCheckIn + Err.Description & ". The card failed to check in!"
End Function

Public Function ShowCheckInOut(CheckInOut As Integer, AccBadge As String)

On Error GoTo Err_Handler
    m_LastError = ""

    m_CashierInstruction = CheckInOut
    Dim ErrType As String
    
    With Frm_CASHIER_CheckInOut
        If CheckInOut = gcCashOUT Then
            .Caption = "Cashier Check Out"
            .cmd_CheckIn.Visible = False
            .cmd_CloseChkIn.Visible = False
            .Cmd_CloseChkOut.Cancel = True
            .cmd_PrintReceipt.Visible = False
            ErrType = gcOperCodeCheckOut
            
        ElseIf CheckInOut = gcCashIN Or CheckInOut = gcCashINPrintReceipt Then
            .Caption = "Cashier Check In"
            .cmd_CheckOut.Visible = False
            .Cmd_CloseChkOut.Visible = False
            .cmd_CloseChkIn.Cancel = True
            .cmd_CheckOutReceipt.Visible = False
            ErrType = gcOperCodeCheckIn
        End If
        
        'If CheckInOut = gcCashINPrintReceipt Then
        '    .cmd_PrintReceipt.Enabled = True
        'End If
    
        .txt_Badge.Text = AccBadge
        If AccBadge <> "" Then Call .LookupAccount
        
        .Show vbModal
    End With
    ShowCheckInOut = True
    Exit Function
    
Err_Handler:
    m_LastError = "Error: " & ErrCodePrefix + ErrType + Err.Description
    
End Function


Public Function ShowCurrentActiveSessions()
    
On Error GoTo Err_Handler
  '  m_LastError = ""
  '  m_RecordGUID = RecordGUID
  '  Dim m_SQL As String
  '  m_SQL = "SELECT OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '" & m_RecordGUID & "'"
    
    With frm_Current_Active_Sessions
           
       '     m_SQL = "SELECT OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '" & m_RecordGUID & "'"
       '    .Caption = "Fund : " & GetSQLValue(m_SQL) & " Organizational Unit"
            
       '     m_SQL = "SELECT count(*) FROM DOCUGATE_GENERAL_ACC WHERE ACC_OU_GUID = '" & m_RecordGUID & "'"
       '    .txt_NoMembers = GetSQLValue(m_SQL)
                      
       '     m_SQL = "SELECT sum(ACC_FUNDS) FROM DOCUGATE_GENERAL_ACC WHERE ACC_OU_GUID = '" & m_RecordGUID & "'"
       '    .txt_preBalance = "$" & Format(GetSQLValue(m_SQL), "0.00")
           
       '    .txt_PostBalance = "$0.00"
           
      '     .ouguid = m_RecordGUID
           
           .Show vbModal
    End With
      Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
    
End Function

              

