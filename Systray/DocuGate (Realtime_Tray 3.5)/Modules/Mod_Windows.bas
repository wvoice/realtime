Attribute VB_Name = "Mod_Windows"
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

Option Explicit
Private Const LWA_COLORKEY = 1
Private Const LWA_ALPHA = 2
Private Const LWA_BOTH = 3
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE = -20
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_SHOWWINDOW = &H40
Private Const HWND_TOPMOST = -1
Private Const HWND_NOTOPMOST = -2

Private Const flags = SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hWnd As Long, ByVal color As Long, ByVal x As Byte, ByVal alpha As Long) As Boolean
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long

Sub SetTranslucent(ThehWnd As Long, nTrans As Integer)

On Error GoTo ErrorRtn

   Dim attrib As Long
   'put current GWL_EXSTYLE in attrib
   attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
   'change GWL_EXSTYLE to WS_EX_LAYERED - makes a window layered
   SetWindowLong ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED
   'Make transparent (RGB value does not have any effect at this
   'time, will in Part 2 of this article)
   SetLayeredWindowAttributes ThehWnd, RGB(0, 0, 0), nTrans, LWA_ALPHA
   Exit Sub

ErrorRtn:
MsgBox Err.Description & " Source : " & Err.Source

End Sub

Sub SetTranslucent2(ThehWnd As Long, nTrans As Integer)
    On Error GoTo ErrorRtn

    'SetWindowLong and SetLayeredWindowAttributes are API functions, see MSDN for details
    Dim attrib As Long
    attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
    SetWindowLong ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED
    SetLayeredWindowAttributes ThehWnd, RGB(255, 255, 0), nTrans, LWA_ALPHA
    Exit Sub
ErrorRtn:
    MsgBox Err.Description & " Source : " & Err.Source
    
End Sub

Sub SetTopMostWindow(ThehWnd As Long, Topmost As Boolean)

    If Topmost = True Then
        Call SetWindowPos(ThehWnd, HWND_TOPMOST, 0, 0, 0, 0, flags)
    Else
        Call SetWindowPos(ThehWnd, HWND_NOTOPMOST, 0, 0, 0, 0, flags)
    End If

End Sub

Sub PositionForm(theForm As Form)
    Dim screenWidth As Long
    Dim screenHeight As Long
    
    screenWidth = Screen.Width
    screenHeight = Screen.Height
    theForm.Left = screenWidth - theForm.Width - 100
    theForm.Top = 800 'screenHeight - theForm.Height - 400

End Sub

'' get the logged on user'
''''''''''''''''''''''''''
Function Get_User_Name() As String

  '  Get_User_Name = Environ("USERNAME")

     Dim lpBuff As String * 25
     Dim ret As Long, UserName As String
     ret = GetUserName(lpBuff, 25)
     UserName = Left(lpBuff, InStr(lpBuff, Chr(0)) - 1)
     Get_User_Name = UserName

End Function


