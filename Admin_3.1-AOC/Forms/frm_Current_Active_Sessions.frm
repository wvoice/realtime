VERSION 5.00
Object = "{543749C9-8732-11D3-A204-0090275C8BC1}#1.0#0"; "vbalGrid6.ocx"
Begin VB.Form frm_Current_Active_Sessions 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Active Sessions:"
   ClientHeight    =   3885
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   7740
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3885
   ScaleWidth      =   7740
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txt_lastRefresh 
      BackColor       =   &H00C0FFFF&
      Height          =   375
      Left            =   2160
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   120
      Width           =   5535
   End
   Begin VB.CommandButton cmd_refresh 
      Caption         =   "&Refresh - F5"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
   Begin VB.CommandButton Cmd_Close 
      Cancel          =   -1  'True
      Caption         =   "&Close"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   6480
      TabIndex        =   1
      Top             =   3480
      Width           =   1215
   End
   Begin vbAcceleratorGrid6.vbalGrid mgrid 
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   7560
      _ExtentX        =   13335
      _ExtentY        =   4895
      MultiSelect     =   -1  'True
      RowMode         =   -1  'True
      BackgroundPictureHeight=   0
      BackgroundPictureWidth=   0
      HighlightBackColor=   16761024
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BorderStyle     =   2
      DisableIcons    =   -1  'True
   End
End
Attribute VB_Name = "frm_Current_Active_Sessions"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
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
'SELECT     dbo.docugate_general_active_session.ACC_GUID AS guid, dbo.docugate_general_acc.ACC_BADGE AS badge,dbo.docugate_general_acc.ACC_FULLNAME AS fullname
'FROM       dbo.docugate_general_active_session INNER JOIN dbo.docugate_general_acc ON dbo.docugate_general_active_session.ACC_GUID = dbo.docugate_general_acc.ACC_ACC_GUID

Private Sub activetimer_Timer()
    Call GridPopuplate
End Sub

Private Sub Cmd_Close_Click()
    Unload Me
End Sub

Private Sub cmd_refresh_Click()
    txt_lastRefresh.Text = Format(Now, "dddd, mmm d yyyy - hh:mm:ss")
    Call GridPopuplate
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

If (KeyCode = 116) Then
    Call cmd_refresh_Click
End If

End Sub


Private Sub Form_Load()
    Call CentreForm(Me)
    Call GridSetUp
    txt_lastRefresh.Text = Format(Now, "dddd, mmm d yyyy - hh:mm:ss")
    Call GridPopuplate
End Sub

'Private Sub GridUpdate_Timer()
'    GridUpdate.Enabled = False
'    Call Mod_SecondaryGrid.GridOUSetUp(Me.oumembersgrid)
'    Call Mod_SecondaryGrid.GridOUPopuplate(Me.oumembersgrid, ouguid)
'End Sub

Private Sub GridSetUp()
    
    With mGrid
      .Redraw = False
      .AddColumn "ACC_GUID", "ACC_GUID", ecgHdrTextALignLeft, , 0
      .AddColumn "", "Badge", ecgHdrTextALignLeft, , 150
      .AddColumn "", "Full Name", ecgHdrTextALignLeft, , 300
      .SetHeaders
      .Redraw = True
    End With

End Sub

Private Sub GridPopuplate()
    
   On Error GoTo Err_Handler
      
   If (gObjDBConn.ConnectDB = False) Then
          Exit Sub
   End If
   
   mGrid.Clear
   mGrid.GridLines = True
   mGrid.Redraw = False
      
   Dim sql As String
   sql = "SELECT  dbo.docugate_general_active_session.ACC_GUID AS guid, dbo.docugate_general_acc.ACC_BADGE AS badge,dbo.docugate_general_acc.ACC_FULLNAME AS fullname " & _
         "FROM    dbo.docugate_general_active_session INNER JOIN dbo.docugate_general_acc ON dbo.docugate_general_active_session.ACC_GUID = dbo.docugate_general_acc.ACC_ACC_GUID"
          
   Set gRs = New ADODB.Recordset
      gRs.Open sql, gConn, adOpenStatic, adLockOptimistic
       While Not gRs.EOF
        With mGrid
            .AddRow
            .CellDetails .Rows, 1, gRs!guid
            .CellDetails .Rows, 2, gRs!badge
            .CellDetails .Rows, 3, gRs!FullName
          End With
        gRs.MoveNext
      Wend
   
   gRs.Close
   Set gRs = Nothing
   
Err_Handler:

    Screen.MousePointer = vbNormal
    mGrid.Redraw = True
    If (Err <> 0) Then
        MsgBox Err.Description
    End If
    
End Sub


Private Sub mgrid_DblClick(ByVal lRow As Long, ByVal lCol As Long)

    Dim Name As String
    Dim guid As String
    Dim badge As String
    Dim message As String
    Dim r As VbMsgBoxResult
    
    If (lCol <> 3) Or (lRow < 0) Then Exit Sub
    
    
    Name = mGrid.CellText(lRow, 3)
    badge = mGrid.CellText(lRow, 2)
    guid = mGrid.CellText(lRow, 1)
    
    message = "Delete Active Session for: " & Name
    r = MsgBox(message, vbYesNoCancel)
    If (r = vbYes) Then
       gObjAccountMngr.DeleteActiveSession (guid)
    End If
        

End Sub
