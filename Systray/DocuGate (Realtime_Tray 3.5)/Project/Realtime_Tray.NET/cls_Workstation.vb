Option Strict Off
Option Explicit On
Friend Class cls_Workstation
	
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
	Private m_Computername As String
	Private m_LoggedOnUser As String
	Private Declare Function GetComputerName Lib "kernel32"  Alias "GetComputerNameA"(ByVal lpBuffer As String, ByRef nSize As Integer) As Integer
	Private Declare Function WNetGetUser Lib "mpr.dll"  Alias "WNetGetUserA"(ByVal lpName As String, ByVal lpUserName As String, ByRef lpnLength As Integer) As Integer
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_Workstation"
		InitComputerName()
		InitLoggedOnUser()
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Private Sub InitComputerName()
		Dim Buffer As New VB6.FixedLengthString(512)
		Dim Length As Integer
		Length = Len(Buffer.Value)
		If GetComputerName(Buffer.Value, Length) Then
			m_Computername = Left(Buffer.Value, Length)
		End If
		
		m_Computername = UCase(m_Computername)
		
	End Sub
	
	Private Sub InitLoggedOnUser()
		
		Dim Buffer As New VB6.FixedLengthString(512)
		Dim Length As Integer
		Length = 0
		WNetGetUser(vbNullString, Buffer.Value, Length)
		If (Length > 0) Then
			WNetGetUser(vbNullString, Buffer.Value, Length)
			m_LoggedOnUser = Left(Buffer.Value, Length - 1)
		End If
		
		m_LoggedOnUser = UCase(m_LoggedOnUser)
		
	End Sub
	
	Public ReadOnly Property mComputerName() As String
		Get
			mComputerName = m_Computername
		End Get
	End Property
	
	Public ReadOnly Property mLoggedOnUser() As Boolean
		Get
			mLoggedOnUser = CBool(m_LoggedOnUser)
		End Get
	End Property
End Class