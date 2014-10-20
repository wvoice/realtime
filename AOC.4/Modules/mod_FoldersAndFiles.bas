Attribute VB_Name = "mod_FoldersAndFiles"
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

Public gFSObj As New FileSystemObject
Public gSelectedFolder As String
Public gSelectedFilename As String
Public gFilenameMsg As String
Public gFSError As String

'// Lynette Austin - 20/02/2008
Private Declare Function PathIsLFNFileSpec Lib "shlwapi" _
   Alias "PathIsLFNFileSpecA" _
  (ByVal pszPath As String) As Long

'//Lynette Austin - 20/02/2008
Public Declare Function HtmlHelp Lib "hhctrl.ocx" _
        Alias "HtmlHelpA" _
        (ByVal hwndCaller As Long, _
        ByVal pszFile As String, _
        ByVal uCommand As Long, _
        ByVal dwData As Long) _
        As Long

Public Const HH_DISPLAY_TOPIC = &H0
'//

Public Function ConvertMYSQLFilename(InputPath As String) As String
    ConvertMYSQLFilename = Replace(InputPath, "\", "/")
End Function

Public Function IsValidLongFilename(InPath As String) As Boolean
   IsValidLongFilename = PathIsLFNFileSpec(InPath)
End Function

Public Function ClearFolder(FolderName As String, Optional ExceptThisFilename As String)
    
    Dim fi As Files
    Dim f As File
    Dim ExFi As String
    ExFi = uct(ExceptThisFilename)
    
    If gFSObj.FolderExists(FolderName) Then
        Set fi = gFSObj.GetFolder(FolderName).Files
        For Each f In fi
            SetAttr f.Path, vbNormal
            
            If ExFi <> "" Then
                If ExFi = uct(f.Name) Then
                    'don't delete this file
                Else
                    On Error Resume Next
                    Call gFSObj.DeleteFile(f.Path)
                End If
            Else
                On Error Resume Next
                Call gFSObj.DeleteFile(f.Path)
            End If
        Next f
    End If
        
End Function

Public Function GetOldestFileInFolder(FolderPath As String, ByRef ErrMsg As String) As String

    ErrMsg = ""
    GetOldestFileInFolder = ""
    
    If gFSObj.FolderExists(FolderPath) = False Then
        ErrMsg = "The folder does not exist"
        Exit Function
    End If
    
    If gFSObj.GetFolder(FolderPath).Files.Count = 0 Then
        ErrMsg = "The folder is empty"
        Exit Function
    End If

    Dim fiColl As Files
    Dim fi As File
    Dim i As Integer
    Dim CrDate As Variant
    Dim OldestFile As String
    
    OldestFile = ""
    Set fiColl = gFSObj.GetFolder(FolderPath).Files
    For Each fi In fiColl
        If IsEmpty(CrDate) Then
            CrDate = fi.DateLastModified
            OldestFile = fi.Name
        End If
        
        If DateDiff("s", fi.DateLastModified, CrDate) > 0 Then
            CrDate = fi.DateLastModified
            OldestFile = fi.Name
        End If
    Next fi
    
    GetOldestFileInFolder = OldestFile
    
End Function

Public Function CreateFolder(destDir As String) As Boolean
    
   Dim i As Long
   Dim prevDir As String
    
   On Error Resume Next
    
   For i = Len(destDir) To 1 Step -1
       If Mid(destDir, i, 1) = "\" Then
           prevDir = Left(destDir, i - 1)
           Exit For
       End If
   Next i
    
   If prevDir = "" Then CreateFolder = False: Exit Function
   If Not Len(Dir(prevDir & "\", vbDirectory)) > 0 Then
       If Not CreateFolder(prevDir) Then CreateFolder = False: Exit Function
   End If
    
   On Error GoTo errDirMake
   MkDir destDir
   CreateFolder = True
   Exit Function
    
errDirMake:
   CreateFolder = False

End Function

Public Function MoveFolderAndFiles(SourceFolder As String, DestFolder As String, MatchName As String)

'// Move all subfolders and files where the name starts with Matchname
On Error GoTo Err_Handler
    
    gFSError = ""
    
    If gFSObj.FolderExists(SourceFolder) = False Then
       MsgBox "Source folder does not exist"
       Exit Function
    End If
    
    If gFSObj.FolderExists(DestFolder) = False Then
       Call CreateFolder(DestFolder)
       Exit Function
    End If
    
    '// Move all files from the source folder to the destination folder
    Dim fi As File
    For Each fi In gFSObj.GetFolder(SourceFolder).Files
        If InStr(1, UCase(fi.Name), UCase(MatchName)) > 0 Then
           Call gFSObj.MoveFile(fi.ParentFolder & "\" & fi.Name, DestFolder & "\" & fi.Name)
        End If
    Next fi
    
    '// Move all sub folders from the source folder to the destination folder
    Dim fo As Folder
    For Each fo In gFSObj.GetFolder(SourceFolder).SubFolders
        If InStr(1, UCase(fo.Name), UCase(MatchName)) > 0 Then
            Call gFSObj.MoveFolder(fo.Name, DestFolder & "\" & fo.Name)
        End If
    Next fo
    
    MoveFolderAndFiles = True
    Exit Function
    
Err_Handler:
    gFSError = Err.Description
End Function

Public Function LoadFileStrIntoBuffer(InputFile As String) As String

On Error GoTo Err_Handler
    
    gFSError = ""
    Dim FileLine As String
    Dim Buffer As String
    Buffer = ""
    
    Open InputFile For Input As 46
    While EOF(46) = False
        Input #46, FileLine
        Buffer = Buffer & vbCrLf & FileLine
    Wend
    Close #46
    LoadFileStrIntoBuffer = Buffer
    Exit Function
    
Err_Handler:
    gFSError = Err.Description
End Function

Public Function DumpBufferIntoFileStr(Buffer As String, OutputPath As String)

On Error GoTo Err_Handler
    gFSError = ""
    Open OutputPath For Output As #25
    Print #25, Buffer
    Close #25
    Exit Function
    
Err_Handler:
    gFSError = Err.Description
End Function

Public Function DumpListCtrlIntoFileStr(lst As ListBox, OutputPath As String) As String

On Error GoTo Err_Handler
    gFSError = ""
    Dim FileLine As String
    Dim i As Integer
    
    Open OutputPath For Output As 46
    For i = 0 To lst.ListCount - 1
        Print #46, lst.List(i)
    Next i
    Close #46
    Exit Function
    
Err_Handler:
    gFSError = Err.Description
End Function

