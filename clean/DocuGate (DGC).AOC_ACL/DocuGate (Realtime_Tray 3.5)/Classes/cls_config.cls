VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Cls_Config"
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

Option Explicit

Private m_Classname As String

Private Type SECURITY_ATTRIBUTES
    nLength              As Long
    lpSecurityDescriptor As Long
    bInheritHandle       As Boolean
End Type
        
Const MAX_SIZE = 2048
Const MAX_INISIZE = 8192

' Constants for Registry top-level keys
Const HKEY_CURRENT_USER = &H80000001
Const HKEY_LOCAL_MACHINE = &H80000002
Const HKEY_USERS = &H80000003
Const HKEY_DYN_DATA = &H80000006
Const HKEY_CURRENT_CONFIG = &H80000005
Const HKEY_CLASSES_ROOT = &H80000000

' Return values
Const ERROR_SUCCESS = 0&
Const ERROR_FILE_NOT_FOUND = 2&
Const ERROR_MORE_DATA = 234
Const ERROR_NO_MORE_ITEMS = 259&

' RegCreateKeyEx options
Const REG_OPTION_NON_VOLATILE = 0

' RegCreateKeyEx Disposition
Const REG_CREATED_NEW_KEY = &H1
Const REG_OPENED_EXISTING_KEY = &H2

' Registry data types
Const REG_NONE = 0
Const REG_SZ = 1
Const REG_BINARY = 3
Const REG_DWORD = 4

' Registry security attributes
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8

Private Declare Function RegEnumValue Lib "advapi32.dll" _
        Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, _
        ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, _
        lpType As Long, lpData As Any, lpcbData As Long) As Long

Private Declare Function RegDeleteValue Lib "advapi32.dll" _
        Alias "RegDeleteValueA" _
        (ByVal hKey As Long, ByVal lpValueName As String) _
        As Long

Private Declare Function RegDeleteKey Lib "advapi32.dll" _
        Alias "RegDeleteKeyA" _
        (ByVal hKey As Long, ByVal lpSubKey As String) As Long

Private Declare Function RegOpenKeyEx Lib "advapi32.dll" _
        Alias "RegOpenKeyExA" _
        (ByVal hKey As Long, ByVal lpSubKey As String, _
        ByVal ulOptions As Long, ByVal samDesired As Long, _
        phkResult As Long) As Long

Private Declare Function RegCreateKeyEx Lib "advapi32.dll" _
        Alias "RegCreateKeyExA" _
        (ByVal hKey As Long, ByVal lpSubKey As String, _
        ByVal Reserved As Long, ByVal lpClass As String, _
        ByVal dwOptions As Long, ByVal samDesired As Long, _
        lpSecurityAttributes As SECURITY_ATTRIBUTES, phkResult As Long, _
        lpdwDisposition As Long) As Long

Private Declare Function RegQueryValueEx Lib "advapi32.dll" _
        Alias "RegQueryValueExA" _
        (ByVal hKey As Long, ByVal lpszValueName As String, _
        ByVal lpdwReserved As Long, lpdwType As Long, _
        lpData As Any, lpcbData As Long) As Long

Private Declare Function RegSetValueEx Lib "advapi32.dll" _
        Alias "RegSetValueExA" _
        (ByVal hKey As Long, ByVal lpValueName As String, _
        ByVal Reserved As Long, ByVal dwType As Long, _
        lpData As Any, ByVal cbData As Long) As Long

Private Declare Function RegEnumKey Lib "advapi32.dll" Alias _
        "RegEnumKeyA" (ByVal hKey As Long, ByVal dwIndex As Long, _
        ByVal lpName As String, ByVal cbName As Long) As Long

Private Declare Function RegCloseKey Lib "advapi32.dll" _
        (ByVal hKey As Long) As Long

Private Declare Function GetPrivateProfileSection Lib "kernel32" _
        Alias "GetPrivateProfileSectionA" (ByVal lpAppName As String, _
        ByVal lpReturnedString As String, ByVal nSize As Long, ByVal _
        lpFileName As String) As Long
        
Private Declare Function GetPrivateProfileString Lib "kernel32" _
        Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, _
        ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString _
        As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
        
Private Declare Function WritePrivateProfileString Lib "kernel32" _
        Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, _
        ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) _
        As Long

Private Declare Function GetPrivateProfileInt Lib "kernel32" _
        Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, _
        ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName _
        As String) As Long

 
