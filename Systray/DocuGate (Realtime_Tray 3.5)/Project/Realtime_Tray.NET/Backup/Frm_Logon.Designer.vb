<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class Frm_Logon
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
	Public WithEvents myUDP As AxMSWinsockLib.AxWinsock
	Public WithEvents AutoLogon As System.Windows.Forms.Timer
	Public WithEvents lst_Activity As AxCTLISTLib.AxctList
	Public WithEvents Inactivity As System.Windows.Forms.Timer
	Public WithEvents TimerJobs As System.Windows.Forms.Timer
	Public WithEvents txt_SessionTimer As System.Windows.Forms.TextBox
	Public WithEvents Cmd_Logoff As System.Windows.Forms.Button
	Public WithEvents txt_Balance As System.Windows.Forms.TextBox
	Public WithEvents txt_ActiveUser As System.Windows.Forms.TextBox
	Public WithEvents Label1 As System.Windows.Forms.Label
	Public WithEvents txt_User As System.Windows.Forms.Label
	Public WithEvents Piclogoff As System.Windows.Forms.Panel
	Public WithEvents Timer1 As System.Windows.Forms.Timer
	Public WithEvents Cmd_Logon As System.Windows.Forms.Button
	Public WithEvents txt_Badge As System.Windows.Forms.TextBox
	Public WithEvents txt_Password As System.Windows.Forms.TextBox
	Public WithEvents lbl_Password As System.Windows.Forms.Label
	Public WithEvents lbl_Badge As System.Windows.Forms.Label
	Public WithEvents Piclogon As System.Windows.Forms.Panel
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Frm_Logon))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.myUDP = New AxMSWinsockLib.AxWinsock
		Me.AutoLogon = New System.Windows.Forms.Timer(components)
		Me.lst_Activity = New AxCTLISTLib.AxctList
		Me.Inactivity = New System.Windows.Forms.Timer(components)
		Me.TimerJobs = New System.Windows.Forms.Timer(components)
		Me.Piclogoff = New System.Windows.Forms.Panel
		Me.txt_SessionTimer = New System.Windows.Forms.TextBox
		Me.Cmd_Logoff = New System.Windows.Forms.Button
		Me.txt_Balance = New System.Windows.Forms.TextBox
		Me.txt_ActiveUser = New System.Windows.Forms.TextBox
		Me.Label1 = New System.Windows.Forms.Label
		Me.txt_User = New System.Windows.Forms.Label
		Me.Timer1 = New System.Windows.Forms.Timer(components)
		Me.Piclogon = New System.Windows.Forms.Panel
		Me.Cmd_Logon = New System.Windows.Forms.Button
		Me.txt_Badge = New System.Windows.Forms.TextBox
		Me.txt_Password = New System.Windows.Forms.TextBox
		Me.lbl_Password = New System.Windows.Forms.Label
		Me.lbl_Badge = New System.Windows.Forms.Label
		Me.Piclogoff.SuspendLayout()
		Me.Piclogon.SuspendLayout()
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		CType(Me.myUDP, System.ComponentModel.ISupportInitialize).BeginInit()
		CType(Me.lst_Activity, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
		Me.Text = " Desktop Login Agent"
		Me.ClientSize = New System.Drawing.Size(253, 323)
		Me.Location = New System.Drawing.Point(3, 22)
		Me.Icon = CType(resources.GetObject("Frm_Logon.Icon"), System.Drawing.Icon)
		Me.MaximizeBox = False
		Me.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Frm_Logon"
		myUDP.OcxState = CType(resources.GetObject("myUDP.OcxState"), System.Windows.Forms.AxHost.State)
		Me.myUDP.Location = New System.Drawing.Point(152, 280)
		Me.myUDP.Name = "myUDP"
		Me.AutoLogon.Enabled = False
		Me.AutoLogon.Interval = 500
		lst_Activity.OcxState = CType(resources.GetObject("lst_Activity.OcxState"), System.Windows.Forms.AxHost.State)
		Me.lst_Activity.Size = New System.Drawing.Size(242, 131)
		Me.lst_Activity.Location = New System.Drawing.Point(0, 128)
		Me.lst_Activity.TabIndex = 12
		Me.lst_Activity.Name = "lst_Activity"
		Me.Inactivity.Enabled = False
		Me.Inactivity.Interval = 1000
		Me.TimerJobs.Enabled = False
		Me.TimerJobs.Interval = 500
		Me.Piclogoff.Size = New System.Drawing.Size(251, 61)
		Me.Piclogoff.Location = New System.Drawing.Point(0, 64)
		Me.Piclogoff.TabIndex = 5
		Me.Piclogoff.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Piclogoff.Dock = System.Windows.Forms.DockStyle.None
		Me.Piclogoff.BackColor = System.Drawing.SystemColors.Control
		Me.Piclogoff.CausesValidation = True
		Me.Piclogoff.Enabled = True
		Me.Piclogoff.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Piclogoff.Cursor = System.Windows.Forms.Cursors.Default
		Me.Piclogoff.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Piclogoff.TabStop = True
		Me.Piclogoff.Visible = True
		Me.Piclogoff.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Piclogoff.Name = "Piclogoff"
		Me.txt_SessionTimer.AutoSize = False
		Me.txt_SessionTimer.TextAlign = System.Windows.Forms.HorizontalAlignment.Center
		Me.txt_SessionTimer.BackColor = System.Drawing.Color.FromARGB(255, 255, 192)
		Me.txt_SessionTimer.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txt_SessionTimer.Size = New System.Drawing.Size(39, 21)
		Me.txt_SessionTimer.Location = New System.Drawing.Point(136, 32)
		Me.txt_SessionTimer.ReadOnly = True
		Me.txt_SessionTimer.TabIndex = 11
		Me.txt_SessionTimer.AcceptsReturn = True
		Me.txt_SessionTimer.CausesValidation = True
		Me.txt_SessionTimer.Enabled = True
		Me.txt_SessionTimer.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txt_SessionTimer.HideSelection = True
		Me.txt_SessionTimer.Maxlength = 0
		Me.txt_SessionTimer.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txt_SessionTimer.MultiLine = False
		Me.txt_SessionTimer.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txt_SessionTimer.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txt_SessionTimer.TabStop = True
		Me.txt_SessionTimer.Visible = True
		Me.txt_SessionTimer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
		Me.txt_SessionTimer.Name = "txt_SessionTimer"
		Me.Cmd_Logoff.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Cmd_Logoff.Text = "&Logoff"
		Me.Cmd_Logoff.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Cmd_Logoff.Size = New System.Drawing.Size(61, 21)
		Me.Cmd_Logoff.Location = New System.Drawing.Point(176, 32)
		Me.Cmd_Logoff.TabIndex = 10
		Me.Cmd_Logoff.TabStop = False
		Me.Cmd_Logoff.BackColor = System.Drawing.SystemColors.Control
		Me.Cmd_Logoff.CausesValidation = True
		Me.Cmd_Logoff.Enabled = True
		Me.Cmd_Logoff.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Cmd_Logoff.Cursor = System.Windows.Forms.Cursors.Default
		Me.Cmd_Logoff.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Cmd_Logoff.Name = "Cmd_Logoff"
		Me.txt_Balance.AutoSize = False
		Me.txt_Balance.BackColor = System.Drawing.Color.FromARGB(255, 255, 192)
		Me.txt_Balance.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txt_Balance.Size = New System.Drawing.Size(71, 21)
		Me.txt_Balance.Location = New System.Drawing.Point(60, 32)
		Me.txt_Balance.ReadOnly = True
		Me.txt_Balance.TabIndex = 9
		Me.txt_Balance.AcceptsReturn = True
		Me.txt_Balance.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txt_Balance.CausesValidation = True
		Me.txt_Balance.Enabled = True
		Me.txt_Balance.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txt_Balance.HideSelection = True
		Me.txt_Balance.Maxlength = 0
		Me.txt_Balance.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txt_Balance.MultiLine = False
		Me.txt_Balance.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txt_Balance.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txt_Balance.TabStop = True
		Me.txt_Balance.Visible = True
		Me.txt_Balance.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
		Me.txt_Balance.Name = "txt_Balance"
		Me.txt_ActiveUser.AutoSize = False
		Me.txt_ActiveUser.BackColor = System.Drawing.Color.FromARGB(255, 255, 192)
		Me.txt_ActiveUser.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txt_ActiveUser.Size = New System.Drawing.Size(178, 21)
		Me.txt_ActiveUser.Location = New System.Drawing.Point(60, 6)
		Me.txt_ActiveUser.ReadOnly = True
		Me.txt_ActiveUser.TabIndex = 7
		Me.txt_ActiveUser.AcceptsReturn = True
		Me.txt_ActiveUser.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txt_ActiveUser.CausesValidation = True
		Me.txt_ActiveUser.Enabled = True
		Me.txt_ActiveUser.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txt_ActiveUser.HideSelection = True
		Me.txt_ActiveUser.Maxlength = 0
		Me.txt_ActiveUser.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txt_ActiveUser.MultiLine = False
		Me.txt_ActiveUser.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txt_ActiveUser.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txt_ActiveUser.TabStop = True
		Me.txt_ActiveUser.Visible = True
		Me.txt_ActiveUser.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
		Me.txt_ActiveUser.Name = "txt_ActiveUser"
		Me.Label1.Text = "Balance $:"
		Me.Label1.Size = New System.Drawing.Size(51, 13)
		Me.Label1.Location = New System.Drawing.Point(2, 32)
		Me.Label1.TabIndex = 8
		Me.Label1.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Label1.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.Label1.BackColor = System.Drawing.SystemColors.Control
		Me.Label1.Enabled = True
		Me.Label1.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Label1.Cursor = System.Windows.Forms.Cursors.Default
		Me.Label1.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Label1.UseMnemonic = True
		Me.Label1.Visible = True
		Me.Label1.AutoSize = True
		Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Label1.Name = "Label1"
		Me.txt_User.Text = "User:"
		Me.txt_User.Size = New System.Drawing.Size(25, 13)
		Me.txt_User.Location = New System.Drawing.Point(2, 8)
		Me.txt_User.TabIndex = 6
		Me.txt_User.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txt_User.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.txt_User.BackColor = System.Drawing.SystemColors.Control
		Me.txt_User.Enabled = True
		Me.txt_User.ForeColor = System.Drawing.SystemColors.ControlText
		Me.txt_User.Cursor = System.Windows.Forms.Cursors.Default
		Me.txt_User.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txt_User.UseMnemonic = True
		Me.txt_User.Visible = True
		Me.txt_User.AutoSize = True
		Me.txt_User.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.txt_User.Name = "txt_User"
		Me.Timer1.Enabled = False
		Me.Timer1.Interval = 10
		Me.Piclogon.Size = New System.Drawing.Size(251, 77)
		Me.Piclogon.Location = New System.Drawing.Point(0, 0)
		Me.Piclogon.TabIndex = 2
		Me.Piclogon.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Piclogon.Dock = System.Windows.Forms.DockStyle.None
		Me.Piclogon.BackColor = System.Drawing.SystemColors.Control
		Me.Piclogon.CausesValidation = True
		Me.Piclogon.Enabled = True
		Me.Piclogon.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Piclogon.Cursor = System.Windows.Forms.Cursors.Default
		Me.Piclogon.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Piclogon.TabStop = True
		Me.Piclogon.Visible = True
		Me.Piclogon.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.Piclogon.Name = "Piclogon"
		Me.Cmd_Logon.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
		Me.Cmd_Logon.Text = "&Logon"
		Me.AcceptButton = Me.Cmd_Logon
		Me.Cmd_Logon.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.Cmd_Logon.Size = New System.Drawing.Size(74, 21)
		Me.Cmd_Logon.Location = New System.Drawing.Point(164, 32)
		Me.Cmd_Logon.TabIndex = 3
		Me.Cmd_Logon.BackColor = System.Drawing.SystemColors.Control
		Me.Cmd_Logon.CausesValidation = True
		Me.Cmd_Logon.Enabled = True
		Me.Cmd_Logon.ForeColor = System.Drawing.SystemColors.ControlText
		Me.Cmd_Logon.Cursor = System.Windows.Forms.Cursors.Default
		Me.Cmd_Logon.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.Cmd_Logon.TabStop = True
		Me.Cmd_Logon.Name = "Cmd_Logon"
		Me.txt_Badge.AutoSize = False
		Me.txt_Badge.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txt_Badge.Size = New System.Drawing.Size(164, 21)
		Me.txt_Badge.Location = New System.Drawing.Point(72, 6)
		Me.txt_Badge.TabIndex = 0
		Me.txt_Badge.AcceptsReturn = True
		Me.txt_Badge.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txt_Badge.BackColor = System.Drawing.SystemColors.Window
		Me.txt_Badge.CausesValidation = True
		Me.txt_Badge.Enabled = True
		Me.txt_Badge.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txt_Badge.HideSelection = True
		Me.txt_Badge.ReadOnly = False
		Me.txt_Badge.Maxlength = 0
		Me.txt_Badge.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txt_Badge.MultiLine = False
		Me.txt_Badge.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txt_Badge.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txt_Badge.TabStop = True
		Me.txt_Badge.Visible = True
		Me.txt_Badge.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
		Me.txt_Badge.Name = "txt_Badge"
		Me.txt_Password.AutoSize = False
		Me.txt_Password.BackColor = System.Drawing.SystemColors.Control
		Me.txt_Password.Enabled = False
		Me.txt_Password.Font = New System.Drawing.Font("Verdana", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.txt_Password.Size = New System.Drawing.Size(88, 21)
		Me.txt_Password.IMEMode = System.Windows.Forms.ImeMode.Disable
		Me.txt_Password.Location = New System.Drawing.Point(75, 32)
		Me.txt_Password.PasswordChar = ChrW(42)
		Me.txt_Password.TabIndex = 1
		Me.txt_Password.AcceptsReturn = True
		Me.txt_Password.TextAlign = System.Windows.Forms.HorizontalAlignment.Left
		Me.txt_Password.CausesValidation = True
		Me.txt_Password.ForeColor = System.Drawing.SystemColors.WindowText
		Me.txt_Password.HideSelection = True
		Me.txt_Password.ReadOnly = False
		Me.txt_Password.Maxlength = 0
		Me.txt_Password.Cursor = System.Windows.Forms.Cursors.IBeam
		Me.txt_Password.MultiLine = False
		Me.txt_Password.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.txt_Password.ScrollBars = System.Windows.Forms.ScrollBars.None
		Me.txt_Password.TabStop = True
		Me.txt_Password.Visible = True
		Me.txt_Password.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
		Me.txt_Password.Name = "txt_Password"
		Me.lbl_Password.Text = "Label1"
		Me.lbl_Password.Size = New System.Drawing.Size(71, 15)
		Me.lbl_Password.Location = New System.Drawing.Point(5, 30)
		Me.lbl_Password.TabIndex = 13
		Me.lbl_Password.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.lbl_Password.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.lbl_Password.BackColor = System.Drawing.SystemColors.Control
		Me.lbl_Password.Enabled = True
		Me.lbl_Password.ForeColor = System.Drawing.SystemColors.ControlText
		Me.lbl_Password.Cursor = System.Windows.Forms.Cursors.Default
		Me.lbl_Password.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.lbl_Password.UseMnemonic = True
		Me.lbl_Password.Visible = True
		Me.lbl_Password.AutoSize = False
		Me.lbl_Password.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.lbl_Password.Name = "lbl_Password"
		Me.lbl_Badge.Text = "Label1"
		Me.lbl_Badge.Size = New System.Drawing.Size(69, 15)
		Me.lbl_Badge.Location = New System.Drawing.Point(5, 10)
		Me.lbl_Badge.TabIndex = 4
		Me.lbl_Badge.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.lbl_Badge.TextAlign = System.Drawing.ContentAlignment.TopLeft
		Me.lbl_Badge.BackColor = System.Drawing.SystemColors.Control
		Me.lbl_Badge.Enabled = True
		Me.lbl_Badge.ForeColor = System.Drawing.SystemColors.ControlText
		Me.lbl_Badge.Cursor = System.Windows.Forms.Cursors.Default
		Me.lbl_Badge.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.lbl_Badge.UseMnemonic = True
		Me.lbl_Badge.Visible = True
		Me.lbl_Badge.AutoSize = False
		Me.lbl_Badge.BorderStyle = System.Windows.Forms.BorderStyle.None
		Me.lbl_Badge.Name = "lbl_Badge"
		Me.Controls.Add(myUDP)
		Me.Controls.Add(lst_Activity)
		Me.Controls.Add(Piclogoff)
		Me.Controls.Add(Piclogon)
		Me.Piclogoff.Controls.Add(txt_SessionTimer)
		Me.Piclogoff.Controls.Add(Cmd_Logoff)
		Me.Piclogoff.Controls.Add(txt_Balance)
		Me.Piclogoff.Controls.Add(txt_ActiveUser)
		Me.Piclogoff.Controls.Add(Label1)
		Me.Piclogoff.Controls.Add(txt_User)
		Me.Piclogon.Controls.Add(Cmd_Logon)
		Me.Piclogon.Controls.Add(txt_Badge)
		Me.Piclogon.Controls.Add(txt_Password)
		Me.Piclogon.Controls.Add(lbl_Password)
		Me.Piclogon.Controls.Add(lbl_Badge)
		CType(Me.lst_Activity, System.ComponentModel.ISupportInitialize).EndInit()
		CType(Me.myUDP, System.ComponentModel.ISupportInitialize).EndInit()
		Me.Piclogoff.ResumeLayout(False)
		Me.Piclogon.ResumeLayout(False)
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class