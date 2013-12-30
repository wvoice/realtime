VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_pcpl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

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
      
Private Sub Class_Initialize()
    m_Classname = "cls_pcpl"
    m_hiddenlog = App.Path & "\logs\csv\papercut-print-log-all-time.csv"
End Sub

Public Function RefreshJobCollection() As Integer

    On Error GoTo handler
    
    Dim m_strjobs() As String
    Dim elements() As String
    Dim linenum As Integer
    Dim fsize As Long
    linenum = 0
    
    If (Dir$(m_hiddenlog) <> "") Then
                
               ReDim m_strjobs(100)
               nFileNum = FreeFile
               Open m_hiddenlog For Input As nFileNum
                
               Do While Not EOF(nFileNum)
                   Line Input #1, m_strjobs(linenum)
                   
                   If (linenum = 100) Then
                       Exit Do
                   End If
                   
                   linenum = linenum + 1
                
               Loop
                
               Close nFileNum
               ResetLog
                                                 
                For a = 0 To linenum
                 If (m_strjobs(a) <> "") Then
                    gClsSessionManager.AddPCPLJob (m_strjobs(a))
                 End If
                Next
               ReDim m_strjobs(0)
   End If
     
handler:
    If (Err <> 0) Then
        MsgBox (Err.Description)
        Err.Clear
    End If
    
    RefreshJobCollection = linenum
 
End Function

Public Sub ResetLog()
    
    On Error GoTo handler
    
    If (Dir$(m_hiddenlog) <> "") Then
      nFileNum = FreeFile
      Open m_hiddenlog For Output As nFileNum
      Close nFileNum
    End If
    
handler:
    If (Err <> 0) Then
        MsgBox (Err.Description)
    End If
    
 Exit Sub



End Sub

Private Function MakeACopy(src As String, dest As String) As Boolean

 On Error GoTo handler
 
    Dim sNextLine As String
    Open src For Input As #1
    Open dest For Output As #2
    
    Do While Not EOF(1)
      Line Input #1, sNextLine
      Print #2, sNextLine
    Loop
    
    Close #1
    Close #2
       
handler:
   If Err <> 0 Then
        MakeACopy = False
        Kill dest
        MsgBox (Err.Description)
   Else
        MakeACopy = True
   End If
       
End Function


