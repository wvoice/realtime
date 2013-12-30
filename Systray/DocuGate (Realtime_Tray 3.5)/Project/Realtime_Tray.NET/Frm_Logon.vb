Option Strict Off
Option Explicit On
Imports VB = Microsoft.VisualBasic
Friend Class Frm_Logon
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
	
	Dim lFormTopMouseDown As Integer
	Dim lFormLeftMouseDown As Integer
	Dim CursorLoc As POINTAPI
	Dim lpwndpl As WINDOWPLACEMENT
	Private Declare Function GetComputerName Lib "kernel32"  Alias "GetComputerNameA"(ByVal lpBuffer As String, ByRef nSize As Integer) As Integer
	
	
	Private PWDREQ As Integer
	Private IdleSeconds As Integer
	
	Const SW_SHOWNORMAL As Short = 1
	
	Private Structure POINTAPI
		Dim x As Integer
		Dim Y As Integer
	End Structure
	
	Private Structure RECT
		'UPGRADE_NOTE: Left was upgraded to Left_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
		Dim Left_Renamed As Integer
		'UPGRADE_NOTE: Top was upgraded to Top_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
		Dim Top_Renamed As Integer
		'UPGRADE_NOTE: Right was upgraded to Right_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
		Dim Right_Renamed As Integer
		'UPGRADE_NOTE: Bottom was upgraded to Bottom_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
		Dim Bottom_Renamed As Integer
	End Structure
	
	Private Structure WINDOWPLACEMENT
		Dim length As Integer
		Dim flags As Integer
		Dim ShowCmd As Integer
		Dim ptMinPosition As POINTAPI
		Dim ptMaxPosition As POINTAPI
		Dim rcNormalPosition As RECT
	End Structure
	
	'UPGRADE_WARNING: Structure POINTAPI may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="C429C3A5-5D47-4CD9-8F51-74A1616405DC"'
	Private Declare Function GetCursorPos Lib "user32" (ByRef lpPoint As POINTAPI) As Integer
	'UPGRADE_WARNING: Structure WINDOWPLACEMENT may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="C429C3A5-5D47-4CD9-8F51-74A1616405DC"'
	Private Declare Function SetWindowPlacement Lib "user32" (ByVal hwnd As Integer, ByRef lpwndpl As WINDOWPLACEMENT) As Integer
	Private Declare Function ReleaseCapture Lib "user32" () As Integer
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function SendMessage Lib "user32"  Alias "SendMessageA"(ByVal hwnd As Integer, ByVal wMsg As Integer, ByVal wParam As Integer, ByRef lParam As Any) As Integer
	
	Const HTCAPTION As Short = 2
	Const WM_NCLBUTTONDOWN As Integer = &HA1
	Const HTLEFT As Short = 10
	Const HTRight As Short = 11
	
	
	'Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
	'Call ReleaseCapture
	'Call SendMessage(hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
	'End Sub
	
	
	'Private Sub cmdResize_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
	'Dim nParam As Long
	
	'With cmdResize
	'    If X > 0 And X < 100 Then
	'        nParam = HTLEFT
	'    ElseIf X > .Width - 100 And X < .Width Then
	'        nParam = HTRight
	'    End If
	'    If nParam Then
	'        Call ReleaseCapture
	'        Call SendMessage(.hwnd, WM_NCLBUTTONDOWN, nParam, 0)
	'    End If
	'End With
	'End Sub
	
	
	'Private Sub CmdResize_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
	'Dim NewPointer As MousePointerConstants
	
	'With cmdResize
	'    If X > 0 And X < 100 Then
	'        NewPointer = vbSizeWE
	'    ElseIf X > .Width - 100 And X < .Width Then
	'        NewPointer = vbSizeWE
	'    Else
	'        NewPointer = vbDefault
	'    End If
	'    If NewPointer <> .MousePointer Then
	'        .MousePointer = NewPointer
	'    End If
	'End With
	
	'End Sub
	Public Function wslogoff() As Object
		
	End Function
	
	Private Sub AutoLogon_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles AutoLogon.Tick
		AutoLogon.Enabled = False
		txt_Badge.Text = Get_User_Name
		Call Cmd_Logon_Click(Cmd_Logon, New System.EventArgs())
	End Sub
	
	Private Sub Cmd_Logoff_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Cmd_Logoff.Click
		Dim activejobs As Object
		
		''''''''''''''''''''''''''''''''''''''''''''''''''''
		' Project #: dgp-0001
		' do we have any active jobs in any monitored queues
		' if we do then do not allow logoff to happen
		''''''''''''''''''''''''''''''''''''''''''''''''''''
		' are we minimized if so then restore
		If Me.WindowState = 1 Then
			Me.WindowState = System.Windows.Forms.FormWindowState.Normal
			System.Windows.Forms.Application.DoEvents()
		End If
		
		Dim totalactivejobs As Integer
		Dim curactivejobs As Integer
		
		'UPGRADE_WARNING: Couldn't resolve default property of object activejobs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		activejobs = 0
		curactivejobs = 0
		
		Dim mInst As cls_Monitor
		For	Each mInst In MyMonitors
			curactivejobs = 0
			curactivejobs = mInst.mJobCount
			'UPGRADE_WARNING: Couldn't resolve default property of object activejobs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			activejobs = activejobs + curactivejobs
		Next mInst
		
		'UPGRADE_WARNING: Couldn't resolve default property of object activejobs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		If (activejobs > 0) Then
			Frm_Main.ShowBalloonError(("Active jobs were detected on monitored queue" & vbCrLf & "Active jobs must be processed before a logoff can be processed"))
			Exit Sub
		End If
		
		
		
		
		If (VerifyNetWork = False) Then
			IdleSeconds = gClsConfig.InactivityThreshold
			processNoNetwork()
			Exit Sub
		End If
		
		If (gCmOpen = True) Then
			Frm_ClientMatter.Close()
		End If
		
		If (gClsDatabase.ConnectDB = False) Then
			IdleSeconds = gClsConfig.InactivityThreshold
			processnodb()
			Exit Sub
		Else
			gClsDatabase.CloseDB()
		End If
		
		
		''''''''''''''''''''''''''''''''''
		' end
		' Project #: DGP-0001
		''''''''''''''''''''''''''''''''
		
		If (gClsDatabase.ConnectDB = True) Then
			
			If (gClsSessionManager.GetSessionState() = True) Then
				
				TimerJobs.Enabled = False
				
				If (processLogoff = False) Then
					TimerJobs.Enabled = True
					Exit Sub
				End If
				
				lst_Activity.ClearList()
				
				Piclogoff.Visible = False
				Piclogoff.Top = 0
				Piclogoff.Left = 0
				
				lst_Activity.Visible = False
				lst_Activity.Top = 0
				lst_Activity.Left = 0
				
				Piclogon.Visible = True
				Piclogon.Top = 0
				Piclogon.Left = 0
				
				Me.Height = VB6.TwipsToPixelsY(1300)
				
				txt_Badge.Text = ""
				txt_Password.Text = ""
				txt_Badge.Focus()
				SetTranslucent(Me.Handle.ToInt32, 128)
			End If
			
			Call gClsDatabase.CloseDB()
			Mod_Main.IsLoggedOn = False
			
		End If
		
		
	End Sub
	
	Private Sub Cmd_Logon_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Cmd_Logon.Click
		
		If Me.WindowState = 1 Then
			Me.WindowState = System.Windows.Forms.FormWindowState.Normal
			System.Windows.Forms.Application.DoEvents()
		End If
		
		If (txt_Badge.Text = "") Then
			txt_Badge.Focus()
			Exit Sub
		End If
		
		If (PWDREQ) And (txt_Password.Text = "") Then
			txt_Password.Focus()
			Exit Sub
		End If
		
		If (VerifyNetWork = False) Then
			processNoNetwork()
			Exit Sub
		End If
		
		If (gClsDatabase.ConnectDB = False) Then
			processnodb()
			Exit Sub
		End If
		
		
		If (gClsSessionManager.GetSessionState() = True) Then
			processActiveSession()
			GoTo Terminate
		End If
		
		If (gClsaccountManager.VerifyBadgeCount((Me.txt_Badge).Text) = 0) Then
			processInvalid()
			SetTopMostWindow(Me.Handle.ToInt32, True)
			txt_Badge.Focus()
			GoTo Terminate
		End If
		
		If (PWDREQ) Then
			Call gClsaccountManager.VerifyBadgePassword((Me.txt_Badge).Text, (Me.txt_Password).Text)
		Else
			Call gClsaccountManager.VerifyBadge((Me.txt_Badge).Text)
		End If
		
		If (gClsaccountManager.isLogonValid = False) Then
			processInvalid()
			SetTopMostWindow(Me.Handle.ToInt32, True)
			txt_Badge.Focus()
			GoTo Terminate
		End If
		
		'' check to make sure not already logged on elsewhere
		''''''''''''''''''''''''''''''''''''''''''''''''''''
		If (gClsaccountManager.DB_IsAlreadyActive((gClsaccountManager.ActiveAccount_GUID)) = True) Then
			processAlreadyLoggedOn()
			SetTopMostWindow(Me.Handle.ToInt32, True)
			txt_Badge.Focus()
			GoTo Terminate
		End If
		
		
		Call gClsaccountManager.GetOU()
		Call gClsaccountManager.GetPrintCosts()
		
		If (gClsaccountManager.mActive_OU_Locked = True) Then
			processOULocked()
			SetTopMostWindow(Me.Handle.ToInt32, True)
			txt_Badge.Focus()
			GoTo Terminate
		End If
		
		If (gClsaccountManager.mActive_OU_Valid = False) Then
			processOUNotFound()
			SetTopMostWindow(Me.Handle.ToInt32, True)
			txt_Badge.Focus()
			GoTo Terminate
		End If
		
		
		If (gClsaccountManager.mActive_OU_CMethod = "DEBIT") And (gClsaccountManager.mActive_OU_AllowNeg = False) Then
			If (gClsaccountManager.mActiveInitFunds < ActiveCost.m_HIGHEST) Then
				processNoFunds()
				GoTo Terminate
			End If
		End If
		
		' good logon
		
		processLogon()
		Piclogon.Visible = False
		Piclogon.Top = 0
		Piclogon.Left = 0
		
		Piclogoff.Visible = True
		Piclogoff.Top = 0
		Piclogoff.Left = 0
		
		lst_Activity.Visible = True
		lst_Activity.Top = VB6.TwipsToPixelsY(VB6.PixelsToTwipsY(Piclogoff.Height) + 10)
		lst_Activity.Left = 0
		Me.Height = VB6.TwipsToPixelsY(1300) 'Piclogoff.Height + picActivity.Height + 100
		''  PositionForm Me
		SetTranslucent(Me.Handle.ToInt32, 128)
		
		'' show units or currency
		'''''''''''''''''''''''''
		If (gclsUnitCurrency.mIsEnabled) Then
			Label1.Text = "Units: "
			lst_Activity.set_ColumnText(2, "Units")
			txt_Balance.Text = gclsUnitCurrency.ConvertCurToUnits((gClsaccountManager.mActiveInitFunds))
		Else
			txt_Balance.Text = VB6.Format(gClsaccountManager.mActiveInitFunds, "currency")
		End If
		
		'txt_ActiveUser = gClsaccountManager.mActiveLastName & "," & gClsaccountManager.mActiveFirstname & "," & gClsaccountManager.mActiveOUName
		txt_ActiveUser.Text = gClsaccountManager.mActiveLastName & "/" & ComputerName & "/" & gClsaccountManager.mActiveOUName
		
		
		Mod_Main.IsLoggedOn = True
		Frm_Main.SetIconColorAfterLogon()
		
