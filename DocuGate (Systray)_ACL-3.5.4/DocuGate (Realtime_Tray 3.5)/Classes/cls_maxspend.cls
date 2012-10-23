VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_maxspend"
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
Private m_rs As ADODB.Recordset

Private Type MaxSpend
    m_GlobalMaxEnabled As Boolean
    m_GlobalMaxSpend As Single
    m_OUMaxEnabled As Boolean
    m_OUMaxSpend As Single
    m_AccountMaxEnabled As Boolean
    m_AccountMaxSpend As Single
End Type

Private m_MaxSpend As MaxSpend
Private m_SessionSpend As Single

Private Sub Class_Initialize()
    
    m_Classname = "cls_maxspend"
    Set m_rs = New ADODB.Recordset
    
    With m_MaxSpend
        .m_AccountMaxEnabled = False
        .m_GlobalMaxEnabled = False
        .m_OUMaxEnabled = False
        .m_AccountMaxSpend = 0
        .m_GlobalMaxSpend = 0
        .m_OUMaxSpend = 0
    End With
    
    m_SessionSpend = 0
    
End Sub

Public Sub InitSession()

   On Error GoTo Err_Handler

    With m_MaxSpend
        .m_AccountMaxEnabled = False
        .m_GlobalMaxEnabled = False
        .m_OUMaxEnabled = False
        .m_AccountMaxSpend = 0
        .m_GlobalMaxSpend = 0
        .m_OUMaxSpend = 0
    End With
    
    m_SessionSpend = 0

Err_Handler:
    
    If (Err.Number <> 0) Then
      m_LastError = Err.Description
    End If
    
End Sub


Public Sub GetGlobalMaxSpend()

   On Error GoTo Err_Handler
   
     m_rs.Open "SELECT GLOBALS_MAXSPEND_ENABLED as Enabled,GLOBALS_MAXSPEND as amount FROM DOCUGATE_GENERAL_GLOBAL", gconn, adOpenStatic, adLockOptimistic
     If Not m_rs.EOF Then
        With m_MaxSpend
            .m_GlobalMaxEnabled = CBool(m_rs!Enabled)
            .m_GlobalMaxSpend = CSng(m_rs!amount)
        End With
     End If
     m_rs.Close
  
Err_Handler:
    
    If (Err.Number <> 0) Then
      m_LastError = Err.Description
    End If
    
End Sub

Public Sub GetAccountMaxSpend(acc_guid As String)

   On Error GoTo Err_Handler
   
     m_rs.Open "SELECT ENABLED,AMOUNT FROM DOCUGATE_GENERAL_ACC_MAXSPEND WHERE ACC_GUID = '" & acc_guid & "'", gconn, adOpenStatic, adLockOptimistic
     If Not m_rs.EOF Then
        
        With m_MaxSpend
            .m_AccountMaxEnabled = CBool(m_rs!Enabled)
            .m_AccountMaxSpend = CSng(m_rs!amount)
        End With
        
     End If
     m_rs.Close
  
Err_Handler:
    
    If (Err.Number <> 0) Then
      m_LastError = Err.Description
    End If
    
End Sub

Public Sub GetOUMaxSpend(ou_guid As String)

   On Error GoTo Err_Handler
   
     m_rs.Open "SELECT ENABLED,AMOUNT FROM DOCUGATE_GENERAL_OU_MAXSPEND WHERE OU_GUID = '" & ou_guid & "'", gconn, adOpenStatic, adLockOptimistic
     If Not m_rs.EOF Then
     
        With m_MaxSpend
            .m_OUMaxEnabled = CBool(m_rs!Enabled)
            .m_OUMaxSpend = CSng(m_rs!amount)
        End With
     
     End If
     m_rs.Close
  
Err_Handler:
    
    If (Err.Number <> 0) Then
      m_LastError = Err.Description
    End If
    
End Sub

Public Sub UpdateCurrentSpend(amount As Single)
   m_SessionSpend = m_SessionSpend + amount
End Sub

Public Function HasMaxSpendReached() As Boolean
   
        HasMaxSpendReached = False
        
        If (m_MaxSpend.m_AccountMaxEnabled) Then
                If (m_SessionSpend > m_MaxSpend.m_AccountMaxSpend) Then HasMaxSpendReached = True
        ElseIf (m_MaxSpend.m_OUMaxEnabled) Then
                If (m_SessionSpend > m_MaxSpend.m_OUMaxSpend) Then HasMaxSpendReached = True
        ElseIf (m_MaxSpend.m_GlobalMaxEnabled) Then
                If (m_SessionSpend > m_MaxSpend.m_GlobalMaxSpend) Then HasMaxSpendReached = True
        End If
 
End Function

Public Function GetMaxSpendPerSessionCur() As String
   
        If (m_MaxSpend.m_AccountMaxEnabled) Then
                GetMaxSpendPerSessionCur = Format(m_MaxSpend.m_AccountMaxSpend, "$0.00")
        ElseIf (m_MaxSpend.m_OUMaxEnabled) Then
                GetMaxSpendPerSessionCur = Format(m_MaxSpend.m_OUMaxSpend, "$0.00")
        ElseIf (m_MaxSpend.m_GlobalMaxEnabled) Then
                GetMaxSpendPerSessionCur = Format(m_MaxSpend.m_GlobalMaxSpend, "$0.00")
        End If
 
End Function

Public Function GetMaxSpendPerSessionUnits() As Single

        If (m_MaxSpend.m_AccountMaxEnabled) Then
                GetMaxSpendPerSessionUnits = m_MaxSpend.m_AccountMaxSpend
        ElseIf (m_MaxSpend.m_OUMaxEnabled) Then
                GetMaxSpendPerSessionUnits = m_MaxSpend.m_OUMaxSpend
        ElseIf (m_MaxSpend.m_GlobalMaxEnabled) Then
                GetMaxSpendPerSessionUnits = m_MaxSpend.m_GlobalMaxSpend
        End If
 
End Function



