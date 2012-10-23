VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_Workstation"
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
Private m_Computername As String
Private m_LoggedOnUser As String
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
Private Declare Function WNetGetUser Lib "mpr.dll" Alias "WNetGetUserA" (ByVal lpName As String, ByVal lpUserName As String, lpnLength As Long) As Long

Private Sub Class_Initialize()
    m_Classname = "cls_Workstation"
    InitComputerName
    InitLoggedOnUser
End Sub

Private Sub InitComputerName()
    Dim Buffer As String * 512, Length As Long
    Length = Len(Buffer)
    If GetComputerName(Buffer, Length) Then
        m_Computername = Left$(Buffer, Length)
    End If

   m_Computername = UCase(m_Computername)

End Sub

Private Sub InitLoggedOnUser()
    
    Dim Buffer As String * 512, Length As Long
    Length = 0
    WNetGetUser vbNullString, Buffer, Length
    If (Length > 0) Then
        WNetGetUser vbNullString, Buffer, Length
        m_LoggedOnUser = Left$(Buffer, Length - 1)
    End If
    
    m_LoggedOnUser = UCase(m_LoggedOnUser)

End Sub

Public Property Get mComputerName() As String
   mComputerName = m_Computername
End Property

Public Property Get mLoggedOnUser() As Boolean
   mLoggedOnUser = m_LoggedOnUser
End Property