Private Sub Class_Initialize()
    m_Classname = "cls_ConfigServices"
End Sub



Private Function fDeleteKey(ByVal sTopKey As String, ByVal sSubKey As String, ByVal sKeyName As String) As Long
Dim lTopKey As Long
Dim lHandle As Long
Dim lResult As Long

On Error GoTo fDeleteKeyError
lResult = 99
lTopKey = fTopKey(sTopKey)
If lTopKey = 0 Then GoTo fDeleteKeyError

lResult = RegOpenKeyEx(lTopKey, sSubKey, 0, KEY_CREATE_SUB_KEY, lHandle)
If lResult = ERROR_SUCCESS Then
    lResult = RegDeleteKey(lHandle, sKeyName)
End If

If lResult = ERROR_SUCCESS Or lResult = ERROR_FILE_NOT_FOUND Then
    fDeleteKey = ERROR_SUCCESS
Else
    fDeleteKey = lResult
End If
Exit Function

fDeleteKeyError:
    fDeleteKey = lResult
End Function

Private Function fDeleteValue(ByVal sTopKeyOrFile As String, ByVal sSubKeyOrSection As String, ByVal sValueName As String) As Long
Dim lTopKey As Long
Dim lHandle As Long
Dim lResult As Long

On Error GoTo fDeleteValueError
lResult = 99
lTopKey = fTopKey(sTopKeyOrFile)
If lTopKey = 0 Then GoTo fDeleteValueError

If lTopKey = 1 Then
    lResult = WritePrivateProfileString(sSubKeyOrSection, sValueName, "", sTopKeyOrFile)
Else
    lResult = RegOpenKeyEx(lTopKey, sSubKeyOrSection, 0, KEY_SET_VALUE, lHandle)
    If lResult = ERROR_SUCCESS Then
        lResult = RegDeleteValue(lHandle, sValueName)
    End If
    
    If lResult = ERROR_SUCCESS Or lResult = ERROR_FILE_NOT_FOUND Then
        fDeleteValue = ERROR_SUCCESS
    Else
        fDeleteValue = lResult
    End If
End If
Exit Function

fDeleteValueError:
    fDeleteValue = lResult
End Function

Private Function fEnumKey(ByVal sTopKey As String, ByVal sSubKey As String, sValues As String) As Long
Dim bDone    As Boolean
Dim lTopKey  As Long
Dim lHandle  As Long
Dim lResult  As Long
Dim lIndex   As Long
Dim sKeyName As String

On Error GoTo fEnumKeyError
lResult = 99
lTopKey = fTopKey(sTopKey)
If lTopKey = 0 Then GoTo fEnumKeyError
'
' Open the registry SubKey.
'
lResult = RegOpenKeyEx(lTopKey, sSubKey, 0, KEY_ENUMERATE_SUB_KEYS, lHandle)
If lResult <> ERROR_SUCCESS Then GoTo fEnumKeyError
'
' Get all subkeys until ERROR_NO_MORE_ITEMS or an error occurs.
'
Do While Not bDone
    sKeyName = Space$(MAX_SIZE)
    lResult = RegEnumKey(lHandle, lIndex, sKeyName, MAX_SIZE)
    
    If lResult = ERROR_SUCCESS Then
        sValues = sValues & Trim$(sKeyName)
        lIndex = lIndex + 1
    Else
        bDone = True
    End If
Loop
sValues = sValues & vbNullChar
If Len(sValues) = 1 Then sValues = sValues & vbNullChar
'
' Close the key.
'
fEnumKey = RegCloseKey(lHandle)
Exit Function
'
' Error processing.
'
fEnumKeyError:
    fEnumKey = lResult
End Function

Private Function fEnumValue(ByVal sTopKeyOrIniFile As String, ByVal sSubKeyOrSection As String, sValues As String) As Long
Dim lTopKey    As Long
Dim lHandle    As Long
Dim lResult    As Long
Dim lValueLen  As Long
Dim lIndex     As Long
Dim lValue     As Long
Dim lValueType As Long
Dim lData      As Long
Dim lDataLen   As Long
Dim bDone      As Boolean
Dim sValueName As String
Dim sValue     As String

On Error GoTo fEnumValueError
lResult = 99
lTopKey = fTopKey(sTopKeyOrIniFile)
If lTopKey = 0 Then GoTo fEnumValueError

