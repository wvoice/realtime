Option Strict Off
Option Explicit On
Friend Class cls_Job
	
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
	Private m_QUEUE As String
	Private m_DRIVER As String
	Private m_CMYK As String
	Private m_MACHINE As String
	Private m_URL As String
	Private m_WORKSTATIONALIAS As String
	Private m_DEVICEALIAS As String
	Private m_CHARGE As String
	
	Private m_CLIENT As String
	Private m_MATTER As String
	
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		Dim m_JOBCHARGE As Object
		Dim m_PAGES As Object
		Dim m_cost As Object
		m_DOCUMENT = ""
		'UPGRADE_WARNING: Couldn't resolve default property of object m_cost. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_cost = ""
		'UPGRADE_WARNING: Couldn't resolve default property of object m_PAGES. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		m_PAGES = ""
		m_COPIES = ""
		m_PAPER = ""
		m_SUBMITTED = Now
		m_PRINTED = ""
		m_USER = ""
		'UPGRADE_WARNING: Couldn't resolve default property of object m_JOBCHARGE. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
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
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	
	Public Property mDeviceAlias() As String
		Get
			mDeviceAlias = m_DEVICEALIAS
		End Get
		Set(ByVal Value As String)
			m_DEVICEALIAS = Value
		End Set
	End Property
	
	
	Public Property mWorkstationAlias() As String
		Get
			mWorkstationAlias = m_WORKSTATIONALIAS
		End Get
		Set(ByVal Value As String)
			m_WORKSTATIONALIAS = Value
		End Set
	End Property
	
	
	Public Property mCharge() As String
		Get
			mCharge = m_CHARGE
		End Get
		Set(ByVal Value As String)
			m_CHARGE = Value
		End Set
	End Property
	
	
	Public Property mURL() As String
		Get
			mURL = m_URL
		End Get
		Set(ByVal Value As String)
			m_URL = Value
		End Set
	End Property
	
	
	Public Property mQueue() As String
		Get
			mQueue = m_QUEUE
		End Get
		Set(ByVal Value As String)
			m_QUEUE = Value
		End Set
	End Property
	
	
	Public Property mMachine() As String
		Get
			mMachine = m_MACHINE
		End Get
		Set(ByVal Value As String)
			m_MACHINE = Value
		End Set
	End Property
	
	
	Public Property mCMYK() As String
		Get
			mCMYK = m_CMYK
		End Get
		Set(ByVal Value As String)
			m_CMYK = Value
		End Set
	End Property
	
	
	Public Property mDriver() As String
		Get
			mDriver = m_DRIVER
		End Get
		Set(ByVal Value As String)
			m_DRIVER = Value
		End Set
	End Property
	
	
	Public Property mDocument() As String
		Get
			mDocument = m_DOCUMENT
		End Get
		Set(ByVal Value As String)
			m_DOCUMENT = Value
		End Set
	End Property
	
	
	Public Property mPaper() As String
		Get
			mPaper = m_PAPER
		End Get
		Set(ByVal Value As String)
			m_PAPER = Value
		End Set
	End Property
	
	
	Public Property mUser() As String
		Get
			mUser = m_USER
		End Get
		Set(ByVal Value As String)
			m_USER = Value
		End Set
	End Property
	
	
	Public Property mPrinted() As String
		Get
			mPrinted = m_PRINTED
		End Get
		Set(ByVal Value As String)
			m_PRINTED = Value
		End Set
	End Property
	
	Public ReadOnly Property msubmitted() As String
		Get
			mPrinted = VB6.Format(m_SUBMITTED, "hh:mm:ss AMPM")
		End Get
	End Property
	
	Public ReadOnly Property mGMTsubmitted() As String
		Get
			mGMTsubmitted = VB6.Format(m_SUBMITTED, "YYYYMMDD")
		End Get
	End Property
	Public ReadOnly Property mRawsubmitted() As Date
		Get
			mRawsubmitted = m_SUBMITTED
		End Get
	End Property
	
	
	
	Public Property mCopies() As String
		Get
			mCopies = m_COPIES
		End Get
		Set(ByVal Value As String)
			m_COPIES = Value
		End Set
	End Property
	
	
	Public Property mJobID() As String
		Get
			mJobID = m_JOBID
		End Get
		Set(ByVal Value As String)
			m_JOBID = Value
		End Set
	End Property
	
	
	Public Property mPageCount() As String
		Get
			mPageCount = m_PAGECOUNT
		End Get
		Set(ByVal Value As String)
			m_PAGECOUNT = Value
		End Set
	End Property
	
	''''''''''''
	' CM data
	''''''''''''
	
	Public Property mClient() As String
		Get
			mClient = m_CLIENT
		End Get
		Set(ByVal Value As String)
			m_CLIENT = Value
		End Set
	End Property
	
	
	Public Property mMatter() As String
		Get
			mMatter = m_MATTER
		End Get
		Set(ByVal Value As String)
			m_MATTER = Value
		End Set
	End Property
	
	Public Function GetJobCharge() As Single
		Dim Total As Integer
		Total = CShort(m_PAGECOUNT) * CShort(m_COPIES)
		GetJobCharge = CShort(Total) * CSng(m_CHARGE)
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
End Class