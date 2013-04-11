Attribute VB_Name = "mod_DateFunctions"
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

Private m_MonthTable(12) As String

Public Function GetFormattedDtTimeStamp() As String
    GetFormattedDtTimeStamp = Format(Now(), "yyyy_mm_dd_hhmmss")
End Function

Public Function LoadDaysOfTheWeek(cbo As comboBox, ExcludeWeekends As Boolean)
    
    cbo.Clear
    cbo.AddItem "Monday"
    cbo.AddItem "Tuesday"
    cbo.AddItem "Wednesday"
    cbo.AddItem "Thursday"
    cbo.AddItem "Friday"
    
    If ExcludeWeekends = False Then
        cbo.AddItem "Saturday"
        cbo.AddItem "Sunday"
    End If
    
End Function

Public Function GetVBDOWIndex(DOWName As String) As Integer
    
    Dim strDOW As String
    strDOW = UCase(Trim(DOWName))
    
    If strDOW = "MONDAY" Then
       GetVBDOWIndex = 2
    ElseIf strDOW = "TUESDAY" Then
       GetVBDOWIndex = 3
    ElseIf strDOW = "WEDNESDAY" Then
       GetVBDOWIndex = 4
    ElseIf strDOW = "THURSDAY" Then
       GetVBDOWIndex = 5
    ElseIf strDOW = "FRIDAY" Then
       GetVBDOWIndex = 6
    ElseIf strDOW = "SATURDAY" Then
       GetVBDOWIndex = 7
    ElseIf strDOW = "SUNDAY" Then
       GetVBDOWIndex = 1
    Else
       GetVBDOWIndex = 0
    End If
    
End Function

Public Function IsDateEQDOW(InputDate As Variant, DOWName As String) As Boolean
'i.e. is the dayname of InputDate = DOWName

    Dim DayIndex As Integer
    DayIndex = GetVBDOWIndex(DOWName)
    
    If Weekday(InputDate) = GetVBDOWIndex(DOWName) Then
        IsDateEQDOW = True
    Else
        IsDateEQDOW = False
    End If

End Function

Public Function GetMonthName(MonthIndex As Integer)
    Call LoadMonthTable
    If MonthIndex >= 1 And MonthIndex <= 12 Then
        GetMonthName = m_MonthTable(MonthIndex)
    Else
        GetMonthName = ""
    End If
End Function

Private Function LoadMonthTable()
    m_MonthTable(1) = "January"
    m_MonthTable(2) = "February"
    m_MonthTable(3) = "March"
    m_MonthTable(4) = "April"
    m_MonthTable(5) = "May"
    m_MonthTable(6) = "June"
    m_MonthTable(7) = "July"
    m_MonthTable(8) = "August"
    m_MonthTable(9) = "September"
    m_MonthTable(10) = "October"
    m_MonthTable(11) = "November"
    m_MonthTable(12) = "December"
End Function