If lTopKey = 1 Then
    '
    ' Enumerate an .ini file section.
    '
    sValues = Space$(MAX_INISIZE)
    lResult = GetPrivateProfileSection(sSubKeyOrSection, sValues, Len(sValues), sTopKeyOrIniFile)
Else
    '
    ' Open the registry SubKey.
    '
    lResult = RegOpenKeyEx(lTopKey, sSubKeyOrSection, 0, KEY_QUERY_VALUE, lHandle)
    If lResult <> ERROR_SUCCESS Then GoTo fEnumValueError
    '
    ' Get all values until ERROR_NO_MORE_ITEMS or an error occurs.
    '
    Do While Not bDone
        lDataLen = MAX_SIZE
        lValueLen = lDataLen
        sValueName = Space$(lDataLen)
        
        lResult = RegEnumValue(lHandle, lIndex, sValueName, lValueLen, 0, lValueType, ByVal lData, lDataLen)
        If lResult = ERROR_SUCCESS Then
            Select Case lValueType
                Case REG_SZ
                    sValue = Space$(lDataLen)
                    sValueName = Left$(sValueName, lValueLen)
                    lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_SZ, ByVal sValue, lDataLen)
                    If lResult = ERROR_SUCCESS Then
                        sValues = sValues & sValueName & "=" & sValue
                    Else
                        GoTo fEnumValueError
                    End If
                Case REG_DWORD
                    lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_NONE, lValue, lDataLen)
                    If lResult = ERROR_SUCCESS Then
                        sValueName = Left$(sValueName, lValueLen)
                        sValues = sValues & sValueName & "=" & lValue & vbNullChar
                    Else
                        GoTo fEnumValueError
                    End If
                Case REG_BINARY
                    If lDataLen <= 2 Then
                        lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_NONE, lValue, lDataLen)
                        If lResult = ERROR_SUCCESS Then
                            sValueName = Left$(sValueName, lValueLen)
                            sValues = sValues & sValueName & "=" & lValue & vbNullChar
                        Else
                            GoTo fEnumValueError
                        End If
                    End If
                Case Else
            End Select
            lIndex = lIndex + 1
        Else
            bDone = True
        End If
    Loop
    sValues = sValues & vbNullChar
    If Len(sValues) = 1 Then sValues = sValues & vbNullChar
    '
    ' Close the key.
    '
    lResult = RegCloseKey(lHandle)
    fEnumValue = lResult
End If
Exit Function
'
' Error processing.
'
fEnumValueError:
    fEnumValue = lResult
End Function

Private Function fReadIniFuzzy(ByVal sIniFile As String, sSection As String, ByVal sIniEntry As String, ByVal sDefault As String, sValue As String) As Long
Dim sNextChar    As String
Dim sLine        As String
Dim sEntry       As String
Dim sSectionName As String
Dim iLen         As Integer
Dim iLocOfEq     As Integer
Dim iFnum        As Integer
Dim bDone        As Boolean
Dim bFound       As Boolean
Dim bNewSection  As Boolean

On Error GoTo fReadIniFuzzyError
fReadIniFuzzy = 99
bDone = False
sValue = sDefault
sEntry = UCase$(sIniEntry)
sSection = UCase$(sSection)
iLen = Len(sSection)

iFnum = FreeFile
Open sIniFile For Input Access Read As iFnum

