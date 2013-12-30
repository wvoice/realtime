Attribute VB_Name = "Mod_Data"
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

Option Explicit

Public gInitialized As Boolean
Public gAppVersion As String
Public gApplication As String
Public gAppName As String
Public gVersion As String
Public gMyIniPath As String
Public gClsConfig As Cls_Config
Public gClsDatabase As cls_Database

Public gconn As ADODB.Connection

Public Type ACTIVE_COST
    m_SFBW As Single
    m_SFCOLOR As Single
    m_LFBW As Single
    m_LFCOLOR As Single
    m_MULTIPLIER As Single
    m_HIGHEST As Single
End Type


Public Type ACTIVE_MAP
    m_MAP_SOURCE As String
    m_MAP_DESTINATION As String
End Type

Type ACTIVE_READER
    m_TYPE As String
    m_Port As String
    m_OPTION As String
End Type

Type ACTIVE_DATABASE
    m_SERVER As String
    m_SCHEMA As String
    m_UID As String
    m_pwd As String
    m_TYPE As String
End Type

Public Type ACTIVE_JOB
    m_JOB As String
    m_PDL As String
    m_DOCUMENT As String
    m_cost As String
    m_PAGES As String
    m_FREE  As Boolean
End Type

Public Type ACTIVE_ACCOUNT
    m_BADGE As String
    m_PASSWORD As String
    m_FIRSTNAME As String
    m_LASTNAME As String
    m_EMAIL As String
    m_ACCESS_LEVEL As String
    m_OU_GUID As String
    m_ACCOUNT_GUID As String
    m_OU_NAME As String
    m_TERMINATE As String
    m_CMETHOD As String
    m_WORKSTATION_OU As String
    
    m_INITFUNDS As Variant
    m_CURFUNDS As Variant
    
    m_VALID As Boolean
    m_OU_ALLOWNEG As Boolean
    m_OU_LOCKED As Boolean
    m_OU_VALID As Boolean
    m_OU_CMETHOD As String
    
    m_ALREADYLOGGEDON  As Boolean
    m_ALREADYLOGGEDONWS As String
    
End Type

Public Type ACTIVE_SESSION
    m_SESSION_GUID As String
    m_STARTED As Date
    m_ENDED As Date
    m_Activated As Boolean
    m_BADGE As String
    m_DURATION As Long
    m_JOBID    As Long
End Type

Type DocInfo
  pDocName    As String
  pOutputFile As String
  pDatatype   As String
End Type

Type Defaults
  pDatatype     As String
  pDevMode      As Long
  DesiredAccess As Long
End Type

Type ACTIVE_OUTPUT
    lhPrinter       As Long
    PrintJobID      As Long
    ThePrinter      As String
    MyDocInfo       As DocInfo
    PrinterDefaults As Defaults
    lpcWritten      As Long
    result          As Long
    lReturn         As Long
End Type

Enum Job_States
  JOB_STATE_SPOOLING = 1
  JOB_STATE_SPOOLED = 2
  JOB_STATE_PRINTED = 3
End Enum

Public ActiveReader     As ACTIVE_READER
Public ActiveJob(100)   As ACTIVE_JOB
Public ActiveDatabase   As ACTIVE_DATABASE
Public Activemap        As ACTIVE_MAP
Public ActiveAccount    As ACTIVE_ACCOUNT
Public ActiveSession    As ACTIVE_SESSION
Public ActiveOutput     As ACTIVE_OUTPUT
Public ActiveCost       As ACTIVE_COST


Public MyJobs As New Collection
Public MyHandlers As New Collection
Public MyMonitors As New Collection
Public gJobId As Long
Public gCmOpen As Boolean
Public gNetwork As Boolean

Enum labprint_States
  LP_INSERT = 1
  LP_UPDATE = 2
  LP_FAILURE = 3
End Enum
