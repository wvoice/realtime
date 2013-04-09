VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frm_DBScript 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Database Schema Scripting"
   ClientHeight    =   2475
   ClientLeft      =   1365
   ClientTop       =   7065
   ClientWidth     =   9285
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_DBScript.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2475
   ScaleWidth      =   9285
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   7200
      TabIndex        =   3
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   5880
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Script to destination file:"
      Height          =   2055
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   8895
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   480
         Top             =   1440
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin VB.CommandButton cmdGetFile 
         Caption         =   "..."
         Height          =   375
         Left            =   8280
         TabIndex        =   4
         Top             =   360
         Width           =   495
      End
      Begin VB.TextBox txtScriptPath 
         Height          =   1050
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   1
         Top             =   360
         Width           =   8055
      End
      Begin VB.Label lblProgress 
         Alignment       =   1  'Right Justify
         Caption         =   "Scripting in progress......"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5760
         TabIndex        =   5
         Top             =   1440
         Visible         =   0   'False
         Width           =   2535
      End
   End
End
Attribute VB_Name = "frm_DBScript"
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
    lblProgress.Caption = "Scripting in progress..."
    Screen.MousePointer = vbHourglass
    
    Dim mClsMSSQLDb As New obj_MSSQLDB
    Call mClsMSSQLDb.ScriptSchema(CurrentDatabase.servername, CurrentDatabase.DBName, _
        False, CurrentDatabase.DBLogin, CurrentDatabase.Password, txtScriptPath.Text)

    Screen.MousePointer = vbNormal
    If mClsMSSQLDb.LastError <> "" Then
        MsgBox mClsMSSQLDb.LastError, vbExclamation + vbOKOnly, "Error"
        Exit Sub
    End If
    
    Set mClsMSSQLDb = Nothing
    
    If gFSObj.FileExists(Me.txtScriptPath.Text) = True Then
        Dim ret As Double
        ret = Shell("notepad.exe " & Me.txtScriptPath.Text, vbNormalFocus)
    Else
        MsgBox "Scripting eror: " & Err.Description, vbExclamation + vbOKOnly, "Error"
        Exit Sub
    End If
   
    lblProgress.Visible = False
    
    Unload Me
    Exit Sub
    
Err_Handler:
    MsgBox "010-" & gcOperCodeDBScript & mClsMSSQLDb.LastError, vbExclamation + vbOKOnly, "Error"
End Sub

Private Sub cmdGetFile_click()

On Error GoTo Err_Handler

With CommonDialog1
    .DialogTitle = "Save script file *.sql"
    .CancelError = True
    .Flags = cdlOFNHideReadOnly
    .Flags = cdlOFNOverwritePrompt
    .Flags = cdlOFNPathMustExist
    .Flags = cdlOFNNoChangeDir
    .Filter = "All Files(*.sql)|*.sql"
    .FilterIndex = 1  '1 = Save and 2 = Open  'This is used to specify which extension is displayed on top.
    .DefaultExt = ".sql"
    .FileName = "DocugateDB" & Format(Now, "yyyymmdd_hhmmss") & ".sql"
   ' .InitDir = Pathy
    .ShowSave
End With

Me.txtScriptPath.Text = CommonDialog1.FileName
Exit Sub

Err_Handler:
    If Err.Number <> 32755 Then
        MsgBox "The script file was not selected: " & Err.Description, vbCritical + vbOKOnly, "Error"
    End If
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    Me.Caption = Me.Caption & " for database server:  " & CurrentDatabase.servername
   
End Sub
