VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_cmChargeBack"
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
Private m_CurJobs   As Collection
Private m_rs As ADODB.Recordset
Private m_ActiveAccount_GUID As String
Private m_ActiveOu_GUID As String


Private Sub Class_Initialize()
    m_Classname = "cls_AcmChargeBack"
    m_ActiveAccount_GUID = gClsaccountManager.ActiveAccount_GUID
    m_ActiveOu_GUID = gClsaccountManager.ActiveOu_GUID
End Sub

Public Sub CM_PopulateClientsByCode(obj As ctList, Filter As String)

       obj.ClearList
       On Error GoTo handler
       
       m_rs.Open "SELECT CC_GUID,CC_CODE,CC_NAME,CC_DESC FROM DOCUGATE_GENERAL_CC WHERE CC_CODE LIKE '" & Filter & "%'", gconn, adOpenForwardOnly, adLockReadOnly
       While Not m_rs.EOF
             Item = obj.AddItem(m_rs!CC_CODE)
             obj.CellText(Item, 2) = m_rs!CC_NAME
             obj.CellText(Item, 3) = m_rs!CC_DESC
             obj.ListCargo(Item) = m_rs!CC_GUID
             m_rs.MoveNext
       Wend
       m_rs.Close
       
handler:
       
       If (Err.Number <> 0) Then
           MsgBox Err.Description
       End If
 
End Sub
   
Public Sub CM_PopulateClientsByName(obj As ctList, Filter As String)

       obj.ClearList
       On Error GoTo handler
       
       m_rs.Open "SELECT CC_GUID,CC_CODE,CC_NAME,CC_DESC FROM DOCUGATE_GENERAL_CC WHERE CC_NAME LIKE '" & Filter & "%'", gconn, adOpenForwardOnly, adLockReadOnly
       While Not m_rs.EOF
             Item = obj.AddItem(m_rs!CC_NAME)
             obj.CellText(Item, 2) = m_rs!CC_DESC
             obj.CellText(Item, 3) = m_rs!CC_CODE
             obj.ListCargo(Item) = m_rs!CC_GUID
             m_rs.MoveNext
       Wend
       m_rs.Close
       
handler:
       
       If (Err.Number <> 0) Then
           MsgBox Err.Description
       End If
 
End Sub
   

Public Function CM_PopulateMatters(obj As ctList, Filter As String) As Long

       obj.ClearList
       On Error GoTo handler
       
       m_rs.Open "SELECT CM_GUID,CM_MATTER,CM_DESCRIPTION FROM DOCUGATE_GENERAL_CM WHERE CC_GUID = '" & Filter & "'", gconn, adOpenForwardOnly, adLockReadOnly
       While Not m_rs.EOF
             Item = obj.AddItem(m_rs!CM_MATTER)
             obj.CellText(Item, 2) = m_rs!CM_DESCRIPTION
             obj.ListCargo(Item) = m_rs!CM_GUID
             m_rs.MoveNext
       Wend
       m_rs.Close

handler:
       
       If (Err.Number <> 0) Then
           MsgBox Err.Description
       End If

End Function
 

Public Function CM_UpdateDatabaseJob(GUID As String, CC As String, CM As String) As Boolean

       On Error GoTo handler
       CM_UpdateDatabaseJob = True
       m_rs.Open "SELECT CC_CODE,CM_MATTER FROM DOCUGATE_GENERAL_ACTIVITY WHERE JOB_GUID = '" & GUID & "'", gconn, adOpenStatic, adLockOptimistic
       m_rs!CC_CODE = CC
       m_rs!CM_MATTER = CM
       m_rs.Update
       m_rs.Close

handler:
       
       If (Err.Number <> 0) Then
           MsgBox "CM_UpdateDatabaseJob(" & Err.Description & ")", vbCritical, "Docugate Workstation Event"
           CM_UpdateDatabaseJob = False
       End If

End Function

Public Function CM_UpdateSessionJob(GUID As String, CC As String, CM As String) As Long
        
       CM_UpdateSessionJob = gClsSessionManager.UpdateCMjob(GUID, CC, CM)

End Function


Public Function CM_PopulateView(obj As ctList) As Long
   
   Dim Item As Long
   
   '1.) Get Unassigned Jobs from prior sessions that were logged in the database
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   If (gClsDatabase.ConnectDB = True) Then
       
       Set m_rs = New ADODB.Recordset
       m_rs.Open "SELECT JOB_GUID,DOCNAME,JOBCOST FROM DOCUGATE_GENERAL_ACTIVITY WHERE CC_CODE='' AND JOBTYPE=1 AND ACC_GUID='" & m_ActiveAccount_GUID & "'", gconn, adOpenStatic, adLockOptimistic
   
        While Not m_rs.EOF
             Item = obj.AddItem(";" & m_rs!DocName)
             obj.CellText(Item, 3) = m_rs!Jobcost
             obj.ListCargo(Item) = m_rs!JOB_GUID
             m_rs.MoveNext
        Wend
       
       m_rs.Close
       
   Else
   
   End If
            
   '2.) Get Unassigned Jobs from current Session that have not yet been logged to database
   ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   Call gClsSessionManager.GetCMjobs(obj)
 
End Function

Private Sub Class_Terminate()
    Set m_rs = Nothing
    gClsDatabase.CloseDB
End Sub



