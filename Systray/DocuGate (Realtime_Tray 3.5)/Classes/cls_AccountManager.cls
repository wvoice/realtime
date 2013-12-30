VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_AccountManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
''DISCLAIMER OF WARRANTY
''
''IN NO EVENT SHALL THE AUTHOR AND/OR NPS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL,
''OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
''EVEN IF THE AUTHOR AND/OR NPS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
''THE AUTHOR AND NPS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
''OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
''THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS PROVIDED "AS IS".
''THE AUTHOR AND NPS HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

''The author and/or distributors of this source code may have made statements about this source code.
''Any such statements do not constitute warranties and shall not be relied on by the user in deciding
''whether to use this source code.
''This source code is provided without any express or implied warranties whatsoever.
''Because of the diversity of conditions and hardware under which this source code may be used,
''no warranty of fitness for a particular purpose is offered.
''The user is advised to test the source code thoroughly before relying on it.
''The user must assume the entire risk of using the source code.

Private m_Classname As String
Private m_Accounts As Collection
Private m_Loaded As Boolean
Private m_rs As ADODB.Recordset
Private m_cmd As ADODB.Command
Private m_LastError As String
Private m_ActiveAccount  As ACTIVE_ACCOUNT
Private m_ActiveState    As String
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Private Sub Class_Initialize()
    Set m_rs = New ADODB.Recordset
    Set m_cmd = New ADODB.Command
    m_Classname = "cls_AccountManager"
    m_Loaded = False
End Sub

Public Sub LoadAccounts()
     If (m_Loaded = False) Then
         m_Loaded = True
         Call mGetAccounts
     End If
End Sub

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Property Get isLogonValid() As Boolean
   isLogonValid = m_ActiveAccount.m_VALID
End Property

Public Property Get mActiveAccountGuid() As String
   mActiveAccountGuid = m_ActiveAccount.m_ACCOUNT_GUID
End Property

Public Property Get mActiveOUGuid() As String
   mActiveOUGuid = m_ActiveAccount.m_OU_GUID
End Property

Public Property Get mActiveOUName() As String
   mActiveOUName = m_ActiveAccount.m_OU_NAME
End Property
Public Property Get mActiveWorkstationOU() As String
    mActiveWorkstationOU = m_ActiveAccount.m_WORKSTATION_OU
End Property

Public Property Get mActiveBadge() As String
   mActiveBadge = m_ActiveAccount.m_BADGE
End Property

Public Property Get mActiveState() As String
   mActiveState = m_ActiveState
End Property

Public Property Get mActiveInitFunds() As Variant
   mActiveInitFunds = m_ActiveAccount.m_INITFUNDS
End Property

Public Property Get mActiveCurFunds() As Variant
   mActiveCurFunds = m_ActiveAccount.m_CURFUNDS
End Property

Public Sub UpdateCurrentFunds(mJobCost As Single)
   
   Select Case UCase(m_ActiveAccount.m_OU_CMETHOD)
   Case "CREDIT"
       m_ActiveAccount.m_CURFUNDS = m_ActiveAccount.m_CURFUNDS + mJobCost
   Case "DEBIT"
       m_ActiveAccount.m_CURFUNDS = m_ActiveAccount.m_CURFUNDS - mJobCost
   Case "NOCHARGE"
       m_ActiveAccount.m_CURFUNDS = m_ActiveAccount.m_CURFUNDS
   End Select
   
End Sub

Public Function ForceLogoff() As Boolean
ForceLogoff = False
  
