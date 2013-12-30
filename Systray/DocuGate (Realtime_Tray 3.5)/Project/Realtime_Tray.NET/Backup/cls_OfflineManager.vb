Option Strict Off
Option Explicit On
Friend Class Cls_OfflineManager
	
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
	Private m_OfflinePermitted As Boolean
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		Dim m_OfflinePermited As Object
		m_Classname = "cls_OffLineManager"
		'UPGRADE_WARNING: Couldn't resolve default property of object m_OfflinePermited. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_OfflinePermited = False
		Call ChkOfflinePermitted()
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
	'this will check the ini to see if offline mode is permitted or not
	Private Sub ChkOfflinePermitted()
		
		If (gClsConfig.ChkOfflinePermitted = 0) Then
			m_OfflinePermitted = False
		Else
			m_OfflinePermitted = True
		End If
		
	End Sub
	
	Public ReadOnly Property mOffLinePermitted() As Boolean
		Get
			mOffLinePermitted = m_OfflinePermitted
		End Get
	End Property
	
	
	Public Function ProcessLog() As Short
	End Function
	
	Private Function WriteLog(ByRef Data As String) As Boolean
	End Function
	
	Private Function ReadLog(ByRef Data As String) As Boolean
	End Function
	
	Private Function UpdateDatabase(ByRef Data As String) As Boolean
	End Function
	
	Private Function ResetLog(ByRef Data As String) As Boolean
	End Function
End Class