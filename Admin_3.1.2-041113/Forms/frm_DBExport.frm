VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frm_DBExport 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Database Table Export"
   ClientHeight    =   2940
   ClientLeft      =   2580
   ClientTop       =   2775
   ClientWidth     =   9240
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_DBExport.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2940
   ScaleWidth      =   9240
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   7200
      TabIndex        =   2
      Top             =   2400
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   5880
      TabIndex        =   3
      Top             =   2400
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Select the table view to export:"
      Height          =   2175
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   8895
      Begin VB.ComboBox cboTable 
         Height          =   345
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   320
         Width           =   5415
      End
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   600
         Top             =   2880
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton cmdGetFile 
         Caption         =   "..."
         Height          =   375
         Left            =   8280
         TabIndex        =   4
         Top             =   960
         Width           =   495
      End
      Begin VB.TextBox txtScriptPath 
         Height          =   930
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   1
         Top             =   960
         Width           =   8055
      End
      Begin VB.Label Label1 
         Caption         =   "Destination file:"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   720
         Width           =   3975
      End
      Begin VB.Label lblProgress 
         Alignment       =   1  'Right Justify
         Caption         =   "Export in progress......"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   5760
         TabIndex        =   6
         Top             =   1920
         Visible         =   0   'False
         Width           =   2535
      End
   End
End
Attribute VB_Name = "frm_DBExport"
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

Private Sub cboTable_Click()
    Me.txtScriptPath = App.Path & "\Database\Exports\" & Me.cboTable.Text & ".csv"
End Sub

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()

On Error GoTo Err_Handler

    If Trim(Me.txtScriptPath.Text) = "" Then
        MsgBox "Specify the destination file!", vbExclamation + vbOKOnly, "Missing filename"
        Me.txtScriptPath.SetFocus
        Exit Sub
    End If
    
    If IsValidLongFilename(Trim(Me.txtScriptPath.Text)) = False Then
        MsgBox "Invalid path or filename!", vbExclamation + vbOKOnly, "Invalid"
        Me.txtScriptPath.SetFocus
        Exit Sub
    End If
    
    Dim foname As String
    Dim finame As String
    
    finame = gFSObj.GetFileName(Me.txtScriptPath.Text)
    foname = Replace(Me.txtScriptPath.Text, finame, "")
    
    If gFSObj.FolderExists(foname) = False Then CreateFolder (foname)
    
    If finame = "" Then
        txtScriptPath.Text = foname & "\Schema_DocuGate_" & Format(Now, "yyyymmdd_hhmmss") & ".sql"
    End If
   
    If gFSObj.FileExists(Me.txtScriptPath.Text) = True Then
        Kill (Me.txtScriptPath.Text)
    End If
    
    lblProgress.Visible = True
    lblProgress.Caption = "Export in progress..."
    Screen.MousePointer = vbHourglass
    
    Call ExportView("Select * from " & Me.cboTable, Me.txtScriptPath.Text)
    Screen.MousePointer = vbNormal
    
    If gFSObj.FileExists(Me.txtScriptPath.Text) = True Then
        Dim ret As Double
        ret = Shell("notepad.exe " & Me.txtScriptPath.Text, vbNormalFocus)
    Else
        MsgBox "Scripting failed", vbExclamation + vbOKOnly, "Error"
    End If
    
    lblProgress.Visible = False
    Me.Cmd_Cancel.Caption = "&Close"
    Exit Sub
    
Err_Handler:
    MsgBox "010-" & gcOperCodeDBDataExport & Err.Description, vbCritical + vbOKOnly, "Error"

End Sub

Private Sub cmdGetFile_click()

On Error GoTo Err_Handler

With CommonDialog1
    .DialogTitle = "Save script file *.csv"
    .CancelError = True
    .Flags = cdlOFNHideReadOnly
    .Flags = cdlOFNOverwritePrompt
    .Flags = cdlOFNPathMustExist
    .Flags = cdlOFNNoChangeDir
    .Filter = "All Files(*.csv)|*.csv"
    .FilterIndex = 1  '1 = Save and 2 = Open  'This is used to specify which extension is displayed on top.
    .DefaultExt = ".csv"
    .FileName = Me.txtScriptPath = App.Path & "\Database\Exports\" & Me.cboTable.Text & ".csv"
    .ShowSave
End With

Me.txtScriptPath.Text = CommonDialog1.FileName
Exit Sub

Err_Handler:
    If Err.Number <> 32755 Then
        MsgBox "The export file was not selected: " & Err.Description, vbCritical + vbOKOnly, "Error"
    End If
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    Me.Caption = Me.Caption & " for database server:  " & CurrentDatabase.servername
    Call LoadComboFromSQL("select name from sysobjects where type='v' and name not like 'sys%' " _
        & " and name not like 'view_function%'  order by name", Me.cboTable)
End Sub

Private Sub ExportView(sql As String, FileDesc As String)
On Error GoTo Err_Handler

   
   Open FileDesc For Output As #1
   
   Dim rs As New ADODB.Recordset
   Dim PrintLine As String
   Dim i As Long
   Dim FieldName As String
   
   Screen.MousePointer = vbHourglass
   
   rs.Open sql, gConn, adOpenForwardOnly, adLockReadOnly
   
   PrintLine = ""
   If rs.EOF = False Then
       'print the headers
       For i = 0 To rs.Fields.Count - 1
       
           FieldName = uct(rs(i).Name)
           
           If FieldName = "OBJECTID" Or _
              FieldName = "USERNAME" Or _
              FieldName = "PARENTOBJECTTYPEID" Or _
              FieldName = "PARENTID" Or _
              FieldName = "OBJECTTYPEID" Or _
              FieldName = "PERSONID" Or _
              FieldName = "OBJECTLINKID" Or _
              FieldName = "INSTID" Then
              '//ignore
           Else
                If PrintLine = "" Then
                    PrintLine = """" & rs(i).Name & """"
                Else
                    PrintLine = PrintLine & "," & """" & rs(i).Name & """"
                End If
           End If
       Next i
       Print #1, PrintLine
       Print #1, ""
   End If
   
   PrintLine = ""
   Dim DataValue As String
   
   While rs.EOF = False
   
       For i = 0 To rs.Fields.Count - 1
           FieldName = uct(rs(i).Name)
           DataValue = nchk(rs(i))

           If FieldName = "OBJECTID" Or _
              FieldName = "USERNAME" Or _
              FieldName = "PARENTOBJECTTYPEID" Or _
              FieldName = "PARENTID" Or _
              FieldName = "OBJECTTYPEID" Or _
              FieldName = "PERSONID" Or _
              FieldName = "OBJECTLINKID" Or _
              FieldName = "INSTID" Then
              '//ignore
           Else
                If PrintLine = "" Then
                    PrintLine = """" & DataValue & """"
                Else
                    PrintLine = PrintLine & "," & """" & DataValue & """"
                End If
           End If
       Next i
       Print #1, PrintLine
       PrintLine = ""
       rs.MoveNext
   Wend
   rs.Close
   
   Close #1
   
   Screen.MousePointer = vbNormal
  'ExportView = True
   Exit Sub
   
Err_Handler:
    MsgBox "010-" & gcOperCodeDBDataExport & Err.Description, vbCritical + vbOKOnly, "Error"

   ' PrintCSV = ""

End Sub