Terminate: 
		Call gClsDatabase.CloseDB()
		
	End Sub
	
	Private Sub Frm_Logon_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		
		Me.Width = VB6.TwipsToPixelsX(3690)
		Me.Height = VB6.TwipsToPixelsY(1300)
		
		lpwndpl.length = Len(lpwndpl)
		lpwndpl.ShowCmd = SW_SHOWNORMAL
		lbl_Badge.Text = gClsConfig.LogonPanel_UID_TXT
		txt_User.Text = "Account:"
		
		lbl_Password.Text = "Pin #"
		txt_Password.Visible = True
		lbl_Password.Visible = True
		
		
		PWDREQ = gClsConfig.LogonPanel_PWD_REQ
		If (PWDREQ) Then
			lbl_Password.Text = gClsConfig.LogonPanel_PWD_TXT
			txt_Password.Enabled = True
			txt_Password.BackColor = System.Drawing.ColorTranslator.FromOle(&H80000005)
		End If
		
		'10152008 - Added by Jeff
		'Used to disable the Close button on the form
		DisableCloseWindowButton(Me)
		VB6.SetDefault(Cmd_Logon, True)
		Timer1.Enabled = True
		
		If (gClsConfig.AutoLogon = True) Then
			AutoLogon.Enabled = True
		End If
		
		
	End Sub
	
	
	
	Private Sub Inactivity_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Inactivity.Tick
		Dim activejobs As Object
		
		Dim totalactivejobs As Integer
		Dim curactivejobs As Integer
		'UPGRADE_WARNING: Couldn't resolve default property of object activejobs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		activejobs = 0
		curactivejobs = 0
		
		
		IdleSeconds = IdleSeconds - 1
		txt_SessionTimer.Text = TimeString_Renamed(IdleSeconds, False)
		
		Dim mInst As cls_Monitor
		If (IdleSeconds = 0) Then
			
			For	Each mInst In MyMonitors
				curactivejobs = 0
				curactivejobs = mInst.mJobCount
				'UPGRADE_WARNING: Couldn't resolve default property of object activejobs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				activejobs = activejobs + curactivejobs
			Next mInst
			
			'UPGRADE_WARNING: Couldn't resolve default property of object activejobs. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If (activejobs > 0) Then
				IdleSeconds = gClsConfig.InactivityThreshold
				Exit Sub
			Else
				Call Cmd_Logoff_Click(Cmd_Logoff, New System.EventArgs())
			End If
			
		End If
		
	End Sub
	
	Private Sub myUDP_DataArrival(ByVal eventSender As System.Object, ByVal eventArgs As AxMSWinsockLib.DMSWinsockControlEvents_DataArrivalEvent) Handles myUDP.DataArrival
		Dim packet As String
		myUDP.GetData(packet)
		gClsSessionManager.AddJob(packet)
		
		IdleSeconds = gClsConfig.InactivityThreshold
		txt_SessionTimer.Text = TimeString_Renamed(IdleSeconds, False)
		
		If (gClsaccountManager.ForceLogoff = True) Then
			Call gClsConfig.ForcedLogoff()
			Call Cmd_Logoff_Click(Cmd_Logoff, New System.EventArgs())
			processNoFunds()
			Exit Sub
		End If
		
		If (gclsMaxSpend.HasMaxSpendReached = True) Then
			Call gClsConfig.ForcedLogoff()
			processMaxSessionSpend()
			Exit Sub
		End If
		
		If (gClsCMActive.CMEnabled = True) Then
			If (gClsCMActive.overThreshold = True) Then
				'UPGRADE_ISSUE: Load statement is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B530EFF2-3132-48F8-B8BC-D88AF543D321"'
				Load(Frm_ClientMatter)
				Frm_ClientMatter.Show()
				SetTopMostWindow(Frm_ClientMatter.Handle.ToInt32, True)
			End If
		End If
		
	End Sub
	
	Private Sub myUDP_Error(ByVal eventSender As System.Object, ByVal eventArgs As AxMSWinsockLib.DMSWinsockControlEvents_ErrorEvent) Handles myUDP.Error
		' we have an error
	End Sub
	
	Private Sub Timer1_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Timer1.Tick
		Timer1.Enabled = False
		PositionForm(Me)
		SetTranslucent(Me.Handle.ToInt32, 128)
		SetTopMostWindow(Me.Handle.ToInt32, True)
		'UPGRADE_ISSUE: Form property Frm_Logon.AutoRedraw was not upgraded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="CC4C7EC0-C903-48FC-ACCC-81861D12DA4A"'
		Me.AutoRedraw = True
		
	End Sub
	
	Function HandleLogoff() As Boolean
		Call gClsDatabase.ConnectDB()
		Call gClsDatabase.CloseDB()
	End Function
	Function ComputerName() As String
		Dim buffer As New VB6.FixedLengthString(512)
		Dim length As Integer
		length = Len(buffer.Value)
		'GetComputerName returns zero on failure
		If GetComputerName(buffer.Value, length) Then
			ComputerName = UCase(VB.Left(buffer.Value, length))
		End If
	End Function
	
	Private Function processLogon() As Boolean
		
		IdleSeconds = gClsConfig.InactivityThreshold
		Inactivity.Enabled = True
		txt_SessionTimer.Text = TimeString_Renamed(IdleSeconds, False)
		gClsaccountManager.GetPrintCosts()
		gClsSessionManager.OpenSession((gClsaccountManager.mActiveBadge))
		
		Call gclsMaxSpend.InitSession()
		Call gclsMaxSpend.GetGlobalMaxSpend()
		Call gclsMaxSpend.GetOUMaxSpend((gClsaccountManager.ActiveOu_GUID))
		Call gclsMaxSpend.GetAccountMaxSpend((gClsaccountManager.ActiveAccount_GUID))
		
		Call gclsUnitCurrency.InitSession()
		
		gClsConfig.Update_ActiveLogon()
		gClsaccountManager.DB_InsertActive((gClsaccountManager.ActiveAccount_GUID))
		
		myUDP.Bind(2203)
		
		Call gclsLabPrint.LP_Installed()
		If (gclsLabPrint.mLPInstalled) Then
			gclsLabPrint.LP_LabParams()
			gclsLabPrint.LP_AddLab()
			gclsLabPrint.LP_AddMachine()
			gclsLabPrint.LP_GetExpire() '' get expire date and time for lab
			gclsLabPrint.LP_MachineLogon() '' update lp_lab_machines to active
		End If
		
		gclspcpl.ResetLog()
		TimerJobs.Enabled = True
		VB6.SetDefault(Cmd_Logon, False)
		VB6.SetDefault(Cmd_Logoff, True)
		
	End Function
	
	Private Function processLogoff() As Boolean
		
		
		processLogoff = gClsSessionManager.CloseSession
		If (processLogoff = True) Then
			
			gClsaccountManager.UpdateAccountFunds()
			gClsConfig.Update_ActiveLogon()
			gClsaccountManager.DB_RemoveActive((gClsaccountManager.ActiveAccount_GUID))
			gclspcpl.ResetLog()
			myUDP.Close()
			
			
			If (gclsLabPrint.mLPInstalled) Then
				Call gclsLabPrint.LP_MachineLogoff() '' update lp_lab_machines to idle
			End If
			
			TimerJobs.Enabled = False
			VB6.SetDefault(Cmd_Logon, True)
			VB6.SetDefault(Cmd_Logoff, False)
			IdleSeconds = 0
			Inactivity.Enabled = False
			txt_SessionTimer.Text = "0.00"
			
		Else
			IdleSeconds = gClsConfig.InactivityThreshold
			txt_SessionTimer.Text = TimeString_Renamed(IdleSeconds, False)
		End If
		
		
	End Function
	
	Private Function processTailGate() As Boolean
		Call Frm_Main.ShowBalloonWarning("Tailgate")
	End Function
	Private Function processnodb() As Boolean
		Call Frm_Main.ShowBalloonWarning("The database server at (" & gClsConfig.DatabaseServer & ") is not responding")
	End Function
	
	Private Function processActiveSession() As Boolean
		Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " Account Aready Logged On")
	End Function
	
	Private Function processInvalid() As Boolean
		Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " not valid")
	End Function
	
	Private Function processAlreadyLoggedOn() As Boolean
		Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " Already Logged On")
	End Function
	
	Private Function processNoNetwork() As Boolean
		Call Frm_Main.ShowBalloonWarning("No Network Detected")
	End Function
	
	Private Function processNoFunds() As Boolean
		Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " Insufficent Funds")
	End Function
	
	Private Function processOULocked() As Boolean
		Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " OU Is Locked")
	End Function
	
	Private Function processOUNotFound() As Boolean
		Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " OU Not Located")
	End Function
	
	Private Function processFreePrintEnabled(ByRef msg As String) As Boolean
		Call Frm_Main.ShowBalloonWarning(msg)
	End Function
	
	Private Function processMaxSessionSpend() As Boolean
		
		On Error GoTo handler
		Dim a As String
		If (gclsUnitCurrency.mIsEnabled) Then
			a = gclsUnitCurrency.ConvertCurToUnits(gclsMaxSpend.GetMaxSpendPerSessionUnits)
			Call Frm_Main.ShowBalloonWarning("The max spend limit of " & a & " has been reached" & vbCrLf & "No more Print jobs will be allowed" & vbCrLf & "Please logoff")
		Else
			Call Frm_Main.ShowBalloonWarning("The max spend limit of " & gclsMaxSpend.GetMaxSpendPerSessionCur & " has been reached" & vbCrLf & "No more Print jobs will be allowed" & vbCrLf & "Please logoff")
		End If
		
