Attribute VB_Name = "mod_WinAPI"
''****************************************************************************
''
'' Copyright (C) 2007-2010 Network Printing Solutions,INC and/or its subsidiary(-ies)
'' and/or its Assignees.
'' All rights reserved.
''
'' This file is part of the Realtime Administrator Source Code Distribution.
''
'' You may use this file under the following terms:
''
''  In plain English:
''
''  1. We don't promise that this software works
''  2. We don't promise that it will meet any requirement or need.
''  3. You can use this software for whatever you want. You don't have to pay us.
''  4. Permission for use of this software is granted only if the user accepts full responsibility for any undesirable consequences;
''     the authors accept NO LIABILITY for damages of any kind whatsoever for what ever reason.
''  5. Permission is NOT granted for the use of author's name or company name in advertising or publicity relating to this software
''     or products derived from
''  6. If any part of the source code for this software is distributed, then this usage must be included,with this copyright and
''     no-warranty notice unaltered; and any additions, deletions, or changes to the original files must be clearly indicated in
''     accompanying documentation.
''  7. We specifically permit and encourage the use of this software as the basis of commercial products, provided that all warranty
''     or liability claims are assumed by you
''  8. We do not offer to nor will we be required to support or maintain the software.
''  9. You assume full responsibility in requesting permission to use and if required you assume the full cost and effort in re-licensing
''     any third party components that may or may not be used by the software.
''
''
'' " Redistribution and use in source and binary forms, with or without
''   modification, are permitted without fee provided that the following
''   conditions are agreed and met:
''   * Redistributions of source code must retain the above copyright
''     notice, this list of conditions and the following disclaimer.
''   * Redistributions in binary form must reproduce the above copyright
''     notice, this list of conditions and the following disclaimer in
''     the documentation and/or other materials provided with the
''     distribution.
''   * Neither the name of Network Printing Solutions,its Subsidiary(-ies)
''     and/or its assigness nor the names of its contributors may be used to
''     endorse or promote products derived from this software without specific
''     prior written permission.
''
'' THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
'' "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
'' LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
'' A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
'' OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
'' SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
'' LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
'' DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
'' THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
'' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
'' OF OR THE INABLITY TO USE THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
'' OF SUCH DAMAGE."
''
''****************************************************************************/
Option Explicit

Private Const LWA_COLORKEY = 1
Private Const LWA_ALPHA = 2
Private Const LWA_BOTH = 3
Private Const WS_EX_LAYERED = &H80000
Private Const GWL_EXSTYLE = -20
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_SHOWWINDOW = &H40
Private Const HWND_TOPMOST = -1
Private Const HWND_NOTOPMOST = -2
Private Const Flags = SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE
Private Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal color As Long, ByVal X As Byte, ByVal alpha As Long) As Boolean
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function apiGetFocus Lib "user32" Alias "GetFocus" () As Long


Public gWinAPIError As String

Public gListSharedResourceCnt As Long
Public gListSharedResource() As String

Private Declare Function InitCommonControls Lib "Comctl32.dll" () As Long

Declare Function ShellExecute Lib "shell32.dll" _
    Alias "ShellExecuteA" (ByVal hwnd As Long, _
    ByVal lpOperation As String, ByVal lpFile As String, _
    ByVal lpParameters As String, ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long

Declare Function WritePrivateProfileString& Lib _
    "KERNEL32" Alias "WritePrivateProfileStringA" _
    (ByVal AppName$, ByVal KeyName$, ByVal _
    keydefault$, ByVal FileName$)
    
Declare Function GetPrivateProfileString& Lib "KERNEL32" Alias _
    "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName _
    As String, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal _
    nSize As Long, ByVal lpFileName As String)

Declare Sub Sleep Lib "KERNEL32" (ByVal dwMilliseconds As Long)

Declare Function MoveFile Lib "KERNEL32" Alias "MoveFileA" _
    (ByVal lpExistingFileName As String, ByVal lpNewFileName As String) As Long


