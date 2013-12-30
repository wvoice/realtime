Option Strict Off
Option Explicit On
Module Mod_CheckNetwork
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
	
	
	Private Declare Function InternetGetConnectedState Lib "wininet" (ByRef dwflags As Integer, ByVal dwReserved As Integer) As Integer
	
	Private Const CONNECT_LAN As Integer = &H2
	Private Const CONNECT_MODEM As Integer = &H1
	Private Const CONNECT_PROXY As Integer = &H4
	Private Const CONNECT_OFFLINE As Integer = &H20
	Private Const CONNECT_CONFIGURED As Integer = &H40
	
	Private Function IsWebConnected() As String
		Dim CONNECT_RAS As Object
		Dim ConnType As Object
		Dim dwflags As Integer
		Dim WebTest As Boolean
		'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		ConnType = ""
		WebTest = InternetGetConnectedState(dwflags, 0)
		Select Case WebTest
			Case dwflags And CONNECT_LAN
				'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ConnType = "LAN"
			Case dwflags And CONNECT_MODEM
				'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ConnType = "Modem"
			Case dwflags And CONNECT_PROXY
				'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ConnType = "Proxy"
			Case dwflags And CONNECT_OFFLINE
				'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ConnType = "Offline"
			Case dwflags And CONNECT_CONFIGURED
				'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ConnType = "Configured"
			Case dwflags And CONNECT_RAS
				'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ConnType = "Remote"
		End Select
		
		'UPGRADE_WARNING: Couldn't resolve default property of object ConnType. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		IsWebConnected = ConnType
		
	End Function
	
	
	Public Function VerifyNetWork() As Boolean
		
		Dim Status As String
		Status = IsWebConnected()
		
		If (UCase(Status) = "OFFLINE") Then
			VerifyNetWork = False
		Else
			VerifyNetWork = True
		End If
		
	End Function
End Module