Option Strict Off
Option Explicit On
Friend Class Frm_ClientMatter
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
	
	
	Dim clsCM As cls_cmChargeBack
	Private clientsplit() As String
	
	Private Sub Command1_Click()
		Me.Close()
	End Sub
	
	'UPGRADE_WARNING: Event cc_selected.TextChanged may fire when form is initialized. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="88B12AE1-6DE0-48A0-86F1-60C0686C026A"'
	Private Sub cc_selected_TextChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cc_selected.TextChanged
		If (cc_selected.Text = "") Then
			cm_selected.Enabled = False
			cm_selected.BackColor = System.Drawing.ColorTranslator.FromOle(&H8000000F)
		Else
			cm_selected.Enabled = True
			cm_selected.BackColor = System.Drawing.ColorTranslator.FromOle(&H80000005)
		End If
		
	End Sub
	
	Private Sub cmd_reset_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmd_reset.Click
		Dim a As Object
		
		For a = 0 To ctJobList.ListCount
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			ctJobList.set_CellText(a, 4, "")
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			ctJobList.set_CellText(a, 5, "")
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			ctJobList.set_CellCheck(a, 1, 0)
		Next 
		
	End Sub
	
	Private Sub cmd_Save_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmd_Save.Click
		Dim Exists As Object
		Dim a As Object
		'''''''''''''''''''''''''
		' here we save the items'
		'''''''''''''''''''''''''
		Dim GUID As String
		Dim CC As String
		Dim CM As String
		Dim result As Boolean
		
		
		For a = 0 To ctJobList.ListCount - 1
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			GUID = ctJobList.get_ListCargo(a)
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			CC = ctJobList.get_CellText(a, 4)
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			CM = ctJobList.get_CellText(a, 5)
			
			'UPGRADE_WARNING: Couldn't resolve default property of object Exists. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Exists = InStr(GUID, "{") <> 0
			'UPGRADE_WARNING: Couldn't resolve default property of object Exists. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If (Exists = True) Then
				result = clsCM.CM_UpdateDatabaseJob(GUID, CC, CM)
			Else
				result = clsCM.CM_UpdateSessionJob(GUID, CC, CM)
			End If
			
			If (result = True) Then
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ctJobList.set_ListBackColor(a, System.Convert.ToUInt32(System.Drawing.ColorTranslator.FromOle(&HC0FFC0)))
			Else
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ctJobList.set_ListBackColor(a, System.Convert.ToUInt32(System.Drawing.ColorTranslator.FromOle(&HC0C0FF)))
			End If
		Next 
		
		
	End Sub
	
	'UPGRADE_WARNING: Event cNameFilter.TextChanged may fire when form is initialized. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="88B12AE1-6DE0-48A0-86F1-60C0686C026A"'
	Private Sub cNameFilter_TextChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cNameFilter.TextChanged
		
		If (cNameFilter.Text = "") Then
			ctClientList.ClearList()
			ctMatterList.ClearList()
			cc_selected.Text = ""
			cm_selected.Text = ""
		Else
			Call clsCM.CM_PopulateClientsByName(ctClientList, cNameFilter.Text)
		End If
		
	End Sub
	
	'UPGRADE_WARNING: Event cCodeFilter.TextChanged may fire when form is initialized. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="88B12AE1-6DE0-48A0-86F1-60C0686C026A"'
	Private Sub cCodeFilter_TextChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cCodeFilter.TextChanged
		
		If (cCodeFilter.Text = "") Then
			ctClientList.ClearList()
			ctMatterList.ClearList()
			cc_selected.Text = ""
			cm_selected.Text = ""
			
		Else
			Call clsCM.CM_PopulateClientsByCode(ctClientList, cCodeFilter.Text)
		End If
		
	End Sub
	
	
	Private Sub Cmd_selectall_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Cmd_selectall.Click
		Dim a As Object
		
		For a = 0 To ctJobList.ListCount
			
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If (ctJobList.get_CellCheck(a, 1) = 1) Then
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ctJobList.set_CellCheck(a, 1, 0)
			Else
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ctJobList.set_CellCheck(a, 1, 1)
			End If
			
		Next 
		
	End Sub
	
	
	Private Sub Cmd_Apply_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Cmd_Apply.Click
		Dim a As Object
		Dim selected As Integer
		
		If (cc_selected.Text = "") Then
			lbl_error.Text = "Client Code is Required.!"
			cc_selected.Focus()
			Exit Sub
		Else
			lbl_error.Text = ""
		End If
		
		
		selected = 0
		For a = 0 To ctJobList.ListCount
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If (ctJobList.get_CellCheck(a, 1) = 1) Then
				selected = selected + 1
			End If
		Next 
		
		If (selected = 0) Then
			lbl_error.Text = "No Jobs Selected.!"
			ctJobList.Focus()
			Exit Sub
		Else
			lbl_error.Text = ""
		End If
		
		
		For a = 0 To ctJobList.ListCount
			
			'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If (ctJobList.get_CellCheck(a, 1) = 1) Then
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ctJobList.set_CellText(a, 4, cc_selected.Text)
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				ctJobList.set_CellText(a, 5, cm_selected.Text)
			End If
			
		Next 
		
	End Sub
	
	Private Sub ctClientList_Change(ByVal eventSender As System.Object, ByVal eventArgs As AxCTLISTLib._DctListEvents_ChangeEvent) Handles ctClientList.Change
		Dim Index As Object
		
		'UPGRADE_WARNING: Couldn't resolve default property of object Index. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		If (Index = -1) Then Exit Sub
		
		If (ctClientList.get_ColumnText(1) = "Client Code:") Then
			cc_selected.Text = ctClientList.get_CellText(eventArgs.nIndex, 1)
		Else
			cc_selected.Text = ctClientList.get_CellText(eventArgs.nIndex, 3)
		End If
		
		cm_selected.Text = ""
		
		Call clsCM.CM_PopulateMatters(ctMatterList, ctClientList.get_ListCargo(eventArgs.nIndex))
		
	End Sub
	
	Private Sub ctMatterList_Change(ByVal eventSender As System.Object, ByVal eventArgs As AxCTLISTLib._DctListEvents_ChangeEvent) Handles ctMatterList.Change
		Dim Index As Object
		
		'UPGRADE_WARNING: Couldn't resolve default property of object Index. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		If (Index = -1) Then Exit Sub
		cm_selected.Text = ctMatterList.get_CellText(eventArgs.nIndex, 1)
		
	End Sub
	
	
	Private Sub Frm_ClientMatter_Load(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles MyBase.Load
		clsCM = New cls_cmChargeBack
		clsCM.CM_PopulateView(ctJobList)
		
		cNameFilter.BackColor = System.Drawing.ColorTranslator.FromOle(&H8000000F)
		cNameFilter.Enabled = False
		cCodeFilter.BackColor = System.Drawing.ColorTranslator.FromOle(&H80000005)
		cCodeFilter.Enabled = True
		
		ctClientList.set_ColumnText(1, "Client Code:")
		ctClientList.set_ColumnWidth(1, 125)
		
		ctClientList.set_ColumnText(2, "Client Name:")
		ctClientList.set_ColumnWidth(2, 225)
		
		ctClientList.set_ColumnText(3, "Client Description:")
		ctClientList.set_ColumnWidth(3, 150)
		
		If (ctJobList.ListCount = 0) Then
			Cmd_selectall.Enabled = False
			Cmd_Apply.Enabled = False
			cmd_Save.Enabled = False
			cmd_reset.Enabled = False
			ctJobList.Enabled = False
		End If
		
		
	End Sub
	
	
	'UPGRADE_WARNING: Event Opt_cc.CheckedChanged may fire when form is initialized. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="88B12AE1-6DE0-48A0-86F1-60C0686C026A"'
	Private Sub Opt_cc_CheckedChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Opt_cc.CheckedChanged
		If eventSender.Checked Then
			
			cNameFilter.BackColor = System.Drawing.ColorTranslator.FromOle(&H8000000F)
			cNameFilter.Enabled = False
			cCodeFilter.BackColor = System.Drawing.ColorTranslator.FromOle(&H80000005)
			cCodeFilter.Enabled = True
			
			ctClientList.set_ColumnText(1, "Client Code:")
			ctClientList.set_ColumnWidth(1, 125)
			
			ctClientList.set_ColumnText(2, "Client Name:")
			ctClientList.set_ColumnWidth(2, 225)
			
			ctClientList.set_ColumnText(3, "Client Description:")
			ctClientList.set_ColumnWidth(3, 150)
			
			ctClientList.ClearList()
			ctMatterList.ClearList()
			
			cCodeFilter.Text = ""
			cCodeFilter.Focus()
			
		End If
	End Sub
	
	'UPGRADE_WARNING: Event Opt_cn.CheckedChanged may fire when form is initialized. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="88B12AE1-6DE0-48A0-86F1-60C0686C026A"'
	Private Sub Opt_cn_CheckedChanged(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles Opt_cn.CheckedChanged
		If eventSender.Checked Then
			
			cNameFilter.BackColor = System.Drawing.ColorTranslator.FromOle(&H80000005)
			cNameFilter.Enabled = True
			cCodeFilter.BackColor = System.Drawing.ColorTranslator.FromOle(&H8000000F)
			cCodeFilter.Enabled = False
			
			ctClientList.set_ColumnText(1, "Client Name:")
			ctClientList.set_ColumnWidth(1, 225)
			
			ctClientList.set_ColumnText(2, "Client Description:")
			ctClientList.set_ColumnWidth(2, 150)
			
			ctClientList.set_ColumnText(3, "Client Code:")
			ctClientList.set_ColumnWidth(3, 125)
			
			ctClientList.ClearList()
			ctMatterList.ClearList()
			
			cNameFilter.Text = ""
			cNameFilter.Focus()
			
		End If
	End Sub
	
	Private Sub cmd_close_Click(ByVal eventSender As System.Object, ByVal eventArgs As System.EventArgs) Handles cmd_close.Click
		
		Me.Close()
	End Sub
	
	Private Sub Frm_ClientMatter_FormClosing(ByVal eventSender As System.Object, ByVal eventArgs As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
		Dim Cancel As Boolean = eventArgs.Cancel
		Dim UnloadMode As System.Windows.Forms.CloseReason = eventArgs.CloseReason
		gCmOpen = False
		'UPGRADE_NOTE: Object clsCM may not be destroyed until it is garbage collected. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6E35BFF6-CD74-4B09-9689-3E1A43DF8969"'
		clsCM = Nothing
		eventArgs.Cancel = Cancel
	End Sub
End Class