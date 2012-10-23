Attribute VB_Name = "mod_ListsAndCombos"
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

Public Sub PrintListItemsToTextFile(FilePath As String, lst As ListBox)

    Dim st As TextStream
    Set st = gFSObj.CreateTextFile(FilePath, True)
    
    Dim i As Integer
    For i = 0 To lst.ListCount - 1
        Call st.WriteLine(lst.List(i))
    Next i
    st.Close
    
End Sub

Public Function SetComboListItem(Desc As String, cbo As Control)

    Dim i As Integer
    Dim t As String
    t = uct(Desc)
    
    Dim MaxCnt As Integer
    If TypeOf cbo Is comboBox Or TypeOf cbo Is ListBox Then
        MaxCnt = cbo.ListCount - 1
    Else
        MaxCnt = cbo.ItemsCount - 1
    End If
    
   'If TypeOf cbo Is comboBox Or TypeOf cbo Is ListBox Then
        For i = 0 To MaxCnt
           If t = uct(cbo.List(i)) Then
               cbo.ListIndex = i
               Exit Function
           End If
        Next i
   'Else
   '    For i = 0 To MaxCnt
   '       If t = uct(cbo.ItemData(i)) Then
   '           cbo.ListIndex = i
   '           Exit Function
   '       End If
   '    Next i
   'End If
    
End Function

Public Sub RemoveMatchedListEntries(SrceList As Control, MatchAndRemoveList As Control, CaseSensitive As Boolean, _
    Optional StrToRemove As String)

    Dim i As Integer
    Dim j As Integer
    Dim SelectedEntry As String
    Dim FoundMatch As Boolean
    
    For i = 0 To SrceList.ListCount - 1
        
        If CaseSensitive = True Then
            SelectedEntry = uct(SrceList.List(i))
        Else
            SelectedEntry = SrceList.List(i)
        End If
        If SelectedEntry <> "" Then SelectedEntry = Trim(Replace(SelectedEntry, StrToRemove, ""))
        
        j = 0
        FoundMatch = False
        
        While j < MatchAndRemoveList.ListCount And FoundMatch = False
            If CaseSensitive = True Then
                If SelectedEntry = uct(MatchAndRemoveList.List(j)) Then
                    MatchAndRemoveList.RemoveItem j
                    FoundMatch = True
                End If
            Else
                If SelectedEntry = MatchAndRemoveList.List(j) Then
                    MatchAndRemoveList.RemoveItem j
                    FoundMatch = True
                End If
            End If
            j = j + 1
        Wend
        
    Next i

End Sub

Public Sub MoveItemBetweenLists(SrceCtrl As ListBox, DestCtrl As ListBox)
   
   If SrceCtrl.SelCount = 0 Then Exit Sub
   If SrceCtrl.ListIndex = -1 Then Exit Sub
   If SrceCtrl.ListCount = 0 Then Exit Sub
      
      
    Dim intX As Integer
    For intX = 0 To SrceCtrl.ListCount - 1
        If SrceCtrl.Selected(intX) Then
          DestCtrl.AddItem SrceCtrl.List(intX)
        End If
    Next
   
End Sub

Public Function IsItemInComboList(comboBox As Control, ItemDesc As String, DisplayError As Boolean, Optional FieldCaption As String) As Boolean
   
   Dim i As Integer
   Dim s As String
   s = uct(ItemDesc)
   
   If s = "" Then
      IsItemInComboList = True
      Exit Function
   End If
   
   For i = 0 To comboBox.ListCount - 1
       If uct(comboBox.List(i)) = s Then
          IsItemInComboList = True
          Exit Function
       End If
   Next i
   
   IsItemInComboList = False
   If DisplayError = True Then
       MsgBox FieldCaption & " is a not a valid Item in the list. Select a value from the list.", vbCritical, ""
   End If

End Function

Public Function CopyListBox(SrceList As Control, DestList As Control)
    DestList.Clear
    Dim i As Integer
    For i = 0 To SrceList.ListCount - 1
       DestList.AddItem SrceList.List(i)
    Next i
    SrceList.Clear
End Function

Public Function GetListItemIndex(lst As Control, FindStr As String) As Integer

    Dim i As Integer
    Dim uFindStr As String
    uFindStr = uct(FindStr)
    
    For i = 0 To lst.ListCount - 1
        If uct(lst.List(i)) = uFindStr Then
            GetListItemIndex = i
            Exit Function
        End If
    Next i
    GetListItemIndex = -1

End Function

Public Sub CopySelectedListItems(SrceList As ListBox, DestList As ListBox, _
    Optional StrToAppend As String, Optional StrToRemove As String)

    Dim i As Integer
    Dim ItemDesc As String
    
    For i = 0 To SrceList.ListCount - 1
        If SrceList.Selected(i) = True Then
            If IsItemInComboList(DestList, SrceList.List(i), False, "") = False Then
                ItemDesc = SrceList.List(i)
                If StrToAppend <> "" Then ItemDesc = ItemDesc & StrToAppend
                If StrToRemove <> "" Then ItemDesc = Replace(ItemDesc, StrToRemove, "")
                DestList.AddItem ItemDesc
            End If
        End If
    Next i
    
    Dim t As Integer
    For i = 0 To DestList.ListCount - 1
        
        ItemDesc = DestList.List(i)
        If StrToAppend <> "" Then ItemDesc = Replace(ItemDesc, StrToAppend, "")
        If StrToRemove <> "" Then ItemDesc = ItemDesc & StrToRemove
        
        t = GetListItemIndex(SrceList, ItemDesc)
        If t > -1 Then
            SrceList.RemoveItem t
        End If
    Next i
End Sub

Public Sub MoveListItemUp(lst As ListBox)

    Dim ItemIdx As Integer
    ItemIdx = lst.ListIndex
    
    
    If ItemIdx <= 0 Then Exit Sub
    If lst.ListCount = 0 Then Exit Sub
    
    Dim t As String
    
    t = lst.List(ItemIdx - 1)
    lst.List(ItemIdx - 1) = lst.List(ItemIdx)
    lst.List(ItemIdx) = t
    
    lst.Selected(ItemIdx) = False
    lst.Selected(ItemIdx - 1) = True
    
End Sub

Public Sub MoveListItemDown(lst As ListBox)

    Dim ItemIdx As Integer
    ItemIdx = lst.ListIndex
    
    If ItemIdx = -1 Then Exit Sub
    If ItemIdx = lst.ListCount - 1 Then Exit Sub
    
    Dim t As String
    
    t = lst.List(ItemIdx + 1)
    lst.List(ItemIdx + 1) = lst.List(ItemIdx)
    lst.List(ItemIdx) = t
    
    lst.Selected(ItemIdx) = False
    lst.Selected(ItemIdx + 1) = True
    
End Sub

Public Sub RemoveItemFromList(LstItems As ListBox)

    If LstItems.ListCount = 0 Then Exit Sub
    If LstItems.ListCount = 1 Then
        LstItems.RemoveItem 0
        Exit Sub
    End If
    If LstItems.ListIndex = -1 Then
        MsgBox "Select an item!", vbExclamation
        Exit Sub
    End If
    LstItems.RemoveItem (LstItems.ListIndex)
End Sub