Declare Function FindClose Lib "KERNEL32" (ByVal hFindFile As Long) As Long

Declare Function SendMessage& Lib "user" (ByVal hwnd%, ByVal wMsg%, ByVal wParam%, ByVal lParam As Long)
      
Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" _
    (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
    
Declare Function CloseHandle Lib "KERNEL32" (hObject As Long) As Boolean

Declare Function WaitForSingleObject Lib "KERNEL32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long

Declare Function CreateChecklistA Lib "KERNEL32" (ByVal lpApplicationName As Long, _
                                                ByVal lpCommandLine As String, _
                                                ByVal lpChecklistAttributes As Long, _
                                                ByVal lpThreadAttributes As Long, _
                                                ByVal bInheritHandles As Long, _
                                                ByVal dwCreationFlags As Long, _
                                                ByVal lpEnvironment As Long, _
                                                ByVal lpCurrentDirectory As Long, _
                                                lpStartupInfo As STARTUPINFO, _
                                                lpChecklistInformation As Checklist_INFORMATION) As Long
                                                
Public Declare Function NetServerEnum Lib "netapi32" _
  (ByVal servername As Long, _
   ByVal level As Long, _
   buf As Any, _
   ByVal prefmaxlen As Long, _
   entriesread As Long, _
   totalentries As Long, _
   ByVal servertype As Long, _
   ByVal domain As Long, _
   resume_handle As Long) As Long

Public Declare Function NetShareEnum Lib "netapi32" _
  (ByVal servername As Long, _
   ByVal level As Long, _
   bufptr As Long, _
   ByVal prefmaxlen As Long, _
   entriesread As Long, _
   totalentries As Long, _
   resume_handle As Long) As Long
   
Public Declare Function NetApiBufferFree Lib "netapi32" _
   (ByVal Buffer As Long) As Long
     
Public Declare Sub CopyMemory Lib "KERNEL32" _
   Alias "RtlMoveMemory" _
  (pTo As Any, uFrom As Any, _
   ByVal lSize As Long)
   
Public Declare Function lstrlenW Lib "KERNEL32" _
  (ByVal lpString As Long) As Long

  
Public Declare Sub ExitChecklist Lib "KERNEL32" (ByVal uExitCode As Long)

Public Declare Sub OutputDebugString Lib "KERNEL32" Alias _
    "OutputDebugStringA" (ByVal lpOutputString As String)
    
    
Public Declare Sub ExitProcess Lib "KERNEL32" (ByVal uExitCode As Long)
    
Declare Function FindWindow Lib "user32" Alias "FindWindowA" _
     (ByVal lpClassName As Any, ByVal lpWindowName As Any) As Long
   Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" _
     (ByVal hwnd As Long, ByVal lpString As String, _
     ByVal aint As Long) As Long
   Declare Function GetWindow Lib "user32" _
     (ByVal hwnd As Long, ByVal wCmd As Long) As Long
   Declare Function EnumWindows Lib "user32" _
     (ByVal wndenmprc As Long, ByVal lParam As Long) As Long
Public Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Public Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
      
Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
'Const VK_TAB = &H9
'If GetAsyncKeyState(VK_TAB) Then
'     '///
'End If
   
    
'// **********************************************************
'// Types, Variables and Constants required for the DOS Shell
'// **********************************************************
Type STARTUPINFO
    cb As Long
    lpReserved As String
    lpDesktop As String
    lpTitle As String
    dwX As Long
    dwY As Long
    dwXSize As Long
    dwYSize As Long
    dwXCountChars As Long
    dwYCountChars As Long
    dwFillAttribute As Long
    dwFlags As Long
    wShowWindow As Integer
    cbReserved2 As Integer
    lpReserved2 As Long
    hStdInput As Long
    hStdOutput As Long
    hStdError As Long
End Type

Type Checklist_INFORMATION
    hChecklist As Long
    hThread As Long
    dwChecklistID As Long
    dwThreadID As Long
End Type

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Copyright ©1996-2006 VBnet, Randy Birch, All Rights Reserved.
' Some pages may also contain other copyrights by the author.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Windows type used to call the Net API

Global Const NORMAL_PRIORITY_CLASS = &H20&
Global Const INFINITE = -1&
Global Const WAIT_FAILED = &HFFFFFFFF
Global Const WAIT_OBJECT_O = &H0&
Global Const WAIT_ABANDONED = &H80&
Global Const WAIT_TIMEOUT = &H102&
Global Const STILL_ACTIVE = &H103&
Dim m_ProcInfo As Checklist_INFORMATION
Dim m_StartInfo As STARTUPINFO
Global gShellExecuteDone As Boolean

Private Const MAX_PREFERRED_LENGTH As Long = -1
Private Const NERR_SUCCESS As Long = 0&
Private Const ERROR_MORE_DATA As Long = 234&
Public Const LB_SETTABSTOPS As Long = &H192

'See NetServerEnum demo for complete
'list of server types supported
Private Const SV_TYPE_ALL As Long = &HFFFFFFFF
Private Const SV_TYPE_WORKSTATION As Long = &H1
Private Const SV_TYPE_SERVER As Long = &H2

Private Const STYPE_ALL As Long = -1  'note: my const
Private Const STYPE_DISKTREE As Long = 0
Private Const STYPE_PRINTQ As Long = 1
Private Const STYPE_DEVICE As Long = 2
Private Const STYPE_IPC As Long = 3
Private Const STYPE_SPECIAL As Long = &H80000000
Private Const ACCESS_READ  As Long = &H1
Private Const ACCESS_WRITE As Long = &H2
Private Const ACCESS_CREATE As Long = &H4
Private Const ACCESS_EXEC As Long = &H8
Private Const ACCESS_DELETE As Long = &H10
Private Const ACCESS_ATRIB As Long = &H20
Private Const ACCESS_PERM As Long = &H40
Private Const ACCESS_ALL As Long = ACCESS_READ Or _
                                   ACCESS_WRITE Or _
                                   ACCESS_CREATE Or _
                                   ACCESS_EXEC Or _
                                   ACCESS_DELETE Or _
                                   ACCESS_ATRIB Or _
                                   ACCESS_PERM
                                   
Private Const WM_CLOSE = &H10
Private Const GW_HWNDFIRST = 0
Private Const GW_HWNDLAST = 1
Private Const GW_HWNDNEXT = 2
Private Const GW_HWNDPREV = 3
Private Const GW_OWNER = 4
Private Const GW_CHILD = 5
Private Const GW_MAX = 5

Public Const SW_SHOWNORMAL = 1
Public Const SW_SHOWMINIMIZED = 2
Public Const SW_SHOWMAXIMIZED = 3

Private mstrTarget As String
Private mblnSuccess As Boolean
                                   
'for use on Win NT/2000 only
Public Type SERVER_INFO_100
  sv100_platform_id As Long
  sv100_name As Long
End Type

'shi2_current_uses: number of current connections to the resource
'shi2_max_uses    : max concurrent connections resource can accommodate
'shi2_netname     : share name of a resource
'shi2_passwd      : share's password when
'                  (server running with share-level security)
'shi2_path        : local path for the shared resource
'shi2_permissions : shared resource's permissions
'                  (servers running with share-level security)
'shi2_remark      : string containing optional comment about the resource
'shi2_type        : the type of the shared resource
Public Type SHARE_INFO_2
  shi2_netname As Long
  shi2_type As Long
  shi2_remark As Long
  shi2_permissions As Long
  shi2_max_uses As Long
  shi2_current_uses As Long
  shi2_path As Long
  shi2_passwd As Long
End Type

Public Function ReadIniFile(gIniPath As String, Section As String, Keyword As String, _
    Str1 As String, Str2 As String, ByRef SettingValue As String)
    
    Dim Buffer As String * 255
    
    Buffer = Space(255)
    Call GetPrivateProfileString(Section, Keyword, "", Buffer, 255, gIniPath)
    
  ' Call GetPrivateProfileString(lpAppame, lpKeyName, lpDefaul, lpReturnedString, nSize, lpFileName)
 
    SettingValue = Left(Buffer, InStr(Buffer, Chr(0)) - 1)
    
End Function

Public Sub WriteIniFile(Section As String, Keyword As String, UpdateValue As String, gIniPath As String)
   Dim rc As Long
   rc = WritePrivateProfileString(Section, Keyword, UpdateValue, gIniPath)
End Sub

Public Function DOSExecute(CmdLine As String, bWithWait As Boolean) As Boolean

    gWinAPIError = ""
    
    Dim X As Long
    
    On Error GoTo ExecErrorHandler
    
    If gShellExecuteDone = False Then
       gWinAPIError = "A previous job is still running!"
       Exit Function
    End If
    
    m_StartInfo.cb = Len(m_StartInfo)
       
    X = CreateChecklistA(0&, CmdLine$, 0&, 0&, 1&, NORMAL_PRIORITY_CLASS, 0&, 0&, m_StartInfo, m_ProcInfo)
    If X = 0 Then
        Err.Raise vbObjectError + 1100, "Execute", "Failed to execute program"
    End If
    gShellExecuteDone = False
    If bWithWait Then
        Do While True
            X = WaitForSingleObject(m_ProcInfo.hChecklist, 100)
            If X <> WAIT_TIMEOUT Then
                Exit Do
            End If
            DoEvents
        Loop
        CloseHandle (m_ProcInfo.hChecklist)
    End If
    
    gShellExecuteDone = True
    DOSExecute = True
    Exit Function
    
ExecErrorHandler:
    gWinAPIError = Err.Description
    
End Function

Public Function GetCommandLine(Optional MaxArgs) As Integer

'// Define in the calling application an array:-> Private ArgArray(8) As String

   Dim c, CmdLine, CmdLnLen, InArg, i, NumArgs
   'See if MaxArgs was provided.
   If IsMissing(MaxArgs) Then MaxArgs = 10
   'Make array of the correct size.
   NumArgs = 0: InArg = False
   'Get command line arguments.
   CmdLine = Command()
   CmdLnLen = Len(CmdLine)
   'Go thru command line one character
   'at a time.
   For i = 1 To CmdLnLen
      c = Mid(CmdLine, i, 1)
      'Test for space or tab.
      If (c <> " " And c <> vbTab) Then
         'Neither space nor tab.
         'Test if already in argument.
         If Not InArg Then
         'New argument begins.
         'Test for too many arguments.
            If NumArgs = MaxArgs Then Exit For
            NumArgs = NumArgs + 1
            InArg = True
         End If
         'Concatenate character to current argument.
         ArgArray(NumArgs) = ArgArray(NumArgs) & c
      Else
         'Found a space or tab.
         'Set InArg flag to False.
         InArg = False
      End If
   Next i
   GetCommandLine = NumArgs
   
End Function

Public Function LoadListSharedResources(CompName As String, IPAddr As String) As Boolean

On Error GoTo Err_Handler
   gWinAPIError = ""
   gListSharedResourceCnt = 0

   Dim bufptr          As Long  'output
   Dim dwServer        As Long  'pointer to the server
   Dim dwEntriesread   As Long  'out
   Dim dwTotalentries  As Long  'out
   Dim dwResumehandle  As Long  'out
   Dim success         As Long
   Dim nStructSize     As Long
   Dim Cnt             As Long
   Dim usrname         As String
   Dim bServer         As String
   Dim shi2            As SHARE_INFO_2
   
   Dim NetPathRes As String
   Dim UNCName As String
   Dim Dirname As String
   Dim StrParam As String
   Dim Netname As String
   
   StrParam = Trim("\\" & CompName)
   bServer = StrParam & vbNullString
   
  'create pointer to the machine name
   dwServer = StrPtr(bServer)
   
   success = NetShareEnum(dwServer, _
                          2, _
                          bufptr, _
                          MAX_PREFERRED_LENGTH, _
                          dwEntriesread, _
                          dwTotalentries, _
                          dwResumehandle)
   
   If success = 5 Then
      gWinAPIError = "Unable to view shared resource on " & CompName & ". Access denied."
      Exit Function
   ElseIf success <> 0 Then
      gWinAPIError = "Unable to view shared resource on " & CompName
      Exit Function
   End If
   
   If success = NERR_SUCCESS And _
      success <> ERROR_MORE_DATA Then
      
      nStructSize = LenB(shi2)
      
      ReDim gListSharedResource(dwEntriesread)
      gListSharedResourceCnt = dwEntriesread
      
      For Cnt = 0 To dwEntriesread - 1
         
        'get one chunk of data and cast
        'into an SHARE_INFO_2 type, and
        'add the data to a list
         CopyMemory shi2, ByVal bufptr + (nStructSize * Cnt), nStructSize

         Netname = GetPointerToByteStringW(shi2.shi2_netname)
         NetPathRes = GetPointerToByteStringW(shi2.shi2_path)
         Dirname = gFSObj.GetDriveName(NetPathRes)
         UNCName = Replace(NetPathRes, Dirname, "\\" & IPAddr)
         UNCName = "\\" & IPAddr & "\" & Netname
         
         If gFSObj.FolderExists(UNCName) Then
            gListSharedResource(Cnt) = UNCName
         End If
    
      Next
      
   End If
   
   Call NetApiBufferFree(bufptr)
   LoadListSharedResources = True
   Exit Function
   
Err_Handler:
     gWinAPIError = Err.Description
End Function

Public Sub EnumSharedResources(CompName As String)

On Error GoTo Err_Handler

   gWinAPIError = ""
   gListSharedResourceCnt = 0

   Dim bufptr          As Long  'output
   Dim dwServer        As Long  'pointer to the server
   Dim dwEntriesread   As Long  'out
   Dim dwTotalentries  As Long  'out
   Dim dwResumehandle  As Long  'out
   Dim success         As Long
   Dim nStructSize     As Long
   Dim Cnt             As Long
   Dim usrname         As String
   Dim bServer         As String
   Dim shi2            As SHARE_INFO_2
   
   Dim TypeOfRes As String
   Dim NetNameRes As String
   Dim NetPathRes As String
     
  'demo using the local machine
   'bServer = "\\" & Environ$("COMPUTERNAME") & vbNullString
   'bServer = "\\server01" & vbNullString
   
   Dim StrParam As String
   StrParam = Trim("\\" & CompName)
   bServer = StrParam & vbNullString
   
  'create pointer to the machine name
   dwServer = StrPtr(bServer)
   
   success = NetShareEnum(dwServer, _
                          2, _
                          bufptr, _
                          MAX_PREFERRED_LENGTH, _
                          dwEntriesread, _
                          dwTotalentries, _
                          dwResumehandle)

   If success = NERR_SUCCESS And _
      success <> ERROR_MORE_DATA Then
      
      nStructSize = LenB(shi2)
      
      For Cnt = 0 To dwEntriesread - 1
         
        'get one chunk of data and cast
        'into an SHARE_INFO_2 type, and
        'add the data to a list
         CopyMemory shi2, ByVal bufptr + (nStructSize * Cnt), nStructSize

         'List1.AddItem GetPointerToByteStringW(shi2.shi2_netname) & vbTab & _
         '              GetConnectionType(shi2.shi2_type) & vbTab & _
         '              GetConnectionPermissions(shi2.shi2_permissions) & vbTab & _
         '              GetPointerToByteStringW(shi2.shi2_remark) & vbTab & _
         '              GetPointerToByteStringW(shi2.shi2_path)  ' & vbTab & _

        TypeOfRes = GetConnectionType(shi2.shi2_type)
        'If TypeOfRes = "disk drive" Then
        
            NetNameRes = GetPointerToByteStringW(shi2.shi2_netname)
            NetPathRes = GetPointerToByteStringW(shi2.shi2_path)
            gListSharedResource(Cnt) = GetConnectionType(shi2.shi2_type) & " - " & NetNameRes & " (" & NetPathRes & ")"
            
            
    Dim Pathname As String
    Dim UNCName As String
    Dim Dirname As String
    
    'Pathname = ExtractStrBetweenDel(combo1.List(combo1.ListIndex))
    Dirname = gFSObj.GetDriveName(Pathname)
    UNCName = Replace(Pathname, Dirname, "\\192.168.10.1")
    
            'List1.AddItem NumToStr(i) & ") Type: " & GetConnectionType(shi2.shi2_type) & vbTab
            'List1.AddItem NumToStr(i) & ") Permissions: " & GetConnectionPermissions(shi2.shi2_permissions)
            'List1.AddItem NumToStr(i) & ") Remark: " & GetPointerToByteStringW(shi2.shi2_remark)
            'List1.AddItem NumToStr(i) & ") Path: " & GetPointerToByteStringW(shi2.shi2_path)
            'List1.AddItem "-----"
        'End If
      Next
      
   End If
   
   Call NetApiBufferFree(bufptr)
   Exit Sub
   
Err_Handler:
    gWinAPIError = Err.Description

End Sub

Public Function GetConnectionPermissions(ByVal dwPermissions As Long) As String

  'Permissions are only returned a shared
  'resource running with share-level security.
  'A server running user-level security ignores
  'this member, so the function returns
  '"not applicable".
   Dim tmp As String
   
   If (dwPermissions And ACCESS_READ) Then tmp = tmp & "R"
   If (dwPermissions And ACCESS_WRITE) Then tmp = tmp & " W"
   If (dwPermissions And ACCESS_CREATE) Then tmp = tmp & " C"
   If (dwPermissions And ACCESS_DELETE) Then tmp = tmp & " D"
   If (dwPermissions And ACCESS_EXEC) Then tmp = tmp & " E"
   If (dwPermissions And ACCESS_ATRIB) Then tmp = tmp & " A"
   If (dwPermissions And ACCESS_PERM) Then tmp = tmp & " P"

   If Len(tmp) = 0 Then tmp = "n/a"
  
   GetConnectionPermissions = tmp
   
End Function


Public Function GetConnectionType(ByVal dwConnectType As Long) As String

  'compare connection type value
   Select Case dwConnectType
      Case STYPE_DISKTREE: GetConnectionType = "disk drive"
      Case STYPE_PRINTQ:   GetConnectionType = "print queue"
      Case STYPE_DEVICE:   GetConnectionType = "communication device"
      Case STYPE_IPC:      GetConnectionType = "ipc"
      Case STYPE_SPECIAL:  GetConnectionType = "administrative"
      Case Else
         
        'weird case. On my NT2000 machines,
        'I have to do this to identify the
        'IPC$ share type
         Select Case (dwConnectType Xor STYPE_SPECIAL) 'rtns 3 if IPC
            Case STYPE_IPC: GetConnectionType = "ipc"
            Case Else:      GetConnectionType = "undefined"
         End Select
         
   End Select
   
End Function

Public Function GetPointerToByteStringW(ByVal dwData As Long) As String
  
   Dim tmp() As Byte
   Dim tmplen As Long
   
   If dwData <> 0 Then
   
      tmplen = lstrlenW(dwData) * 2
      
      If tmplen <> 0 Then
      
         ReDim tmp(0 To (tmplen - 1)) As Byte
         CopyMemory tmp(0), ByVal dwData, tmplen
         GetPointerToByteStringW = tmp
         
     End If
     
   End If
    
End Function

Public Function blnFindWindow(strApplicationTitle As String) As Boolean

   Dim hWndTmp As Long
   Dim nRet As Integer
   Dim TitleTmp As String
   Dim TitlePart As String
   Dim MyWholeTitle As String
   Dim mCounter As Long
   Dim hWndOver As Integer
   Dim sClassName As String * 100

   blnFindWindow = False

   TitlePart = UCase$(strApplicationTitle)

   'loop through all the open windows
   hWndTmp = FindWindow(0&, 0&)

   Do Until hWndTmp = 0

      TitleTmp = Space$(256)
      nRet = GetWindowText(hWndTmp, TitleTmp, Len(TitleTmp))

      If nRet Then
         'retrieve window title
         TitleTmp = UCase$(VBA.Left$(TitleTmp, nRet))
         'compare window title & strApplicationTitle
         If InStr(TitleTmp, TitlePart) Then
            blnFindWindow = True
            Exit Do
         End If
      End If

      hWndTmp = GetWindow(hWndTmp, GW_HWNDNEXT)
      mCounter = mCounter + 1

   Loop

End Function

Public Function blnGetWindow(strApplicationTitle As String) As Long

   Dim hWndTmp As Long
   Dim nRet As Integer
   Dim TitleTmp As String
   Dim TitlePart As String
   Dim MyWholeTitle As String
   Dim mCounter As Long
   Dim hWndOver As Integer
   Dim sClassName As String * 100

   blnGetWindow = 0

   TitlePart = UCase$(strApplicationTitle)

   'loop through all the open windows
   hWndTmp = FindWindow(0&, 0&)

   Do Until hWndTmp = 0

      TitleTmp = Space$(256)
      nRet = GetWindowText(hWndTmp, TitleTmp, Len(TitleTmp))

      If nRet Then
         'retrieve window title
         TitleTmp = UCase$(VBA.Left$(TitleTmp, nRet))
         'compare window title & strApplicationTitle
         If InStr(TitleTmp, TitlePart) Then
            blnGetWindow = hWndTmp
            Exit Do
         End If
      End If

      hWndTmp = GetWindow(hWndTmp, GW_HWNDNEXT)
      mCounter = mCounter + 1

   Loop

End Function

Public Function blnCloseWindow(strApplicationTitle As String) As Boolean

   ' retrieve Windows list of tasks.
   mblnSuccess = False
   mstrTarget = strApplicationTitle
   EnumWindows AddressOf EnumCallback, 0
   blnCloseWindow = mblnSuccess

End Function

Public Function EnumCallback(ByVal app_hWnd As Long, _
  ByVal param As Long) As Long

   Dim buf As String * 256
   Dim title As String
   Dim length As Long
   
    Const NILL = 0&
    Const WM_SYSCOMMAND = &H112
    Const SC_CLOSE = &HF060&
   

   ' Checks a returned task to determine if App should be closed

   ' get window's title.
   length = GetWindowText(app_hWnd, buf, Len(buf))
   title = Left$(buf, length)

   ' determine if target window.
   If InStr(UCase(title), UCase(mstrTarget)) <> 0 Then
      ' Kill window.
      'SendMessage app_hWnd, WM_CLOSE, 0, 0
      Call SendMessage(app_hWnd, WM_SYSCOMMAND, SC_CLOSE, NILL)

      mblnSuccess = True
   End If

   ' continue searching.
   EnumCallback = 1

End Function

Sub SetTranslucent(ThehWnd As Long, nTrans As Integer)

On Error GoTo ErrorRtn

   Dim attrib As Long
   'put current GWL_EXSTYLE in attrib
   attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
   'change GWL_EXSTYLE to WS_EX_LAYERED - makes a window layered
   SetWindowLong ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED
   'Make transparent (RGB value does not have any effect at this
   'time, will in Part 2 of this article)
   SetLayeredWindowAttributes ThehWnd, RGB(0, 0, 0), nTrans, LWA_ALPHA
   Exit Sub

ErrorRtn:
MsgBox Err.Description & " Source : " & Err.Source

End Sub

