Option Strict Off
Option Explicit On
Friend Class cls_AccountManager
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
	Private m_ActiveAccount As ACTIVE_ACCOUNT
	Private m_ActiveState As String
	Private Declare Function GetComputerName Lib "kernel32"  Alias "GetComputerNameA"(ByVal lpBuffer As String, ByRef nSize As Integer) As Integer
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_rs = New ADODB.Recordset
		m_cmd = New ADODB.Command
		m_Classname = "cls_AccountManager"
		m_Loaded = False
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public Sub LoadAccounts()
		If (m_Loaded = False) Then
			m_Loaded = True
			Call mGetAccounts()
		End If
	End Sub
	
	Public ReadOnly Property mLastError() As String
		Get
			mLastError = m_LastError
		End Get
	End Property
	
	Public ReadOnly Property isLogonValid() As Boolean
		Get
			isLogonValid = m_ActiveAccount.m_VALID
		End Get
	End Property
	
	Public ReadOnly Property mActiveAccountGuid() As String
		Get
			mActiveAccountGuid = m_ActiveAccount.m_ACCOUNT_GUID
		End Get
	End Property
	
	Public ReadOnly Property mActiveOUGuid() As String
		Get
			mActiveOUGuid = m_ActiveAccount.m_OU_GUID
		End Get
	End Property
	
	Public ReadOnly Property mActiveOUName() As String
		Get
			mActiveOUName = m_ActiveAccount.m_OU_NAME
		End Get
	End Property
	Public ReadOnly Property mActiveWorkstationOU() As String
		Get
			mActiveWorkstationOU = m_ActiveAccount.m_WORKSTATION_OU
		End Get
	End Property
	
	Public ReadOnly Property mActiveBadge() As String
		Get
			mActiveBadge = m_ActiveAccount.m_BADGE
		End Get
	End Property
	
	Public ReadOnly Property mActiveState() As String
		Get
			mActiveState = m_ActiveState
		End Get
	End Property
	
	Public ReadOnly Property mActiveInitFunds() As Object
		Get
			'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_INITFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			'UPGRADE_WARNING: Couldn't resolve default property of object mActiveInitFunds. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			mActiveInitFunds = m_ActiveAccount.m_INITFUNDS
		End Get
	End Property
	
	Public ReadOnly Property mActiveCurFunds() As Object
		Get
			'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			'UPGRADE_WARNING: Couldn't resolve default property of object mActiveCurFunds. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			mActiveCurFunds = m_ActiveAccount.m_CURFUNDS
		End Get
	End Property
	
	
	
	Public ReadOnly Property mActiveFirstname() As String
		Get
			mActiveFirstname = m_ActiveAccount.m_FIRSTNAME
		End Get
	End Property
	
	Public ReadOnly Property mActiveLastName() As String
		Get
			mActiveLastName = m_ActiveAccount.m_LASTNAME
		End Get
	End Property
	
	Public ReadOnly Property mActive_OU_CMethod() As String
		Get
			mActive_OU_CMethod = m_ActiveAccount.m_OU_CMETHOD
		End Get
	End Property
	
	Public ReadOnly Property mActive_OU_AllowNeg() As Boolean
		Get
			mActive_OU_AllowNeg = m_ActiveAccount.m_OU_ALLOWNEG
		End Get
	End Property
	
	Public ReadOnly Property mActive_OU_Locked() As Boolean
		Get
			mActive_OU_Locked = m_ActiveAccount.m_OU_LOCKED
		End Get
	End Property
	
	Public ReadOnly Property mActive_OU_Valid() As Boolean
		Get
			mActive_OU_Valid = m_ActiveAccount.m_OU_VALID
		End Get
	End Property
	
	ReadOnly Property ActiveAccount_GUID() As String
		Get
			ActiveAccount_GUID = m_ActiveAccount.m_ACCOUNT_GUID
		End Get
	End Property
	
	ReadOnly Property ActiveOu_GUID() As String
		Get
			ActiveOu_GUID = m_ActiveAccount.m_OU_GUID
		End Get
	End Property
	
	Public Sub UpdateCurrentFunds(ByRef mJobCost As Single)
		
		Select Case UCase(m_ActiveAccount.m_OU_CMETHOD)
			Case "CREDIT"
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				m_ActiveAccount.m_CURFUNDS = m_ActiveAccount.m_CURFUNDS + mJobCost
			Case "DEBIT"
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				m_ActiveAccount.m_CURFUNDS = m_ActiveAccount.m_CURFUNDS - mJobCost
			Case "NOCHARGE"
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
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
		Dim ComputerName As Object
		Dim buffer As New VB6.FixedLengthString(512)
		Dim length As Integer
		length = Len(buffer.Value)
		If GetComputerName(buffer.Value, length) Then
			'UPGRADE_WARNING: Couldn't resolve default property of object ComputerName. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			ComputerName = UCase(Left(buffer.Value, length))
		End If
		On Error GoTo Err_Handler
		
		'UPGRADE_WARNING: Couldn't resolve default property of object ComputerName. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Open("SELECT WORKSTATION_NAME,WORKSTATION_OU FROM DOCUGATE_GENERAL_WORKSTATION WHERE WORKSTATION_NAME = '" & ComputerName & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		With m_ActiveAccount
			.m_OU_VALID = False
			If Not m_rs.EOF Then
				.m_WORKSTATION_OU = m_rs.Fields("WORKSTATION_OU").Value
			End If
			
		End With
		
		m_rs.Close()
		Exit Sub
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Sub
	
	
	Public Function VerifyBadgeCount(ByRef Badge As String) As Integer
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT count(*) as count FROM docugate_acc_view WHERE ACC_BADGE='" & Badge & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		VerifyBadgeCount = m_rs.Fields("Count").Value
		m_rs.Close()
		Exit Function
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Function
	
	Public Sub VerifyBadge(ByRef Badge As String)
		Dim ComputerName As Object
		Dim buffer As New VB6.FixedLengthString(512)
		Dim length As Integer
		length = Len(buffer.Value)
		If GetComputerName(buffer.Value, length) Then
			'UPGRADE_WARNING: Couldn't resolve default property of object ComputerName. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			ComputerName = UCase(Left(buffer.Value, length))
		End If
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT * FROM docugate_acc_view WHERE acc_BADGE='" & Badge & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		'm_rs.Open "SELECT * FROM docugate_acc_view,docugate_general_workstation WHERE docugate_acc_view.acc_BADGE='" & Badge & "' AND docugate_general_workstation.workstation_name='" & ComputerName & "'", gconn, adOpenStatic, adLockOptimistic
		m_ActiveAccount.m_VALID = False
		
		With m_ActiveAccount
			If Not m_rs.EOF Then
				
				.m_VALID = True
				.m_ACCOUNT_GUID = m_rs.Fields("ACC_ACC_GUID").value
				.m_FIRSTNAME = m_rs.Fields("acc_FIRSTNAME").value
				.m_LASTNAME = m_rs.Fields("acc_LASTNAME").value
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_INITFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				.m_INITFUNDS = m_rs.Fields("acc_funds").value
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_INITFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				.m_CURFUNDS = .m_INITFUNDS
				.m_OU_GUID = m_rs.Fields("ACC_OU_GUID").value
				.m_BADGE = m_rs.Fields("acc_Badge").value
				.m_ACCESS_LEVEL = m_rs.Fields("acc_level").value
				
				'If m_rs!ou_name = UCase("copier") Then
				'If ComputerName = UCase("morpheus") Then
				If m_rs.Fields("OU_NAME").Value = UCase("PW PURPLE QK") Or m_rs.Fields("OU_NAME").Value = UCase("Staff") Or m_rs.Fields("OU_NAME").Value = UCase("AGENCY CREDIT") Or m_rs.Fields("OU_NAME").Value = UCase("AGENCY DEBIT") Then
					.m_VALID = True
				Else
					.m_VALID = False
				End If
				
			End If
			
		End With
		
		m_rs.Close()
		Exit Sub
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Sub
	
	
	
	Public Sub VerifyBadgePassword(ByRef Badge As String, ByRef password As String)
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT * FROM docugate_acc_view WHERE acc_password = '" & password & "' and acc_BADGE='" & Badge & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		m_ActiveAccount.m_VALID = False
		
		With m_ActiveAccount
			If Not m_rs.EOF Then
				
				.m_VALID = True
				.m_ACCOUNT_GUID = m_rs.Fields("acc_guid").Value
				.m_FIRSTNAME = m_rs.Fields("acc_FIRSTNAME").Value
				.m_LASTNAME = m_rs.Fields("acc_lastname").Value
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_INITFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				.m_INITFUNDS = m_rs.Fields("acc_funds").Value
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_INITFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				.m_CURFUNDS = .m_INITFUNDS
				.m_OU_GUID = m_rs.Fields("ou_guid").Value
				.m_BADGE = m_rs.Fields("ACC_BADGE").Value
				.m_ACCESS_LEVEL = m_rs.Fields("acc_level").Value
				
				
			End If
			
		End With
		
		m_rs.Close()
		Exit Sub
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Sub
	
	Public Function DeleteAccount(ByRef GUID As String) As Boolean
		Dim gCmd As Object
		
		On Error GoTo Err_Handler
		m_cmd = New ADODB.Command
		'  m_cmd.Execute "DELETE FROM DOCUGATE_ACCOUNTS WHERE ACOUNT_GUID='" & GUID & "'", gConn, adOpenStatic, adLockOptimistic
		'UPGRADE_NOTE: Object gCmd may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gCmd = Nothing
		Exit Function
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Function
	Public Function GetSQLValue(ByRef sql As String) As Object
		
		Dim rs As New ADODB.Recordset
		rs.Open(sql, gconn, ADODB.CursorTypeEnum.adOpenForwardOnly, ADODB.LockTypeEnum.adLockReadOnly)
		If rs.EOF = True Then
			'UPGRADE_WARNING: Use of Null/IsNull() detected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="2EED02CB-5C0E-4DC1-AE94-4FAA3A30F51A"'
			'UPGRADE_WARNING: Couldn't resolve default property of object GetSQLValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			GetSQLValue = System.DBNull.Value
		Else
			GetSQLValue = rs.Fields(0).Value
		End If
		rs.Close()
		
	End Function
	
	Public Function AddAccount(ByRef MyForm As System.Windows.Forms.Form) As String
		Dim USER_LEVEL As Object
		Dim CASHIER_LEVEL As Object
		Dim ADMIN_LEVEL As Object
		
		
		
		
		' add a new account
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT * FROM DOCUGATE_ACCOUNTS WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.AddNew()
		'UPGRADE_ISSUE: Control txt_Badge could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("Badge").Value = MyForm.txt_Badge
		'UPGRADE_ISSUE: Control txt_Firstname could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("FIRSTNAME").Value = MyForm.txt_Firstname
		'UPGRADE_ISSUE: Control txt_LastName could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("LASTNAME").Value = MyForm.txt_LastName
		'UPGRADE_ISSUE: Control Cbm_Charge could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("cmethod").Value = UCase(MyForm.Cbm_Charge)
		'UPGRADE_ISSUE: Control txt_Funds could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("Funds").Value = MyForm.txt_Funds
		
		'UPGRADE_ISSUE: Control Cbm_AccessLevel could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		If (UCase(MyForm.Cbm_AccessLevel) = "ADMIN") Then
			'UPGRADE_WARNING: Couldn't resolve default property of object ADMIN_LEVEL. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_rs.Fields("Access_Level").Value = ADMIN_LEVEL
			'UPGRADE_ISSUE: Control Cbm_AccessLevel could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		ElseIf (UCase(MyForm.Cbm_AccessLevel) = "CASHIER") Then 
			'UPGRADE_WARNING: Couldn't resolve default property of object CASHIER_LEVEL. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_rs.Fields("Access_Level").Value = CASHIER_LEVEL
			'UPGRADE_ISSUE: Control Cbm_AccessLevel could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		ElseIf (UCase(MyForm.Cbm_AccessLevel) = "USER") Then 
			'UPGRADE_WARNING: Couldn't resolve default property of object USER_LEVEL. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_rs.Fields("Access_Level").Value = USER_LEVEL
		Else
			'UPGRADE_WARNING: Couldn't resolve default property of object USER_LEVEL. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_rs.Fields("Access_Level").Value = USER_LEVEL
		End If
		
		'UPGRADE_ISSUE: Control txt_Password could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("password").Value = MyForm.txt_Password
		'UPGRADE_ISSUE: Control txt_Email could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		m_rs.Fields("email").Value = MyForm.txt_Email
		m_rs.Fields("ACC_ACC_GUID").Value = GetGuid()
		
		' Dim ou_guid As Object
		' Set ou_guid = MyOUs.Item(MyForm.Cbm_OU)
		' m_rs!ou_guid = ou_guid.mGuid
		m_rs.Update()
		m_rs.Close()
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		Exit Function
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Function
	
	Private Sub mGetAccounts()
		
		On Error GoTo Err_Handler
		
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT * FROM DOCUGATE_ACC_VIEW", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		While Not m_rs.EOF
			
			'  Dim mAccount As New ACTIVE_ACCOUNT
			'  m_Accounts.Add mAccount, rs!acc_guid
			'  m_rs.MoveNext
			
		End While
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		Exit Sub
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Sub
	
	
	Public Sub GetPrintCosts()
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT GLOBALS_SFBW, GLOBALS_LFBW, GLOBALS_SFCOLOR, GLOBALS_LFCOLOR, GLOBALS_SITE_MULTIPLR FROM DOCUGATE_GENERAL_GLOBAL", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		With ActiveCost
			.m_HIGHEST = 0
			
			If Not m_rs.EOF Then
				
				.m_MULTIPLIER = CSng(m_rs.Fields("GLOBALS_SITE_MULTIPLR").Value)
				
				.m_LFBW = CSng(m_rs.Fields("GLOBALS_LFBW").Value)
				.m_LFBW = .m_LFBW * .m_MULTIPLIER
				If .m_LFBW > .m_HIGHEST Then .m_HIGHEST = .m_LFBW
				
				.m_LFCOLOR = CSng(m_rs.Fields("GLOBALS_LFCOLOR").Value)
				.m_LFCOLOR = .m_LFCOLOR * .m_MULTIPLIER
				If .m_LFCOLOR > .m_HIGHEST Then .m_HIGHEST = .m_LFCOLOR
				
				.m_SFBW = CSng(m_rs.Fields("GLOBALS_SFBW").Value)
				.m_SFBW = .m_SFBW * .m_MULTIPLIER
				If .m_SFBW > .m_HIGHEST Then .m_HIGHEST = .m_SFBW
				
				.m_SFCOLOR = CSng(m_rs.Fields("GLOBALS_SFCOLOR").Value)
				.m_SFCOLOR = .m_SFCOLOR * .m_MULTIPLIER
				If .m_SFCOLOR > .m_HIGHEST Then .m_HIGHEST = .m_SFCOLOR
				
			End If
			
		End With
		
		m_rs.Close()
		
Err_Handler: 
		
		If (Err.Number <> 0) Then
			m_LastError = Err.Description
		End If
		
	End Sub
	
	Public Sub GetOU()
		
		On Error GoTo Err_Handler
		
		m_rs.Open("SELECT OU_LOCKED,OU_CHARGE,OU_ALLOWNEG,OU_NAME FROM DOCUGATE_GENERAL_OU WHERE OU_GUID = '" & m_ActiveAccount.m_OU_GUID & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		With m_ActiveAccount
			.m_OU_VALID = False
			If Not m_rs.EOF Then
				.m_OU_ALLOWNEG = m_rs.Fields("OU_ALLOWNEG").Value
				.m_OU_LOCKED = m_rs.Fields("OU_LOCKED").Value
				.m_OU_VALID = True
				.m_OU_CMETHOD = m_rs.Fields("OU_CHARGE").Value
				.m_OU_NAME = m_rs.Fields("OU_NAME").Value
			End If
			
		End With
		
		m_rs.Close()
		Exit Sub
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Sub
	
	
	Public Sub UpdateAccountFunds()
		
		On Error GoTo Err_Handler
		
		m_rs.Open("SELECT ACC_FUNDS FROM docugate_general_Acc WHERE ACC_ACC_GUID = '" & m_ActiveAccount.m_ACCOUNT_GUID & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		If Not m_rs.EOF Then
			'UPGRADE_WARNING: Couldn't resolve default property of object m_ActiveAccount.m_CURFUNDS. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_rs.Fields("acc_funds").Value = m_ActiveAccount.m_CURFUNDS
			m_rs.Update()
		End If
		
		m_rs.Close()
		Exit Sub
		
Err_Handler: 
		m_LastError = Err.Description
		
	End Sub
	
	Public Function DB_IsAlreadyActive(ByRef acc_guid As String) As Boolean
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT COUNT(*) as counter FROM docugate_general_active_session WHERE acc_guid = '" & acc_guid & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		If (CShort(m_rs.Fields("counter").Value) > 0) Then
			DB_IsAlreadyActive = True
		Else
			DB_IsAlreadyActive = False
		End If
		
		
Err_Handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
			Err.Clear()
		End If
		
		m_rs.Close()
		
	End Function
	
	Public Sub DB_InsertActive(ByRef acc_guid As String)
		
		On Error GoTo Err_Handler
		m_rs.Open("SELECT * FROM DOCUGATE_GENERAL_ACTIVE_SESSION WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.AddNew()
		m_rs.Fields("acc_guid").Value = acc_guid
		m_rs.Update()
		m_rs.Close()
		
Err_Handler: 
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
			Err.Clear()
		End If
		
	End Sub
	
	Public Sub DB_RemoveActive(ByRef acc_guid As String)
		Dim sql As Object
		
		
		On Error GoTo Err_Handler
		Dim mcmd As ADODB.Command
		mcmd = New ADODB.Command
		mcmd.CommandText = "DELETE FROM DOCUGATE_GENERAL_ACTIVE_SESSION WHERE ACC_GUID = '" & acc_guid & "'"
		mcmd.let_ActiveConnection(gconn)
		mcmd.Execute(sql)
		'UPGRADE_NOTE: Object mcmd may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		mcmd = Nothing
		
Err_Handler: 
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
			Err.Clear()
		End If
		
	End Sub
End Class