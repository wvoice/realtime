Option Strict Off
Option Explicit On
Imports VB = Microsoft.VisualBasic
Friend Class Frm_SysTray
	Inherits System.Windows.Forms.Form
	
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
	
	
	'UPGRADE_WARNING: Structure NOTIFYICONDATAA may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="C429C3A5-5D47-4CD9-8F51-74A1616405DC"'
	Private Declare Function Shell_NotifyIconA Lib "shell32.dll" (ByVal dwMessage As Integer, ByRef lpData As NOTIFYICONDATAA) As Integer
	
	'UPGRADE_WARNING: Structure NOTIFYICONDATAW may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="C429C3A5-5D47-4CD9-8F51-74A1616405DC"'
	Private Declare Function Shell_NotifyIconW Lib "shell32.dll" (ByVal dwMessage As Integer, ByRef lpData As NOTIFYICONDATAW) As Integer
	
	
	Private Const NIF_ICON As Integer = &H2
	Private Const NIF_MESSAGE As Integer = &H1
	Private Const NIF_TIP As Integer = &H4
	Private Const NIF_STATE As Integer = &H8
	Private Const NIF_INFO As Integer = &H10
	
	Private Const NIM_ADD As Integer = &H0
	Private Const NIM_MODIFY As Integer = &H1
	Private Const NIM_DELETE As Integer = &H2
	Private Const NIM_SETFOCUS As Integer = &H3
	Private Const NIM_SETVERSION As Integer = &H4
	
	Private Const NOTIFYICON_VERSION As Short = 3
	
	Private Structure NOTIFYICONDATAA
		Dim cbSize As Integer ' 4
		Dim hwnd As Integer ' 8
		Dim uID As Integer ' 12
		Dim uFlags As Integer ' 16
		Dim uCallbackMessage As Integer ' 20
		Dim hIcon As Integer ' 24
		'UPGRADE_WARNING: Fixed-length string size must fit in the buffer. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="3C1E4426-0B80-443E-B943-0627CD55D48B"'
		<VBFixedString(128),System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.ByValArray,SizeConst:=128)> Public szTip() As Char ' 152
		Dim dwState As Integer ' 156
		Dim dwStateMask As Integer ' 160
		'UPGRADE_WARNING: Fixed-length string size must fit in the buffer. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="3C1E4426-0B80-443E-B943-0627CD55D48B"'
		<VBFixedString(256),System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.ByValArray,SizeConst:=256)> Public szInfo() As Char ' 416
		Dim uTimeOutOrVersion As Integer ' 420
		'UPGRADE_WARNING: Fixed-length string size must fit in the buffer. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="3C1E4426-0B80-443E-B943-0627CD55D48B"'
		<VBFixedString(64),System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.ByValArray,SizeConst:=64)> Public szInfoTitle() As Char ' 484
		Dim dwInfoFlags As Integer ' 488
		Dim guidItem As Integer ' 492
	End Structure
	Private Structure NOTIFYICONDATAW
		Dim cbSize As Integer ' 4
		Dim hwnd As Integer ' 8
		Dim uID As Integer ' 12
		Dim uFlags As Integer ' 16
		Dim uCallbackMessage As Integer ' 20
		Dim hIcon As Integer ' 24
		<VBFixedArray(255)> Dim szTip() As Byte ' 280
		Dim dwState As Integer ' 284
		Dim dwStateMask As Integer ' 288
		<VBFixedArray(511)> Dim szInfo() As Byte ' 800
		Dim uTimeOutOrVersion As Integer ' 804
		<VBFixedArray(127)> Dim szInfoTitle() As Byte ' 932
		Dim dwInfoFlags As Integer ' 936
		Dim guidItem As Integer ' 940
		
		'UPGRADE_TODO: "Initialize" must be called to initialize instances of this structure. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B4BFF9E0-8631-45CF-910E-62AB3970F27B"'
		Public Sub Initialize()
			ReDim szTip(255)
			ReDim szInfo(511)
			ReDim szInfoTitle(127)
		End Sub
	End Structure
	
	
	Private nfIconDataA As NOTIFYICONDATAA
	'UPGRADE_WARNING: Arrays in structure nfIconDataW may need to be initialized before they can be used. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="814DF224-76BD-4BB4-BFFB-EA359CB9FC48"'
	Private nfIconDataW As NOTIFYICONDATAW
	
	Private Const NOTIFYICONDATAA_V1_SIZE_A As Short = 88
	Private Const NOTIFYICONDATAA_V1_SIZE_U As Short = 152
	Private Const NOTIFYICONDATAA_V2_SIZE_A As Short = 488
	Private Const NOTIFYICONDATAA_V2_SIZE_U As Short = 936
	
	Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Integer) As Integer
	
	Private Const WM_MOUSEMOVE As Integer = &H200
	Private Const WM_LBUTTONDBLCLK As Integer = &H203
	Private Const WM_LBUTTONDOWN As Integer = &H201
	Private Const WM_LBUTTONUP As Integer = &H202
	Private Const WM_RBUTTONDBLCLK As Integer = &H206
	Private Const WM_RBUTTONDOWN As Integer = &H204
	Private Const WM_RBUTTONUP As Integer = &H205
	
	Private Const WM_USER As Integer = &H400
	
	Private Const NIN_SELECT As Integer = WM_USER
	Private Const NINF_KEY As Integer = &H1
	Private Const NIN_KEYSELECT As Boolean = (NIN_SELECT Or NINF_KEY)
	Private Const NIN_BALLOONSHOW As Decimal = (WM_USER + 2)
	Private Const NIN_BALLOONHIDE As Decimal = (WM_USER + 3)
	Private Const NIN_BALLOONTIMEOUT As Decimal = (WM_USER + 4)
	Private Const NIN_BALLOONUSERCLICK As Decimal = (WM_USER + 5)
	
	' Version detection:
	Private Declare Function GetVersion Lib "kernel32" () As Integer
	
	Public Event SysTrayMouseDown(ByVal eButton As VB6.MouseButtonConstants)
	Public Event SysTrayMouseUp(ByVal eButton As VB6.MouseButtonConstants)
	Public Event SysTrayMouseMove()
	Public Event SysTrayDoubleClick(ByVal eButton As VB6.MouseButtonConstants)
	Public Event MenuClick(ByVal lIndex As Integer, ByVal sKey As String)
	Public Event BalloonShow()
	Public Event BalloonHide()
	Public Event BalloonTimeOut()
	Public Event BalloonClicked()
	
	Public Enum EBalloonIconTypes
		NIIF_NONE = 0
		NIIF_INFO = 1
		NIIF_WARNING = 2
		NIIF_ERROR = 3
		NIIF_NOSOUND = &H10
	End Enum
	
	Private m_bAddedMenuItem As Boolean
	Private m_iDefaultIndex As Integer
	
	Private m_bUseUnicode As Boolean
	Private m_bSupportsNewVersion As Boolean
	
	
	Public Sub ShowBalloonTip(ByVal sMessage As String, Optional ByVal sTitle As String = "", Optional ByVal eIcon As EBalloonIconTypes = 0, Optional ByVal lTimeOutMs As Object = 1000)
		
		Dim lR As Integer
		
		If (m_bSupportsNewVersion) Then
			
			If (m_bUseUnicode) Then
				stringToArray(sMessage, nfIconDataW.szInfo, 512)
				stringToArray(sTitle, nfIconDataW.szInfoTitle, 128)
				'UPGRADE_WARNING: Couldn't resolve default property of object lTimeOutMs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				nfIconDataW.uTimeOutOrVersion = lTimeOutMs
				nfIconDataW.dwInfoFlags = eIcon
				nfIconDataW.uFlags = NIF_INFO
				lR = Shell_NotifyIconW(NIM_MODIFY, nfIconDataW)
			Else
				nfIconDataA.szInfo = sMessage
				nfIconDataA.szInfoTitle = sTitle
				'UPGRADE_WARNING: Couldn't resolve default property of object lTimeOutMs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				nfIconDataA.uTimeOutOrVersion = lTimeOutMs
				nfIconDataA.dwInfoFlags = eIcon
				nfIconDataA.uFlags = NIF_INFO
				lR = Shell_NotifyIconA(NIM_MODIFY, nfIconDataA)
			End If
		Else
			' can't do it, fail silently.
		End If
	End Sub
	
	Public Property ToolTip() As String
		Get
			Dim sTip As String
			Dim iPos As Integer
			sTip = nfIconDataA.szTip
			iPos = InStr(sTip, Chr(0))
			If (iPos <> 0) Then
				sTip = VB.Left(sTip, iPos - 1)
			End If
			ToolTip = sTip
		End Get
		Set(ByVal Value As String)
			If (m_bUseUnicode) Then
				stringToArray(Value, nfIconDataW.szTip, unicodeSize(IIf(m_bSupportsNewVersion, 128, 64)))
				nfIconDataW.uFlags = NIF_TIP
				Shell_NotifyIconW(NIM_MODIFY, nfIconDataW)
			Else
				If (Value & Chr(0) <> nfIconDataA.szTip) Then
					nfIconDataA.szTip = Value & Chr(0)
					nfIconDataA.uFlags = NIF_TIP
					Shell_NotifyIconA(NIM_MODIFY, nfIconDataA)
				End If
			End If
		End Set
	End Property
	
	Public Property IconHandle() As Integer
		Get
			IconHandle = nfIconDataA.hIcon
		End Get
		Set(ByVal Value As Integer)
			If (m_bUseUnicode) Then
				If (Value <> nfIconDataW.hIcon) Then
					nfIconDataW.hIcon = Value
					nfIconDataW.uFlags = NIF_ICON
					Shell_NotifyIconW(NIM_MODIFY, nfIconDataW)
				End If
			Else
				If (Value <> nfIconDataA.hIcon) Then
					nfIconDataA.hIcon = Value
					nfIconDataA.uFlags = NIF_ICON
					Shell_NotifyIconA(NIM_MODIFY, nfIconDataA)
				End If
			End If
		End Set
	End Property
	
	
	Public Property DefaultMenuIndex() As Integer
		Get
			DefaultMenuIndex = m_iDefaultIndex
		End Get
		Set(ByVal Value As Integer)
			If (ValidIndex(Value)) Then
				m_iDefaultIndex = Value
			Else
				m_iDefaultIndex = 0
			End If
		End Set
	End Property
	
	Private ReadOnly Property nfStructureSize() As Integer
		Get
			If (m_bSupportsNewVersion) Then
				If (m_bUseUnicode) Then
					nfStructureSize = NOTIFYICONDATAA_V2_SIZE_U
				Else
					nfStructureSize = NOTIFYICONDATAA_V2_SIZE_A
				End If
			Else
				If (m_bUseUnicode) Then
					nfStructureSize = NOTIFYICONDATAA_V1_SIZE_U
				Else
					nfStructureSize = NOTIFYICONDATAA_V1_SIZE_A
				End If
			End If
		End Get
	End Property
	
	Public Function AddMenuItem(ByVal sCaption As String, Optional ByVal sKey As String = "", Optional ByVal bDefault As Boolean = False) As Integer
		Dim iIndex As Integer
		If Not (m_bAddedMenuItem) Then
			iIndex = 0
			m_bAddedMenuItem = True
		Else
			iIndex = mnuSysTray.UBound + 1
			mnuSysTray.Load(iIndex)
		End If
		mnuSysTray(iIndex).Visible = True
		mnuSysTray(iIndex).Tag = sKey
		mnuSysTray(iIndex).Text = sCaption
		
		If (bDefault) Then
			m_iDefaultIndex = iIndex
		End If
		AddMenuItem = iIndex
	End Function
	
	Private Function ValidIndex(ByVal lIndex As Integer) As Boolean
		ValidIndex = (lIndex >= mnuSysTray.LBound And lIndex <= mnuSysTray.UBound)
	End Function
	
	Public Sub EnableMenuItem(ByVal lIndex As Integer, ByVal bState As Boolean)
		If (ValidIndex(lIndex)) Then
			mnuSysTray(lIndex).Enabled = bState
		End If
	End Sub
	
	Public Function GetMenuItemChecked(ByVal lIndex As Integer) As Boolean
		If (ValidIndex(lIndex)) Then
			GetMenuItemChecked = mnuSysTray(lIndex).Checked
		End If
	End Function
	
	Public Function SetMenuItemChecked(ByVal lIndex As Integer, ByVal bState As Boolean) As Object
		If (ValidIndex(lIndex)) Then
			mnuSysTray(lIndex).Checked = bState
		End If
	End Function
	
	Public Function RemoveMenuItem(ByVal iIndex As Integer) As Integer
		Dim i As Integer
		If ValidIndex(iIndex) Then
			If (iIndex = 0) Then
				mnuSysTray(0).Text = ""
			Else
				' remove the item:
				For i = iIndex + 1 To mnuSysTray.UBound
					mnuSysTray(iIndex - 1).Text = mnuSysTray(iIndex).Text
					mnuSysTray(iIndex - 1).Tag = mnuSysTray(iIndex).Tag
				Next i
				mnuSysTray.Unload(mnuSysTray.UBound)
			End If
		End If
	End Function
	
	Public Function ShowMenu() As Object
		SetForegroundWindow(Me.Handle.ToInt32)
		If (m_iDefaultIndex > -1) Then
			'UPGRADE_ISSUE: Form method Frm_SysTray.PopupMenu was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="CC4C7EC0-C903-48FC-ACCC-81861D12DA4A"'
			Me.PopupMenu(mnupopup, 0,  ,  , mnuSysTray(m_iDefaultIndex))
		Else
			'UPGRADE_ISSUE: Form method Frm_SysTray.PopupMenu was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="CC4C7EC0-C903-48FC-ACCC-81861D12DA4A"'
			Me.PopupMenu(mnupopup, 0)
		End If
	End Function
	
	Private Sub Frm_SysTray_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		' Get version:
		Dim lMajor As Integer
		Dim lMinor As Integer
		Dim bIsNt As Integer
		GetWindowsVersion(lMajor, lMinor,  ,  , bIsNt)
		
		If (bIsNt) Then
			m_bUseUnicode = True
			If (lMajor >= 5) Then
				' 2000 or XP
				m_bSupportsNewVersion = True
			End If
		ElseIf (lMajor = 4) And (lMinor = 90) Then 
			' Windows ME
			m_bSupportsNewVersion = True
		End If
		
		
		'Add the icon to the system tray...
		Dim lR As Integer
		
		If (m_bUseUnicode) Then
			With nfIconDataW
				.hwnd = Me.Handle.ToInt32
				.uID = CInt(CObj(Me.Icon))
				.uFlags = NIF_ICON Or NIF_MESSAGE Or NIF_TIP
				.uCallbackMessage = WM_MOUSEMOVE
				'UPGRADE_ISSUE: Picture property Icon.Handle was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="CC4C7EC0-C903-48FC-ACCC-81861D12DA4A"'
				.hIcon = Me.Icon.Handle
				stringToArray(My.Application.Info.Title, .szTip, unicodeSize(IIf(m_bSupportsNewVersion, 128, 64)))
				If (m_bSupportsNewVersion) Then
					.uTimeOutOrVersion = NOTIFYICON_VERSION
				End If
				.cbSize = nfStructureSize
			End With
			lR = Shell_NotifyIconW(NIM_ADD, nfIconDataW)
			If (m_bSupportsNewVersion) Then
				Shell_NotifyIconW(NIM_SETVERSION, nfIconDataW)
			End If
		Else
			With nfIconDataA
				.hwnd = Me.Handle.ToInt32
				.uID = CInt(CObj(Me.Icon))
				.uFlags = NIF_ICON Or NIF_MESSAGE Or NIF_TIP
				.uCallbackMessage = WM_MOUSEMOVE
				'UPGRADE_ISSUE: Picture property Icon.Handle was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="CC4C7EC0-C903-48FC-ACCC-81861D12DA4A"'
				.hIcon = Me.Icon.Handle
				.szTip = My.Application.Info.Title & Chr(0)
				If (m_bSupportsNewVersion) Then
					.uTimeOutOrVersion = NOTIFYICON_VERSION
				End If
				.cbSize = nfStructureSize
			End With
			lR = Shell_NotifyIconA(NIM_ADD, nfIconDataA)
			If (m_bSupportsNewVersion) Then
				lR = Shell_NotifyIconA(NIM_SETVERSION, nfIconDataA)
			End If
		End If
		
	End Sub
	
	Private Sub stringToArray(ByVal sString As String, ByRef bArray() As Byte, ByVal lMaxSize As Integer)
		Dim b() As Byte
		Dim i As Integer
		Dim j As Integer
		If Len(sString) > 0 Then
			'UPGRADE_TODO: Code was upgraded to use System.Text.UnicodeEncoding.Unicode.GetBytes() which may not have the same behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="93DD716C-10E3-41BE-A4A8-3BA40157905B"'
			b = System.Text.UnicodeEncoding.Unicode.GetBytes(sString)
			For i = LBound(b) To UBound(b)
				bArray(i) = b(i)
				If (i = (lMaxSize - 2)) Then
					Exit For
				End If
			Next i
			For j = i To lMaxSize - 1
				bArray(j) = 0
			Next j
		End If
	End Sub
	Private Function unicodeSize(ByVal lSize As Integer) As Integer
		If (m_bUseUnicode) Then
			unicodeSize = lSize * 2
		Else
			unicodeSize = lSize
		End If
	End Function
	
	Private Sub Frm_SysTray_MouseMove(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
		Dim Button As Short = eventArgs.Button \ &H100000
		Dim Shift As Short = System.Windows.Forms.Control.ModifierKeys \ &H10000
		Dim X As Single = VB6.PixelsToTwipsX(eventArgs.X)
		Dim Y As Single = VB6.PixelsToTwipsY(eventArgs.Y)
		Dim lX As Integer
		' VB manipulates the x value according to scale mode:
		' we must remove this before we can interpret the
		' message windows was trying to send to us:
		'UPGRADE_ISSUE: Constant vbPixels was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="55B59875-9A95-4B71-9D6A-7C294BF7139D"'
		'UPGRADE_ISSUE: Form property Frm_SysTray.ScaleMode is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="8027179A-CB3B-45C0-9863-FAA1AF983B59"'
		'UPGRADE_ISSUE: Form method Frm_SysTray.ScaleX was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="CC4C7EC0-C903-48FC-ACCC-81861D12DA4A"'
		lX = ScaleX(X, Me.ScaleMode, vbPixels)
		Select Case lX
			Case WM_MOUSEMOVE
				RaiseEvent SysTrayMouseMove()
			Case WM_LBUTTONUP
				RaiseEvent SysTrayMouseDown(VB6.MouseButtonConstants.LeftButton)
			Case WM_LBUTTONUP
				RaiseEvent SysTrayMouseUp(VB6.MouseButtonConstants.LeftButton)
			Case WM_LBUTTONDBLCLK
				RaiseEvent SysTrayDoubleClick(VB6.MouseButtonConstants.LeftButton)
			Case WM_RBUTTONDOWN
				RaiseEvent SysTrayMouseDown(VB6.MouseButtonConstants.RightButton)
			Case WM_RBUTTONUP
				RaiseEvent SysTrayMouseUp(VB6.MouseButtonConstants.RightButton)
			Case WM_RBUTTONDBLCLK
				RaiseEvent SysTrayDoubleClick(VB6.MouseButtonConstants.RightButton)
			Case NIN_BALLOONSHOW
				RaiseEvent BalloonShow()
			Case NIN_BALLOONHIDE
				RaiseEvent BalloonHide()
			Case NIN_BALLOONTIMEOUT
				RaiseEvent BalloonTimeOut()
			Case NIN_BALLOONUSERCLICK
				RaiseEvent BalloonClicked()
		End Select
		
	End Sub
	
	Private Sub Frm_SysTray_FormClosing(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
		Dim Cancel As Boolean = eventArgs.Cancel
		Dim UnloadMode As System.Windows.Forms.CloseReason = eventArgs.CloseReason
		If (m_bUseUnicode) Then
			Shell_NotifyIconW(NIM_DELETE, nfIconDataW)
		Else
			Shell_NotifyIconA(NIM_DELETE, nfIconDataA)
		End If
		eventArgs.Cancel = Cancel
	End Sub
	
	
	Public Sub mnuSysTray_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles mnuSysTray.Click
		Dim Index As Short = mnuSysTray.GetIndex(eventSender)
		RaiseEvent MenuClick(Index, mnuSysTray(Index).Tag)
	End Sub
	
	Private Sub GetWindowsVersion(Optional ByRef lMajor As Object = 0, Optional ByRef lMinor As Object = 0, Optional ByRef lRevision As Object = 0, Optional ByRef lBuildNumber As Object = 0, Optional ByRef bIsNt As Object = False)
		Dim lR As Integer
		lR = GetVersion()
		'UPGRADE_WARNING: Couldn't resolve default property of object lBuildNumber. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		lBuildNumber = (lR And &H7F000000) \ &H1000000
		'UPGRADE_WARNING: Couldn't resolve default property of object lBuildNumber. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		If (lR And &H80000000) Then lBuildNumber = lBuildNumber Or &H80
		'UPGRADE_WARNING: Couldn't resolve default property of object lRevision. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		lRevision = (lR And &HFF0000) \ &H10000
		'UPGRADE_WARNING: Couldn't resolve default property of object lMinor. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		lMinor = (lR And &HFF00) \ &H100
		'UPGRADE_WARNING: Couldn't resolve default property of object lMajor. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		lMajor = (lR And &HFF)
		'UPGRADE_WARNING: Couldn't resolve default property of object bIsNt. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		bIsNt = ((lR And &H80000000) = 0)
	End Sub
End Class