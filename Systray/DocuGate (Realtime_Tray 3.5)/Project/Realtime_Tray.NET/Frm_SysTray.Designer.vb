<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class Frm_SysTray
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
	Public WithEvents _mnuSysTray_0 As System.Windows.Forms.ToolStripMenuItem
	Public WithEvents mnupopup As System.Windows.Forms.ToolStripMenuItem
	Public WithEvents MainMenu1 As System.Windows.Forms.MenuStrip
	Public WithEvents mnuSysTray As Microsoft.VisualBasic.Compatibility.VB6.ToolStripMenuItemArray
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Frm_SysTray))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.MainMenu1 = New System.Windows.Forms.MenuStrip
		Me.mnupopup = New System.Windows.Forms.ToolStripMenuItem
		Me._mnuSysTray_0 = New System.Windows.Forms.ToolStripMenuItem
		Me.mnuSysTray = New Microsoft.VisualBasic.Compatibility.VB6.ToolStripMenuItemArray(components)
		Me.MainMenu1.SuspendLayout()
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		CType(Me.mnuSysTray, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.Text = "sysTray"
		Me.ClientSize = New System.Drawing.Size(312, 129)
		Me.Location = New System.Drawing.Point(11, 49)
		Me.Icon = CType(resources.GetObject("Frm_SysTray.Icon"), System.Drawing.Icon)
		Me.StartPosition = System.Windows.Forms.FormStartPosition.WindowsDefaultLocation
		Me.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.BackColor = System.Drawing.SystemColors.Control
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Sizable
		Me.ControlBox = True
		Me.Enabled = True
		Me.KeyPreview = False
		Me.MaximizeBox = True
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.ShowInTaskbar = True
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Frm_SysTray"
		Me.mnupopup.Name = "mnupopup"
		Me.mnupopup.Text = "&Popup"
		Me.mnupopup.Checked = False
		Me.mnupopup.Enabled = True
		Me.mnupopup.Visible = True
		Me._mnuSysTray_0.Name = "_mnuSysTray_0"
		Me._mnuSysTray_0.Text = ""
		Me._mnuSysTray_0.Checked = False
		Me._mnuSysTray_0.Enabled = True
		Me._mnuSysTray_0.Visible = True
		Me.mnuSysTray.SetIndex(_mnuSysTray_0, CType(0, Short))
		CType(Me.mnuSysTray, System.ComponentModel.ISupportInitialize).EndInit()
		MainMenu1.Items.AddRange(New System.Windows.Forms.ToolStripItem(){Me.mnupopup})
		mnupopup.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem(){Me._mnuSysTray_0})
		Me.Controls.Add(MainMenu1)
		Me.MainMenu1.ResumeLayout(False)
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class