handler: 
		
		If (Err.Number <> 0) Then
			Call Frm_Main.ShowBalloonWarning("ProcessMaxSessionSpend()" & vbCrLf & "Generated Error :" & Err.Description)
		End If
		
	End Function
	
	
	Private Sub TimerJobs_Tick(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles TimerJobs.Tick
		
		TimerJobs.Enabled = False
		
		Call gClsSessionManager.RefreshJobList(lst_Activity)
		
		''''''''''''''''''''''''''''''''''''''
		'' show curfunds as units or currecny'
		''''''''''''''''''''''''''''''''''''''
		If (gclsUnitCurrency.mIsEnabled) Then
			Label1.Text = "Units: "
			txt_Balance.Text = gclsUnitCurrency.ConvertCurToUnits((gClsaccountManager.mActiveCurFunds))
		Else
			txt_Balance.Text = VB6.Format(gClsaccountManager.mActiveCurFunds, "currency")
		End If
		
		
		
		TimerJobs.Enabled = True
		
	End Sub
	
	'UPGRADE_NOTE: TimeString was upgraded to TimeString_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Public Function TimeString_Renamed(ByRef Seconds As Integer, Optional ByRef Verbose As Boolean = False) As String
		
		'if verbose = false, returns
		'something like
		'02:22.08
		'if true, returns
		'2 hours, 22 minutes, and 8 seconds
		
		Dim lHrs As Integer
		Dim lMinutes As Integer
		Dim lSeconds As Integer
		
		lSeconds = Seconds
		
		lHrs = Int(lSeconds / 3600)
		lMinutes = (Int(lSeconds / 60)) - (lHrs * 60)
		lSeconds = Int(lSeconds Mod 60)
		
		Dim sAns As String
		
		
		If lSeconds = 60 Then
			lMinutes = lMinutes + 1
			lSeconds = 0
		End If
		
		If lMinutes = 60 Then
			lMinutes = 0
			lHrs = lHrs + 1
		End If
		
		sAns = VB6.Format(CStr(lMinutes), "00") & "." & VB6.Format(CStr(lSeconds), "00")
		
		If Verbose Then sAns = TimeStringtoEnglish(sAns)
		TimeString_Renamed = sAns
		
	End Function
	
	Private Function TimeStringtoEnglish(ByRef sTimeString As String) As String
		
		Dim sAns As String
		Dim sHour As Object
		Dim sMin, sSec As String
		Dim iTemp As Short
		Dim sTemp As String
		Dim iPos As Short
		iPos = InStr(sTimeString, ":") - 1
		
		'UPGRADE_WARNING: Couldn't resolve default property of object sHour. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		sHour = VB.Left(sTimeString, iPos)
		'UPGRADE_WARNING: Couldn't resolve default property of object sHour. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		If CInt(sHour) <> 0 Then
			'UPGRADE_WARNING: Couldn't resolve default property of object sHour. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			sAns = CInt(sHour) & " hour"
			'UPGRADE_WARNING: Couldn't resolve default property of object sHour. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If CInt(sHour) > 1 Then sAns = sAns & "s"
			sAns = sAns & ", "
		End If
		
		sMin = Mid(sTimeString, iPos + 2, 2)
		
		iTemp = CShort(sMin)
		
		If sMin = "00" Then
			sAns = IIf(Len(sAns), sAns & "0 minutes, and ", "")
		Else
			sTemp = IIf(iTemp = 1, " minute", " minutes")
			sTemp = IIf(Len(sAns), sTemp & ", and ", sTemp & " and ")
			sAns = sAns & VB6.Format(iTemp, "##") & sTemp
		End If
		
		iTemp = Val(VB.Right(sTimeString, 2))
		sSec = VB6.Format(iTemp, "#0")
		sAns = sAns & sSec & " second"
		If iTemp <> 1 Then sAns = sAns & "s"
		
		TimeStringtoEnglish = sAns
		
	End Function
End Class