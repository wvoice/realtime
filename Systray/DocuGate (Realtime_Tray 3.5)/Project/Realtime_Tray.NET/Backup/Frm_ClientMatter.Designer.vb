<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class Frm_ClientMatter
#Region "Windows Form Designer generated code "
	<System.Diagnostics.DebuggerNonUserCode()> Public Sub New()
		MyBase.New()
		'This call is required by the Windows Form Designer.
		InitializeComponent()
	End Sub
	'Form overrides dispose to clean up the component list.
	<System.Diagnostics.DebuggerNonUserCode()> Protected Overloads Overrides Sub Dispose(ByVal Disposing As Boolean)
		If Disposing Then
			If Not components Is Nothing Then
				components.Dispose()
			End If
		End If
		MyBase.Dispose(Disposing)
	End Sub
	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer
	Public ToolTip1 As System.Windows.Forms.ToolTip
	Public WithEvents cmd_Save As System.Windows.Forms.Button
	Public WithEvents Cmd_selectall As System.Windows.Forms.Button
	Public WithEvents cm_selected As System.Windows.Forms.TextBox
	Public WithEvents cc_selected As System.Windows.Forms.TextBox
	Public WithEvents Opt_cn As System.Windows.Forms.RadioButton
	Public WithEvents Opt_cc As System.Windows.Forms.RadioButton
	Public WithEvents cCodeFilter As System.Windows.Forms.TextBox
	Public WithEvents ctClientList As AxCTLISTLib.AxctList
	Public WithEvents ctJobList As AxCTLISTLib.AxctList
	Public WithEvents cmd_close As System.Windows.Forms.Button
	Public WithEvents cmd_reset As System.Windows.Forms.Button
	Public WithEvents cNameFilter As System.Windows.Forms.TextBox
	Public WithEvents Cmd_Apply As System.Windows.Forms.Button
	Public WithEvents ctMatterList As AxCTLISTLib.AxctList
	Public WithEvents lbl_error As System.Windows.Forms.Label
	Public WithEvents Label3 As System.Windows.Forms.Label
	Public WithEvents Label2 As System.Windows.Forms.Label
	Public WithEvents OptcName_Filter As System.Windows.Forms.Label
	Public WithEvents OptcCode_Filter As System.Windows.Forms.Label
	Public WithEvents Label1 As System.Windows.Forms.Label
	Public WithEvents piccm As System.Windows.Forms.Panel
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Frm_ClientMatter))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.piccm = New System.Windows.Forms.Panel
		Me.cmd_Save = New System.Windows.Forms.Button
		Me.Cmd_selectall = New System.Windows.Forms.Button
		Me.cm_selected = New System.Windows.Forms.TextBox
		Me.cc_selected = New System.Windows.Forms.TextBox
		Me.Opt_cn = New System.Windows.Forms.RadioButton
		Me.Opt_cc = New System.Windows.Forms.RadioButton
		Me.cCodeFilter = New System.Windows.Forms.TextBox
		Me.ctClientList = New AxCTLISTLib.AxctList
		Me.ctJobList = New AxCTLISTLib.AxctList
		Me.cmd_close = New System.Windows.Forms.Button
		Me.cmd_reset = New System.Windows.Forms.Button
		Me.cNameFilter = New System.Windows.Forms.TextBox
		Me.Cmd_Apply = New System.Windows.Forms.Button
		Me.ctMatterList = New AxCTLISTLib.AxctList
		Me.lbl_error = New System.Windows.Forms.Label
		Me.Label3 = New System.Windows.Forms.Label
		Me.Label2 = New System.Windows.Forms.Label
		Me.OptcName_Filter = New System.Windows.Forms.Label
		Me.OptcCode_Filter = New System.Windows.Forms.Label
		Me.Label1 = New System.Windows.Forms.Label
		Me.piccm.SuspendLayout()
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		CType(Me.ctClientList, System.ComponentModel.ISupportInitialize).BeginInit()
		CType(Me.ctJobList, System.ComponentModel.ISupportInitialize).BeginInit()
		CType(Me.ctMatterList, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
		Me.Text = "Client Matter Selection"
		Me.ClientSize = New System.Drawing.Size(572, 475)
		Me.Location = New System.Drawing.Point(3, 22)
		Me.Icon = CType(resources.GetObject("Frm_ClientMatter.Icon"), System.Drawing.Icon)
		Me.MaximizeBox = False
		Me.MinimizeBox = False
		Me.ShowInTaskbar = False
		Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		Me.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Frm_ClientMatter"
		Me.piccm.BackColor = System.Drawing.SystemColors.ActiveBorder
		Me.piccm.Size = New System.Drawing.Size(574, 476)
		Me.piccm.Location = New System.Drawing.Point(-1, 0)
		Me.piccm.TabIndex = 11
		Me.piccm.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.piccm.Dock = System.Windows.Forms.DockStyle.None
		Me.piccm.CausesValidation = True
		Me.piccm.Enabled = True
		Me.piccm.ForeColor = System.Drawing.SystemColors.ControlText
		Me.piccm.Cursor = System.Windows.Forms.Cursors.Default
		Me.piccm.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.piccm.TabStop = True
		Me.piccm.Visible = True
		Me.piccm.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.piccm.Name = "piccm"
		Me.cmd_Save.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.cmd_Save.Text = "&Save"
		Me.cmd_Save.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cmd_Save.Size = New System.Drawing.Size(66, 21)
		Me.cmd_Save.Location = New System.Drawing.Point(486, 276)
		Me.cmd_Save.TabIndex = 19
		Me.cmd_Save.BackColor = System.Drawing.SystemColors.Control
		Me.cmd_Save.CausesValidation = True
		Me.cmd_Save.Enabled = True
		Me.cmd_Save.ForeColor = System.Drawing.SystemColors.ControlText
		Me.cmd_Save.Cursor = System.Windows.Forms.Cursors.Default
		Me.cmd_Save.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cmd_Save.TabStop = True
		Me.cmd_Save.Name = "cmd_Save"
		Me.Cmd_selectall.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Cmd_selectall.Text = "&Select All"
		Me.Cmd_selectall.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Cmd_selectall.Size = New System.Drawing.Size(66, 21)
		Me.Cmd_selectall.Location = New System.Drawing.Point(348, 276)
		Me.Cmd_selectall.TabIndex = 6
		Me.Cmd_selectall.BackColor = System.Drawing.SystemColors.Control
		Me.Cmd_selectall.CausesValidation = True
		Me.Cmd_selectall.Enabled = True
		Me.Cmd_selectall.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Cmd_selectall.Cursor = System.Windows.Forms.Cursors.Default
		Me.Cmd_selectall.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Cmd_selectall.TabStop = True
		Me.Cmd_selectall.Name = "Cmd_selectall"
		Me.cm_selected.AutoSize = False
		Me.cm_selected.BackColor = System.Drawing.SystemColors.Control
		Me.cm_selected.Enabled = False
		Me.cm_selected.Size = New System.Drawing.Size(148, 19)
		Me.cm_selected.Location = New System.Drawing.Point(91, 275)
		Me.cm_selected.TabIndex = 5
		Me.cm_selected.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cm_selected.AcceptsReturn = True
		Me.cm_selected.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.cm_selected.CausesValidation = True
		Me.cm_selected.ForeColor = System.Drawing.SystemColors.WindowText
		Me.cm_selected.HideSelection = True
		Me.cm_selected.ReadOnly = False
		Me.cm_selected.Maxlength = 0
		Me.cm_selected.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.cm_selected.MultiLine = False
		Me.cm_selected.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cm_selected.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.cm_selected.TabStop = True
		Me.cm_selected.Visible = True
		Me.cm_selected.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.cm_selected.Name = "cm_selected"
		Me.cc_selected.AutoSize = False
		Me.cc_selected.Size = New System.Drawing.Size(148, 19)
		Me.cc_selected.Location = New System.Drawing.Point(91, 254)
		Me.cc_selected.TabIndex = 4
		Me.cc_selected.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cc_selected.AcceptsReturn = True
		Me.cc_selected.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.cc_selected.BackColor = System.Drawing.SystemColors.Window
		Me.cc_selected.CausesValidation = True
		Me.cc_selected.Enabled = True
		Me.cc_selected.ForeColor = System.Drawing.SystemColors.WindowText
		Me.cc_selected.HideSelection = True
		Me.cc_selected.ReadOnly = False
		Me.cc_selected.Maxlength = 0
		Me.cc_selected.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.cc_selected.MultiLine = False
		Me.cc_selected.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cc_selected.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.cc_selected.TabStop = True
		Me.cc_selected.Visible = True
		Me.cc_selected.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.cc_selected.Name = "cc_selected"
		Me.Opt_cn.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.Opt_cn.Text = "Option2"
		Me.Opt_cn.Size = New System.Drawing.Size(16, 13)
		Me.Opt_cn.Location = New System.Drawing.Point(27, 38)
		Me.Opt_cn.TabIndex = 16
		Me.Opt_cn.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Opt_cn.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.Opt_cn.BackColor = System.Drawing.SystemColors.Control
		Me.Opt_cn.CausesValidation = True
		Me.Opt_cn.Enabled = True
		Me.Opt_cn.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Opt_cn.Cursor = System.Windows.Forms.Cursors.Default
		Me.Opt_cn.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Opt_cn.Appearance = System.Windows.Forms.Appearance.Normal
		Me.Opt_cn.TabStop = True
		Me.Opt_cn.Checked = False
		Me.Opt_cn.Visible = True
		Me.Opt_cn.Name = "Opt_cn"
		Me.Opt_cc.TextAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.Opt_cc.Text = "Option1"
		Me.Opt_cc.Size = New System.Drawing.Size(11, 13)
		Me.Opt_cc.Location = New System.Drawing.Point(27, 13)
		Me.Opt_cc.TabIndex = 15
		Me.Opt_cc.Checked = True
		Me.Opt_cc.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Opt_cc.CheckAlign = System.Drawing.ContentAlignment.MiddleLeft
		Me.Opt_cc.BackColor = System.Drawing.SystemColors.Control
		Me.Opt_cc.CausesValidation = True
		Me.Opt_cc.Enabled = True
		Me.Opt_cc.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Opt_cc.Cursor = System.Windows.Forms.Cursors.Default
		Me.Opt_cc.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Opt_cc.Appearance = System.Windows.Forms.Appearance.Normal
		Me.Opt_cc.TabStop = True
		Me.Opt_cc.Visible = True
		Me.Opt_cc.Name = "Opt_cc"
		Me.cCodeFilter.AutoSize = False
		Me.cCodeFilter.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cCodeFilter.Size = New System.Drawing.Size(161, 21)
		Me.cCodeFilter.Location = New System.Drawing.Point(162, 12)
		Me.cCodeFilter.TabIndex = 0
		Me.cCodeFilter.AcceptsReturn = True
		Me.cCodeFilter.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.cCodeFilter.BackColor = System.Drawing.SystemColors.Window
		Me.cCodeFilter.CausesValidation = True
		Me.cCodeFilter.Enabled = True
		Me.cCodeFilter.ForeColor = System.Drawing.SystemColors.WindowText
		Me.cCodeFilter.HideSelection = True
		Me.cCodeFilter.ReadOnly = False
		Me.cCodeFilter.Maxlength = 0
		Me.cCodeFilter.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.cCodeFilter.MultiLine = False
		Me.cCodeFilter.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cCodeFilter.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.cCodeFilter.TabStop = True
		Me.cCodeFilter.Visible = True
		Me.cCodeFilter.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.cCodeFilter.Name = "cCodeFilter"
		ctClientList.OcxState = CType(resources.GetObject("ctClientList.OcxState"), System.Windows.Forms.AxHost.State)
		Me.ctClientList.Size = New System.Drawing.Size(536, 99)
		Me.ctClientList.Location = New System.Drawing.Point(20, 69)
		Me.ctClientList.TabIndex = 2
		Me.ctClientList.Name = "ctClientList"
		ctJobList.OcxState = CType(resources.GetObject("ctJobList.OcxState"), System.Windows.Forms.AxHost.State)
		Me.ctJobList.Size = New System.Drawing.Size(536, 144)
		Me.ctJobList.Location = New System.Drawing.Point(20, 300)
		Me.ctJobList.TabIndex = 9
		Me.ctJobList.Name = "ctJobList"
		Me.cmd_close.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.cmd_close.Text = "&Exit"
		Me.AcceptButton = Me.cmd_close
		Me.cmd_close.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cmd_close.Size = New System.Drawing.Size(66, 21)
		Me.cmd_close.Location = New System.Drawing.Point(489, 446)
		Me.cmd_close.TabIndex = 10
		Me.cmd_close.BackColor = System.Drawing.SystemColors.Control
		Me.cmd_close.CausesValidation = True
		Me.cmd_close.Enabled = True
		Me.cmd_close.ForeColor = System.Drawing.SystemColors.ControlText
		Me.cmd_close.Cursor = System.Windows.Forms.Cursors.Default
		Me.cmd_close.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cmd_close.TabStop = True
		Me.cmd_close.Name = "cmd_close"
		Me.cmd_reset.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.cmd_reset.Text = "&Reset"
		Me.cmd_reset.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cmd_reset.Size = New System.Drawing.Size(66, 21)
		Me.cmd_reset.Location = New System.Drawing.Point(421, 446)
		Me.cmd_reset.TabIndex = 8
		Me.cmd_reset.BackColor = System.Drawing.SystemColors.Control
		Me.cmd_reset.CausesValidation = True
		Me.cmd_reset.Enabled = True
		Me.cmd_reset.ForeColor = System.Drawing.SystemColors.ControlText
		Me.cmd_reset.Cursor = System.Windows.Forms.Cursors.Default
		Me.cmd_reset.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cmd_reset.TabStop = True
		Me.cmd_reset.Name = "cmd_reset"
		Me.cNameFilter.AutoSize = False
		Me.cNameFilter.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.cNameFilter.Size = New System.Drawing.Size(162, 21)
		Me.cNameFilter.Location = New System.Drawing.Point(161, 39)
		Me.cNameFilter.TabIndex = 1
		Me.cNameFilter.AcceptsReturn = True
		Me.cNameFilter.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.cNameFilter.BackColor = System.Drawing.SystemColors.Window
		Me.cNameFilter.CausesValidation = True
		Me.cNameFilter.Enabled = True
		Me.cNameFilter.ForeColor = System.Drawing.SystemColors.WindowText
		Me.cNameFilter.HideSelection = True
		Me.cNameFilter.ReadOnly = False
		Me.cNameFilter.Maxlength = 0
		Me.cNameFilter.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.cNameFilter.MultiLine = False
		Me.cNameFilter.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.cNameFilter.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.cNameFilter.TabStop = True
		Me.cNameFilter.Visible = True
		Me.cNameFilter.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
		Me.cNameFilter.Name = "cNameFilter"
		Me.Cmd_Apply.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Cmd_Apply.Text = "&Apply"
		Me.Cmd_Apply.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Cmd_Apply.Size = New System.Drawing.Size(66, 21)
		Me.Cmd_Apply.Location = New System.Drawing.Point(417, 276)
		Me.Cmd_Apply.TabIndex = 7
		Me.Cmd_Apply.BackColor = System.Drawing.SystemColors.Control
		Me.Cmd_Apply.CausesValidation = True
		Me.Cmd_Apply.Enabled = True
		Me.Cmd_Apply.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Cmd_Apply.Cursor = System.Windows.Forms.Cursors.Default
		Me.Cmd_Apply.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Cmd_Apply.TabStop = True
		Me.Cmd_Apply.Name = "Cmd_Apply"
		ctMatterList.OcxState = CType(resources.GetObject("ctMatterList.OcxState"), System.Windows.Forms.AxHost.State)
		Me.ctMatterList.Size = New System.Drawing.Size(536, 77)
		Me.ctMatterList.Location = New System.Drawing.Point(20, 172)
		Me.ctMatterList.TabIndex = 3
		Me.ctMatterList.Name = "ctMatterList"
		Me.lbl_error.TextAlign = System.Drawing.ContentAlignment.TopCenter
		Me.lbl_error.BackColor = System.Drawing.Color.Transparent
		Me.lbl_error.ForeColor = System.Drawing.SystemColors.WindowText
		Me.lbl_error.Size = New System.Drawing.Size(280, 19)
		Me.lbl_error.Location = New System.Drawing.Point(274, 253)
		Me.lbl_error.TabIndex = 20
		Me.lbl_error.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.lbl_error.Enabled = True
		Me.lbl_error.Cursor = System.Windows.Forms.Cursors.Default
		Me.lbl_error.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.lbl_error.UseMnemonic = True
		Me.lbl_error.Visible = True
		Me.lbl_error.AutoSize = False
		Me.lbl_error.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
		Me.lbl_error.Name = "lbl_error"
		Me.Label3.Text = "Client Matter:"
		Me.Label3.Size = New System.Drawing.Size(62, 13)
		Me.Label3.Location = New System.Drawing.Point(22, 276)
		Me.Label3.TabIndex = 18
		Me.Label3.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label3.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label3.BackColor = System.Drawing.Color.Transparent
		Me.Label3.Enabled = True
		Me.Label3.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label3.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label3.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label3.UseMnemonic = True
		Me.Label3.Visible = True
		Me.Label3.AutoSize = True
		Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label3.Name = "Label3"
		Me.Label2.Text = "Client Code:"
		Me.Label2.Size = New System.Drawing.Size(57, 13)
		Me.Label2.Location = New System.Drawing.Point(24, 255)
		Me.Label2.TabIndex = 17
		Me.Label2.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label2.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label2.BackColor = System.Drawing.Color.Transparent
		Me.Label2.Enabled = True
		Me.Label2.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label2.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label2.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label2.UseMnemonic = True
		Me.Label2.Visible = True
		Me.Label2.AutoSize = True
		Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label2.Name = "Label2"
		Me.OptcName_Filter.Text = "Use a client name filter:"
		Me.OptcName_Filter.Size = New System.Drawing.Size(110, 13)
		Me.OptcName_Filter.Location = New System.Drawing.Point(45, 39)
		Me.OptcName_Filter.TabIndex = 14
		Me.ToolTip1.SetToolTip(Me.OptcName_Filter, "Use a Client Name Filter:")
		Me.OptcName_Filter.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.OptcName_Filter.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.OptcName_Filter.BackColor = System.Drawing.Color.Transparent
		Me.OptcName_Filter.Enabled = True
		Me.OptcName_Filter.ForeColor = System.Drawing.SystemColors.ControlText
		Me.OptcName_Filter.Cursor = System.Windows.Forms.Cursors.Default
		Me.OptcName_Filter.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.OptcName_Filter.UseMnemonic = True
		Me.OptcName_Filter.Visible = True
		Me.OptcName_Filter.AutoSize = True
		Me.OptcName_Filter.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.OptcName_Filter.Name = "OptcName_Filter"
		Me.OptcCode_Filter.BackColor = System.Drawing.Color.Transparent
		Me.OptcCode_Filter.Text = "Use a client code filter:"
		Me.OptcCode_Filter.Size = New System.Drawing.Size(108, 13)
		Me.OptcCode_Filter.Location = New System.Drawing.Point(45, 14)
		Me.OptcCode_Filter.TabIndex = 13
		Me.ToolTip1.SetToolTip(Me.OptcCode_Filter, "Use a Client Code Filter:")
		Me.OptcCode_Filter.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.OptcCode_Filter.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.OptcCode_Filter.Enabled = True
		Me.OptcCode_Filter.ForeColor = System.Drawing.SystemColors.ControlText
		Me.OptcCode_Filter.Cursor = System.Windows.Forms.Cursors.Default
		Me.OptcCode_Filter.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.OptcCode_Filter.UseMnemonic = True
		Me.OptcCode_Filter.Visible = True
		Me.OptcCode_Filter.AutoSize = True
		Me.OptcCode_Filter.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.OptcCode_Filter.Name = "OptcCode_Filter"
		Me.Label1.Text = "Please highlight the job below and select it's desired client/matter codes. Once the row is complete press the Apply btton to go to the next row."
		Me.Label1.Size = New System.Drawing.Size(226, 57)
		Me.Label1.Location = New System.Drawing.Point(330, 9)
		Me.Label1.TabIndex = 12
		Me.Label1.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label1.BackColor = System.Drawing.Color.Transparent
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = False
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label1.Name = "Label1"
		Me.Controls.Add(piccm)
		Me.piccm.Controls.Add(cmd_Save)
		Me.piccm.Controls.Add(Cmd_selectall)
		Me.piccm.Controls.Add(cm_selected)
		Me.piccm.Controls.Add(cc_selected)
		Me.piccm.Controls.Add(Opt_cn)
		Me.piccm.Controls.Add(Opt_cc)
		Me.piccm.Controls.Add(cCodeFilter)
		Me.piccm.Controls.Add(ctClientList)
		Me.piccm.Controls.Add(ctJobList)
		Me.piccm.Controls.Add(cmd_close)
		Me.piccm.Controls.Add(cmd_reset)
		Me.piccm.Controls.Add(cNameFilter)
		Me.piccm.Controls.Add(Cmd_Apply)
		Me.piccm.Controls.Add(ctMatterList)
		Me.piccm.Controls.Add(lbl_error)
		Me.piccm.Controls.Add(Label3)
		Me.piccm.Controls.Add(Label2)
		Me.piccm.Controls.Add(OptcName_Filter)
		Me.piccm.Controls.Add(OptcCode_Filter)
		Me.piccm.Controls.Add(Label1)
		CType(Me.ctMatterList, System.ComponentModel.ISupportInitialize).EndInit()
		CType(Me.ctJobList, System.ComponentModel.ISupportInitialize).EndInit()
		CType(Me.ctClientList, System.ComponentModel.ISupportInitialize).EndInit()
		Me.piccm.ResumeLayout(False)
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class