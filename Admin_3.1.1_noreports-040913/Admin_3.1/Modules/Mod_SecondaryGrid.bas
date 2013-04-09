Attribute VB_Name = "Mod_SecondaryGrid"
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

Public Sub GridReset(ByRef mgrid As vbalGrid)
    mgrid.Clear (True)
End Sub

Public Sub GridMatterSetUp(ByRef mgrid As vbalGrid, CC_GUID As String)
    
    With mgrid
      .Redraw = False
      .AddColumn "CM_GUID", "CM_GUID", ecgHdrTextALignLeft, , 0
      .AddColumn "CC_GUID", "CC_GUID", ecgHdrTextALignLeft, , 0
      .AddColumn "CM_MATTER", "Matter code", ecgHdrTextALignCentre, , 96
      .AddColumn "CC_CODE", "Client code", ecgHdrTextALignCentre, , 96
      .AddColumn "CM_DESCRIPTION", "Description", ecgHdrTextALignLeft, , 128
      .AddColumn "CM_CUSTOM", "Custom", ecgHdrTextALignLeft, , 128
      .SetHeaders
      If CC_GUID <> "" Then GridMatterPopulate mgrid, CC_GUID
      .KeySearchColumn = .ColumnIndex("CM_MATTER")
      .Redraw = True
    End With

End Sub


Public Sub GridOUSetUp(ByRef mgrid As vbalGrid)
    
    With mgrid
      .Redraw = False
      .AddColumn "ACC_GUID", "ACC_GUID", ecgHdrTextALignLeft, , 0
      .AddColumn "", "Account", ecgHdrTextALignLeft, , 96
      .AddColumn "", "Firstname", ecgHdrTextALignLeft, , 96
      .AddColumn "", "Lastname", ecgHdrTextALignLeft, , 96
      .AddColumn "", "Balance", ecgHdrTextALignRight, , 96
      .SetHeaders
      .Redraw = True
    End With

End Sub

Public Sub GridOUPopuplate(ByRef mgrid As vbalGrid, ouguid As String)
    
   On Error GoTo Err_Handler
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   mgrid.Clear
   mgrid.GridLines = True
   mgrid.Redraw = False
      
   Set gRs = New ADODB.Recordset
      gRs.Open "SELECT acc_funds,acc_firstname,acc_lastname,acc_acc_guid,acc_badge FROM dbo.docugate_general_acc where acc_ou_guid='" & ouguid & "'", gConn, adOpenStatic, adLockOptimistic
       While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!acc_acc_guid
            .CellDetails .Rows, 2, gRs!acc_badge
            .CellDetails .Rows, 3, gRs!acc_firstname
            .CellDetails .Rows, 4, gRs!acc_lastname
            .CellDetails .Rows, 5, FormatCurrency(gRs!acc_funds, 2, True, False, True), DT_RIGHT
          End With
        gRs.MoveNext
      Wend
   
   gRs.Close
   Set gRs = Nothing
   
Err_Handler:

    Screen.MousePointer = vbNormal
    mgrid.Redraw = True
    If (Err <> 0) Then
        MsgBox Err.Description
    End If
    
End Sub

Public Sub GridAccountJournelSetup(ByRef mgrid As vbalGrid)
    
    With mgrid
      .Redraw = False
      .AddColumn "", "Date", ecgHdrTextALignLeft, , 128
      .AddColumn "", "Type", ecgHdrTextALignLeft, , 96
      .AddColumn "", "Description", ecgHdrTextALignLeft, , 255
      .AddColumn "", "Amount", ecgHdrTextALignRight, , 50
      .SetHeaders
      .Redraw = True
    End With

End Sub

Public Sub GridAccountJournelPopuplate(ByRef mgrid As vbalGrid, ACC_GUID As String)
    
   On Error GoTo Err_Handler
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   mgrid.GridLines = True
   mgrid.Redraw = False
      
   Set gRs = New ADODB.Recordset
      gRs.Open "SELECT * FROM dbo.docugate_general_activity_journel where j_guid='" & ACC_GUID & "' order by j_date", gConn, adOpenStatic, adLockOptimistic
       While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!j_date
            .CellDetails .Rows, 2, gRs!j_type
            .CellDetails .Rows, 3, gRs!j_desc
            .CellDetails .Rows, 4, gRs!j_amount
          End With
        gRs.MoveNext
      Wend
   
   gRs.Close
   Set gRs = Nothing
   
Err_Handler:

    Screen.MousePointer = vbNormal
    mgrid.Redraw = True
    If (Err <> 0) Then
        MsgBox Err.Description
    End If
    
End Sub



Public Sub GridMatterPopulate(ByRef mgrid As vbalGrid, CC_GUID As String)

On Error GoTo Err_Handler
   Dim lRow As Long, lCol As Long, lIndent As Long
   Dim sFnt2 As New StdFont
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   sFnt2.Name = "Times New Roman"
   sFnt2.Bold = True
   sFnt2.Size = 12
   mgrid.GridLines = True
      
   mgrid.Redraw = False
   lRow = 1
      
   Set gRs = New ADODB.Recordset
   gRs.Open "SELECT * FROM dbo.docugate_cm_view where cc_guid='" & CC_GUID & "' order by cm_matter", gConn, adOpenStatic, adLockOptimistic
      
    While Not gRs.EOF
        With mgrid
            .AddRow
            .CellDetails .Rows, 1, gRs!CM_GUID, DT_WORD_ELLIPSIS Or DT_SINGLELINE, , vbButtonFace, , , , 4
            .CellDetails .Rows, 2, gRs!CC_GUID
            .CellDetails .Rows, 3, gRs!CM_MATTER, DT_CENTER
            .CellDetails .Rows, 4, gRs!CC_CODE, DT_CENTER
            .CellDetails .Rows, 5, gRs!CM_DESCRIPTION
            .CellDetails .Rows, 6, gRs!CM_CUSTOM
                        
        End With
        gRs.MoveNext
   Wend
   
   mgrid.Redraw = True
   Screen.MousePointer = vbNormal
   Exit Sub
   
Err_Handler:
    Screen.MousePointer = vbNormal
    MsgBox Err.Description
End Sub


