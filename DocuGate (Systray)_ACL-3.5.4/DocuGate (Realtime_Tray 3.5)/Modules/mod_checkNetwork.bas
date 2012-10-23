Attribute VB_Name = "Mod_CheckNetwork"
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


Private Declare Function InternetGetConnectedState Lib "wininet" (ByRef dwflags As Long, ByVal dwReserved As Long) As Long

Private Const CONNECT_LAN As Long = &H2
Private Const CONNECT_MODEM As Long = &H1
Private Const CONNECT_PROXY As Long = &H4
Private Const CONNECT_OFFLINE As Long = &H20
Private Const CONNECT_CONFIGURED As Long = &H40

Private Function IsWebConnected() As String
Dim dwflags As Long
Dim WebTest As Boolean
ConnType = ""
WebTest = InternetGetConnectedState(dwflags, 0&)
Select Case WebTest
    Case dwflags And CONNECT_LAN: ConnType = "LAN"
    Case dwflags And CONNECT_MODEM: ConnType = "Modem"
    Case dwflags And CONNECT_PROXY: ConnType = "Proxy"
    Case dwflags And CONNECT_OFFLINE: ConnType = "Offline"
    Case dwflags And CONNECT_CONFIGURED: ConnType = "Configured"
    Case dwflags And CONNECT_RAS: ConnType = "Remote"
End Select

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
