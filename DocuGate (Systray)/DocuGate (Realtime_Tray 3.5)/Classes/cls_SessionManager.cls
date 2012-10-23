VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_SessionManager"
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

Private Type ACTIVE_SESSION
    m_SESSION_GUID As String
    m_STARTED As Date
    m_ENDED As Date
    m_ACTIVE As Boolean
    m_BADGE As String
    m_DURATION As Long
    m_JOBID    As Long
    
End Type

Private m_SessionJobs As New Collection
Private m_ActiveSession  As ACTIVE_SESSION


Private Sub Class_Initialize()
    
    For Num = 1 To m_SessionJobs.Count
       m_SessionJobs.Remove 1
    Next
    
    m_Classname = "cls_SessionManager"
    
    With m_ActiveSession
      .m_ACTIVE = False
      .m_SESSION_GUID = ""
      .m_JOBID = 1
    End With
   
End Sub

Public Sub ClearCollection()
    
    For Num = 1 To m_SessionJobs.Count
       m_SessionJobs.Remove 1
    Next
  
End Sub


Public Function OpenSession(Data As String) As Boolean
    
    With m_ActiveSession
      .m_ACTIVE = True
      .m_STARTED = Now
      .m_SESSION_GUID = GetGuid
      .m_BADGE = Data
      .m_DURATION = 0
      .m_JOBID = 1
    End With
    

End Function

Public Function CloseSession() As Boolean
   
   On Error GoTo handler
   
   CloseSession = True
    
   Dim mInst As cls_Job
   Dim m_rs As ADODB.Recordset
     
   For Each mInst In m_SessionJobs
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACTIVITY WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
     m_rs.AddNew
     m_rs!acc_guid = gClsaccountManager.mActiveAccountGuid
     m_rs!ou_guid = gClsaccountManager.mActiveOUGuid
     m_rs!OU_NAME = gClsaccountManager.mActiveOUName
     m_rs!ACC_BADGE = gClsaccountManager.mActiveBadge
     m_rs!JOB_GUID = GetGuid
     m_rs!DT_REQUESTED = mInst.mRawsubmitted
     m_rs!Copies = mInst.mCopies
     m_rs!DocName = mInst.mDocument
     m_rs!PageCount = mInst.mPageCount
     m_rs!Jobcost = mInst.GetJobCharge
     
     If (mInst.mWorkstationAlias <> "") Then
          m_rs!COMPUTERNAME = mInst.mWorkstationAlias
     End If
     
     If (mInst.mDeviceAlias <> "") Then
         m_rs!PRINTERNAME = mInst.mDeviceAlias
     End If
          
     m_rs!Jobtype = 1
     m_rs!CC_CODE = mInst.mClient
     m_rs!CM_MATTER = mInst.mMatter
     m_rs!CTLUNIT_SERIAL_NO = ""
     m_rs!Comments = m_ActiveSession.m_SESSION_GUID
     m_rs!color = 0
     m_rs!Duplex = 0
     m_rs.Update
     m_rs.Close
     Set m_rs = Nothing
     DoEvents
   Next mInst
     
   For Each mInst In m_SessionJobs
     Set m_rs = New ADODB.Recordset
     m_rs.Open "SELECT * FROM DOCUGATE_GENERAL_ACTIVITY_JOURNEL WHERE 1=0", gconn, adOpenStatic, adLockOptimistic
     m_rs.AddNew
     m_rs!j_guid = gClsaccountManager.mActiveAccountGuid
     m_rs!j_type = "WS PRINT"
     m_rs!j_amount = FormatCurrency(mInst.GetJobCharge, 2, True, False, True)
     m_rs!j_desc = mInst.mDocument
     m_rs.Update
     m_rs.Close
     Set m_rs = Nothing
   Next mInst
     
   
handler:
      
   For Num = 1 To m_SessionJobs.Count
       m_SessionJobs.Remove 1
   Next
     
   With m_ActiveSession
      .m_ACTIVE = False
      .m_ENDED = Now
      .m_DURATION = 0
    End With
   
   If (Err.Number <> 0) Then
        Err.Clear
   End If
   
End Function


Public Function AddJob(Data As String) As Boolean
   
   On Error GoTo handler
    
   Dim d() As String
   d = Split(Data, ",")
   If (UBound(d) = 0) Then
    d = Split(Data, ";")
     If (UBound(d) = 0) Then Exit Function
   End If
   
   
   Dim Inst As New cls_Job
   
   Inst.mUser = d(0)
   Inst.mJobID = d(1)
   Inst.mDocument = d(2)
   Inst.mPrinted = d(3)
   Inst.mPageCount = d(4)
   Inst.mCopies = d(5)
   Inst.mMachine = d(6)
   Inst.mQueue = d(7)
   
   Inst.SetDeviceURL
      
    On Error GoTo notfound
     Dim cObj As Object
     Set cObj = MyMonitors.Item(d(7))

