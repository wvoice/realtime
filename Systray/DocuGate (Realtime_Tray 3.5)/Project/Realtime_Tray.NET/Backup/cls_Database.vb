Option Strict Off
Option Explicit On
Friend Class cls_Database
	
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
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_Database"
		gconn = New ADODB.Connection
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public Function ConnectDB() As Boolean
		Dim gLastErr As Object
		
		On Error GoTo Err_Handler
		
		ConnectDB = False
		
		If gconn.State = ADODB.ObjectStateEnum.adStateClosed Then
			gconn.CursorLocation = ADODB.CursorLocationEnum.adUseClient
			
			With ActiveDatabase
				gconn.ConnectionString = "Provider=SQLOLEDB" & ";SERVER=" & gClsConfig.DatabaseServer & ";DATABASE=DOCUGATE;UID=RTT;PWD=Qwerty#1;"
			End With
			
			gconn.ConnectionTimeout = 4
			gconn.Open()
		End If
		
		ConnectDB = True
		Exit Function
		
Err_Handler: 
		
		If Err.Number <> 0 And InStr(UCase(Err.Description), "LOGIN FAILED") Then
			Err.Clear()
			If (SecondaryLogin() = False) Then
				ConnectDB = False
			Else
				ConnectDB = True
			End If
		Else
			''  MsgBox Err.Description, vbCritical, "cls_Database::ConnectDB()"
		End If
		
		'UPGRADE_WARNING: Couldn't resolve default property of object gLastErr. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		gLastErr = Err.Description
		
	End Function
	
	
	Private Function SecondaryLogin() As Boolean
		Dim gLastErr As Object
		
		On Error GoTo Err_Handler
		
		SecondaryLogin = False
		
		If gconn.State = ADODB.ObjectStateEnum.adStateClosed Then
			
			gconn.CursorLocation = ADODB.CursorLocationEnum.adUseClient
			With ActiveDatabase
				gconn.ConnectionString = "Provider=SQLOLEDB" & ";SERVER=" & gClsConfig.DatabaseServer & ";DATABASE=DOCUGATE;UID=sa;PWD=Qwerty#1;"
			End With
			
			gconn.ConnectionTimeout = 4
			gconn.Open()
		End If
		
		SecondaryLogin = True
		Exit Function
		
Err_Handler: 
		MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_Database::ConnectDB()")
		'UPGRADE_WARNING: Couldn't resolve default property of object gLastErr. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		gLastErr = Err.Description
		
	End Function
	
	
	
	
	Public Function CloseDB() As String
		
		If gconn.State = ADODB.ObjectStateEnum.adStateOpen Then
			gconn.Close()
		End If
		
	End Function
	
	'UPGRADE_NOTE: Class_Terminate was upgraded to Class_Terminate_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Terminate_Renamed()
		Call CloseDB()
	End Sub
	Protected Overrides Sub Finalize()
		Class_Terminate_Renamed()
		MyBase.Finalize()
	End Sub
	
	
	Public Function AddJob(ByRef MyForm As System.Windows.Forms.Form) As String
		Dim m_LastError As Object
		Dim m_rs As Object
		
		On Error GoTo Err_Handler
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.Open. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Open("SELECT * FROM DOCUGATE_ACCOUNTS WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.AddNew. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.AddNew()
		'UPGRADE_ISSUE: Control txt_Badge could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!Badge. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!Badge = MyForm.txt_Badge
		'UPGRADE_ISSUE: Control txt_Firstname could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!FIRSTNAME. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!FIRSTNAME = MyForm.txt_Firstname
		'UPGRADE_ISSUE: Control txt_LastName could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!LASTNAME. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!LASTNAME = MyForm.txt_LastName
		'UPGRADE_ISSUE: Control Cbm_Charge could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!cmethod. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!cmethod = UCase(MyForm.Cbm_Charge)
		'UPGRADE_ISSUE: Control txt_Funds could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!Funds. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!Funds = MyForm.txt_Funds
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.Update. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Update()
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.Close. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Close()
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		
Err_Handler: 
		If (Err.Number <> 0) Then
			'UPGRADE_WARNING: Couldn't resolve default property of object m_LastError. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_LastError = Err.Description
		End If
		
	End Function
	
	
	Public Function IsLoggedOn(ByRef MyForm As System.Windows.Forms.Form) As String
		Dim m_LastError As Object
		Dim m_rs As Object
		
		On Error GoTo Err_Handler
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.Open. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Open("SELECT * FROM DOCUGATE_ACCOUNTS WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.AddNew. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.AddNew()
		'UPGRADE_ISSUE: Control txt_Badge could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!Badge. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!Badge = MyForm.txt_Badge
		'UPGRADE_ISSUE: Control txt_Firstname could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!FIRSTNAME. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!FIRSTNAME = MyForm.txt_Firstname
		'UPGRADE_ISSUE: Control txt_LastName could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!LASTNAME. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!LASTNAME = MyForm.txt_LastName
		'UPGRADE_ISSUE: Control Cbm_Charge could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!cmethod. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!cmethod = UCase(MyForm.Cbm_Charge)
		'UPGRADE_ISSUE: Control txt_Funds could not be resolved because it was within the generic namespace Form. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="084D22AD-ECB1-400F-B4C7-418ECEC5E36E"'
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs!Funds. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs!Funds = MyForm.txt_Funds
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.Update. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Update()
		'UPGRADE_WARNING: Couldn't resolve default property of object m_rs.Close. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_rs.Close()
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		
Err_Handler: 
		If (Err.Number <> 0) Then
			'UPGRADE_WARNING: Couldn't resolve default property of object m_LastError. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_LastError = Err.Description
		End If
		
	End Function
End Class