VERSION 5.00
Begin VB.Form frm_Reports_Data 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Reports Data Selection"
   ClientHeight    =   4710
   ClientLeft      =   2100
   ClientTop       =   1545
   ClientWidth     =   6150
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_Reports_Data.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4710
   ScaleWidth      =   6150
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Cmd_Next 
      Caption         =   "&Next"
      Default         =   -1  'True
      Height          =   375
      Left            =   4800
      TabIndex        =   4
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   3480
      TabIndex        =   3
      Top             =   4200
      Width           =   1215
   End
   Begin VB.Frame Frame2 
      Height          =   3975
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   5775
      Begin VB.OptionButton optData 
         Caption         =   "Specific"
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   5295
      End
      Begin VB.Frame FrameSelected 
         Height          =   3015
         Left            =   240
         TabIndex        =   5
         Top             =   720
         Width           =   5295
         Begin VB.CommandButton cmd_AddAll 
            Caption         =   ">>"
            Height          =   372
            Left            =   2400
            TabIndex        =   12
            Top             =   2160
            Width           =   495
         End
         Begin VB.CommandButton cmd_DelAll 
            Caption         =   "<<"
            Height          =   372
            Left            =   2400
            TabIndex        =   11
            Top             =   2520
            Width           =   495
         End
         Begin VB.ListBox LstFilter 
            BackColor       =   &H00C0FFFF&
            Height          =   2310
            Left            =   120
            MultiSelect     =   2  'Extended
            TabIndex        =   10
            Top             =   600
            Width           =   2175
         End
         Begin VB.CommandButton cmd_AddSelected 
            Caption         =   ">"
            Height          =   372
            Left            =   2400
            TabIndex        =   9
            Top             =   1080
            Width           =   495
         End
         Begin VB.CommandButton cmd_DelSelected 
            Caption         =   "<"
            Height          =   372
            Left            =   2400
            TabIndex        =   8
            Top             =   720
            Width           =   495
         End
         Begin VB.ListBox lstDataValue 
            BackColor       =   &H00C0FFFF&
            Height          =   2535
            Left            =   3000
            MultiSelect     =   2  'Extended
            TabIndex        =   7
            Top             =   360
            Width           =   2175
         End
         Begin VB.TextBox txt_Filter 
            BackColor       =   &H00C0FFFF&
            Height          =   330
            Left            =   120
            TabIndex        =   6
            Top             =   240
            Width           =   2175
         End
      End
      Begin VB.OptionButton optData 
         Caption         =   "ALL"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   240
         Width           =   5295
      End
   End
End
Attribute VB_Name = "frm_Reports_Data"
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

Option Explicit
Public Entity As String

Private Sub cmd_AddAll_Click()
    Call CopyListBox(Me.LstFilter, Me.lstDataValue)
End Sub

Private Sub cmd_DelAll_Click()
    Call CopyListBox(Me.lstDataValue, Me.LstFilter)
End Sub

Private Sub cmd_AddSelected_Click()
    Call CopySelectedListItems(Me.LstFilter, Me.lstDataValue)
End Sub

Private Sub cmd_DelSelected_Click()
    Call CopySelectedListItems(Me.lstDataValue, Me.LstFilter)
End Sub

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub ClearDataSelection()
     Me.lstDataValue.Clear
End Sub

Private Sub Cmd_Next_Click()

    gClsReports.CancelledPressed = False
    If Me.lstDataValue.ListCount = 0 Then
        gClsReports.SelectedEntityList = ""
    Else
        Dim i As Integer
        Dim ValClause As String
        
        For i = 0 To Me.lstDataValue.ListCount - 1
            If ValClause = "" Then
                ValClause = "'" & lstDataValue.List(i) & "'"
            Else
                ValClause = ValClause & ",'" & lstDataValue.List(i) & "'"
            End If
        Next i
        If Trim(ValClause) = "" Then
            gClsReports.SelectedEntityList = Trim(ValClause)
        Else
            gClsReports.SelectedEntityList = " AND " & gClsReports.EntityFieldname & " in (" & Trim(ValClause) & ")"
        End If
    End If
    Unload Me
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    gClsReports.CancelledPressed = True
End Sub

Private Sub optData_Click(Index As Integer)
    
    If Index = 0 Then
        FrameSelected.Enabled = False
        txt_Filter.Text = ""
        Me.lstDataValue.Clear
        Me.LstFilter.Clear
    End If

    If Index = 1 Then
        FrameSelected.Enabled = True
        txt_Filter.Text = ""
        txt_Filter.SetFocus
        Me.lstDataValue.Clear
        Me.LstFilter.Clear
    End If


End Sub

Private Sub txt_Filter_Change()
       
       If (txt_Filter.Text = "") Then
           LstFilter.Clear
           Exit Sub
       End If
       
       On Error GoTo handler
       Me.LstFilter.Clear
       
       Dim m_rs As ADODB.Recordset
       Set m_rs = New ADODB.Recordset
       Dim m_SQL As String
       
       
       Select Case UCase(Entity)
             Case "CLIENTS"
                   m_SQL = "SELECT CC_CODE as strdata FROM DOCUGATE_GENERAL_CC WHERE CC_CODE LIKE '" & txt_Filter & "%'"
             Case "USERS"
                   m_SQL = "SELECT ACC_BADGE as strdata FROM DOCUGATE_GENERAL_ACC WHERE ACC_BADGE LIKE '" & txt_Filter & "%'"
             Case "ORGANIZATIONAL UNITS"
                   m_SQL = "SELECT OU_NAME as strdata FROM DOCUGATE_GENERAL_OU WHERE OU_NAME LIKE '" & txt_Filter & "%'"
             Case "COMPUTERNAME"
                   m_SQL = "SELECT COMPUTERNAME as strdata FROM DOCUGATE_COMPUTERNAME_VIEW WHERE COMPUTERNAME LIKE '" & txt_Filter & "%'"
       End Select
              
       m_rs.Open m_SQL, gConn, adOpenForwardOnly, adLockReadOnly
       While Not m_rs.EOF
             
             Me.LstFilter.AddItem (m_rs!strdata)
             m_rs.MoveNext
       Wend
       m_rs.Close
       Set m_rs = Nothing
       
handler:
       
       If (Err.Number <> 0) Then
           MsgBox Err.Description, vbOKOnly, "Frm_Reports_Data::txt_filter_change()"
           Err.Clear
       End If

End Sub
