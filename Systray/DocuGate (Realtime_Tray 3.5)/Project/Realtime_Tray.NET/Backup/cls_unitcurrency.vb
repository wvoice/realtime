Option Strict Off
Option Explicit On
Friend Class cls_unitcurrency
	
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
	Private m_UnitEnabled As Boolean
	Private m_UnitAmount As Single
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		
		m_Classname = "cls_unitcurrency"
		m_UnitEnabled = False
		m_UnitAmount = 0#
		
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public Sub InitSession()
		Dim m_LastError As Object
		
		On Error GoTo Err_Handler
		
		m_UnitEnabled = False
		m_UnitAmount = 0#
		
		Dim m_rs As ADODB.Recordset
		m_rs = New ADODB.Recordset
		m_rs.Open("SELECT GLOBALS_UNITVALUE_ENABLED as Enabled, GLOBALS_UNITVALUE as amount FROM DOCUGATE_GENERAL_GLOBAL", gconn, ADODB.CursorTypeEnum.adOpenStatic, ADODB.LockTypeEnum.adLockOptimistic)
		
		If Not m_rs.EOF Then
			m_UnitEnabled = CBool(m_rs.Fields("Enabled").Value)
			m_UnitAmount = CSng(m_rs.Fields("amount").Value)
		End If
		m_rs.Close()
		
Err_Handler: 
		
		'UPGRADE_NOTE: Object m_rs may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		m_rs = Nothing
		
		If (Err.Number <> 0) Then
			'UPGRADE_WARNING: Couldn't resolve default property of object m_LastError. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			m_LastError = Err.Description
		End If
		
		
	End Sub
	
	Public ReadOnly Property mIsEnabled() As Boolean
		Get
			mIsEnabled = m_UnitEnabled
		End Get
	End Property
	
	Public Function ConvertCurToUnits(ByRef amount As Single) As String
		Dim units As Integer
		units = 0
		units = amount / m_UnitAmount
		ConvertCurToUnits = CStr(units)
	End Function
End Class