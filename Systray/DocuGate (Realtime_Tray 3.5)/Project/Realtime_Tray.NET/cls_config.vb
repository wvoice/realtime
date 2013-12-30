Option Strict Off
Option Explicit On
Friend Class Cls_Config
	
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
	
	Private Structure SECURITY_ATTRIBUTES
		Dim nLength As Integer
		Dim lpSecurityDescriptor As Integer
		Dim bInheritHandle As Boolean
	End Structure
	
	Const MAX_SIZE As Short = 2048
	Const MAX_INISIZE As Short = 8192
	
	' Constants for Registry top-level keys
	Const HKEY_CURRENT_USER As Integer = &H80000001
	Const HKEY_LOCAL_MACHINE As Integer = &H80000002
	Const HKEY_USERS As Integer = &H80000003
	Const HKEY_DYN_DATA As Integer = &H80000006
	Const HKEY_CURRENT_CONFIG As Integer = &H80000005
	Const HKEY_CLASSES_ROOT As Integer = &H80000000
	
	' Return values
	Const ERROR_SUCCESS As Short = 0
	Const ERROR_FILE_NOT_FOUND As Short = 2
	Const ERROR_MORE_DATA As Short = 234
	Const ERROR_NO_MORE_ITEMS As Short = 259
	
	' RegCreateKeyEx options
	Const REG_OPTION_NON_VOLATILE As Short = 0
	
	' RegCreateKeyEx Disposition
	Const REG_CREATED_NEW_KEY As Integer = &H1
	Const REG_OPENED_EXISTING_KEY As Integer = &H2
	
	' Registry data types
	Const REG_NONE As Short = 0
	Const REG_SZ As Short = 1
	Const REG_BINARY As Short = 3
	Const REG_DWORD As Short = 4
	
	' Registry security attributes
	Const KEY_QUERY_VALUE As Integer = &H1
	Const KEY_SET_VALUE As Integer = &H2
	Const KEY_CREATE_SUB_KEY As Integer = &H4
	Const KEY_ENUMERATE_SUB_KEYS As Integer = &H8
	
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function RegEnumValue Lib "advapi32.dll"  Alias "RegEnumValueA"(ByVal hKey As Integer, ByVal dwIndex As Integer, ByVal lpValueName As String, ByRef lpcbValueName As Integer, ByVal lpReserved As Integer, ByRef lpType As Integer, ByRef lpData As Any, ByRef lpcbData As Integer) As Integer
	
	Private Declare Function RegDeleteValue Lib "advapi32.dll"  Alias "RegDeleteValueA"(ByVal hKey As Integer, ByVal lpValueName As String) As Integer
	
	Private Declare Function RegDeleteKey Lib "advapi32.dll"  Alias "RegDeleteKeyA"(ByVal hKey As Integer, ByVal lpSubKey As String) As Integer
	
	Private Declare Function RegOpenKeyEx Lib "advapi32.dll"  Alias "RegOpenKeyExA"(ByVal hKey As Integer, ByVal lpSubKey As String, ByVal ulOptions As Integer, ByVal samDesired As Integer, ByRef phkResult As Integer) As Integer
	
	'UPGRADE_WARNING: Structure SECURITY_ATTRIBUTES may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="C429C3A5-5D47-4CD9-8F51-74A1616405DC"'
	Private Declare Function RegCreateKeyEx Lib "advapi32.dll"  Alias "RegCreateKeyExA"(ByVal hKey As Integer, ByVal lpSubKey As String, ByVal Reserved As Integer, ByVal lpClass As String, ByVal dwOptions As Integer, ByVal samDesired As Integer, ByRef lpSecurityAttributes As SECURITY_ATTRIBUTES, ByRef phkResult As Integer, ByRef lpdwDisposition As Integer) As Integer
	
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function RegQueryValueEx Lib "advapi32.dll"  Alias "RegQueryValueExA"(ByVal hKey As Integer, ByVal lpszValueName As String, ByVal lpdwReserved As Integer, ByRef lpdwType As Integer, ByRef lpData As Any, ByRef lpcbData As Integer) As Integer
	
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function RegSetValueEx Lib "advapi32.dll"  Alias "RegSetValueExA"(ByVal hKey As Integer, ByVal lpValueName As String, ByVal Reserved As Integer, ByVal dwType As Integer, ByRef lpData As Any, ByVal cbData As Integer) As Integer
	
	Private Declare Function RegEnumKey Lib "advapi32.dll"  Alias "RegEnumKeyA"(ByVal hKey As Integer, ByVal dwIndex As Integer, ByVal lpName As String, ByVal cbName As Integer) As Integer
	
	Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Integer) As Integer
	
	Private Declare Function GetPrivateProfileSection Lib "kernel32"  Alias "GetPrivateProfileSectionA"(ByVal lpAppName As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFileName As String) As Integer
	
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function GetPrivateProfileString Lib "kernel32"  Alias "GetPrivateProfileStringA"(ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Integer, ByVal lpFileName As String) As Integer
	
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function WritePrivateProfileString Lib "kernel32"  Alias "WritePrivateProfileStringA"(ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Integer
	
	Private Declare Function GetPrivateProfileInt Lib "kernel32"  Alias "GetPrivateProfileIntA"(ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal nDefault As Integer, ByVal lpFileName As String) As Integer
	
	
	'UPGRADE_NOTE: Class_Initialize was upgraded to Class_Initialize_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Private Sub Class_Initialize_Renamed()
		m_Classname = "cls_ConfigServices"
	End Sub
	Public Sub New()
		MyBase.New()
		Class_Initialize_Renamed()
	End Sub
	
	
	
	Private Function fDeleteKey(ByVal sTopKey As String, ByVal sSubKey As String, ByVal sKeyName As String) As Integer
		Dim lTopKey As Integer
		Dim lHandle As Integer
		Dim lResult As Integer
		
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
	
	Private Function fDeleteValue(ByVal sTopKeyOrFile As String, ByVal sSubKeyOrSection As String, ByVal sValueName As String) As Integer
		Dim lTopKey As Integer
		Dim lHandle As Integer
		Dim lResult As Integer
		
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
	
	Private Function fEnumKey(ByVal sTopKey As String, ByVal sSubKey As String, ByRef sValues As String) As Integer
		Dim bDone As Boolean
		Dim lTopKey As Integer
		Dim lHandle As Integer
		Dim lResult As Integer
		Dim lIndex As Integer
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
			sKeyName = Space(MAX_SIZE)
			lResult = RegEnumKey(lHandle, lIndex, sKeyName, MAX_SIZE)
			
			If lResult = ERROR_SUCCESS Then
				sValues = sValues & Trim(sKeyName)
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
	
	Private Function fEnumValue(ByVal sTopKeyOrIniFile As String, ByVal sSubKeyOrSection As String, ByRef sValues As String) As Integer
		Dim lTopKey As Integer
		Dim lHandle As Integer
		Dim lResult As Integer
		Dim lValueLen As Integer
		Dim lIndex As Integer
		Dim lValue As Integer
		Dim lValueType As Integer
		Dim lData As Integer
		Dim lDataLen As Integer
		Dim bDone As Boolean
		Dim sValueName As String
		Dim sValue As String
		
		On Error GoTo fEnumValueError
		lResult = 99
		lTopKey = fTopKey(sTopKeyOrIniFile)
		If lTopKey = 0 Then GoTo fEnumValueError
		
		If lTopKey = 1 Then
			'
			' Enumerate an .ini file section.
			'
			sValues = Space(MAX_INISIZE)
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
				sValueName = Space(lDataLen)
				
				lResult = RegEnumValue(lHandle, lIndex, sValueName, lValueLen, 0, lValueType, lData, lDataLen)
				If lResult = ERROR_SUCCESS Then
					Select Case lValueType
						Case REG_SZ
							sValue = Space(lDataLen)
							sValueName = Left(sValueName, lValueLen)
							lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_SZ, sValue, lDataLen)
							If lResult = ERROR_SUCCESS Then
								sValues = sValues & sValueName & "=" & sValue
							Else
								GoTo fEnumValueError
							End If
						Case REG_DWORD
							lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_NONE, lValue, lDataLen)
							If lResult = ERROR_SUCCESS Then
								sValueName = Left(sValueName, lValueLen)
								sValues = sValues & sValueName & "=" & lValue & vbNullChar
							Else
								GoTo fEnumValueError
							End If
						Case REG_BINARY
							If lDataLen <= 2 Then
								lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_NONE, lValue, lDataLen)
								If lResult = ERROR_SUCCESS Then
									sValueName = Left(sValueName, lValueLen)
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
	
	Private Function fReadIniFuzzy(ByVal sIniFile As String, ByRef sSection As String, ByVal sIniEntry As String, ByVal sDefault As String, ByRef sValue As String) As Integer
		Dim sNextChar As String
		Dim sLine As String
		Dim sEntry As String
		Dim sSectionName As String
		Dim iLen As Short
		Dim iLocOfEq As Short
		Dim iFnum As Short
		Dim bDone As Boolean
		Dim bFound As Boolean
		Dim bNewSection As Boolean
		
		On Error GoTo fReadIniFuzzyError
		fReadIniFuzzy = 99
		bDone = False
		sValue = sDefault
		sEntry = UCase(sIniEntry)
		sSection = UCase(sSection)
		iLen = Len(sSection)
		
		iFnum = FreeFile
		FileOpen(iFnum, sIniFile, OpenMode.Input, OpenAccess.Read)
		
		sLine = LineInput(iFnum)
		Dim iPos As Short
		Do While Not EOF(iFnum) And Not bDone
			sLine = UCase(Trim(sLine))
			bNewSection = False
			'
			' See if line is a section heading.
			'
			If Left(sLine, 1) = "[" Then
				'
				' See if section heading contains desired value.
				'
				sSectionName = sLine
				iPos = InStr(1, sLine, sSection)
				If iPos > 0 Then
					'
					' Be sure the value is not part of a larger value.
					'
					sNextChar = Mid(sLine, iPos + iLen, 1)
					If sNextChar = " " Or sNextChar = "]" Then
						'
						' Search this section for the entry.
						'
						sLine = LineInput(iFnum)
						bFound = False
						bNewSection = False
						Do While Not EOF(iFnum) And Not bFound
							'
							' If we hit a new section, stop.
							'
							sLine = UCase(Trim(sLine))
							If Left(sLine, 1) = "[" Then
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
									sValue = Mid(sLine, iLocOfEq + 1)
									sSection = Mid(sSectionName, 2, InStr(1, sSectionName, "]") - 2)
									bFound = True
									bDone = True
									fReadIniFuzzy = 0
								End If
							End If
							If Not bFound Then
								sLine = LineInput(iFnum)
							End If
						Loop 
						If EOF(iFnum) Then bDone = True
						sSection = Mid(sSectionName, 2, InStr(1, sSectionName, "]") - 2)
					End If
				End If
			End If
			If Not bNewSection And Not bDone Then
				sLine = LineInput(iFnum)
			End If
		Loop 
		FileClose(iFnum)
		Exit Function
		
