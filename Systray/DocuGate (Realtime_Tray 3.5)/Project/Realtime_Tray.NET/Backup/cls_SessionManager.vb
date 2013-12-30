Option Strict Off
Option Explicit On
Friend Class cls_SessionManager
	
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
	
	Private Structure ACTIVE_SESSION
		Dim m_SESSION_GUID As String
		Dim m_STARTED As Date
		Dim m_ENDED As Date
		Dim m_ACTIVE As Boolean
		Dim m_BADGE As String
		Dim m_DURATION As Integer
		Dim m_JOBID As Integer
	End Structure
	
	Private m_SessionJobs As New Collection
	Private m_ActiveSession As ACTIVE_SESSION
	
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		Dim m_Classname As Object
		Dim Num As Object
		
		For Num = 1 To m_SessionJobs.Count()
			m_SessionJobs.Remove(1)
		Next 
		
		'UPGRADE_WARNING: Couldn't resolve default property of object m_Classname. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_Classname = "cls_SessionManager"
		
		With m_ActiveSession
			.m_ACTIVE = False
			.m_SESSION_GUID = ""
			.m_JOBID = 1
		End With
		
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public Sub ClearCollection()
		Dim Num As Object
		
		For Num = 1 To m_SessionJobs.Count()
			m_SessionJobs.Remove(1)
		Next 
		
	End Sub
	
	
	Public Function OpenSession(ByRef Data As String) As Boolean
		
		With m_ActiveSession
			.m_ACTIVE = True
			.m_STARTED = Now
			.m_SESSION_GUID = GetGuid
			.m_BADGE = Data
			.m_DURATION = 0
			.m_JOBID = 1
		End With
		
		
	End Function
	
	Public Function CloseSession() As Boolean
		Dim Num As Object
		
		On Error GoTo handler
		
		CloseSession = True
		
		Dim mInst As cls_Job
		Dim m_rs As ADODB.Recordset
		
		For	Each mInst In m_SessionJobs
			m_rs = New ADODB.Recordset
			m_rs.Open("SELECT * FROM DOCUGATE_GENERAL_ACTIVITY WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
			m_rs.AddNew()
			m_rs.Fields("acc_guid").Value = gClsaccountManager.mActiveAccountGuid
			m_rs.Fields("ou_guid").Value = gClsaccountManager.mActiveOUGuid
			m_rs.Fields("OU_NAME").Value = gClsaccountManager.mActiveOUName
			m_rs.Fields("ACC_BADGE").Value = gClsaccountManager.mActiveBadge
			m_rs.Fields("JOB_GUID").Value = GetGuid
			m_rs.Fields("DT_REQUESTED").Value = mInst.mRawsubmitted
			m_rs.Fields("Copies").Value = mInst.mCopies
			m_rs.Fields("DocName").Value = mInst.mDocument
			m_rs.Fields("PageCount").Value = mInst.mPageCount
			m_rs.Fields("Jobcost").Value = mInst.GetJobCharge
			
			If (mInst.mWorkstationAlias <> "") Then
				m_rs.Fields("COMPUTERNAME").Value = mInst.mWorkstationAlias
			End If
			
			If (mInst.mDeviceAlias <> "") Then
				m_rs.Fields("PRINTERNAME").Value = mInst.mDeviceAlias
			End If
			
			m_rs.Fields("Jobtype").Value = 1
			m_rs.Fields("CC_CODE").Value = mInst.mClient
			m_rs.Fields("CM_MATTER").Value = mInst.mMatter
			m_rs.Fields("CTLUNIT_SERIAL_NO").Value = ""
			m_rs.Fields("Comments").Value = m_ActiveSession.m_SESSION_GUID
			m_rs.Fields("color").Value = 0
			m_rs.Fields("Duplex").Value = 0
			m_rs.Update()
			m_rs.Close()
			'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
			m_rs = Nothing
			System.Windows.Forms.Application.DoEvents()
		Next mInst
		
		For	Each mInst In m_SessionJobs
			m_rs = New ADODB.Recordset
			m_rs.Open("SELECT * FROM DOCUGATE_GENERAL_ACTIVITY_JOURNEL WHERE 1=0", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
			m_rs.AddNew()
			m_rs.Fields("j_guid").Value = gClsaccountManager.mActiveAccountGuid
			m_rs.Fields("j_type").Value = "WS PRINT"
			m_rs.Fields("j_amount").Value = FormatCurrency(mInst.GetJobCharge, 2, True, False, True)
			m_rs.Fields("j_desc").Value = mInst.mDocument
			m_rs.Update()
			m_rs.Close()
			'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
			m_rs = Nothing
		Next mInst
		
		
handler: 
		
		For Num = 1 To m_SessionJobs.Count()
			m_SessionJobs.Remove(1)
		Next 
		
		With m_ActiveSession
			.m_ACTIVE = False
			.m_ENDED = Now
			.m_DURATION = 0
		End With
		
		If (Err.Number <> 0) Then
			Err.Clear()
		End If
		
	End Function
	
	
	Public Function AddJob(ByRef Data As String) As Boolean
		
		On Error GoTo handler
		
		Dim d() As String
		d = Split(Data, ",")
		If (UBound(d) = 0) Then
			d = Split(Data, ";")
			If (UBound(d) = 0) Then Exit Function
		End If
		
		
		Dim Inst As New cls_Job
		
		Inst.mUser = d(0)
		Inst.mJobID = d(1)
		Inst.mDocument = d(2)
		Inst.mPrinted = d(3)
		Inst.mPageCount = d(4)
		Inst.mCopies = d(5)
		Inst.mMachine = d(6)
		Inst.mQueue = d(7)
		
		Inst.SetDeviceURL()
		
		On Error GoTo notfound
		'UPGRADE_NOTE: cObj was upgraded to cObj_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
		Dim cObj_Renamed As Object
		cObj_Renamed = MyMonitors.Item(d(7))
		
notfound: 
		
		If (Err.Number <> 0) Then
			Err.Clear()
			Exit Function
		End If
		
		On Error GoTo handler
		
		'UPGRADE_WARNING: Couldn't resolve default property of object cObj_Renamed.mAlias. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		Inst.mDeviceAlias = cObj_Renamed.mAlias
		
		If (gclsLabPrint.mFreePrint) Then
			Inst.mCharge = "0.00"
		Else
			'UPGRADE_WARNING: Couldn't resolve default property of object cObj_Renamed.mCost. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Inst.mCharge = cObj_Renamed.mCost
			If (Inst.mCharge = "") Then
				Inst.mCharge = gClsConfig.GlobalCharge()
			End If
		End If
		
		'UPGRADE_NOTE: Object cObj_Renamed may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		cObj_Renamed = Nothing
		
		
		Inst.GetWorkstationAlias()
		Inst.mClient = ""
		Inst.mMatter = ""
		
		Dim c1 As Single
		c1 = Inst.GetJobCharge
		
		Dim Index As String
		Index = CStr(d(1))
		
		m_SessionJobs.Add(Inst, Index)
		gclsMaxSpend.UpdateCurrentSpend((c1))
		gClsaccountManager.UpdateCurrentFunds((c1))
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_SessionManager::AddJob()")
		End If
		
		
	End Function
	
	Public Function AddPCPLJob(ByRef Data As String) As Boolean
		
		On Error GoTo handler
		Dim lprinted As Short
		
		Dim d() As String
		d = Split(Data, ",")
		
		Dim Inst As New cls_Job
		Inst.mUser = d(1)
		Inst.mDocument = d(5)
		lprinted = CShort(d(3)) * CShort(d(2))
		Inst.mPrinted = CStr(lprinted)
		Inst.mPageCount = d(2)
		Inst.mCopies = d(3)
		Inst.mMachine = d(6)
		Inst.mQueue = d(4)
		Inst.SetDeviceURL()
		Inst.mJobID = CStr(ActiveSession.m_JOBID)
		
		On Error GoTo notfound
		'UPGRADE_NOTE: cObj was upgraded to cObj_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
		Dim cObj_Renamed As Object
		cObj_Renamed = MyMonitors.Item(d(4))
		
notfound: 
		
		If (Err.Number <> 0) Then
			Err.Clear()
			Exit Function
		End If
		
		'UPGRADE_WARNING: Couldn't resolve default property of object cObj_Renamed.mAlias. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		Inst.mDeviceAlias = cObj_Renamed.mAlias
		'UPGRADE_WARNING: Couldn't resolve default property of object cObj_Renamed.mCost. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		Inst.mCharge = cObj_Renamed.mCost
		If (Inst.mCharge = "") Then
			Inst.mCharge = gClsConfig.GlobalCharge()
		End If
		
		Inst.GetWorkstationAlias()
		Inst.mClient = ""
		Inst.mMatter = ""
		
		'UPGRADE_NOTE: Object cObj_Renamed may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		cObj_Renamed = Nothing
		
		
		Dim c1 As Single
		c1 = Inst.GetJobCharge
		
		m_SessionJobs.Add(Inst)
		
		gClsaccountManager.UpdateCurrentFunds((c1))
		gclsMaxSpend.UpdateCurrentSpend((c1))
		
		ActiveSession.m_JOBID = ActiveSession.m_JOBID + 1
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_SessionManager::AddJob()")
		End If
		
		
	End Function
	
	
	
	
	Public Function GetSessionState() As Boolean
		GetSessionState = m_ActiveSession.m_ACTIVE
	End Function
	
	Public Function RefreshJobList(ByRef obj As AxCTLISTLib.AxctList) As Boolean
		
		On Error GoTo handler
		
		Dim Item As Integer
		Dim mInst As cls_Job
		
		obj.ClearList()
		For	Each mInst In m_SessionJobs
			Item = obj.AddItem(mInst.mDocument)
			
			If (gclsUnitCurrency.mIsEnabled) Then
				obj.set_CellText(Item, 2, gclsUnitCurrency.ConvertCurToUnits(mInst.GetJobCharge))
			Else
				obj.set_CellText(Item, 2, VB6.Format(mInst.GetJobCharge, "currency"))
			End If
			
			''   obj.CellText(Item, 2) = Format(mInst.GetJobCharge, "0.00")
			
			obj.set_ListCargo(Item, mInst.mJobID)
		Next mInst
		
handler: 
		If (Err.Number <> 0) Then
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_SessionManager::RefreshJobList()")
		End If
		
	End Function
	
	Public Function GetCMjobs(ByRef obj As AxCTLISTLib.AxctList) As Object
		
		On Error GoTo handler
		
		Dim Item As Integer
		Dim mInst As cls_Job
		
		For	Each mInst In m_SessionJobs
			If (mInst.mClient = "") Then
				Item = obj.AddItem(";" & mInst.mDocument)
				obj.set_CellText(Item, 3, mInst.GetJobCharge)
				obj.set_ListCargo(Item, mInst.mJobID)
			End If
			
		Next mInst
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_SessionManager::GetCMJobs()")
		End If
		
	End Function
	
	
	Public Function GetCMUnassignedCount() As Integer
		
		On Error GoTo handler
		
		GetCMUnassignedCount = 0
		
		Dim ItemCnt As Integer
		Dim mInst As cls_Job
		
		For	Each mInst In m_SessionJobs
			
			If (mInst.mClient = "") Then
				ItemCnt = ItemCnt + 1
			End If
			
		Next mInst
		
		GetCMUnassignedCount = ItemCnt
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_SessionManager::GetCMUnassignedCount()")
		End If
		
	End Function
	
	Public Function UpdateCMjob(ByRef GUID As String, ByRef CC As String, ByRef CM As String) As Boolean
		
		UpdateCMjob = True
		
		On Error GoTo handler
		
		Dim mInst As cls_Job
		
		For	Each mInst In m_SessionJobs
			
			If (mInst.mJobID = GUID) Then
				mInst.mClient = CC
				mInst.mMatter = CM
			End If
			
		Next mInst
		
handler: 
		
		If (Err.Number <> 0) Then
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_SessionManager::UpdateCMJob()")
			UpdateCMjob = False
		End If
		
	End Function
End Class