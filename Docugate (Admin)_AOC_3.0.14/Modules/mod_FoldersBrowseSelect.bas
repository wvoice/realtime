Attribute VB_Name = "mod_FoldersBrowseSelect"
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

Private Type BROWSEINFO
  hWndOwner       As Long
  pIDLRoot        As Long
  pszDisplayName  As Long
  lpszTitle       As String
  ulFlags         As Long
  lpfnCallback    As Long
  lParam          As Long
  iImage          As Long
End Type

Private Declare Function SHBrowseForFolder Lib "shell32.dll" Alias "SHBrowseForFolderA" _
        (lpBrowseInfo As BROWSEINFO) As Long
        
Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" _
        (ByVal pidl As Long, ByVal pszPath As String) As Long
        
Private Declare Function SetFileAttributes Lib "KERNEL32" Alias "SetFileAttributesA" _
        (ByVal lpFileName As String, ByVal dwFileAttributes As Long) As Long
        
Private Const FileAttributeArchive = &H20, FileAttributeReadonly = &H1
Private Const FileAttributeSystem = &H4, FileAttributeHidden = &H2
Private Const FileAttributeDirectory = &H10
Private Const BIF_RETURNONLYFSDIRS = &H1, BIF_DONTGOBELOWDOMAIN = &H2

Public Function BrowseFolder(hwnd As Long, szDialogTitle As String) As String
On Local Error Resume Next
    Dim X As Long, BI As BROWSEINFO, dwIList As Long, szPath As String, wPos As Integer
    BI.hWndOwner = hwnd
    BI.lpszTitle = szDialogTitle
    BI.ulFlags = BIF_RETURNONLYFSDIRS + BIF_DONTGOBELOWDOMAIN
    dwIList = SHBrowseForFolder(BI)
    szPath = Space$(512)
    X = SHGetPathFromIDList(ByVal dwIList, ByVal szPath)
    If X Then
        wPos = InStr(szPath, Chr(0))
        BrowseFolder = Trim(Left$(szPath, wPos - 1))
    Else
        BrowseFolder = vbNullString
    End If
End Function

Public Function CheckIfFolderIsSystem(ByVal FolderName As String) As Boolean
    Dim fs, f, FolderAttribute As Integer
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFolder(FolderName)
    FolderAttribute = f.Attributes - FileAttributeDirectory
If FolderAttribute = FileAttributeSystem + FileAttributeHidden _
        Or FolderAttribute = FileAttributeSystem + FileAttributeReadonly _
        Or FolderAttribute = FileAttributeSystem + FileAttributeArchive _
        Or FolderAttribute = FileAttributeSystem + FileAttributeReadonly + FileAttributeHidden _
        Or FolderAttribute = FileAttributeSystem + FileAttributeReadonly + FileAttributeArchive _
        Or FolderAttribute = FileAttributeSystem + FileAttributeHidden + FileAttributeArchive _
        Or FolderAttribute = FileAttributeSystem + FileAttributeHidden + FileAttributeReadonly + FileAttributeArchive _
        Or FolderAttribute = FileAttributeSystem Then
CheckIfFolderIsSystem = True
Else
CheckIfFolderIsSystem = False
End If
End Function

Public Sub setFolderRead(folderspec)
Dim f, fs
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set f = fs.GetFolder(folderspec)
f.Attributes = FileAttributeDirectory + FileAttributeReadonly
End Sub

Public Function IsFolderExists(ByVal FolderName As String) As Boolean
Dim fs
Set fs = CreateObject("Scripting.FileSystemObject")
IsFolderExists = fs.FolderExists(FolderName)
End Function

Public Sub FileAttribHide(ByVal FileName As String)
Dim vResult As Long: On Local Error Resume Next
vResult = SetFileAttributes(FileName, FileAttributeHidden + FileAttributeSystem)
End Sub

Public Function bFileExists(ByVal sFileName As String) As Boolean
On Error Resume Next: Dim i As Integer
i = Len(Dir$(sFileName))
bFileExists = IIf(Err Or i = 0, False, True)
If Trim(sFileName) = vbNullString Then bFileExists = False
End Function