notfound:
    
   If (Err.Number <> 0) Then
        Err.Clear
        Exit Function
   End If
        
    On Error GoTo handler
     
   Inst.mDeviceAlias = cObj.mAlias
   
   If (gclsLabPrint.mFreePrint) Then
      Inst.mCharge = "0.00"
   Else
      Inst.mCharge = cObj.mCost
      If (Inst.mCharge = "") Then
          Inst.mCharge = gClsConfig.GlobalCharge()
      End If
   End If
      
   Set cObj = Nothing
   
   
   Inst.GetWorkstationAlias
   Inst.mClient = ""
   Inst.mMatter = ""
      
   Dim c1 As Single
   c1 = Inst.GetJobCharge
          
   Dim Index As String
   Index = CStr(d(1))
   
   m_SessionJobs.Add Inst, Index
   gclsMaxSpend.UpdateCurrentSpend (c1)
   gClsaccountManager.UpdateCurrentFunds (c1)
   
handler:
   
       If (Err.Number <> 0) Then
            MsgBox Err.Description, vbCritical, "cls_SessionManager::AddJob()"
       End If
   
   
End Function

Public Function AddPCPLJob(Data As String) As Boolean
   
   On Error GoTo handler
   Dim lprinted As Integer
   
   Dim d() As String
   d = Split(Data, ",")
   
   Dim Inst As New cls_Job
   Inst.mUser = d(1)
   Inst.mDocument = d(5)
   lprinted = CInt(d(3)) * CInt(d(2))
   Inst.mPrinted = lprinted
   Inst.mPageCount = d(2)
   Inst.mCopies = d(3)
   Inst.mMachine = d(6)
   Inst.mQueue = d(4)
   Inst.SetDeviceURL
   Inst.mJobID = ActiveSession.m_JOBID
   
   On Error GoTo notfound
     Dim cObj As Object
     Set cObj = MyMonitors.Item(d(4))

notfound:
    
   If (Err.Number <> 0) Then
        Err.Clear
        Exit Function
   End If
        
   Inst.mDeviceAlias = cObj.mAlias
   Inst.mCharge = cObj.mCost
   If (Inst.mCharge = "") Then
       Inst.mCharge = gClsConfig.GlobalCharge()
   End If
   
   Inst.GetWorkstationAlias
   Inst.mClient = ""
   Inst.mMatter = ""
      
   Set cObj = Nothing
   
      
   Dim c1 As Single
   c1 = Inst.GetJobCharge
   
   m_SessionJobs.Add Inst
   
   gClsaccountManager.UpdateCurrentFunds (c1)
   gclsMaxSpend.UpdateCurrentSpend (c1)
   
   ActiveSession.m_JOBID = ActiveSession.m_JOBID + 1
   
handler:
   
    If (Err.Number <> 0) Then
           MsgBox Err.Description, vbCritical, "cls_SessionManager::AddJob()"
    End If
   
   
End Function




Public Function GetSessionState() As Boolean
   GetSessionState = m_ActiveSession.m_ACTIVE
End Function

Public Function RefreshJobList(obj As ctList) As Boolean
     
  On Error GoTo handler
  
   Dim Item As Long
   Dim mInst As cls_Job
   
   obj.ClearList
   For Each mInst In m_SessionJobs
     Item = obj.AddItem(mInst.mDocument)
     
      If (gclsUnitCurrency.mIsEnabled) Then
            obj.CellText(Item, 2) = gclsUnitCurrency.ConvertCurToUnits(mInst.GetJobCharge)
      Else
            obj.CellText(Item, 2) = Format(mInst.GetJobCharge, "currency")
      End If
      
  ''   obj.CellText(Item, 2) = Format(mInst.GetJobCharge, "0.00")
     
     obj.ListCargo(Item) = mInst.mJobID
   Next mInst

handler:
       If (Err.Number <> 0) Then
            MsgBox Err.Description, vbCritical, "cls_SessionManager::RefreshJobList()"
       End If

End Function

Public Function GetCMjobs(obj As ctList)
   
   On Error GoTo handler
    
   Dim Item As Long
   Dim mInst As cls_Job
   
   For Each mInst In m_SessionJobs
      If (mInst.mClient = "") Then
          Item = obj.AddItem(";" & mInst.mDocument)
          obj.CellText(Item, 3) = mInst.GetJobCharge
          obj.ListCargo(Item) = mInst.mJobID
      End If
      
   Next mInst
   
handler:
   
       If (Err.Number <> 0) Then
            MsgBox Err.Description, vbCritical, "cls_SessionManager::GetCMJobs()"
       End If

End Function


Public Function GetCMUnassignedCount() As Long

   On Error GoTo handler
   
   GetCMUnassignedCount = 0
   
   Dim ItemCnt As Long
   Dim mInst As cls_Job
   
   For Each mInst In m_SessionJobs
      
      If (mInst.mClient = "") Then
          ItemCnt = ItemCnt + 1
      End If
      
   Next mInst
   
   GetCMUnassignedCount = ItemCnt
      
handler:
   
       If (Err.Number <> 0) Then
            MsgBox Err.Description, vbCritical, "cls_SessionManager::GetCMUnassignedCount()"
       End If
      
End Function

Public Function UpdateCMjob(GUID As String, CC As String, CM As String) As Boolean

   UpdateCMjob = True
    
   On Error GoTo handler
    
   Dim mInst As cls_Job
   
   For Each mInst In m_SessionJobs
      
      If (mInst.mJobID = GUID) Then
          mInst.mClient = CC
          mInst.mMatter = CM
      End If
      
   Next mInst
   
handler:
       
       If (Err.Number <> 0) Then
           MsgBox Err.Description, vbCritical, "cls_SessionManager::UpdateCMJob()"
           UpdateCMjob = False
       End If

End Function







