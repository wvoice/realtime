VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_IniSettings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
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

Public Function ReadIniSetting(Section As String)

    Select Case Section
    
      Case "DATABASE"
        With CurrentDatabase
            Call ReadIniFile(gAppIniPath, Section, "SERVER", "S", "", .servername)
            Call ReadIniFile(gAppIniPath, Section, "SCHEMA", "S", "", .DBName)
            Call ReadIniFile(gAppIniPath, Section, "MSDE", "S", "", .MSDE)
            
            '/// 08/04/2008
            Call ReadIniFile(gAppIniPath, Section, "CONNECTION", "S", "", .CONNSTR)
      End With
      
      '//Lynette
      Case "GENERAL"
        Dim InputFlag As String
        Call ReadIniFile(gAppIniPath, Section, "DEVMODE", "S", "", InputFlag)
        gDevMode = nchkYesNo(InputFlag)
        
      '//Lynette
      Case "TITLE-BAR-ICONS"
        With MyTitleBarIconsShow
            Call ReadIniFile(gAppIniPath, Section, "OU", "S", "", .m_OU)
            Call ReadIniFile(gAppIniPath, Section, "ACCOUNT", "S", "", .m_Accounts)
            Call ReadIniFile(gAppIniPath, Section, "CLIENT", "S", "", .m_CLIENTS)
            Call ReadIniFile(gAppIniPath, Section, "CTRLUNIT", "S", "", .m_CTRLUNIT)
            Call ReadIniFile(gAppIniPath, Section, "REPORTS", "S", "", .m_REPORTS)
            Call ReadIniFile(gAppIniPath, Section, "CASHIER", "S", "", .m_CASHIER)
            Call ReadIniFile(gAppIniPath, Section, "CONSOLE", "S", "", .m_CONSOLE)
        End With

   
      Case "TYPE-OF-TERMINAL"
        '//lynette - primitive way of dynamically allow a list of terminal types in the ini file
        Dim i As Integer
        Dim More As Boolean
        Dim Keyword As String
        More = True
        i = 1
        
        While i <= 4 And More = True
            Keyword = "TYPE" & Trim(Str(i))
            Call ReadIniFile(gAppIniPath, Section, Keyword, "S", "", gTerminalTypes(i))
            If gTerminalTypes(i) = "" Then
                More = False
            Else
                gTerminalTypes(i) = uct(gTerminalTypes(i))
                i = i + 1
            End If
        Wend
   
   End Select

End Function

Public Function WriteIniSetting(gAppIniPath As String, Section As String, Keyword As String, _
        StrVal As String, SetttingValue As String)
   
    Call WriteIniFile(gAppIniPath, Section, Keyword, SetttingValue)
End Function
'Looking to use current design to update other .ini files too- Mike Young
'Public Function WriteMcrSetting(gMcrIniPath As String, Section As String, Keyword As String, _
'        StrVal As String, SetttingValue As String)
'
'    Call WriteMcrFile(gMcrIniPath, Section, Keyword, SetttingValue)
'End Function
'Public Function WriteAvsSetting(gAvsIniPath As String, Section As String, Keyword As String, _
'        StrVal As String, SetttingValue As String)
'
'    Call WriteMcrFile(gAvsIniPath, Section, Keyword, SetttingValue)
'End Function

Public Function Clean_ini_file()
'// remove blank lines
    
    Dim ts As TextStream
    Dim newts As TextStream
    Set ts = gFSObj.OpenTextFile(gAppIniPath, ForReading)
    Set newts = gFSObj.OpenTextFile(gAppIniPath & "_copy", ForWriting, True)
    
    Dim InputLine As String
    
    While ts.AtEndOfStream = False
        InputLine = Replace(Replace(Trim(ts.ReadLine()), Chr(13), ""), Chr(10), "")
         If Len(InputLine) > 0 Then
            If InStr(1, InputLine, "[") > 0 Then newts.WriteBlankLines (1)
            newts.WriteLine (InputLine)
        End If
    Wend
    ts.Close
    newts.Close
    gFSObj.CopyFile gAppIniPath & "_copy", gAppIniPath, True

