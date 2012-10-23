Attribute VB_Name = "Mod_Main"
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

Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Declare Sub InitCommonControls Lib "comctl32.dll" ()
Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryA" (ByVal lpLibFileName As String) As Long
Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Public m_hMod As Long

Public gClsaccountManager As cls_AccountManager
Public gClsSessionManager As cls_SessionManager
Public gClsWorkstation    As cls_Workstation
Public gClsCMActive       As cls_cmActive
Public gclspcpl           As cls_pcpl
Public gclsMaxSpend       As cls_maxspend
Public gclsUnitCurrency   As cls_unitcurrency
Public gclsLabPrint       As cls_LabPrint
Public gclsfpNoLogon      As cls_fpNoLogon
Public gclsOfflineManager As Cls_OfflineManager

Public IsLoggedOn As Boolean


Public Sub Main()
       
    gMyIniPath = App.Path & "\realtime.conf"
       
    If (Dir$(gMyIniPath) = "") Then
        MsgBox (gMyIniPath & " - Not located")
        End
    End If
     
    Set gClsConfig = New Cls_Config
    Set gClsDatabase = New cls_Database
    Set gClsaccountManager = New cls_AccountManager
    Set gClsSessionManager = New cls_SessionManager
    Set gClsWorkstation = New cls_Workstation
    Set gclspcpl = New cls_pcpl
    Set gclsMaxSpend = New cls_maxspend
    Set gclsUnitCurrency = New cls_unitcurrency
    Set gclsLabPrint = New cls_LabPrint
    Set gclsOfflineManager = New Cls_OfflineManager
               
                
    m_hMod = LoadLibrary("shell32.dll")
    InitCommonControls
    gClsConfig.Init_ActiveLogon
        
    gAppName = App.Title
    gAppVersion = App.ProductName & " Version: " & App.Major & "." & App.Minor
    gVersion = App.Major & "." & App.Minor
    
    '''''''''''''''''''''''''''''''''''''''
    'Peter Drysdale, Added for version 1.02
    'Project #: DGP-0001
    '08/05/2008
    'Handle logoff/toggle
    'create a collection for each queue that we should be monitoring for active jobs
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Dim section As String
    Dim counter As Integer
    Dim CmdLine As String
    Dim key    As String
    Dim Inst As cls_Monitor
    
    On Error GoTo handler
    For counter = 0 To 25
        
        section = "QMonitor" + CStr(counter)
        key = gClsConfig.mGetData(section, "printer")
        If (key <> "") Then
            Set Inst = New cls_Monitor
            Inst.mPrinter = key
            Inst.mCost = gClsConfig.mGetData(section, "cost")
            Inst.mAlias = gClsConfig.mGetData(section, "alias")
            MyMonitors.Add Item:=Inst, key:=Inst.mPrinter
        End If
        
handler:
        
    Next
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    'end
    'project #: DGP-0001
    'create a collection for each queue that we should be nonitoring for active jobs
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    IsLoggedOn = False
    Set gClsCMActive = New cls_cmActive
    Load Frm_Main
       
End Sub

Public Sub TerminateApp()
    
    Dim f As Form
    For Each f In Forms
        Unload f
        Set f = Nothing
    Next f
    
    Set gClsaccountManager = Nothing
    Set gClsSessionManager = Nothing
    Set gClsWorkstation = Nothing
    Set gClsCMActive = Nothing
          
    FreeLibrary (m_hMod)
    Set gClsConfig = Nothing
    Set gClsDatabase = Nothing
    End
End Sub


