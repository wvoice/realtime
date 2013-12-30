Option Strict Off
Option Explicit On
Friend Class cls_LabPrint
	
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
	Private m_LPInstalled As Boolean
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		Dim m_FreePrint As Object
		m_Classname = "cls_LabPrint"
		
		Dim m_workstation As New cls_Workstation
		m_MachineName = m_workstation.mComputerName
		'UPGRADE_NOTE: Object m_workstation may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_workstation = Nothing
		
		'UPGRADE_WARNING: Couldn't resolve default property of object m_FreePrint. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_FreePrint = False
		m_LPInstalled = False
		
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public ReadOnly Property mLPInstalled() As Boolean
		Get
			mLPInstalled = m_LPInstalled
		End Get
	End Property
	
	Public ReadOnly Property mFreePrint() As Boolean
		Get
			
			Dim enabledmsg As String
			enabledmsg = "Free Print is enabled until:" & vbCrLf
			enabledmsg = enabledmsg & VB6.Format(m_Expire, "h:mm:ss AM/PM - dddd, mmmm dd, yyyy")
			
			'UPGRADE_WARNING: DateValue has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
			If (DateValue(CStr(Now)) > DateValue(CStr(m_Expire))) Then
				mFreePrint = False
				Exit Property
			End If
			
			'UPGRADE_WARNING: DateValue has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
			If (DateValue(CStr(Now)) < DateValue(CStr(m_Expire))) Then
				Frm_Main.ShowBalloonInformation((enabledmsg))
				mFreePrint = True
				Exit Property
			End If
			
			Dim a As Integer
			'UPGRADE_WARNING: DateDiff behavior may be different. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6B38EC3F-686D-4B2E-B5A5-9E8E7A762E32"'
			a = DateDiff(Microsoft.VisualBasic.DateInterval.Minute, m_Expire, Now)
			If (a < 0) Then
				Frm_Main.ShowBalloonInformation((enabledmsg))
				mFreePrint = True
			Else
				mFreePrint = False
			End If
			
		End Get
	End Property
	
	Public Function LP_AddMachine() As Boolean
		
		On Error GoTo handler
		
		LP_AddMachine = True
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT * FROM LP_LAB_MACHINES WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.AddNew()
		m_rs.Fields("lp_Lab_name").Value = m_LabName
		m_rs.Fields("lp_machine_name").Value = m_MachineName
		m_rs.Update()
		m_rs.Close()
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	Public Function LP_AddLab() As Boolean
		
		On Error GoTo handler
		
		LP_AddLab = True
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT * FROM LP_LAB WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.AddNew()
		m_rs.Fields("lp_Lab_name").Value = m_LabName
		m_rs.Update()
		m_rs.Close()
		
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	Public Function LP_MachineLogon() As Boolean
		
		On Error GoTo handler
		
		LP_MachineLogon = False
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT * FROM LP_LAB_MACHINES WHERE LP_MACHINE_NAME = '" & m_MachineName & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.Fields("lp_Machine_user").Value = gClsaccountManager.mActiveLastName & "," & gClsaccountManager.mActiveLastName
		m_rs.Fields("lp_machine_status").Value = "Active"
		m_rs.Update()
		m_rs.Close()
		LP_MachineLogon = True
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	
	Public Function LP_MachineLogoff() As Boolean
		
		On Error GoTo handler
		
		LP_MachineLogoff = False
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT * FROM LP_LAB_MACHINES WHERE LP_MACHINE_NAME = '" & m_MachineName & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		m_rs.Fields("lp_Machine_user").Value = ""
		m_rs.Fields("lp_machine_status").Value = "Idle"
		m_rs.Update()
		m_rs.Close()
		LP_MachineLogoff = True
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	
	Public Function LP_LabParams() As Boolean
		Dim m_Enabled As Object
		
		On Error GoTo handler
		
		
		'UPGRADE_WARNING: Couldn't resolve default property of object m_Enabled. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_Enabled = False
		LP_LabParams = False
		
		Dim start As Short
		Dim Length As Short
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT fp_start,fp_length FROM LP_LAB_PARAMS", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		If (Not m_rs.EOF) Then
			LP_LabParams = True
			'UPGRADE_WARNING: Couldn't resolve default property of object m_Enabled. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_Enabled = True
			start = m_rs.Fields("fp_start").Value
			Length = m_rs.Fields("fp_length").Value
			m_LabName = Mid(m_MachineName, start, Length)
			m_rs.Close()
			
		End If
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	
	Public Sub LP_GetExpire()
		
		On Error GoTo handler
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT LP_LAB_FP_EXPIRE FROM LP_LAB WHERE LP_LAB_NAME = '" & m_LabName & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		If Not m_rs.EOF Then
			m_Expire = CDate(m_rs.Fields("LP_LAB_FP_EXPIRE").Value)
		Else
			m_Expire = System.Date.FromOADate(Now.ToOADate - 1) ' default to yesterday always expired
		End If
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Sub
	
	''''''''''''''''''''''''''''''''''''''''''''''''''''''
	'' check to see if functionality has been installed'''
	''''''''''''''''''''''''''''''''''''''''''''''''''''''
	
	Public Sub LP_Installed()
		
		On Error GoTo handler
		
		m_LPInstalled = False
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT COUNT(*) AS TableCount From sysobjects WHERE id = OBJECT_ID(N'lp_lab') AND (type = 'U')", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		If (CShort(m_rs.Fields("TableCount").Value) > 0) Then
			m_LPInstalled = True
		Else
			m_LPInstalled = False
		End If
		
		m_rs.Close()
		
handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Sub
End Class