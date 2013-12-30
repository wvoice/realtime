Option Strict Off
Option Explicit On
Module Mod_DisableClose
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
	
	'Disable a Windows Close Button
	'This sample will show you how to disable the little 'X'
	'close button found on the upper right of every window.
	'To do this what we will do is use a couple of API calls
	'to remove the Close menu item from the windows system menu.
	'Doing this will disable the close button.  When you try
	'out this sample, you may want to have an alternate way
	'to close your window.
	
	'Insert this code into a .bas module
	
	
	Public Declare Function GetSystemMenu Lib "user32" (ByVal hwnd As Integer, ByVal bRevert As Integer) As Integer
	
	Public Declare Function RemoveMenu Lib "user32" (ByVal hMenu As Integer, ByVal nPosition As Integer, ByVal wFlags As Integer) As Integer
	
	Public Const MF_BYPOSITION As Integer = &H400
	
	
	Public Sub DisableCloseWindowButton(ByRef frm As System.Windows.Forms.Form)
		
		Dim hSysMenu As Integer
		
		'Get the handle to this windows
		'system menu
		hSysMenu = GetSystemMenu(frm.Handle.ToInt32, 0)
		
		'Remove the Close menu item
		'This will also disable the close button
		RemoveMenu(hSysMenu, 6, MF_BYPOSITION)
		
		'Lastly, we remove the seperator bar
		RemoveMenu(hSysMenu, 5, MF_BYPOSITION)
		
	End Sub
End Module