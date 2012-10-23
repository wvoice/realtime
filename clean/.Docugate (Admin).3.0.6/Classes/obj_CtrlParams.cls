VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_CtrlParams"
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
Const ErrCodePrefix = "006-"

Public Property Get RecordGUID() As String
    RecordGUID = m_RecordGUID
End Property

Private Sub Class_Initialize()
    m_Classname = "obj_CtrlParams"
    m_Loaded = False
End Sub

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Function ShowCtrlParmDetail()
   On Error GoTo Err_Handler
   m_LastError = ""
   
    With Frm_CTLPARMS_detail
        Call Mod_Data.LoadComboFromSQL("select ACC_FULLNAME from dbo.docugate_general_acc", .Cbm_ACC)
        Call LoadCtrlParms(Frm_CTLPARMS_detail)
        .Show vbModal
    End With
    ShowCtrlParmDetail = True
    Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Function

Public Function LoadCtrlParms(MyForm As Frm_CTLPARMS_detail)

   On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   
   '// I am assuming there will only be one row of data in this table at any time
   m_rs.Open "SELECT * FROM dbo.docugate_ctlparams_view", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
        With MyForm
             Call SetComboListItem(nchk(m_rs!ACC_FULLNAME), .Cbm_ACC)
            .chk_CTLPARM_ACCOUNTENABLED.Value = numchk(m_rs!CTLPARM_ACCOUNTENABLED)
            .chk_CTLPARM_ACCOUNTSCROLL.Value = numchk(m_rs!CTLPARM_ACCOUNTSCROLL)
            .chk_CTLPARM_AUTOMODE.Value = numchk(m_rs!CTLPARM_AUTOMODE)
            .chk_CTLPARM_AUTORELEASE.Value = numchk(m_rs!CTLPARM_AUTORELEASE)
            .chk_CTLPARM_CLIENTENABLED.Value = numchk(m_rs!CTLPARM_CLIENTENABLED)
            .chk_CTLPARM_CLIENTSCROLLENABLED.Value = numchk(m_rs!CTLPARM_CLIENTSCROLLENABLED)
            .chk_CTLPARM_IDENABLED.Value = numchk(m_rs!CTLPARM_IDENABLED)
            .chk_CTLPARM_MATTERENABLED.Value = numchk(m_rs!CTLPARM_MATTERENABLED)
            .chk_CTLPARM_MATTERSCROLLENABLED.Value = numchk(m_rs!CTLPARM_MATTERSCROLLENABLED)
            .chk_CTLPARM_PINENABLED.Value = numchk(m_rs!CTLPARM_PINENABLED)
            .chk_CTLPARM_RELEASEMODE.Value = numchk(m_rs!CTLPARM_RELEASEMODE)
            .chk_CTLPARM_USDATE.Value = numchk(m_rs!CTLPARM_USDATE)
            .txt_CTLPARM_CLIENTPROMPT = nchk(m_rs!CTLPARM_CLIENTPROMPT)
            .txt_CTLPARM_COMPANY = nchk(m_rs!CTLPARM_COMPANY)
            .txt_CTLPARM_COPYTIMEOUT = nchk(m_rs!CTLPARM_COPYTIMEOUT)
            .txt_CTLPARM_IDPROMPT = nchk(m_rs!CTLPARM_IDPROMPT)
            .txt_CTLPARM_MATTERPROMPT = nchk(m_rs!CTLPARM_MATTERPROMPT)
            
            .txt_CTLPARM_PIN = nchk(m_rs!CTLPARM_PIN)
            
            .txt_CTLPARM_PINPROMPT = nchk(m_rs!CTLPARM_PINPROMPT)
            .txt_CTLPARM_USERIDMODE = nchk(m_rs!CTLPARM_USERIDMODE)
            .chk_F3TASK.Value = numchk(m_rs!F3TASK)
             
        End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   LoadCtrlParms = True
   Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
End Function

Public Function SaveCtrlParms(MyForm As Frm_CTLPARMS_detail) As Boolean
   
    On Error GoTo Err_Handler
    m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    '// I am assuming that there will only be one record in this table at any time
    m_rs.Open "SELECT top 1 * FROM docugate_general_ctlparams", gConn, adOpenDynamic, adLockOptimistic
    If m_rs.EOF = True Then m_rs.AddNew
   
    With MyForm
        m_rs!CTLPARM_ACCOUNTENABLED = .chk_CTLPARM_ACCOUNTENABLED.Value
        m_rs!CTLPARM_ACCOUNTSCROLL = .chk_CTLPARM_ACCOUNTSCROLL.Value
        m_rs!CTLPARM_AUTOMODE = .chk_CTLPARM_AUTOMODE.Value
        m_rs!CTLPARM_AUTORELEASE = .chk_CTLPARM_AUTORELEASE.Value
        m_rs!CTLPARM_CLIENTENABLED = .chk_CTLPARM_CLIENTENABLED.Value
        m_rs!CTLPARM_CLIENTSCROLLENABLED = .chk_CTLPARM_CLIENTSCROLLENABLED.Value
        m_rs!CTLPARM_IDENABLED = .chk_CTLPARM_IDENABLED.Value
        m_rs!CTLPARM_MATTERENABLED = .chk_CTLPARM_MATTERENABLED.Value
        m_rs!CTLPARM_MATTERSCROLLENABLED = .chk_CTLPARM_MATTERSCROLLENABLED.Value
        m_rs!CTLPARM_PINENABLED = .chk_CTLPARM_PINENABLED.Value
        m_rs!CTLPARM_RELEASEMODE = .chk_CTLPARM_RELEASEMODE.Value
        m_rs!CTLPARM_USDATE = .chk_CTLPARM_USDATE.Value
        m_rs!F3TASK = .chk_F3TASK.Value
        
        m_rs!CTLPARM_CLIENTPROMPT = UCase(Mid(.txt_CTLPARM_CLIENTPROMPT.Text, 1, 16))
        m_rs!CTLPARM_COMPANY = UCase(Mid(.txt_CTLPARM_COMPANY.Text, 1, 15))
        
        m_rs!CTLPARM_IDPROMPT = UCase(Mid(.txt_CTLPARM_IDPROMPT.Text, 1, 16))
        m_rs!CTLPARM_MATTERPROMPT = UCase(Mid(.txt_CTLPARM_MATTERPROMPT.Text, 1, 16))
        m_rs!CTLPARM_PINPROMPT = UCase(Mid(.txt_CTLPARM_PINPROMPT.Text, 1, 16))
        m_rs!CTLPARM_PIN = Mid(.txt_CTLPARM_PIN.Text, 1, 4)
        
        m_rs!CTLPARM_USERIDMODE = Val(.txt_CTLPARM_USERIDMODE.Text)
        m_rs!CTLPARM_COPYTIMEOUT = Val(.txt_CTLPARM_COPYTIMEOUT.Text)
        
        If .Cbm_ACC = "" Then
            m_rs!CTLPARM_ACC_ACC_GUID = Null
        Else
            m_rs!CTLPARM_ACC_ACC_GUID = GetSQLValue("Select ACC_ACC_GUID from dbo.docugate_general_acc " _
                & " where ACC_FULLName = '" & .Cbm_ACC.Text & "'")
        End If
        
    End With
    
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
    SaveCtrlParms = True
    Exit Function
    
Err_Handler:
    m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
End Function


              