If (m_ActiveAccount.m_OU_CMETHOD = "DEBIT") And (m_ActiveAccount.m_OU_ALLOWNEG = False) And (m_ActiveAccount.m_CURFUNDS <= 0#) Then
    ForceLogoff = True
End If
     
End Function
'Function LocalComputerName() As String
'    Dim buffer As String * 512, length As Long
'    length = Len(buffer)
'    'GetComputerName returns zero on failure
'    If GetComputerName(buffer, length) Then
'        ComputerName = UCase(Left$(buffer, length))
'    End If
'
'End Function
Public Sub GetWorkstationOU()
   Dim buffer As String * 512, length As Long
   length = Len(buffer)
   If GetComputerName(buffer, length) Then
        ComputerName = UCase(Left$(buffer, length))
   End If
   On Error GoTo Err_Handler
          
   m_rs.Open "SELECT WORKSTATION_NAME,WORKSTATION_OU FROM DOCUGATE_GENERAL_WORKSTATION WHERE WORKSTATION_NAME = '" & ComputerName & "'", gconn, adOpenStatic, adLockOptimistic
   
   With m_ActiveAccount
      .m_OU_VALID = False
      If Not m_rs.EOF Then
        .m_WORKSTATION_OU = m_rs!WORKSTATION_OU
     End If
   
   End With
    
   m_rs.Close
   Exit Sub
    
Err_Handler:
  m_LastError = Err.Description
 
End Sub



Public Property Get mActiveFirstname() As String
   mActiveFirstname = m_ActiveAccount.m_FIRSTNAME
End Property

Public Property Get mActiveLastName() As String
   mActiveLastName = m_ActiveAccount.m_LASTNAME
End Property

Public Property Get mActive_OU_CMethod() As String
   mActive_OU_CMethod = m_ActiveAccount.m_OU_CMETHOD
End Property

Public Property Get mActive_OU_AllowNeg() As Boolean
   mActive_OU_AllowNeg = m_ActiveAccount.m_OU_ALLOWNEG
End Property

Public Property Get mActive_OU_Locked() As Boolean
   mActive_OU_Locked = m_ActiveAccount.m_OU_LOCKED
End Property

Public Property Get mActive_OU_Valid() As Boolean
   mActive_OU_Valid = m_ActiveAccount.m_OU_VALID
End Property


Public Function VerifyBadgeCount(Badge As String) As Long
   
   On Error GoTo Err_Handler
   m_rs.Open "SELECT count(*) as count FROM docugate_acc_view WHERE ACC_BADGE='" & Badge & "'", gconn, adOpenStatic, adLockOptimistic
   VerifyBadgeCount = m_rs!Count
   m_rs.Close
   Exit Function
    
Err_Handler:
  m_LastError = Err.Description
 
End Function

Public Sub VerifyBadge(Badge As String)
    Dim buffer As String * 512, length As Long
    length = Len(buffer)
    If GetComputerName(buffer, length) Then
        ComputerName = UCase(Left$(buffer, length))
    End If
   
   On Error GoTo Err_Handler
   m_rs.Open "SELECT * FROM docugate_acc_view WHERE acc_BADGE='" & Badge & "'", gconn, adOpenStatic, adLockOptimistic
   'm_rs.Open "SELECT * FROM docugate_acc_view,docugate_general_workstation WHERE docugate_acc_view.acc_BADGE='" & Badge & "' AND docugate_general_workstation.workstation_name='" & ComputerName & "'", gconn, adOpenStatic, adLockOptimistic
   m_ActiveAccount.m_VALID = False
   
   With m_ActiveAccount
     If Not m_rs.EOF Then
      
          .m_VALID = True
          .m_ACCOUNT_GUID = m_rs.Fields("ACC_ACC_GUID").value
          .m_FIRSTNAME = m_rs.Fields("acc_FIRSTNAME").value
          .m_LASTNAME = m_rs.Fields("acc_LASTNAME").value
          .m_INITFUNDS = m_rs.Fields("acc_funds").value
          .m_CURFUNDS = .m_INITFUNDS
          .m_OU_GUID = m_rs.Fields("ACC_OU_GUID").value
          .m_BADGE = m_rs.Fields("acc_Badge").value
          .m_ACCESS_LEVEL = m_rs.Fields("acc_level").value
          
          'If m_rs!ou_name = UCase("copier") Then
          'If ComputerName = UCase("morpheus") Then
          If m_rs!OU_NAME = UCase("PW PURPLE QK") Or m_rs!OU_NAME = UCase("Staff") Or m_rs!OU_NAME = UCase("AGENCY CREDIT") Or m_rs!OU_NAME = UCase("AGENCY DEBIT") Then
            .m_VALID = True
          Else
            .m_VALID = False
          End If
          
     End If
   
   End With
    
   m_rs.Close
   Exit Sub
    
Err_Handler:
  m_LastError = Err.Description
 
End Sub



Public Sub VerifyBadgePassword(Badge As String, password As String)
          
   On Error GoTo Err_Handler
   m_rs.Open "SELECT * FROM docugate_acc_view WHERE acc_password = '" & password & "' and acc_BADGE='" & Badge & "'", gconn, adOpenStatic, adLockOptimistic
    
   m_ActiveAccount.m_VALID = False
   
   With m_ActiveAccount
     If Not m_rs.EOF Then
      
          .m_VALID = True
          .m_ACCOUNT_GUID = m_rs!acc_guid
          .m_FIRSTNAME = m_rs!acc_FIRSTNAME
          .m_LASTNAME = m_rs!acc_lastname
          .m_INITFUNDS = m_rs!acc_funds
          .m_CURFUNDS = .m_INITFUNDS
          .m_OU_GUID = m_rs!ou_guid
          .m_BADGE = m_rs!ACC_BADGE
          .m_ACCESS_LEVEL = m_rs!acc_level
          
          
     End If
   
   End With
    
   m_rs.Close
   Exit Sub
    
Err_Handler:
  m_LastError = Err.Description
 
End Sub

Public Function DeleteAccount(GUID As String) As Boolean
    
   On Error GoTo Err_Handler
      Set m_cmd = New ADODB.Command
      'm_cmd.Execute "DELETE FROM DOCUGATE_ACCOUNTS WHERE ACOUNT_GUID='" & GUID & "'", gconn, adOpenStatic, adLockOptimistic 'dec28 MJY
      Set gCmd = Nothing
      Exit Function
    
Err_Handler:
  m_LastError = Err.Description
 
End Function
Public Function GetSQLValue(sql As String) As Variant

    Dim rs As New ADODB.Recordset
    rs.Open sql, gconn, adOpenForwardOnly, adLockReadOnly
    If rs.EOF = True Then
        GetSQLValue = Null
    Else
        GetSQLValue = rs(0)
    End If
    rs.Close

End Function

Public Function AddAccount(ByRef MyForm As Form) As String
    
    
    
    
   ' add a new account
   
   On Error GoTo Err_Handler
   m_rs.Open "SELECT * FROM DOCUGATE_ACCOUNTS WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
   m_rs.AddNew
   m_rs!Badge = MyForm.txt_Badge
   m_rs!FIRSTNAME = MyForm.txt_Firstname
   m_rs!LASTNAME = MyForm.txt_LastName
   m_rs!cmethod = UCase(MyForm.Cbm_Charge)
   m_rs!Funds = MyForm.txt_Funds
   
   If (UCase(MyForm.Cbm_AccessLevel) = "ADMIN") Then
       m_rs!Access_Level = ADMIN_LEVEL
   ElseIf (UCase(MyForm.Cbm_AccessLevel) = "CASHIER") Then
       m_rs!Access_Level = CASHIER_LEVEL
   ElseIf (UCase(MyForm.Cbm_AccessLevel) = "USER") Then
       m_rs!Access_Level = USER_LEVEL
   Else
       m_rs!Access_Level = USER_LEVEL
   End If
         
   m_rs!password = MyForm.txt_Password
   m_rs!email = MyForm.txt_Email
   m_rs!ACC_ACC_GUID = GetGuid()
      
  ' Dim ou_guid As Object
  ' Set ou_guid = MyOUs.Item(MyForm.Cbm_OU)
  ' m_rs!ou_guid = ou_guid.mGuid
   m_rs.Update
   m_rs.Close
   Set m_rs = Nothing
   Exit Function
    
Err_Handler:
   m_LastError = Err.Description
 
End Function

Private Sub mGetAccounts()
   
   On Error GoTo Err_Handler
   
   Set m_rs = New ADODB.Recordset
   m_rs.Open "SELECT * FROM DOCUGATE_ACC_VIEW", gconn, adOpenStatic, adLockOptimistic
          
   While Not m_rs.EOF
    
   '  Dim mAccount As New ACTIVE_ACCOUNT
   '  m_Accounts.Add mAccount, rs!acc_guid
   '  m_rs.MoveNext
   
   Wend
   
   Set m_rs = Nothing
   Exit Sub
   
Err_Handler:
   m_LastError = Err.Description

End Sub


Public Sub GetPrintCosts()

   On Error GoTo Err_Handler
   m_rs.Open "SELECT GLOBALS_SFBW, GLOBALS_LFBW, GLOBALS_SFCOLOR, GLOBALS_LFCOLOR, GLOBALS_SITE_MULTIPLR FROM DOCUGATE_GENERAL_GLOBAL", gconn, adOpenStatic, adLockOptimistic
    
   With ActiveCost
          .m_HIGHEST = 0
          
     If Not m_rs.EOF Then
          
          .m_MULTIPLIER = CSng(m_rs!GLOBALS_SITE_MULTIPLR)
          
          .m_LFBW = CSng(m_rs!GLOBALS_LFBW)
          .m_LFBW = .m_LFBW * .m_MULTIPLIER
          If .m_LFBW > .m_HIGHEST Then .m_HIGHEST = .m_LFBW
           
          .m_LFCOLOR = CSng(m_rs!GLOBALS_LFCOLOR)
          .m_LFCOLOR = .m_LFCOLOR * .m_MULTIPLIER
          If .m_LFCOLOR > .m_HIGHEST Then .m_HIGHEST = .m_LFCOLOR
          
          .m_SFBW = CSng(m_rs!GLOBALS_SFBW)
          .m_SFBW = .m_SFBW * .m_MULTIPLIER
          If .m_SFBW > .m_HIGHEST Then .m_HIGHEST = .m_SFBW
          
          .m_SFCOLOR = CSng(m_rs!GLOBALS_SFCOLOR)
          .m_SFCOLOR = .m_SFCOLOR * .m_MULTIPLIER
          If .m_SFCOLOR > .m_HIGHEST Then .m_HIGHEST = .m_SFCOLOR
          
     End If
   
   End With
    
   m_rs.Close
    
Err_Handler:
    
    If (Err.Number <> 0) Then
      m_LastError = Err.Description
    End If
    
End Sub

Public Sub GetOU()
   
   On Error GoTo Err_Handler
          
   m_rs.Open "SELECT OU_LOCKED,OU_CHARGE,OU_ALLOWNEG,OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '" & m_ActiveAccount.m_OU_GUID & "'", gconn, adOpenStatic, adLockOptimistic
   
   With m_ActiveAccount
      .m_OU_VALID = False
      If Not m_rs.EOF Then
        .m_OU_ALLOWNEG = m_rs!OU_ALLOWNEG
        .m_OU_LOCKED = m_rs!OU_LOCKED
        .m_OU_VALID = True
        .m_OU_CMETHOD = m_rs!OU_CHARGE
        .m_OU_NAME = m_rs!OU_NAME
     End If
   
   End With
    
   m_rs.Close
   Exit Sub
    
Err_Handler:
  m_LastError = Err.Description
 
End Sub


Public Sub UpdateAccountFunds()
   
   On Error GoTo Err_Handler
          
   m_rs.Open "SELECT ACC_FUNDS FROM docugate_general_Acc WHERE ACC_ACC_GUID = '" & m_ActiveAccount.m_ACCOUNT_GUID & "'", gconn, adOpenStatic, adLockOptimistic
   
   If Not m_rs.EOF Then
       m_rs!acc_funds = m_ActiveAccount.m_CURFUNDS
       m_rs.Update
   End If
    
   m_rs.Close
   Exit Sub
    
Err_Handler:
  m_LastError = Err.Description
 
End Sub

Property Get ActiveAccount_GUID() As String
     ActiveAccount_GUID = m_ActiveAccount.m_ACCOUNT_GUID
End Property

Property Get ActiveOu_GUID() As String
     ActiveOu_GUID = m_ActiveAccount.m_OU_GUID
End Property

Public Function DB_IsAlreadyActive(acc_guid As String) As Boolean
   
   On Error GoTo Err_Handler
   m_rs.Open "SELECT COUNT(*) as counter FROM docugate_general_active_session WHERE acc_guid = '" & acc_guid & "'", gconn, adOpenStatic, adLockOptimistic
   
   If (CInt(m_rs!counter) > 0) Then
       DB_IsAlreadyActive = True
   Else
       DB_IsAlreadyActive = False
   End If
   
    
Err_Handler:
   
   If (Err.Number <> 0) Then
      MsgBox (Err.Description)
      Err.Clear
   End If
      
   m_rs.Close
 
End Function

Public Sub DB_InsertActive(acc_guid As String)
   
   On Error GoTo Err_Handler
   m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACTIVE_SESSION WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
   m_rs.AddNew
   m_rs!acc_guid = acc_guid
   m_rs.Update
   m_rs.Close
    
Err_Handler:
   If (Err.Number <> 0) Then
      MsgBox (Err.Description)
      Err.Clear
   End If
  
End Sub

Public Sub DB_RemoveActive(acc_guid As String)
   
   
   On Error GoTo Err_Handler
    Dim mcmd As ADODB.Command
    Set mcmd = New ADODB.Command
    mcmd.CommandText = "DELETE FROM DOCUGATE_GENERAL_ACTIVE_SESSION WHERE ACC_GUID = '" & acc_guid & "'"
    mcmd.ActiveConnection = gconn
    mcmd.Execute sql
    Set mcmd = Nothing
   
Err_Handler:
   If (Err.Number <> 0) Then
      MsgBox (Err.Description)
      Err.Clear
   End If
  
End Sub


