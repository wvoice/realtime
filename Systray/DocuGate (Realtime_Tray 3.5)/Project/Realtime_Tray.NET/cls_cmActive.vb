Option Strict Off
Option Explicit On
Friend Class cls_cmActive
	
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
	Private m_ActiveAccountGUID As String
	Private m_CMEnabled As Boolean
	Private m_CMThreshold As Integer
	Private m_CMrs As ADODB.Recordset
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_cmActive"
		m_CMEnabled = getCMEnabled()
		
		If (m_CMEnabled = True) Then
			m_CMThreshold = getCMThreshold()
		End If
		
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	''''''''''''''''''''''''''''''''
	'private functions
	''''''''''''''''''''''''''''''''
	
	Private Function getCMEnabled() As Boolean
		Dim r As String
		r = gClsConfig.CMEnabled
		
		If (r = "1") Then
			getCMEnabled = True
		Else
			getCMEnabled = False
		End If
	End Function
	
	Private Function getCMThreshold() As Integer
		Dim r As String
		r = gClsConfig.CMThreshold
		getCMThreshold = CInt(r)
	End Function
	
	
	Private Function Unassignedcount() As Integer
		
		Dim curcount As Integer
		Dim activeaccountguid As String
		On Error GoTo handler
		
		curcount = 0
		
		If (gClsDatabase.ConnectDB = True) Then
			
			activeaccountguid = gClsaccountManager.ActiveAccount_GUID
			
			m_CMrs = New ADODB.Recordset
			m_CMrs.Open("SELECT count(*) as unassigned FROM DOCUGATE_GENERAL_ACTIVITY WHERE CC_CODE='' AND JOBTYPE=1 AND ACC_GUID='" & activeaccountguid & "'", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
			curcount = curcount + CInt(m_CMrs.Fields("unassigned").Value)
			m_CMrs.Close()
			'UPGRADE_NOTE: Object m_CMrs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
			m_CMrs = Nothing
			gClsDatabase.CloseDB()
			
			curcount = curcount + gClsSessionManager.GetCMUnassignedCount()
			
		End If
		
handler: 
		
		If (Err.Number <> 0) Then
			Unassignedcount = 0
			MsgBox(Err.Description, MsgBoxStyle.Critical, "cls_cmActive::unassignedcount()")
		Else
			Unassignedcount = curcount
		End If
		
		
		
	End Function
	
	''''''''''''''''''''''''''''''''
	'public functions and properties
	'''''''''''''''''''''''''''''''''
	Public Function overThreshold() As Boolean
		
		If (m_CMEnabled = False) Then
			overThreshold = False
			Exit Function
		End If
		
		
		Dim ucount As Integer
		ucount = Unassignedcount()
		
		If (ucount > m_CMThreshold) Then
			overThreshold = True
		Else
			overThreshold = False
		End If
		
	End Function
	
	Public ReadOnly Property CMEnabled() As Boolean
		Get
			CMEnabled = m_CMEnabled
		End Get
	End Property
End Class