fReadIniFuzzyError: 
		fReadIniFuzzy = 99
	End Function
	Public Function fReadValue(ByVal sTopKeyOrFile As String, ByVal sSubKeyOrSection As String, ByVal sValueName As String, ByVal sValueType As String, ByVal vDefault As Object, ByRef vValue As Object) As Integer
		Dim lTopKey As Integer
		Dim lHandle As Integer
		Dim lLenData As Integer
		Dim lResult As Integer
		Dim lDefault As Integer
		Dim lValue As Integer
		Dim sValue As String
		Dim sSubKeyPath As String
		Dim sDefaultStr As String
		Dim bValue As Boolean
		
		On Error GoTo fReadValueError
		lResult = 99
		'UPGRADE_WARNING: Couldn't resolve default property of object vDefault. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
		vValue = vDefault
		lTopKey = fTopKey(sTopKeyOrFile)
		If lTopKey = 0 Then GoTo fReadValueError
		
		If lTopKey = 1 Then
			'
			' Read the .ini file value.
			'
			If UCase(sValueType) = "S" Then
				lLenData = 255
				'UPGRADE_WARNING: Couldn't resolve default property of object vDefault. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				sDefaultStr = vDefault
				sValue = Space(lLenData)
				lResult = GetPrivateProfileString(sSubKeyOrSection, sValueName, sDefaultStr, sValue, lLenData, sTopKeyOrFile)
				'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				vValue = Left(sValue, lResult)
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
			Select Case UCase(sValueType)
				Case "S"
					'
					' String value. The first query gets the string length. The second
					' gets the string value.
					'
					lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_SZ, "", lLenData)
					If lResult = ERROR_MORE_DATA Then
						sValue = Space(lLenData)
						lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_SZ, sValue, lLenData)
					End If
					If lResult = ERROR_SUCCESS Then 'Remove null character.
						'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
						vValue = Left(sValue, lLenData - 1)
					Else
						GoTo fReadValueError
					End If
				Case "B"
					lLenData = Len(bValue)
					lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_BINARY, bValue, lLenData)
					If lResult = ERROR_SUCCESS Then
						'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
						vValue = bValue
					Else
						GoTo fReadValueError
					End If
				Case "D"
					lLenData = 32
					lResult = RegQueryValueEx(lHandle, sValueName, 0, REG_DWORD, lValue, lLenData)
					If lResult = ERROR_SUCCESS Then
						'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
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
	
	
	Private Function fTopKey(ByVal sTopKeyOrFile As String) As Integer
		Dim sDir As String
		On Error GoTo fTopKeyError
		fTopKey = 0
		Select Case UCase(sTopKeyOrFile)
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
				'UPGRADE_WARNING: Dir has a new behavior. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="9B7D5ADD-D8FE-4819-A36C-6DEDAF088CC7"'
				sDir = Dir(sTopKeyOrFile)
				If Err.Number = 0 And sDir <> "" Then fTopKey = 1
		End Select
		Exit Function
		
