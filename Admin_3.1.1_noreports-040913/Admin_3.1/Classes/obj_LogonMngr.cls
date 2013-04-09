VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_LogonMngr"
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
Private m_rs As ADODB.Recordset
Private m_cmd As ADODB.Command
Private m_LastError As String
Private m_ActiveLogon As CURRENT_ACCOUNT
Const ErrCodePrefix = "008-"

Private Sub Class_Initialize()
    m_Classname = "obj_LogonMngr"
End Sub

Public Property Let mTerminate(ByVal Data As Boolean)
   m_ActiveLogon.m_TERMINATE = Data
End Property

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Property Get mTerminate() As Boolean
   mTerminate = m_ActiveLogon.m_TERMINATE
End Property

Public Property Let mBadge(ByVal Data As String)
   m_ActiveLogon.m_BADGE = Data
End Property

Public Property Let mPassword(ByVal Data As String)
   m_ActiveLogon.m_PASSWORD = Data
End Property

Public Function SuperUser()
    m_ActiveLogon.m_VALID = True
    m_ActiveLogon.m_ACCESS_LEVEL = "3"
End Function

Public Property Get mBadge() As String
   mBadge = m_ActiveLogon.m_BADGE
End Property

Public Property Get mFullname() As String
   mFullname = m_ActiveLogon.m_FULLNAME
End Property

Public Property Get mValid() As Boolean
   mValid = m_ActiveLogon.m_VALID
End Property

Public Property Get mLevel() As Long
   mLevel = m_ActiveLogon.m_ACCESS_LEVEL
End Property

Public Function SetSuperUserLogin(badge As String)
'//Lynette - there seems to be no account for this hard coded user, hence this is a workaround
'// to populate the required fields needed in the m_ActiveLogon structure

   With m_ActiveLogon
        .m_BADGE = badge
        .m_FIRSTNAME = badge
        .m_FUNDS = "0.00"
        .m_VALID = True
   End With

End Function

Public Function LoginAccount() As Boolean
          
On Error GoTo Err_Handler
   m_LastError = ""
   
   m_ActiveLogon.m_VALID = False
     
   Set m_rs = New ADODB.Recordset
   m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACC WHERE ACC_BADGE='" _
        & m_ActiveLogon.m_BADGE & "' and ACC_PASSWORD = '" _
        & m_ActiveLogon.m_PASSWORD & "'", gConn, adOpenStatic, adLockOptimistic
         
   With m_ActiveLogon
    
     If Not m_rs.EOF Then
          .m_ACCOUNT_GUID = m_rs!acc_acc_guid
          .m_BADGE = m_rs!acc_badge
          .m_ACCESS_LEVEL = m_rs!ACC_ACCESS_LEVEL
          .m_CMETHOD = m_rs!ACC_CMETHOD
          .m_EMAIL = m_rs!ACC_EMAIL
          .m_FIRSTNAME = m_rs!acc_firstname
          .m_FULLNAME = m_rs!ACC_FULLNAME
          .m_LASTNAME = m_rs!acc_lastname
          .m_FUNDS = m_rs!acc_funds
          .m_OU_GUID = m_rs!ACC_OU_GUID
          .m_VALID = True
     End If
   
   End With
    
   m_rs.Close
   Set m_rs = Nothing
   LoginAccount = True
   Exit Function
  
Err_Handler:
   m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description

End Function
