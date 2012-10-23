VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_CLIENT_MATTER_detail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Client Matter"
   ClientHeight    =   3210
   ClientLeft      =   1530
   ClientTop       =   4500
   ClientWidth     =   6540
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_CLIENT_MATTER_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   6540
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame2 
      Caption         =   "Client:"
      Height          =   735
      Left            =   120
      TabIndex        =   12
      Top             =   120
      Width           =   6255
      Begin SCLABELLib.SCLabel lblClientName 
         Height          =   315
         Left            =   240
         TabIndex        =   13
         Top             =   300
         Width           =   5805
         _Version        =   65536
         _ExtentX        =   10239
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.01
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   ""
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
   End
   Begin VB.CommandButton cmd_Previous 
      Caption         =   "&Previous"
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
      Left            =   2280
      TabIndex        =   11
      Top             =   840
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.CommandButton cmd_Next 
      Caption         =   "&Next"
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
      Left            =   5040
      TabIndex        =   10
      Top             =   840
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Save and Exit"
      Default         =   -1  'True
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
      Left            =   4920
      TabIndex        =   9
      Top             =   2640
      Width           =   1455
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
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
      Left            =   3720
      TabIndex        =   8
      Top             =   2640
      Width           =   1095
   End
   Begin VB.CommandButton Cmd_Delete 
      Caption         =   "&Delete"
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
      Left            =   2520
      TabIndex        =   7
      Top             =   2640
      Width           =   1095
   End
   Begin VB.Frame Frame1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1635
      Left            =   120
      TabIndex        =   3
      Top             =   920
      Width           =   6285
      Begin VB.TextBox txt_CM_MATTER 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1650
         TabIndex        =   0
         Top             =   360
         Width           =   4395
      End
      Begin VB.TextBox txt_CM_DESCRIPTION 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1650
         TabIndex        =   1
         Top             =   720
         Width           =   4395
      End
      Begin VB.TextBox txt_CM_CUSTOM 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   1650
         TabIndex        =   2
         Top             =   1080
         Width           =   4395
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   2
         Left            =   240
         TabIndex        =   4
         Top             =   720
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Description:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   4
         Left            =   240
         TabIndex        =   5
         Top             =   1080
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Custom:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   0
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Matter Code:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
End
Attribute VB_Name = "frm_CLIENT_MATTER_detail"
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

Private m_Entity As String

Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    
    If gObjMatterMngr.DeleteOU(gObjMatterMngr.RecordGUID) = False Then
        Caption = gObjMatterMngr.mLastError
        If gObjMatterMngr.mLastError <> "" Then
            MsgBox gObjMatterMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        
    Else
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()
    If Validate() = False Then Exit Sub
    If gObjMatterMngr.SaveOU(Me) = False Then
        If gObjMatterMngr.mLastError <> "" Then
            MsgBox gObjMatterMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
    Else
        Unload Me
    End If
End Sub

Private Function Validate() As Boolean
    If Trim(Me.txt_CM_MATTER.Text) = "" Then
        MsgBox "Specify the Matter of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_CM_MATTER.SetFocus
        Exit Function
    End If
    
    If gObjMatterMngr.VerifyCM_Exists(Me.txt_CM_MATTER.Text) = True Then
        If gObjMatterMngr.mLastError <> "" Then
            MsgBox gObjMatterMngr.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Function
        End If
        MsgBox "Attempt to create a duplicate " & m_Entity & " Code for this client!", vbExclamation + vbOKOnly, "Error"
        txt_CM_MATTER.SetFocus
        Exit Function
    End If
    
    Validate = True
End Function

Private Sub Form_Load()
    m_Entity = "Client Matter"
    Call CentreForm(Me)
End Sub

Private Sub txt_CM_CUSTOM_GotFocus()
    Call HighLightField(txt_CM_CUSTOM)
End Sub

Private Sub txt_CM_DESCRIPTION_GotFocus()
    Call HighLightField(txt_CM_DESCRIPTION)
End Sub

Private Sub txt_CM_MATTER_GotFocus()
    Call HighLightField(txt_CM_MATTER)
End Sub

Private Sub txt_CM_MATTER_LostFocus()
    txt_CM_MATTER.Text = RemoveQuotes(txt_CM_MATTER.Text)
End Sub
