Option Strict Off
Option Explicit On
Module Mod_Data
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
	
	
	Public gInitialized As Boolean
	Public gAppVersion As String
	Public gApplication As String
	Public gAppName As String
	Public gVersion As String
	Public gMyIniPath As String
	Public gClsConfig As Cls_Config
	Public gClsDatabase As cls_Database
	
	Public gconn As ADODB.Connection
	
	Public Structure ACTIVE_COST
		Dim m_SFBW As Single
		Dim m_SFCOLOR As Single
		Dim m_LFBW As Single
		Dim m_LFCOLOR As Single
		Dim m_MULTIPLIER As Single
		Dim m_HIGHEST As Single
	End Structure
	
	
	Public Structure ACTIVE_MAP
		Dim m_MAP_SOURCE As String
		Dim m_MAP_DESTINATION As String
	End Structure
	
	Structure ACTIVE_READER
		Dim m_TYPE As String
		Dim m_Port As String
		Dim m_OPTION As String
	End Structure
	
	Structure ACTIVE_DATABASE
		Dim m_SERVER As String
		Dim m_SCHEMA As String
		Dim m_UID As String
		Dim m_pwd As String
		Dim m_TYPE As String
	End Structure
	
	Public Structure ACTIVE_JOB
		Dim m_JOB As String
		Dim m_PDL As String
		Dim m_DOCUMENT As String
		Dim m_cost As String
		Dim m_PAGES As String
		Dim m_FREE As Boolean
	End Structure
	
	Public Structure ACTIVE_ACCOUNT
		Dim m_BADGE As String
		Dim m_PASSWORD As String
		Dim m_FIRSTNAME As String
		Dim m_LASTNAME As String
		Dim m_EMAIL As String
		Dim m_ACCESS_LEVEL As String
		Dim m_OU_GUID As String
		Dim m_ACCOUNT_GUID As String
		Dim m_OU_NAME As String
		Dim m_TERMINATE As String
		Dim m_CMETHOD As String
		Dim m_WORKSTATION_OU As String
		Dim m_INITFUNDS As Object
		Dim m_CURFUNDS As Object
		Dim m_VALID As Boolean
		Dim m_OU_ALLOWNEG As Boolean
		Dim m_OU_LOCKED As Boolean
		Dim m_OU_VALID As Boolean
		Dim m_OU_CMETHOD As String
		Dim m_ALREADYLOGGEDON As Boolean
		Dim m_ALREADYLOGGEDONWS As String
	End Structure
	
	Public Structure ACTIVE_SESSION
		Dim m_SESSION_GUID As String
		Dim m_STARTED As Date
		Dim m_ENDED As Date
		Dim m_Activated As Boolean
		Dim m_BADGE As String
		Dim m_DURATION As Integer
		Dim m_JOBID As Integer
	End Structure
	
	Structure DocInfo
		Dim pDocName As String
		Dim pOutputFile As String
		Dim pDatatype As String
	End Structure
	
	Structure Defaults
		Dim pDatatype As String
		Dim pDevMode As Integer
		Dim DesiredAccess As Integer
	End Structure
	
	Structure ACTIVE_OUTPUT
		Dim lhPrinter As Integer
		Dim PrintJobID As Integer
		Dim ThePrinter As String
		Dim MyDocInfo As DocInfo
		Dim PrinterDefaults As Defaults
		Dim lpcWritten As Integer
		Dim result As Integer
		Dim lReturn As Integer
	End Structure
	
	Enum Job_States
		JOB_STATE_SPOOLING = 1
		JOB_STATE_SPOOLED = 2
		JOB_STATE_PRINTED = 3
	End Enum
	
	Public ActiveReader As ACTIVE_READER
	Public ActiveJob(100) As ACTIVE_JOB
	Public ActiveDatabase As ACTIVE_DATABASE
	Public Activemap As ACTIVE_MAP
	Public ActiveAccount As ACTIVE_ACCOUNT
	Public ActiveSession As ACTIVE_SESSION
	Public ActiveOutput As ACTIVE_OUTPUT
	Public ActiveCost As ACTIVE_COST
	
	
	Public MyJobs As New Collection
	Public MyHandlers As New Collection
	Public MyMonitors As New Collection
	Public gJobId As Integer
	Public gCmOpen As Boolean
	Public gNetwork As Boolean
	
	Enum labprint_States
		LP_INSERT = 1
		LP_UPDATE = 2
		LP_FAILURE = 3
	End Enum
End Module