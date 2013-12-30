Option Strict Off
Option Explicit On
Friend Class cls_fpNoLogon
	
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
	Private m_MachineName As String
	Private m_LabName As String
	Private m_Expire As Date
	Private mFreePrint As Boolean
	
	Private mLabPrint As cls_LabPrint
	Private mCounter As Short
	Private mstart As Short
	Private mLength As Short
	Private fpactivemsg As String
	Private fpexpiredmsg As String
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_FpNoLogon"
		mCounter = 0
		mstart = 1
		mLength = 3
		mCounter = 0
		
		Dim m_workstation As New cls_Workstation
		m_MachineName = m_workstation.mComputerName
		'UPGRADE_NOTE: Object m_workstation may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_workstation = Nothing
		
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public Function Handle_fpNoLogon_Timer() As Short
		
		Handle_fpNoLogon_Timer = 0
		
		mCounter = mCounter + 1
		If (mCounter = 60) Then
			mCounter = 0
			
			If (Mod_Main.IsLoggedOn = False) Then
				If (gClsDatabase.ConnectDB = True) Then
					
					If (GetLabParams = False) Then
						gClsDatabase.CloseDB()
						Exit Function
					End If
					
					If (GetLabExpire = False) Then
						gClsDatabase.CloseDB()
						Exit Function
					End If
					
					gClsDatabase.CloseDB()
					
					ChkFreePrint()
					If (mFreePrint) Then
						gClsConfig.Update_FpNoLogon(True)
						Handle_fpNoLogon_Timer = 3
					Else
						gClsConfig.Update_FpNoLogon(False)
						Handle_fpNoLogon_Timer = 2
					End If
					
				End If 'if clsdatabase.connectdb
			End If ' if mob_main,IsLogged on
		End If ' if counter = 60
		
	End Function
	
	Private Function GetLabParams() As Boolean
		Dim Length As Object
		Dim start As Object
		
		On Error GoTo handler
		
		GetLabParams = False
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT fp_start,fp_length FROM LP_LAB_PARAMS", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		If (Not m_rs.EOF) Then
			'UPGRADE_WARNING: Couldn't resolve default property of object start. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			start = m_rs.Fields("fp_start").Value
			'UPGRADE_WARNING: Couldn't resolve default property of object Length. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Length = m_rs.Fields("fp_length").Value
			'UPGRADE_WARNING: Couldn't resolve default property of object Length. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			'UPGRADE_WARNING: Couldn't resolve default property of object start. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_LabName = Mid(m_MachineName, start, Length)
			m_rs.Close()
			GetLabParams = True
		End If
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	Private Function GetLabExpire() As Boolean
		
		
		On Error GoTo handler
		GetLabExpire = False
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT LP_LAB_FP_EXPIRE FROM LP_LAB WHERE LP_LAB_NAME = '" & m_LabName & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		If Not m_rs.EOF Then
			m_Expire = CDate(m_rs.Fields("LP_LAB_FP_EXPIRE").Value)
			GetLabExpire = True
		End If
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	Private Sub ChkFreePrint()
		
		'UPGRADE_WARNING: DateValue has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
		If (DateValue(CStr(Now)) > DateValue(CStr(m_Expire))) Then
			mFreePrint = False
			Exit Sub
		End If
		
		'UPGRADE_WARNING: DateValue has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
		If (DateValue(CStr(Now)) < DateValue(CStr(m_Expire))) Then
			mFreePrint = True
			Exit Sub
		End If
		
		Dim a As Integer
		'UPGRADE_WARNING: DateDiff behavior may be different. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6B38EC3F-686D-4B2E-B5A5-9E8E7A762E32"'
		a = DateDiff(Microsoft.VisualBasic.DateInterval.Minute, m_Expire, Now)
		If (a < 0) Then
			mFreePrint = True
		Else
			mFreePrint = False
		End If
		
	End Sub
End Class