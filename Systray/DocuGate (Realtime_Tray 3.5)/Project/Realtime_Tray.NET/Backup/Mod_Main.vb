Option Strict Off
Option Explicit On
Module Mod_Main
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
	
	Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Integer)
	Declare Sub InitCommonControls Lib "comctl32.dll" ()
	Declare Function LoadLibrary Lib "kernel32"  Alias "LoadLibraryA"(ByVal lpLibFileName As String) As Integer
	Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Integer) As Integer
	Public m_hMod As Integer
	
	Public gClsaccountManager As cls_AccountManager
	Public gClsSessionManager As cls_SessionManager
	Public gClsWorkstation As cls_Workstation
	Public gClsCMActive As cls_cmActive
	Public gclspcpl As cls_pcpl
	Public gclsMaxSpend As cls_maxspend
	Public gclsUnitCurrency As cls_unitcurrency
	Public gclsLabPrint As cls_LabPrint
	Public gclsfpNoLogon As cls_fpNoLogon
	Public gclsOfflineManager As Cls_OfflineManager
	
	Public IsLoggedOn As Boolean
	
	
	'UPGRADE_WARNING: Application will terminate when Sub Main() finishes. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="E08DDC71-66BA-424F-A612-80AF11498FF8"'
	Public Sub Main()
		
		gMyIniPath = My.Application.Info.DirectoryPath & "\realtime.conf"
		
		'UPGRADE_WARNING: Dir has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
		If (Dir(gMyIniPath) = "") Then
			MsgBox(gMyIniPath & " - Not located")
			End
		End If
		
		gClsConfig = New Cls_Config
		gClsDatabase = New cls_Database
		gClsaccountManager = New cls_AccountManager
		gClsSessionManager = New cls_SessionManager
		gClsWorkstation = New cls_Workstation
		gclspcpl = New cls_pcpl
		gclsMaxSpend = New cls_maxspend
		gclsUnitCurrency = New cls_unitcurrency
		gclsLabPrint = New cls_LabPrint
		gclsOfflineManager = New Cls_OfflineManager
		
		
		m_hMod = LoadLibrary("shell32.dll")
		InitCommonControls()
		gClsConfig.Init_ActiveLogon()
		
		gAppName = My.Application.Info.Title
		gAppVersion = My.Application.Info.ProductName & " Version: " & My.Application.Info.Version.Major & "." & My.Application.Info.Version.Minor
		gVersion = My.Application.Info.Version.Major & "." & My.Application.Info.Version.Minor
		
		'''''''''''''''''''''''''''''''''''''''
		'Peter Drysdale, Added for version 1.02
		'Project #: DGP-0001
		'08/05/2008
		'Handle logoff/toggle
		'create a collection for each queue that we should be monitoring for active jobs
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		Dim section As String
		Dim counter As Short
		Dim CmdLine As String
		Dim key As String
		Dim Inst As cls_Monitor
		
		On Error GoTo handler
		For counter = 0 To 25
			
			section = "QMonitor" & CStr(counter)
			key = gClsConfig.mGetData(section, "printer")
			If (key <> "") Then
				Inst = New cls_Monitor
				Inst.mPrinter = key
				Inst.mCost = gClsConfig.mGetData(section, "cost")
				Inst.mAlias = gClsConfig.mGetData(section, "alias")
				MyMonitors.Add(Inst, Inst.mPrinter)
			End If
			
handler: 
			
		Next 
		
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		'end
		'project #: DGP-0001
		'create a collection for each queue that we should be nonitoring for active jobs
		''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		IsLoggedOn = False
		gClsCMActive = New cls_cmActive
		'UPGRADE_ISSUE: Load statement is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="B530EFF2-3132-48F8-B8BC-D88AF543D321"'
		Load(Frm_Main)
		
	End Sub
	
	Public Sub TerminateApp()
		
		Dim f As System.Windows.Forms.Form
		For	Each f In My.Application.OpenForms
			f.Close()
			'UPGRADE_NOTE: Object f may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
			f = Nothing
		Next f
		
		'UPGRADE_NOTE: Object gClsaccountManager may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gClsaccountManager = Nothing
		'UPGRADE_NOTE: Object gClsSessionManager may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gClsSessionManager = Nothing
		'UPGRADE_NOTE: Object gClsWorkstation may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gClsWorkstation = Nothing
		'UPGRADE_NOTE: Object gClsCMActive may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gClsCMActive = Nothing
		
		FreeLibrary(m_hMod)
		'UPGRADE_NOTE: Object gClsConfig may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gClsConfig = Nothing
		'UPGRADE_NOTE: Object gClsDatabase may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		gClsDatabase = Nothing
		End
	End Sub
End Module