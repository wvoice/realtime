VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cls_OfflineManager"
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
Private m_OfflinePermitted As Boolean

Private Sub Class_Initialize()
    m_Classname = "cls_OffLineManager"
    m_OfflinePermited = False
    Call ChkOfflinePermitted
End Sub
  
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'this will check the ini to see if offline mode is permitted or not
Private Sub ChkOfflinePermitted()
    
    If (gClsConfig.ChkOfflinePermitted = 0) Then
        m_OfflinePermitted = False
    Else
        m_OfflinePermitted = True
    End If

End Sub

Public Property Get mOffLinePermitted() As Boolean
     mOffLinePermitted = m_OfflinePermitted
End Property


Public Function ProcessLog() As Integer
End Function

Private Function WriteLog(Data As String) As Boolean
End Function

Private Function ReadLog(Data As String) As Boolean
End Function

Private Function UpdateDatabase(Data As String) As Boolean
End Function

Private Function ResetLog(Data As String) As Boolean
End Function

