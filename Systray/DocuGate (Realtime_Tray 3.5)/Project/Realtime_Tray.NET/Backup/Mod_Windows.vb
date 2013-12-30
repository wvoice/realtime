Option Strict Off
Option Explicit On
Module Mod_Windows
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
	
	Private Const LWA_COLORKEY As Short = 1
	Private Const LWA_ALPHA As Short = 2
	Private Const LWA_BOTH As Short = 3
	Private Const WS_EX_LAYERED As Integer = &H80000
	Private Const GWL_EXSTYLE As Short = -20
	Private Const SWP_NOMOVE As Integer = &H2
	Private Const SWP_NOSIZE As Integer = &H1
	Private Const SWP_NOACTIVATE As Integer = &H10
	Private Const SWP_SHOWWINDOW As Integer = &H40
	Private Const HWND_TOPMOST As Short = -1
	Private Const HWND_NOTOPMOST As Short = -2
	Private Const flags As Boolean = SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE
	Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Integer, ByVal color As Integer, ByVal X As Byte, ByVal alpha As Integer) As Boolean
	Private Declare Function SetWindowLong Lib "user32"  Alias "SetWindowLongA"(ByVal hwnd As Integer, ByVal nIndex As Integer, ByVal dwNewLong As Integer) As Integer
	Private Declare Function GetWindowLong Lib "user32"  Alias "GetWindowLongA"(ByVal hwnd As Integer, ByVal nIndex As Integer) As Integer
	Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Integer, ByVal hWndInsertAfter As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal cx As Integer, ByVal cy As Integer, ByVal wFlags As Integer) As Integer
	Private Declare Function GetUserName Lib "advapi32.dll"  Alias "GetUserNameA"(ByVal lpBuffer As String, ByRef nSize As Integer) As Integer
	
	Sub SetTranslucent(ByRef ThehWnd As Integer, ByRef nTrans As Short)
		
		On Error GoTo ErrorRtn
		
		Dim attrib As Integer
		'put current GWL_EXSTYLE in attrib
		attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
		'change GWL_EXSTYLE to WS_EX_LAYERED - makes a window layered
		SetWindowLong(ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED)
		'Make transparent (RGB value does not have any effect at this
		'time, will in Part 2 of this article)
		SetLayeredWindowAttributes(ThehWnd, RGB(0, 0, 0), nTrans, LWA_ALPHA)
		Exit Sub
		
ErrorRtn: 
		MsgBox(Err.Description & " Source : " & Err.Source)
		
	End Sub
	
	Sub SetTranslucent2(ByRef ThehWnd As Integer, ByRef nTrans As Short)
		On Error GoTo ErrorRtn
		
		'SetWindowLong and SetLayeredWindowAttributes are API functions, see MSDN for details
		Dim attrib As Integer
		attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
		SetWindowLong(ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED)
		SetLayeredWindowAttributes(ThehWnd, RGB(255, 255, 0), nTrans, LWA_ALPHA)
		Exit Sub
ErrorRtn: 
		MsgBox(Err.Description & " Source : " & Err.Source)
		
	End Sub
	
	Sub SetTopMostWindow(ByRef ThehWnd As Integer, ByRef Topmost As Boolean)
		
		If Topmost = True Then
			Call SetWindowPos(ThehWnd, HWND_TOPMOST, 0, 0, 0, 0, flags)
		Else
			Call SetWindowPos(ThehWnd, HWND_NOTOPMOST, 0, 0, 0, 0, flags)
		End If
		
	End Sub
	
	Sub PositionForm(ByRef theForm As System.Windows.Forms.Form)
		Dim screenWidth As Integer
		Dim screenHeight As Integer
		
		screenWidth = VB6.PixelsToTwipsX(System.Windows.Forms.Screen.PrimaryScreen.Bounds.Width)
		screenHeight = VB6.PixelsToTwipsY(System.Windows.Forms.Screen.PrimaryScreen.Bounds.Height)
		theForm.Left = VB6.TwipsToPixelsX(screenWidth - VB6.PixelsToTwipsX(theForm.Width) - 100)
		theForm.Top = VB6.TwipsToPixelsY(800) 'screenHeight - theForm.Height - 400
		
	End Sub
	
	'' get the logged on user'
	''''''''''''''''''''''''''
	Function Get_User_Name() As String
		
		'  Get_User_Name = Environ("USERNAME")
		
		Dim lpBuff As New VB6.FixedLengthString(25)
		Dim ret As Integer
		Dim UserName As String
		ret = GetUserName(lpBuff.Value, 25)
		UserName = Left(lpBuff.Value, InStr(lpBuff.Value, Chr(0)) - 1)
		Get_User_Name = UserName
		
	End Function
End Module