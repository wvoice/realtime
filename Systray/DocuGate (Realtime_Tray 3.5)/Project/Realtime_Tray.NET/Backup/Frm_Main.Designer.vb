<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> Partial Class Frm_Main
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
	Public WithEvents fpNoLogon_Timer As System.Windows.Forms.Timer
	Public WithEvents Timer1 As System.Windows.Forms.Timer
	Public WithEvents ImageList As System.Windows.Forms.ImageList
	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
		Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(Frm_Main))
		Me.components = New System.ComponentModel.Container()
		Me.ToolTip1 = New System.Windows.Forms.ToolTip(components)
		Me.fpNoLogon_Timer = New System.Windows.Forms.Timer(components)
		Me.Timer1 = New System.Windows.Forms.Timer(components)
		Me.ImageList = New System.Windows.Forms.ImageList
		Me.SuspendLayout()
		Me.ToolTip1.Active = True
		Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
		Me.BackColor = System.Drawing.Color.FromARGB(224, 224, 224)
		Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
		Me.Text = "DocuGate"
		Me.ClientSize = New System.Drawing.Size(144, 47)
		Me.Location = New System.Drawing.Point(304, 184)
		Me.ControlBox = False
		Me.Icon = CType(resources.GetObject("Frm_Main.Icon"), System.Drawing.Icon)
		Me.ShowInTaskbar = False
		Me.Visible = False
		Me.Font = New System.Drawing.Font("Arial", 8!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.Enabled = True
		Me.KeyPreview = False
		Me.MaximizeBox = True
		Me.MinimizeBox = True
		Me.Cursor = System.Windows.Forms.Cursors.Default
		Me.RightToLeft = System.Windows.Forms.RightToLeft.No
		Me.HelpButton = False
		Me.WindowState = System.Windows.Forms.FormWindowState.Normal
		Me.Name = "Frm_Main"
		Me.fpNoLogon_Timer.Enabled = False
		Me.fpNoLogon_Timer.Interval = 1
		Me.Timer1.Interval = 100
		Me.Timer1.Enabled = True
		Me.ImageList.ImageSize = New System.Drawing.Size(48, 48)
		Me.ImageList.TransparentColor = System.Drawing.Color.FromARGB(192, 192, 192)
		Me.ImageList.ImageStream = CType(resources.GetObject("ImageList.ImageStream"), System.Windows.Forms.ImageListStreamer)
		Me.ImageList.Images.SetKeyName(0, "")
		Me.ImageList.Images.SetKeyName(1, "")
		Me.ImageList.Images.SetKeyName(2, "")
		Me.ResumeLayout(False)
		Me.PerformLayout()
	End Sub
#End Region 
End Class