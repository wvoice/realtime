Option Strict Off
Option Explicit On
Friend Class Frm_Main
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
	
	
	Private Declare Function FindWindow Lib "user32"  Alias "FindWindowA"(ByVal lpClassName As String, ByVal lpWindowName As String) As Integer
	Private WithEvents m_frmSysTray As Frm_SysTray
	Private m_frmLogon As Frm_Logon
	Dim StrCommand As String
	Private IsHistoryOn As Boolean
	
	Private m_historyitem As Integer
	Private m_aboutitem As Integer
	Private m_cmitem As Integer
	
	Public Sub SetIconColorAfterLogon()
		'UPGRADE_WARNING: Lower bound of collection ImageList.ListImages has changed from 1 to 0. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A3B628A0-A810-4AE2-BFA2-9E7A29EB9AD0"'
		m_frmSysTray.IconHandle = CInt(CObj(ImageList.Images.Item(2)))
	End Sub
	
	Public Sub ShowBalloonInformation(ByRef Message As String)
		Call m_frmSysTray.ShowBalloonTip(Message, "RealTime Workstation", Frm_SysTray.EBalloonIconTypes.NIIF_INFO, 15000)
	End Sub
	
	Public Sub ShowBalloonWarning(ByRef Message As String)
		Call m_frmSysTray.ShowBalloonTip(Message, "RealTime Workstation", Frm_SysTray.EBalloonIconTypes.NIIF_WARNING, 15000)
	End Sub
	
	Public Sub ShowBalloonError(ByRef Message As String)
		Call m_frmSysTray.ShowBalloonTip(Message, "RealTime Workstation", Frm_SysTray.EBalloonIconTypes.NIIF_ERROR, 15000)
	End Sub
	
	Private Sub Frm_Main_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		
		Me.Text = "RealTime Workstation"
		IsHistoryOn = False
		
		m_frmSysTray = New Frm_SysTray
		m_frmLogon = New Frm_Logon
		Dim m_item As Integer
		
		With m_frmSysTray
			m_aboutitem = .AddMenuItem("&About...", "about")
			.AddMenuItem("-")
			m_historyitem = .AddMenuItem("&History", "history")
			
			If (gClsCMActive.CMEnabled = True) Then
				m_cmitem = .AddMenuItem("&Client/Matter", "cm")
			End If
			
			
			'UPGRADE_WARNING: Lower bound of collection ImageList.ListImages has changed from 1 to 0. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A3B628A0-A810-4AE2-BFA2-9E7A29EB9AD0"'
			.IconHandle = CInt(CObj(ImageList.Images.Item(1)))
			.ToolTip = "RealTime Workstation - Checking Connection"
		End With
		
	End Sub
	
	
	Private Sub Frm_Main_FormClosing(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
		Dim Cancel As Boolean = eventArgs.Cancel
		Dim UnloadMode As System.Windows.Forms.CloseReason = eventArgs.CloseReason
		
		If (Mod_Main.IsLoggedOn = True) Then
			Cancel = -1
			ShowBalloonError(("Docugate Workstation is still Logged on" & vbCrLf & "Docugate Workstation must be logged off before a workstation logoff is allowed"))
		End If
		
		eventArgs.Cancel = Cancel
	End Sub
	
	Private Sub Frm_Main_FormClosed(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosedEventArgs) Handles Me.FormClosed
		Call Mod_Main.TerminateApp()
	End Sub
	
	Private Sub fpNoLogon_Timer_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles fpNoLogon_Timer.Tick
		
		If Not gclsfpNoLogon Is Nothing Then
			
			Select Case gclsfpNoLogon.Handle_fpNoLogon_Timer
				
				Case 2
					'UPGRADE_WARNING: Lower bound of collection ImageList.ListImages has changed from 1 to 0. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A3B628A0-A810-4AE2-BFA2-9E7A29EB9AD0"'
					m_frmSysTray.IconHandle = CInt(CObj(ImageList.Images.Item(2)))
				Case 3
					'UPGRADE_WARNING: Lower bound of collection ImageList.ListImages has changed from 1 to 0. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A3B628A0-A810-4AE2-BFA2-9E7A29EB9AD0"'
					m_frmSysTray.IconHandle = CInt(CObj(ImageList.Images.Item(3)))
					
			End Select
			
		End If
		
	End Sub
	
	Private Sub m_frmSysTray_SysTrayMouseDown(ByVal eButton As VB6.MouseButtonConstants) Handles m_frmSysTray.SysTrayMouseDown
		If (eButton = VB6.MouseButtonConstants.RightButton) Then
			m_frmSysTray.ShowMenu()
		End If
	End Sub
	
	Private Sub m_frmSysTray_MenuClick(ByVal lIndex As Integer, ByVal sKey As String) Handles m_frmSysTray.MenuClick
		
		Dim a As System.Windows.Forms.ToolStripMenuItem
		
		If (sKey = "history") Then
			
			If (Mod_Main.IsLoggedOn = False) Then
				'UPGRADE_ISSUE: Load statement is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B530EFF2-3132-48F8-B8BC-D88AF543D321"'
				Load(frm_Error)
				frm_Error.Show()
				SetTopMostWindow(frm_Error.Handle.ToInt32, True)
				Exit Sub
			Else
				
				If (m_frmSysTray.GetMenuItemChecked(m_historyitem) = True) Then
					
					If Frm_Logon.WindowState = 1 Then
						Frm_Logon.WindowState = System.Windows.Forms.FormWindowState.Normal
						System.Windows.Forms.Application.DoEvents()
					End If
					Call m_frmSysTray.SetMenuItemChecked(m_historyitem, False)
					Frm_Logon.Height = VB6.TwipsToPixelsY(1300)
				Else
					
					If Frm_Logon.WindowState = 1 Then
						Frm_Logon.WindowState = System.Windows.Forms.FormWindowState.Normal
						System.Windows.Forms.Application.DoEvents()
					End If
					
					Frm_Logon.Height = VB6.TwipsToPixelsY(VB6.PixelsToTwipsY(Frm_Logon.Piclogoff.Height) + VB6.PixelsToTwipsY(Frm_Logon.lst_Activity.Height) + 400)
					Call m_frmSysTray.SetMenuItemChecked(m_historyitem, True)
				End If
			End If
			
		End If
		
		If (sKey = "about") Then
			'UPGRADE_ISSUE: Load statement is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B530EFF2-3132-48F8-B8BC-D88AF543D321"'
			Load(Frm_About)
			Frm_About.Show()
			SetTopMostWindow(Frm_About.Handle.ToInt32, True)
		End If
		
		
		If (sKey = "cm") Then
			If (Mod_Main.IsLoggedOn = False) Then
				'UPGRADE_ISSUE: Load statement is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B530EFF2-3132-48F8-B8BC-D88AF543D321"'
				Load(frm_Error)
				frm_Error.Show()
				SetTopMostWindow(frm_Error.Handle.ToInt32, True)
				Exit Sub
			Else
				
				If (VerifyNetWork = False) Then
					ShowBalloonError("RealTime Workstation (No Network Connection)")
					Exit Sub
				End If
				'UPGRADE_ISSUE: Load statement is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B530EFF2-3132-48F8-B8BC-D88AF543D321"'
				Load(Frm_ClientMatter)
				Frm_ClientMatter.Show()
				SetTopMostWindow(Frm_ClientMatter.Handle.ToInt32, True)
				gCmOpen = True
			End If
		End If
		
	End Sub
	
	Private Sub Timer1_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Timer1.Tick
		
		Timer1.Enabled = False
		
		If (VerifyNetWork = False) Then
			ShowBalloonError("RealTime Workstation (No Network Connection enabled)")
			Timer1.Interval = 1000
			Timer1.Enabled = True
			Frm_Logon.Hide()
			Exit Sub
		End If
		
		If (gClsDatabase.ConnectDB = False) Then
			
			Frm_Logon.Hide()
			If (gclsOfflineManager.mOffLinePermitted = False) Then
				ShowBalloonError("RealTime Workstation (Database = " & gClsConfig.DatabaseServer & ")" & vbCrLf & "Database is not responding")
				Timer1.Interval = 1000
				Timer1.Enabled = True
			Else
				m_frmSysTray.ToolTip = "RealTime Workstation Standalone Mode Enabled"
				'UPGRADE_WARNING: Lower bound of collection ImageList.ListImages has changed from 1 to 0. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A3B628A0-A810-4AE2-BFA2-9E7A29EB9AD0"'
				m_frmSysTray.IconHandle = CInt(CObj(ImageList.Images.Item(3)))
				Timer1.Interval = 1000
				Timer1.Enabled = True
			End If
			
		Else
			Call gclsLabPrint.LP_Installed()
			If (gclsLabPrint.mLPInstalled) Then
				gclsLabPrint.LP_LabParams()
				gclsLabPrint.LP_AddLab()
				gclsLabPrint.LP_AddMachine()
				
				'' if labprint is installed then
				'' then start the class to allow printing if no logon
				'' and fp is active
				'' the timer on this form will call the class method
				'' to do the work
				gclsfpNoLogon = New cls_fpNoLogon
				fpNoLogon_Timer.Interval = 1000
				fpNoLogon_Timer.Enabled = True
			Else
				ShowBalloonInformation("LabPrint Functionality is not availible")
			End If
			
			gClsDatabase.CloseDB()
			m_frmSysTray.ToolTip = "RealTime Workstation (Database = " & gClsConfig.DatabaseServer & ")"
			'UPGRADE_WARNING: Lower bound of collection ImageList.ListImages has changed from 1 to 0. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A3B628A0-A810-4AE2-BFA2-9E7A29EB9AD0"'
			m_frmSysTray.IconHandle = CInt(CObj(ImageList.Images.Item(2)))
			Frm_Logon.Show()
			Frm_Logon.Activate()
			Timer1.Interval = 1000
			Timer1.Enabled = False 'Changed to False by Mike Young on 7/10/2011 to stop flashing taskbar.
		End If
		
	End Sub
End Class