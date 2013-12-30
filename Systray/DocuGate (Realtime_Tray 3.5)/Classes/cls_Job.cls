VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "cls_Job"
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

Private m_DOCUMENT As String
Private m_PAGECOUNT As String
Private m_COPIES As String
Private m_JOBID As String
Private m_PAPER As String
Private m_USER As String
Private m_PRINTED As String
Private m_SUBMITTED As Date
Private m_QUEUE  As String
Private m_DRIVER As String
Private m_CMYK   As String
Private m_MACHINE As String
Private m_URL     As String
Private m_WORKSTATIONALIAS   As String
Private m_DEVICEALIAS        As String
Private m_CHARGE  As String

Private m_CLIENT   As String
Private m_MATTER   As String


Private Sub Class_Initialize()
    m_DOCUMENT = ""
    m_cost = ""
    m_PAGES = ""
    m_COPIES = ""
    m_PAPER = ""
    m_SUBMITTED = Now()
    m_PRINTED = ""
    m_USER = ""
    m_JOBCHARGE = "0.00"
    m_QUEUE = ""
    m_DRIVER = ""
    m_CMYK = ""
    m_DRIVER = ""
    m_URL = ""
    m_DEVICEALIAS = ""
    m_WORKSTATIONALIAS = ""
    m_CLIENT = ""
    m_MATTER = ""
End Sub

Public Property Let mDeviceAlias(Data As String)
   m_DEVICEALIAS = Data
End Property

Public Property Get mDeviceAlias() As String
   mDeviceAlias = m_DEVICEALIAS
End Property

Public Property Let mWorkstationAlias(Data As String)
   m_WORKSTATIONALIAS = Data
End Property

Public Property Get mWorkstationAlias() As String
   mWorkstationAlias = m_WORKSTATIONALIAS
End Property

Public Property Let mCharge(Data As String)
   m_CHARGE = Data
End Property

Public Property Get mCharge() As String
   mCharge = m_CHARGE
End Property

Public Property Let mURL(Data As String)
   m_URL = Data
End Property

Public Property Get mURL() As String
   mURL = m_URL
End Property

Public Property Let mQueue(Data As String)
   m_QUEUE = Data
End Property

Public Property Get mQueue() As String
   mQueue = m_QUEUE
End Property

Public Property Let mMachine(Data As String)
   m_MACHINE = Data
End Property

Public Property Get mMachine() As String
   mMachine = m_MACHINE
End Property

Public Property Let mCMYK(Data As String)
   m_CMYK = Data
End Property

Public Property Get mCMYK() As String
   mCMYK = m_CMYK
End Property

Public Property Let mDriver(Data As String)
   m_DRIVER = Data
End Property

Public Property Get mDriver() As String
   mDriver = m_DRIVER
End Property

Public Property Let mDocument(Data As String)
   m_DOCUMENT = Data
End Property

Public Property Get mDocument() As String
   mDocument = m_DOCUMENT
End Property

Public Property Let mPaper(Data As String)
   m_PAPER = Data
End Property

Public Property Get mPaper() As String
   mPaper = m_PAPER
End Property

Public Property Let mUser(Data As String)
   m_USER = Data
End Property

Public Property Get mUser() As String
   mUser = m_USER
End Property

Public Property Let mPrinted(Data As String)
   m_PRINTED = Data
End Property

Public Property Get mPrinted() As String
   mPrinted = m_PRINTED
End Property

Public Property Get msubmitted() As String
   mPrinted = Format(m_SUBMITTED, "hh:mm:ss AMPM")
End Property

Public Property Get mGMTsubmitted() As String
   mGMTsubmitted = Format(m_SUBMITTED, "YYYYMMDD")
End Property
Public Property Get mRawsubmitted() As Date
   mRawsubmitted = m_SUBMITTED
End Property


Public Property Let mCopies(Data As String)
   m_COPIES = Data
End Property

Public Property Get mCopies() As String
   mCopies = m_COPIES
End Property

Public Property Let mJobID(Data As String)
   m_JOBID = Data
End Property

Public Property Get mJobID() As String
   mJobID = m_JOBID
End Property

Public Property Let mPageCount(Data As String)
   m_PAGECOUNT = Data
End Property

Public Property Get mPageCount() As String
   mPageCount = m_PAGECOUNT
End Property

Public Function GetJobCharge() As Single
   Dim Total   As Long
   Total = CInt(m_PAGECOUNT) * CInt(m_COPIES)
   GetJobCharge = CInt(Total) * CSng(m_CHARGE)
End Function

Public Sub SetDeviceURL()
    mURL = m_MACHINE & "\" & m_QUEUE
End Sub

' get device alias from .ini file
' if it exsists
Public Sub GetDeviceAlias()
    mDeviceAlias = gClsConfig.DeviceAlias(mURL)
End Sub

Public Sub GetWorkstationAlias()
    mWorkstationAlias = gClsConfig.WorkstationAlias()
End Sub


' get device Charge from .ini file
' if it exsists
Public Sub GetDeviceCharge()

mCharge = gClsConfig.DeviceCharge(mURL)
If (mCharge = "") Then
    mCharge = gClsConfig.GlobalCharge()
End If

End Sub

''''''''''''
' CM data
''''''''''''
Public Property Let mClient(Data As String)
   m_CLIENT = Data
End Property

Public Property Get mClient() As String
   mClient = m_CLIENT
End Property

Public Property Let mMatter(Data As String)
   m_MATTER = Data
End Property

Public Property Get mMatter() As String
   mMatter = m_MATTER
End Property


