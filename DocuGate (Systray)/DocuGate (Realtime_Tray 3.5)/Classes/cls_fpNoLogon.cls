VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_fpNoLogon"
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
Private m_MachineName As String
Private m_LabName As String
Private m_Expire As Date
Private mFreePrint As Boolean

Private mLabPrint As cls_LabPrint
Private mCounter As Integer
Private mstart As Integer
Private mLength As Integer
Private fpactivemsg As String
Private fpexpiredmsg As String

Private Sub Class_Initialize()
    m_Classname = "cls_FpNoLogon"
    mCounter = 0
    mstart = 1
    mLength = 3
    mCounter = 0
    
    Dim m_workstation As New cls_Workstation
     m_MachineName = m_workstation.mComputerName
    Set m_workstation = Nothing
 
End Sub

Public Function Handle_fpNoLogon_Timer() As Integer
    
    Handle_fpNoLogon_Timer = 0
    
    mCounter = mCounter + 1
    If (mCounter = 60) Then
        mCounter = 0
        
        If (Mod_Main.IsLoggedOn = False) Then
            If (gClsDatabase.ConnectDB = True) Then
               
                    If (GetLabParams = False) Then
                       gClsDatabase.CloseDB
                       Exit Function
                    End If
               
                    If (GetLabExpire = False) Then
                       gClsDatabase.CloseDB
                       Exit Function
                    End If
               
                    gClsDatabase.CloseDB
                    
                    ChkFreePrint
                    If (mFreePrint) Then
                       gClsConfig.Update_FpNoLogon True
                       Handle_fpNoLogon_Timer = 3
                    Else
                       gClsConfig.Update_FpNoLogon False
                       Handle_fpNoLogon_Timer = 2
                    End If
           
            End If 'if clsdatabase.connectdb
        End If ' if mob_main,IsLogged on
    End If ' if counter = 60
                
End Function

Private Function GetLabParams() As Boolean

     On Error GoTo handler
     
     GetLabParams = False
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT fp_start,fp_length FROM LP_LAB_PARAMS", gconn, adOpenStatic, adLockOptimistic
     If (Not m_rs.EOF) Then
          start = m_rs!fp_start
          Length = m_rs!fp_length
          m_LabName = Mid(m_MachineName, start, Length)
          m_rs.Close
          GetLabParams = True
     End If
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If

End Function

Private Function GetLabExpire() As Boolean

     
     On Error GoTo handler
     GetLabExpire = False
     
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT LP_LAB_FP_EXPIRE FROM LP_LAB WHERE LP_LAB_NAME = '" & m_LabName & "'", gconn, adOpenStatic, adLockOptimistic
     If Not m_rs.EOF Then
         m_Expire = CDate(m_rs!LP_LAB_FP_EXPIRE)
         GetLabExpire = True
     End If
   
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If
    
End Function

Private Sub ChkFreePrint()
    
   If (DateValue(Now) > DateValue(m_Expire)) Then
       mFreePrint = False
       Exit Sub
   End If
      
   If (DateValue(Now) < DateValue(m_Expire)) Then
       mFreePrint = True
       Exit Sub
   End If
      
   Dim a As Long
   a = DateDiff("n", m_Expire, Now())
   If (a < 0) Then
       mFreePrint = True
   Else
       mFreePrint = False
   End If
 
End Sub