fTopKeyError: 
	End Function
	
	Public Function fWriteValue(ByVal sTopKeyOrFile As String, ByVal sSubKeyOrSection As String, ByVal sValueName As String, ByVal sValueType As String, ByVal vValue As Object) As Integer
		Dim hKey As Integer
		Dim lTopKey As Integer
		Dim lOptions As Integer
		Dim lsamDesired As Integer
		Dim lHandle As Integer
		Dim lDisposition As Integer
		Dim lLenData As Integer
		Dim lResult As Integer
		Dim lValue As Integer
		Dim sClass As String
		Dim sValue As String
		Dim sSubKeyPath As String
		Dim bValue As Boolean
		Dim tSecurityAttributes As SECURITY_ATTRIBUTES
		
		On Error GoTo fWriteValueError
		lResult = 99
		lTopKey = fTopKey(sTopKeyOrFile)
		If lTopKey = 0 Then GoTo fWriteValueError
		
		If lTopKey = 1 Then
			'
			' Read the .ini file value.
			'
			If UCase(sValueType) = "S" Then
				'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
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
			lResult = RegCreateKeyEx(lTopKey, sSubKeyOrSection, 0, sClass, lOptions, lsamDesired, tSecurityAttributes, lHandle, lDisposition)
			If lResult <> ERROR_SUCCESS Then GoTo fWriteValueError
			'
			' Set the actual value.
			'
			Select Case UCase(sValueType)
				Case "S"
					'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
					sValue = vValue
					'02/05/2002            lLenData = Len(sValue) + 1
					lLenData = Len(sValue)
					lResult = RegSetValueEx(lHandle, sValueName, 0, REG_SZ, sValue, lLenData)
				Case "B"
					'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
					bValue = vValue
					lLenData = Len(bValue)
					lResult = RegSetValueEx(lHandle, sValueName, 0, REG_BINARY, bValue, lLenData)
				Case "D"
					'UPGRADE_WARNING: Couldn't resolve default property of object vValue. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
					lValue = CShort(vValue)
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
	
	
	Public Function Get_ini(ByRef section As String) As Object
		
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
	
	Public Function Update_ActiveLogon() As Object
		
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
	
	Public Function ForcedLogoff() As Object
		Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
	End Function
	Public Function Init_ActiveLogon() As Object
		Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
		' for older dcpapp.exe
		Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "ACTIVE", "D", 0)
		Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "USERGUID", "s", "")
		Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "OUGUID", "s", "")
		Call fWriteValue("HKLM", "software\network printing solutions,inc\docugate", "BADGE", "s", "")
		
		
	End Function
	
	
	
	
	'UPGRADE_NOTE: Module was upgraded to Module_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	Public Property Version(ByVal Module_Renamed As String) As String
		Get
			
			Select Case Module_Renamed
				Case "WORKSTATION"
					Call fReadValue("HKLM", "software\Realtime Systems\" & Module_Renamed, "version", "S", "", Version)
			End Select
			
		End Get
		Set(ByVal Value As String)
			
			Select Case Module_Renamed
				Case "WORKSTATION"
					Call fWriteValue("HKLM", "software\Realtime Systems\" & Module_Renamed, "version", "s", Value)
			End Select
			
		End Set
	End Property
	
	Public ReadOnly Property GlobalCharge() As String
		Get
			GlobalCharge = CStr(ActiveCost.m_HIGHEST)
		End Get
	End Property
	
	Public ReadOnly Property DeviceCharge(ByVal url As String) As String
		Get
			Call fReadValue(gMyIniPath, "QCHARGE", url, "S", "", DeviceCharge)
		End Get
	End Property
	
	Public ReadOnly Property DeviceAlias(ByVal url As String) As String
		Get
			Call fReadValue(gMyIniPath, "QALIAS", url, "S", "", DeviceAlias)
		End Get
	End Property
	
	Public ReadOnly Property ChkOfflinePermitted() As Short
		Get
			Call fReadValue(gMyIniPath, "PARAMS", "offline", "S", "0", ChkOfflinePermitted)
		End Get
	End Property
	
	
	Public ReadOnly Property WorkstationAlias() As String
		Get
			Call fReadValue(gMyIniPath, "WSALIAS", "Name", "S", "", WorkstationAlias)
		End Get
	End Property
	
	Public ReadOnly Property DatabaseServer() As String
		Get
			Dim rval As String
			Call fReadValue(gMyIniPath, "PARAMS", "server", "S", "", rval)
			DatabaseServer = rval
		End Get
	End Property
	
	
	Public ReadOnly Property LogonPanel_UID_TXT() As String
		Get
			
			Dim rval As String
			Call fReadValue(gMyIniPath, "PARAMS", "userprompt", "S", "", rval)
			LogonPanel_UID_TXT = rval
			
		End Get
	End Property
	
	Public ReadOnly Property LogonPanel_PWD_TXT() As String
		Get
			Dim rval As String
			Call fReadValue(gMyIniPath, "PARAMS", "passprompt", "S", "", rval)
			LogonPanel_PWD_TXT = rval
		End Get
	End Property
	
	Public ReadOnly Property LogonPanel_PWD_REQ() As Integer
		Get
			Dim rval As String
			Call fReadValue(gMyIniPath, "PARAMS", "passchk", "S", "", rval)
			LogonPanel_PWD_REQ = CInt(rval)
		End Get
	End Property
	
	Public ReadOnly Property InactivityThreshold() As Integer
		Get
			Dim rval As String
			Call fReadValue(gMyIniPath, "PARAMS", "inactivity", "S", "", rval)
			InactivityThreshold = CInt(rval)
		End Get
	End Property
	
	Public ReadOnly Property mGetCommandLine(ByVal Data As String) As String
		Get
			Call fReadValue(gMyIniPath, Data, "CommandLine", "S", "", mGetCommandLine)
		End Get
	End Property
	
	Public ReadOnly Property mGetData(ByVal section As String, ByVal Value_Renamed As String) As String
		Get
			Call fReadValue(gMyIniPath, section, Value_Renamed, "S", "", mGetData)
		End Get
	End Property
	
	Public ReadOnly Property CMEnabled() As String
		Get
			Call fReadValue(gMyIniPath, "clientmatter", "enable", "S", "0", CMEnabled)
		End Get
	End Property
	
	Public ReadOnly Property CMThreshold() As String
		Get
			Call fReadValue(gMyIniPath, "clientmatter", "jobnum", "S", "0", CMThreshold)
		End Get
	End Property
	
	Public ReadOnly Property AutoLogon() As Boolean
		Get
			
			Dim Data As String
			Call fReadValue(gMyIniPath, "autologon", "enable", "S", "0", Data)
			If (Data = "1") Then
				AutoLogon = True
			Else
				AutoLogon = False
			End If
			
			
		End Get
	End Property
	
	Public Function Update_FpNoLogon(ByRef Data As Boolean) As Object
		
		If (Data = True) Then
			Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "active")
		Else
			Call fWriteValue("HKLM", "software\Realtime Systems", "", "S", "idle")
		End If
		
	End Function
End Class