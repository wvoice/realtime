VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_LabPrint"
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
Private m_LPInstalled As Boolean

Private Sub Class_Initialize()
    m_Classname = "cls_LabPrint"
    
    Dim m_workstation As New cls_Workstation
    m_MachineName = m_workstation.mComputerName
    Set m_workstation = Nothing
    
    m_FreePrint = False
    m_LPInstalled = False
    
End Sub

Public Property Get mLPInstalled() As Boolean
    mLPInstalled = m_LPInstalled
End Property

Public Property Get mFreePrint() As Boolean
     
   Dim enabledmsg As String
   enabledmsg = "Free Print is enabled until:" & vbCrLf
   enabledmsg = enabledmsg & Format(m_Expire, "h:mm:ss AM/PM - dddd, mmmm dd, yyyy")
    
   If (DateValue(Now) > DateValue(m_Expire)) Then
       mFreePrint = False
       Exit Property
   End If
      
   If (DateValue(Now) < DateValue(m_Expire)) Then
       Frm_Main.ShowBalloonInformation (enabledmsg)
       mFreePrint = True
       Exit Property
   End If
      
   Dim a As Long
   a = DateDiff("n", m_Expire, Now())
   If (a < 0) Then
       Frm_Main.ShowBalloonInformation (enabledmsg)
       mFreePrint = True
   Else
       mFreePrint = False
   End If
 
End Property

Public Function LP_AddMachine() As Boolean
     
     On Error GoTo handler
     
     LP_AddMachine = True
         
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT * FROM LP_LAB_MACHINES WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
     m_rs.AddNew
     m_rs!lp_Lab_name = m_LabName
     m_rs!lp_machine_name = m_MachineName
     m_rs.Update
     m_rs.Close
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If
    
End Function

Public Function LP_AddLab() As Boolean
     
     On Error GoTo handler
     
     LP_AddLab = True
         
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT * FROM LP_LAB WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
     m_rs.AddNew
     m_rs!lp_Lab_name = m_LabName
     m_rs.Update
     m_rs.Close
     
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If
    
End Function

Public Function LP_MachineLogon() As Boolean

     On Error GoTo handler
     
     LP_MachineLogon = False
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT * FROM LP_LAB_MACHINES WHERE LP_MACHINE_NAME = '" & m_MachineName & "'", gconn, adOpenStatic, adLockOptimistic
     m_rs!lp_Machine_user = gClsaccountManager.mActiveLastName & "," & gClsaccountManager.mActiveLastName
     m_rs!lp_machine_status = "Active"
     m_rs.Update
     m_rs.Close
     LP_MachineLogon = True
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If

End Function


Public Function LP_MachineLogoff() As Boolean

     On Error GoTo handler
     
     LP_MachineLogoff = False
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT * FROM LP_LAB_MACHINES WHERE LP_MACHINE_NAME = '" & m_MachineName & "'", gconn, adOpenStatic, adLockOptimistic
     m_rs!lp_Machine_user = ""
     m_rs!lp_machine_status = "Idle"
     m_rs.Update
     m_rs.Close
     LP_MachineLogoff = True
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If

End Function


Public Function LP_LabParams() As Boolean

     On Error GoTo handler
     
     
     m_Enabled = False
     LP_LabParams = False
     
     Dim start As Integer
     Dim Length As Integer
     
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT fp_start,fp_length FROM LP_LAB_PARAMS", gconn, adOpenStatic, adLockOptimistic
     If (Not m_rs.EOF) Then
          LP_LabParams = True
          m_Enabled = True
          start = m_rs!fp_start
          Length = m_rs!fp_length
          m_LabName = Mid(m_MachineName, start, Length)
          m_rs.Close
     
     End If
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If

End Function


Public Sub LP_GetExpire()
     
     On Error GoTo handler
     
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT LP_LAB_FP_EXPIRE FROM LP_LAB WHERE LP_LAB_NAME = '" & m_LabName & "'", gconn, adOpenStatic, adLockOptimistic
     If Not m_rs.EOF Then
         m_Expire = CDate(m_rs!LP_LAB_FP_EXPIRE)
     Else
         m_Expire = Now() - 1 ' default to yesterday always expired
     End If
   
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If
    
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' check to see if functionality has been installed'''
''''''''''''''''''''''''''''''''''''''''''''''''''''''

Public Sub LP_Installed()

     On Error GoTo handler
     
     m_LPInstalled = False
     
     Dim m_rs As ADODB.Recordset
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT COUNT(*) AS TableCount From sysobjects WHERE id = OBJECT_ID(N'lp_lab') AND (type = 'U')", gconn, adOpenStatic, adLockOptimistic
     
     If (CInt(m_rs!TableCount) > 0) Then
          m_LPInstalled = True
     Else
          m_LPInstalled = False
     End If
     
     m_rs.Close
     
handler:
    
    Set m_rs = Nothing
    If (Err.Number <> 0) Then
         Err.Clear
    End If

End Sub

