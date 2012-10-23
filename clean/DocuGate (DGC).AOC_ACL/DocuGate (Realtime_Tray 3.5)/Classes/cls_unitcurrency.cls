VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_unitcurrency"
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
Private m_UnitEnabled As Boolean
Private m_UnitAmount As Single

Private Sub Class_Initialize()
    
    m_Classname = "cls_unitcurrency"
    m_UnitEnabled = False
    m_UnitAmount = 0#
  
End Sub

Public Sub InitSession()

   On Error GoTo Err_Handler

    m_UnitEnabled = False
    m_UnitAmount = 0#
    
    Dim m_rs As ADODB.Recordset
    Set m_rs = New ADODB.Recordset
    m_rs.Open "SELECT GLOBALS_UNITVALUE_ENABLED as Enabled, GLOBALS_UNITVALUE as amount FROM DOCUGATE_GENERAL_GLOBAL", gconn, adOpenStatic, adLockOptimistic
     
     If Not m_rs.EOF Then
            m_UnitEnabled = CBool(m_rs!Enabled)
            m_UnitAmount = CSng(m_rs!amount)
     End If
     m_rs.Close
     
Err_Handler:
    
    Set m_rs = Nothing
    
    If (Err.Number <> 0) Then
      m_LastError = Err.Description
    End If
    
    
End Sub

Public Property Get mIsEnabled() As Boolean
   mIsEnabled = m_UnitEnabled
End Property

Public Function ConvertCurToUnits(amount As Single) As String
    Dim units As Long
    units = 0
    units = amount / m_UnitAmount
    ConvertCurToUnits = CStr(units)
End Function


