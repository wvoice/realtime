Option Strict Off
Option Explicit On
Friend Class cls_pcpl
	
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
	
	Private m_Classname As String
	Private m_hiddenlog As String
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_pcpl"
		m_hiddenlog = My.Application.Info.DirectoryPath & "\logs\csv\papercut-print-log-all-time.csv"
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	Public Function RefreshJobCollection() As Short
		Dim a As Object
		Dim nFileNum As Object
		
		On Error GoTo handler
		
		Dim m_strjobs() As String
		Dim elements() As String
		Dim linenum As Short
		Dim fsize As Integer
		linenum = 0
		
		'UPGRADE_WARNING: Dir has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
		If (Dir(m_hiddenlog) <> "") Then
			
			ReDim m_strjobs(100)
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			nFileNum = FreeFile
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			FileOpen(nFileNum, m_hiddenlog, OpenMode.Input)
			
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			Do While Not EOF(nFileNum)
				m_strjobs(linenum) = LineInput(1)
				
				If (linenum = 100) Then
					Exit Do
				End If
				
				linenum = linenum + 1
				
			Loop 
			
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			FileClose(nFileNum)
			ResetLog()
			
			For a = 0 To linenum
				'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				If (m_strjobs(a) <> "") Then
					'UPGRADE_WARNING: Couldn't resolve default property of object a. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
					gClsSessionManager.AddPCPLJob(m_strjobs(a))
				End If
			Next 
			ReDim m_strjobs(0)
		End If
		
handler: 
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
			Err.Clear()
		End If
		
		RefreshJobCollection = linenum
		
	End Function
	
	Public Sub ResetLog()
		Dim nFileNum As Object
		
		On Error GoTo handler
		
		'UPGRADE_WARNING: Dir has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
		If (Dir(m_hiddenlog) <> "") Then
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			nFileNum = FreeFile
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			FileOpen(nFileNum, m_hiddenlog, OpenMode.Output)
			'UPGRADE_WARNING: Couldn't resolve default property of object nFileNum. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			FileClose(nFileNum)
		End If
		
handler: 
		If (Err.Number <> 0) Then
			MsgBox(Err.Description)
		End If
		
		Exit Sub
		
		
		
	End Sub
	
	Private Function MakeACopy(ByRef src As String, ByRef dest As String) As Boolean
		
		On Error GoTo handler
		
		Dim sNextLine As String
		FileOpen(1, src, OpenMode.Input)
		FileOpen(2, dest, OpenMode.Output)
		
		Do While Not EOF(1)
			sNextLine = LineInput(1)
			PrintLine(2, sNextLine)
		Loop 
		
		FileClose(1)
		FileClose(2)
		
handler: 
		If Err.Number <> 0 Then
			MakeACopy = False
			Kill(dest)
			MsgBox(Err.Description)
		Else
			MakeACopy = True
		End If
		
	End Function
End Class