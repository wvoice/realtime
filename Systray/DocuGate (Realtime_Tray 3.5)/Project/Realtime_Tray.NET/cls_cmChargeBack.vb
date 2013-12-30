Option Strict Off
Option Explicit On
Friend Class cls_cmChargeBack
	
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
	Private m_CurJobs As Collection
	Private m_rs As ADODB.Recordset
	Private m_ActiveAccount_GUID As String
	Private m_ActiveOu_GUID As String
	
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_AcmChargeBack"
		m_ActiveAccount_GUID = gClsaccountManager.ActiveAccount_GUID
		m_ActiveOu_GUID = gClsaccountManager.ActiveOu_GUID
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	'UPGRADE_NOTE: Filter was upgraded to Filter_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Public Sub CM_PopulateClientsByCode(ByRef obj As AxCTLISTLib.AxctList, ByRef Filter_Renamed As String)
		Dim Item As Object
		
		obj.ClearList()
		On Error GoTo handler
		
		m_rs.Open("SELECT CC_GUID,CC_CODE,CC_NAME,CC_DESC FROM DOCUGATE_GENERAL_CC WHERE CC_CODE LIKE '" & Filter_Renamed & "%'", gconn, ADODB.CursorTypeEnum.adOpenForwardOnly, ADODB.LockTypeEnum.adLockReadOnly)
		While Not m_rs.EOF
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Item = obj.AddItem(m_rs.Fields("CC_CODE").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_CellText(Item, 2, m_rs.Fields("CC_NAME").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_CellText(Item, 3, m_rs.Fields("CC_DESC").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_ListCargo(Item, m_rs.Fields("CC_GUID").Value)
			m_rs.MoveNext()
		End While
		m_rs.Close()
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
		End If
		
	End Sub
	
	'UPGRADE_NOTE: Filter was upgraded to Filter_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Public Sub CM_PopulateClientsByName(ByRef obj As AxCTLISTLib.AxctList, ByRef Filter_Renamed As String)
		Dim Item As Object
		
		obj.ClearList()
		On Error GoTo handler
		
		m_rs.Open("SELECT CC_GUID,CC_CODE,CC_NAME,CC_DESC FROM DOCUGATE_GENERAL_CC WHERE CC_NAME LIKE '" & Filter_Renamed & "%'", gconn, ADODB.CursorTypeEnum.adOpenForwardOnly, ADODB.LockTypeEnum.adLockReadOnly)
		While Not m_rs.EOF
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Item = obj.AddItem(m_rs.Fields("CC_NAME").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_CellText(Item, 2, m_rs.Fields("CC_DESC").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_CellText(Item, 3, m_rs.Fields("CC_CODE").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_ListCargo(Item, m_rs.Fields("CC_GUID").Value)
			m_rs.MoveNext()
		End While
		m_rs.Close()
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
		End If
		
	End Sub
	
	
	'UPGRADE_NOTE: Filter was upgraded to Filter_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Public Function CM_PopulateMatters(ByRef obj As AxCTLISTLib.AxctList, ByRef Filter_Renamed As String) As Integer
		Dim Item As Object
		
		obj.ClearList()
		On Error GoTo handler
		
		m_rs.Open("SELECT CM_GUID,CM_MATTER,CM_DESCRIPTION FROM DOCUGATE_GENERAL_CM WHERE CC_GUID = '" & Filter_Renamed & "'", gconn, ADODB.CursorTypeEnum.adOpenForwardOnly, ADODB.LockTypeEnum.adLockReadOnly)
		While Not m_rs.EOF
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Item = obj.AddItem(m_rs.Fields("CM_MATTER").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_CellText(Item, 2, m_rs.Fields("CM_DESCRIPTION").Value)
			'UPGRADE_WARNING: Couldn't resolve default property of object Item. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			obj.set_ListCargo(Item, m_rs.Fields("CM_GUID").Value)
			m_rs.MoveNext()
		End While
		m_rs.Close()
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
		End If
		
	End Function
	
	
	Public Function CM_UpdateDatabaseJob(ByRef GUID As String, ByRef CC As String, ByRef CM As String) As Boolean
		
		On Error GoTo handler
		CM_UpdateDatabaseJob = True
		m_rs.Open("SELECT CC_CODE,CM_MATTER FROM DOCUGATE_GENERAL_ACTIVITY WHERE JOB_GUID = '" & GUID & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.Fields("CC_CODE").Value = CC
		m_rs.Fields("CM_MATTER").Value = CM
		m_rs.Update()
		m_rs.Close()
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox("CM_UpdateDatabaseJob(" & Err.Description & ")", MsgBoxStyle.Critical, "Docugate Workstation Event")
			CM_UpdateDatabaseJob = False
		End If
		
	End Function
	
	Public Function CM_UpdateSessionJob(ByRef GUID As String, ByRef CC As String, ByRef CM As String) As Integer
		
		CM_UpdateSessionJob = gClsSessionManager.UpdateCMjob(GUID, CC, CM)
		
	End Function
	
	
	Public Function CM_PopulateView(ByRef obj As AxCTLISTLib.AxctList) As Integer
		
		Dim Item As Integer
		
		'1.) Get Unassigned Jobs from prior sessions that were logged in the database
		'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		If (gClsDatabase.ConnectDB = True) Then
			
			m_rs = New ADODB.Recordset
			m_rs.Open("SELECT JOB_GUID,DOCNAME,JOBCOST FROM DOCUGATE_GENERAL_ACTIVITY WHERE CC_CODE='' AND JOBTYPE=1 AND ACC_GUID='" & m_ActiveAccount_GUID & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
			
			While Not m_rs.EOF
				Item = obj.AddItem(";" & m_rs.Fields("DocName").Value)
				obj.set_CellText(Item, 3, m_rs.Fields("Jobcost").Value)
				obj.set_ListCargo(Item, m_rs.Fields("JOB_GUID").Value)
				m_rs.MoveNext()
			End While
			
			m_rs.Close()
			
		Else
			
		End If
		
		'2.) Get Unassigned Jobs from current Session that have not yet been logged to database
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		Call gClsSessionManager.GetCMjobs(obj)
		
	End Function
	
	'UPGRADE_NOTE: Class_Terminate was upgraded to Class_Terminate_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Terminate_Renamed()
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		gClsDatabase.CloseDB()
	End Sub
	Protected Overrides Sub Finalize()
		Class_Terminate_Renamed()
		MyBase.Finalize()
	End Sub
End Class