Line Input #iFnum, sLine
Do While Not EOF(iFnum) And Not bDone
    sLine = UCase$(Trim$(sLine))
    bNewSection = False
    '
    ' See if line is a section heading.
    '
    If Left$(sLine, 1) = "[" Then
        '
        ' See if section heading contains desired value.
        '
        sSectionName = sLine
        Dim iPos As Integer
        iPos = InStr(1, sLine, sSection)
        If iPos > 0 Then
            '
            ' Be sure the value is not part of a larger value.
            '
            sNextChar = Mid$(sLine, iPos + iLen, 1)
            If sNextChar = " " Or sNextChar = "]" Then
                '
                ' Search this section for the entry.
                '
                Line Input #iFnum, sLine
                bFound = False
                bNewSection = False
                Do While Not EOF(iFnum) And Not bFound
                    '
                    ' If we hit a new section, stop.
                    '
                    sLine = UCase$(Trim$(sLine))
                    If Left$(sLine, 1) = "[" Then
                        bNewSection = True
                        Exit Do
                    End If
                    '
                    ' Entry must start in column 1 to avoid comment lines.
                    '
                    If InStr(1, sLine, sEntry) = 1 Then
                        '
                        ' If entry found and line is not incomplete, get value.
                        '
                        iLocOfEq = InStr(1, sLine, "=")
                        If iLocOfEq <> 0 Then
                            sValue = Mid$(sLine, iLocOfEq + 1)
                            sSection = Mid$(sSectionName, 2, InStr(1, sSectionName, "]") - 2)
                            bFound = True
                            bDone = True
                            fReadIniFuzzy = 0
                        End If
                    End If
                    If Not bFound Then
                        Line Input #iFnum, sLine
                    End If
                Loop
                If EOF(iFnum) Then bDone = True
                sSection = Mid$(sSectionName, 2, InStr(1, sSectionName, "]") - 2)
            End If
        End If
    End If
    If Not bNewSection And Not bDone Then
        Line Input #iFnum, sLine
    End If
Loop
Close iFnum
Exit Function

fReadIniFuzzyError:
    fReadIniFuzzy = 99
End Function
Public Function fReadValue(ByVal sTopKeyOrFile As String, _
    ByVal sSubKeyOrSection As String, ByVal sValueName As String, _
    ByVal sValueType As String, ByVal vDefault As Variant, _
    vValue As Variant) As Long
Dim lTopKey     As Long
Dim lHandle     As Long
Dim lLenData    As Long
Dim lResult     As Long
Dim lDefault    As Long
Dim lValue      As Long
Dim sValue      As String
Dim sSubKeyPath As String
Dim sDefaultStr As String
Dim bValue      As Boolean

On Error GoTo fReadValueError
lResult = 99
vValue = vDefault
lTopKey = fTopKey(sTopKeyOrFile)
If lTopKey = 0 Then GoTo fReadValueError

If lTopKey = 1 Then
    '
    ' Read the .ini file value.
    '
    If UCase$(sValueType) = "S" Then
        lLenData = 255
        sDefaultStr = vDefault
        sValue = Space$(lLenData)
        lResult = GetPrivateProfileString(sSubKeyOrSection, sValueName, sDefaultStr, sValue, lLenData, sTopKeyOrFile)
        vValue = Left$(sValue, lResult)
    Else
        lDefault = 0
        lResult = GetPrivateProfileInt(sSubKeyOrSection, sValueName, lDefault, sTopKeyOrFile)
    End If
Else
    '
    ' Open the registry SubKey.
    '
    lResult = RegOpenKeyEx(lTopKey, sSubKeyOrSection, 0, KEY_QUERY_VALUE, lHandle)
    If lResult <> ERROR_SUCCESS Then
        fReadValue = lResult
        Exit Function
    End If
    '
    ' Get the actual value.
    '
    Select Case UCase$(sValueType)
        Case "S"
            '
            ' String value. The first query gets the string length. The second
            ' gets the string value.
            '
            lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_SZ, "", lLenData)
            If lResult = ERROR_MORE_DATA Then
                sValue = Space(lLenData)
                lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_SZ, ByVal sValue, lLenData)
            End If
            If lResult = ERROR_SUCCESS Then  'Remove null character.
                vValue = Left$(sValue, lLenData - 1)
            Else
                GoTo fReadValueError
            End If
        Case "B"
            lLenData = Len(bValue)
            lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_BINARY, bValue, lLenData)
            If lResult = ERROR_SUCCESS Then
                vValue = bValue
            Else
                GoTo fReadValueError
            End If
        Case "D"
            lLenData = 32
            lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_DWORD, lValue, lLenData)
            If lResult = ERROR_SUCCESS Then
                vValue = lValue
            Else
                GoTo fReadValueError
            End If
    End Select
    '
    ' Close the key.
    '
    lResult = RegCloseKey(lHandle)
    fReadValue = lResult
End If
Exit Function
'
' Error processing.
'
fReadValueError:
    fReadValue = lResult
End Function