End Function

Public Function Delete_ini_section(DeleteSection As String)
   
    Dim ts As TextStream
    Dim newts As TextStream
    Dim InputLine As String
    Dim OutputLine As String
    Dim fSkipEntriesUntilNextSection As Boolean
    Dim StartPos As Integer
    Dim EndPos As Integer
    Dim SectionName As String
    
    Set ts = gFSObj.OpenTextFile(gAppIniPath, ForReading)
    Set newts = gFSObj.OpenTextFile(gAppIniPath & "_copy", ForWriting, True)
    
    fSkipEntriesUntilNextSection = False
    
    While ts.AtEndOfStream = False
    
        StartPos = 0
        EndPos = 0
        
        InputLine = ts.ReadLine()
        StartPos = InStr(1, InputLine, "[")
        If StartPos > 0 Then EndPos = InStr(StartPos + 1, InputLine, "]")
       
        If StartPos > 0 And EndPos > 0 Then
            If fSkipEntriesUntilNextSection = True Then
                '// assume we found the next section after we were skipping entries to delete
                '// stop 'deleting' and continue to process the file
                fSkipEntriesUntilNextSection = False
            Else
                '// examine the new section to see if we should delete it
                SectionName = UCase(Mid(InputLine, StartPos, EndPos - StartPos))
                If UCase(SectionName) = DeleteSection Then
                   fSkipEntriesUntilNextSection = True
                End If
            End If
        End If
        
        If fSkipEntriesUntilNextSection = False Then
            '// omit blank lines to clean up
            If LTrim(Trim(InputLine)) <> "" Then newts.WriteLine (InputLine)
        End If
        
    Wend
    ts.Close
    newts.Close
    Call Clean_ini_file
    
End Function

Public Sub Delete_ini_entry(IniPath As String, DeleteSection As String, DeleteEntry As String)
'// Added by L Austin 20/02/2008
'// Deltes the an entry in section of an ini file
    
    Dim ts As TextStream
    Dim InputLine As String
    Dim StartPos As Integer
    Dim EndPos As Integer
    Dim fFoundSection As Boolean
    Dim SectionName As String
    Dim EntryName As String
    Dim BufferData As String
    
    Set ts = gFSObj.OpenTextFile(IniPath, ForReading)
    
    fFoundSection = False
    
    While ts.AtEndOfStream = False
    
        StartPos = 0
        EndPos = 0
        InputLine = ts.ReadLine()
        
        If fFoundSection = False Then
            '// still looking for the section now
            
            StartPos = InStr(1, InputLine, "[")
            If StartPos > 0 Then EndPos = InStr(StartPos + 1, InputLine, "]")
            If StartPos > 0 And EndPos > 0 Then
                '// examine the new section to see if the entry we want to delete is in here
                SectionName = uct(Mid(InputLine, StartPos + 1, EndPos - StartPos - 1))
                If uct(SectionName) = uct(DeleteSection) Then
                   fFoundSection = True
                End If
            End If
        Else
            '//look for an entry until the next section is found
            If Trim(InputLine) <> "" Then
            StartPos = InStr(1, InputLine, "=")
            EntryName = uct(Mid(InputLine, 1, StartPos - 1))
            If EntryName = uct(DeleteEntry) Then
                '//replace this entry with a blank line
                ts.Close
                '// make a backup of the ini file
                Call gFSObj.CopyFile(IniPath, Replace(LCase(IniPath), ".ini", "_bck.ini"), True)
                
                BufferData = LoadFileStrIntoBuffer(IniPath)
                BufferData = Replace(BufferData, InputLine, "")
                '// put a blank line after each section
                'BufferData = Replace(BufferData, "[", vbCrLf & "[")
                '// rewrite the ini file
                Call DumpBufferIntoFileStr(BufferData, IniPath)
                Exit Sub
             End If
             End If
        End If
        
    Wend
    ts.Close
    
    Call Clean_ini_file
    
End Sub
