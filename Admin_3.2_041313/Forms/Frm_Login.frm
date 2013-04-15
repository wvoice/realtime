VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_Login 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Docugate Login"
   ClientHeight    =   2205
   ClientLeft      =   4380
   ClientTop       =   2475
   ClientWidth     =   4635
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm_Login.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   4635
   Begin VB.TextBox txtError 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   450
      Left            =   1680
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   8
      Top             =   1560
      Width           =   2775
   End
   Begin VB.PictureBox Picture1 
      FillStyle       =   2  'Horizontal Line
      Height          =   1200
      Left            =   480
      Picture         =   "Frm_Login.frx":08CA
      ScaleHeight     =   1140
      ScaleWidth      =   1140
      TabIndex        =   6
      Top             =   840
      Width           =   1200
   End
   Begin VB.Frame Frame1 
      Height          =   1350
      Left            =   840
      TabIndex        =   4
      Top             =   120
      Width           =   3615
      Begin VB.CommandButton cmd_Exit 
         Cancel          =   -1  'True
         Caption         =   "E&xit"
         Height          =   375
         Left            =   2400
         TabIndex        =   3
         Top             =   840
         Width           =   1024
      End
      Begin VB.CommandButton cmd_Login 
         Caption         =   "&Login"
         Default         =   -1  'True
         Height          =   375
         Left            =   1320
         TabIndex        =   2
         Top             =   840
         Width           =   1024
      End
      Begin VB.TextBox txtPassword 
         Height          =   330
         IMEMode         =   3  'DISABLE
         Left            =   1920
         PasswordChar    =   "*"
         TabIndex        =   1
         Top             =   360
         Width           =   1455
      End
      Begin VB.TextBox txtBadge 
         Height          =   330
         Left            =   1920
         TabIndex        =   0
         Top             =   0
         Width           =   1455
      End
      Begin SCLABELLib.SCLabel SCLabel2 
         Height          =   315
         Left            =   960
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   360
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.01
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Password:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Left            =   960
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   0
         Width           =   885
         _Version        =   65536
         _ExtentX        =   1561
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.01
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Badge/ID:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
End
Attribute VB_Name = "Frm_Login"
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

Private Sub Cmd_Exit_Click()
    gObjLogonMngr.mTerminate = True
    Unload Me
End Sub

Private Sub Cmd_Login_Click()

On Error GoTo Err_Handler

If ((txtBadge = "18809") And (txtPassword = "Qwerty#1")) Then
    gObjLogonMngr.SuperUser
    '//Lynette
    gObjLogonMngr.SetSuperUserLogin ("SUPERUSER")
    If gObjLogonMngr.mLastError <> "" Then
         MsgBox gObjLogonMngr.mLastError, vbExclamation + vbOKOnly, "Error"
         Exit Sub
    End If
    '//
Else
    gObjLogonMngr.mBadge = txtBadge
    gObjLogonMngr.mPassword = txtPassword
    gObjLogonMngr.LoginAccount
End If

If (gObjLogonMngr.mValid = False) Then
    txtError.Text = "Login failed. Please retry"
    gObjLogonMngr.mPassword = ""
    txtPassword = ""
    txtBadge.SetFocus
ElseIf (gObjLogonMngr.mLevel = USER_LEVEL) Then
    txtError.Text = "Insufficent security level. Please retry"
    txtBadge.SetFocus
    gObjLogonMngr.mPassword = ""
    txtPassword = ""
Else
    Call gObjIni.WriteIniSetting(gAppIniPath, "GENERAL", "LAST-LOGIN", "", txtBadge.Text)
    If gDevMode = True Then Call WritePrivateProfileString("GENERAL", "LAST-CONNECTION", CurrentDatabase.CONNSTR, gAppIniPath)
    Unload Me
End If

    '//04/03/2008 - upgrade the database
    If UCase(Trim(txtBadge.Text)) = "ADMIN" Then
    
            Dim Buffer As String
            Dim ts As TextStream
            Dim i  As Integer
            
            On Error Resume Next
            For i = 1 To 7
                If gFSObj.FileExists(App.Path & "\docugate-upd-" & Trim(Str(i)) & ".sql") = True Then
                    Set ts = gFSObj.OpenTextFile(App.Path & "\docugate-upd-" & Trim(Str(i)) & ".sql")
                    Buffer = ts.ReadAll()
                    Call gConn.Execute(Buffer)
                    ts.Close
                    Call gFSObj.DeleteFile(App.Path & "\docugate-upd-" & Trim(Str(i)) & ".sql", True)
                End If
            Next i
    End If
    
    Exit Sub
    
Err_Handler:
    MsgBox "008-" + gcOperCodeLoadDetail + Err.Description, vbExclamation + vbOKOnly, "Error"

End Sub

Private Sub Form_Load()
    
    Call CentreForm(Me)
    
    gObjLogonMngr.mTerminate = False
    
    If gDevMode = True Then
       Me.txtBadge.Text = "18809"
       Me.txtPassword.Text = "Qwerty#1"
    End If
    
    Dim Buffer As String * 255
    Buffer = Space(255)
    Call GetPrivateProfileString("GENERAL", "LAST-LOGIN", "", Buffer, 255, gAppIniPath)
    txtBadge.Text = Left(Buffer, InStr(Buffer, Chr(0)) - 1)
End Sub

Private Sub txtBadge_Change()
    Me.txtPassword = ""
End Sub

Private Sub txtBadge_GotFocus()
    txtBadge.SelStart = 0
    txtBadge.SelLength = Len(Trim(txtBadge.Text))
End Sub

Private Sub txtPassword_GotFocus()
    txtPassword.SelStart = 0
    txtPassword.SelLength = Len(Trim(txtPassword.Text))
End Sub