Private Function fTopKey(ByVal sTopKeyOrFile As String) As Long
Dim sDir   As String
On Error GoTo fTopKeyError
fTopKey = 0
Select Case UCase$(sTopKeyOrFile)
    Case "HKCU"
        fTopKey = HKEY_CURRENT_USER
    Case "HKLM"
        fTopKey = HKEY_LOCAL_MACHINE
    Case "HKU"
        fTopKey = HKEY_USERS
    Case "HKDD"
        fTopKey = HKEY_DYN_DATA
    Case "HKCC"
        fTopKey = HKEY_CURRENT_CONFIG
    Case "HKCR"
        fTopKey = HKEY_CLASSES_ROOT
    Case Else
        On Error Resume Next
        sDir = Dir$(sTopKeyOrFile)
        If Err.Number = 0 And sDir <> "" Then fTopKey = 1
End Select
Exit Function

fTopKeyError:
End Function

Public Function fWriteValue(ByVal sTopKeyOrFile As String, _
    ByVal sSubKeyOrSection As String, ByVal sValueName As String, _
    ByVal sValueType As String, ByVal vValue As Variant) As Long
Dim hKey                As Long
Dim lTopKey             As Long
Dim lOptions            As Long
Dim lsamDesired         As Long
Dim lHandle             As Long
Dim lDisposition        As Long
Dim lLenData            As Long
Dim lResult             As Long
Dim lValue              As Long
Dim sClass              As String
Dim sValue              As String
Dim sSubKeyPath         As String
Dim bValue              As Boolean
Dim tSecurityAttributes As SECURITY_ATTRIBUTES

On Error GoTo fWriteValueError
lResult = 99
lTopKey = fTopKey(sTopKeyOrFile)
If lTopKey = 0 Then GoTo fWriteValueError

If lTopKey = 1 Then
    '
    ' Read the .ini file value.
    '
    If UCase$(sValueType) = "S" Then
        sValue = vValue
        lResult = WritePrivateProfileString(sSubKeyOrSection, sValueName, sValue, sTopKeyOrFile)
    Else
        GoTo fWriteValueError
    End If
Else
    sClass = ""
    lOptions = REG_OPTION_NON_VOLATILE
    lsamDesired = KEY_CREATE_SUB_KEY Or KEY_SET_VALUE
    '
    ' Create the SubKey or open it if it exists. Return its handle.
    ' lDisposition will be REG_CREATED_NEW_KEY if the key did not exist.
    '
    lResult = RegCreateKeyEx(lTopKey, sSubKeyOrSection, 0, sClass, lOptions, _
                  lsamDesired, tSecurityAttributes, lHandle, lDisposition)
    If lResult <> ERROR_SUCCESS Then GoTo fWriteValueError
    '
    ' Set the actual value.
    '
    Select Case UCase$(sValueType)
        Case "S"
            sValue = vValue
'02/05/2002            lLenData = Len(sValue) + 1
            lLenData = Len(sValue)
            lResult = RegSetValueEx(lHandle, sValueName, 0, REG_SZ, ByVal sValue, lLenData)
        Case "B"
            bValue = vValue
            lLenData = Len(bValue)
            lResult = RegSetValueEx(lHandle, sValueName, 0, REG_BINARY, bValue, lLenData)
        Case "D"
            lValue = CInt(vValue)
            lLenData = 4
            lResult = RegSetValueEx(lHandle, sValueName, 0, REG_DWORD, lValue, lLenData)
    End Select
    '
    ' Close the key.
    '
    If lResult = ERROR_SUCCESS Then
        lResult = RegCloseKey(lHandle)
        fWriteValue = lResult
        Exit Function
    End If
End If
Exit Function
'
' Error processing.
'
fWriteValueError:
    fWriteValue = lResult
End Function


Public Function Get_ini(section As String)

  Select Case section
         
     Case "READER"
      With ActiveReader
      Call fReadValue(gMyIniPath, section, "TYPE", "S", "IBUTTON", .m_TYPE)
      Call fReadValue(gMyIniPath, section, "PORT", "S", "1", .m_Port)
      Call fReadValue(gMyIniPath, section, "OPTION", "S", "6", .m_OPTION)
      End With
   
     Case "PAPER"
      With ActiveReader
      Call fReadValue(gMyIniPath, section, "TYPE", "S", "IBUTTON", .m_TYPE)
      Call fReadValue(gMyIniPath, section, "PORT", "S", "1", .m_Port)
      Call fReadValue(gMyIniPath, section, "OPTION", "S", "6", .m_OPTION)
      End With
      
    
   End Select

End Function

