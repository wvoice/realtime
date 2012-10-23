VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_Database"
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

Private Sub Class_Initialize()
    m_Classname = "cls_Database"
    Set gconn = New ADODB.Connection
End Sub

Public Function ConnectDB() As Boolean
             
On Error GoTo Err_Handler
          
    ConnectDB = False
        
    If gconn.State = adStateClosed Then
        gconn.CursorLocation = adUseClient
        
        With ActiveDatabase
           gconn.ConnectionString = "Provider=SQLOLEDB" & ";SERVER=" & gClsConfig.DatabaseServer & ";DATABASE=DOCUGATE;UID=RTT;PWD=Qwerty#1;"
        End With
       
       gconn.ConnectionTimeout = 4
       gconn.Open
    End If
       
    ConnectDB = True
    Exit Function

Err_Handler:

     If Err.Number <> 0 And InStr(UCase$(Err.Description), "LOGIN FAILED") Then
        Err.Clear
        If (SecondaryLogin() = False) Then
            ConnectDB = False
        Else
            ConnectDB = True
        End If
     Else
      ''  MsgBox Err.Description, vbCritical, "cls_Database::ConnectDB()"
     End If
     
     gLastErr = Err.Description

End Function


Private Function SecondaryLogin() As Boolean
             
On Error GoTo Err_Handler
          
    SecondaryLogin = False
        
    If gconn.State = adStateClosed Then
        
        gconn.CursorLocation = adUseClient
        With ActiveDatabase
           gconn.ConnectionString = "Provider=SQLOLEDB" & ";SERVER=" & gClsConfig.DatabaseServer & ";DATABASE=DOCUGATE;UID=sa;PWD=Qwerty#1;"
        End With
       
       gconn.ConnectionTimeout = 4
       gconn.Open
    End If
       
    SecondaryLogin = True
    Exit Function

Err_Handler:
    MsgBox Err.Description, vbCritical, "cls_Database::ConnectDB()"
    gLastErr = Err.Description

End Function




Public Function CloseDB() As String
    
    If gconn.State = adStateOpen Then
        gconn.Close
    End If

End Function

Private Sub Class_Terminate()
    Call CloseDB
End Sub


Public Function AddJob(ByRef MyForm As Form) As String
    
   On Error GoTo Err_Handler
   m_rs.Open "SELECT * FROM DOCUGATE_ACCOUNTS WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
   m_rs.AddNew
   m_rs!Badge = MyForm.txt_Badge
   m_rs!FIRSTNAME = MyForm.txt_Firstname
   m_rs!LASTNAME = MyForm.txt_LastName
   m_rs!cmethod = UCase(MyForm.Cbm_Charge)
   m_rs!Funds = MyForm.txt_Funds
   m_rs.Update
   m_rs.Close
   Set m_rs = Nothing
    
Err_Handler:
   If (Err.Number <> 0) Then
      m_LastError = Err.Description
   End If
   
End Function


Public Function IsLoggedOn(ByRef MyForm As Form) As String
    
   On Error GoTo Err_Handler
   m_rs.Open "SELECT * FROM DOCUGATE_ACCOUNTS WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
   m_rs.AddNew
   m_rs!Badge = MyForm.txt_Badge
   m_rs!FIRSTNAME = MyForm.txt_Firstname
   m_rs!LASTNAME = MyForm.txt_LastName
   m_rs!cmethod = UCase(MyForm.Cbm_Charge)
   m_rs!Funds = MyForm.txt_Funds
   m_rs.Update
   m_rs.Close
   Set m_rs = Nothing
    
Err_Handler:
   If (Err.Number <> 0) Then
      m_LastError = Err.Description
   End If
   
End Function