Public Function Update_ActiveLogon()

       If (gClsSessionManager.GetSessionState = True) Then
          Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "active")
          ' for older dcpapp.exe
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "ACTIVE", "D", 1)
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "USERguid", "s", gClsaccountManager.mActiveAccountGuid)
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "OUguid", "s", gClsaccountManager.mActiveOUGuid)
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "BADGE", "s", gClsaccountManager.mActiveBadge)
       Else
          Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
          ' for older dcpapp.exe
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "ACTIVE", "D", 0)
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "USERGUID", "s", "")
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "OUGUID", "s", "")
          Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "BADGE", "s", "")
       End If
 
End Function

Public Function ForcedLogoff()
          Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
End Function
Public Function Init_ActiveLogon()
       Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
       ' for older dcpapp.exe
       Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "ACTIVE", "D", 0)
       Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "USERGUID", "s", "")
       Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "OUGUID", "s", "")
       Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "BADGE", "s", "")


End Function


Public Property Let Version(Module As String, Version As String)
    
    Select Case Module
        Case "WORKSTATION"
            Call fWriteValue("HKLM", "software\Realtime Systems\" & Module, "version", "s", Version)
    End Select
    
End Property


Public Property Get Version(Module As String) As String
    
    Select Case Module
        Case "WORKSTATION"
            Call fReadValue("HKLM", "software\Realtime Systems\" & Module, "version", "S", "", Version)
    End Select
    
End Property

Public Property Get GlobalCharge() As String
    GlobalCharge = ActiveCost.m_HIGHEST
End Property

Public Property Get DeviceCharge(url As String) As String
    Call fReadValue(gMyIniPath, "QCHARGE", url, "S", "", DeviceCharge)
End Property

Public Property Get DeviceAlias(url As String) As String
    Call fReadValue(gMyIniPath, "QALIAS", url, "S", "", DeviceAlias)
End Property

Public Property Get ChkOfflinePermitted() As Integer
    Call fReadValue(gMyIniPath, "PARAMS", "offline", "S", "0", ChkOfflinePermitted)
End Property


Public Property Get WorkstationAlias() As String
    Call fReadValue(gMyIniPath, "WSALIAS", "Name", "S", "", WorkstationAlias)
End Property

Public Property Get DatabaseServer() As String
       Dim rval As String
       Call fReadValue(gMyIniPath, "PARAMS", "server", "S", "", rval)
       DatabaseServer = rval
End Property


Public Property Get LogonPanel_UID_TXT() As String
       
       Dim rval As String
       Call fReadValue(gMyIniPath, "PARAMS", "userprompt", "S", "", rval)
       LogonPanel_UID_TXT = rval
       
End Property

Public Property Get LogonPanel_PWD_TXT() As String
       Dim rval As String
       Call fReadValue(gMyIniPath, "PARAMS", "passprompt", "S", "", rval)
       LogonPanel_PWD_TXT = rval
End Property

Public Property Get LogonPanel_PWD_REQ() As Long
       Dim rval As String
       Call fReadValue(gMyIniPath, "PARAMS", "passchk", "S", "", rval)
       LogonPanel_PWD_REQ = rval
End Property

Public Property Get InactivityThreshold() As Long
       Dim rval As String
       Call fReadValue(gMyIniPath, "PARAMS", "inactivity", "S", "", rval)
       InactivityThreshold = rval
End Property

Public Property Get mGetCommandLine(Data As String) As String
        Call fReadValue(gMyIniPath, Data, "CommandLine", "S", "", mGetCommandLine)
End Property

Public Property Get mGetData(section As String, value As String) As String
        Call fReadValue(gMyIniPath, section, value, "S", "", mGetData)
End Property

Public Property Get CMEnabled() As String
    Call fReadValue(gMyIniPath, "clientmatter", "enable", "S", "0", CMEnabled)
End Property

Public Property Get CMThreshold() As String
    Call fReadValue(gMyIniPath, "clientmatter", "jobnum", "S", "0", CMThreshold)
End Property

Public Property Get AutoLogon() As Boolean
    
    Dim Data As String
    Call fReadValue(gMyIniPath, "autologon", "enable", "S", "0", Data)
    If (Data = "1") Then
        AutoLogon = True
    Else
        AutoLogon = False
    End If
    

End Property

Public Function Update_FpNoLogon(Data As Boolean)

       If (Data = True) Then
          Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "active")
       Else
          Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
       End If
 
End Function



