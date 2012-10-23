VERSION 5.00
Begin VB.Form frm_CTLUNIT_SelectType 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Select a Terminal Type"
   ClientHeight    =   3075
   ClientLeft      =   5070
   ClientTop       =   3510
   ClientWidth     =   4815
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frm_CTLUNIT_SelectType.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3075
   ScaleWidth      =   4815
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton Cmd_Next 
      Caption         =   "&Next"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   2400
      Width           =   1092
   End
   Begin VB.CommandButton Cmd_Cancel 
      Cancel          =   -1  'True
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2160
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   2400
      Width           =   1092
   End
   Begin VB.Frame Frame1 
      Height          =   1935
      Left            =   240
      TabIndex        =   5
      Top             =   120
      Width           =   4215
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   375
         Index           =   4
         Left            =   720
         TabIndex        =   6
         Top             =   1440
         Value           =   -1  'True
         Width           =   3012
      End
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   375
         Index           =   3
         Left            =   720
         TabIndex        =   2
         Top             =   1080
         Width           =   3135
      End
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   375
         Index           =   2
         Left            =   720
         TabIndex        =   1
         Top             =   720
         Width           =   3012
      End
      Begin VB.OptionButton optTermType 
         Caption         =   "Option1"
         Height          =   375
         Index           =   1
         Left            =   720
         TabIndex        =   0
         Top             =   360
         Width           =   3135
      End
   End
End
Attribute VB_Name = "frm_CTLUNIT_SelectType"
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

Private Sub Cmd_Next_Click()

    Dim i As Integer
    For i = 1 To 4
        If Me.optTermType(i).Value = True Then
            gObjCtrlUnitMngr.TerminalType = i
        End If
    Next i
    Unload Me
End Sub

Private Sub Form_Load()

    gObjCtrlUnitMngr.TerminalType = 0
    
    Call CentreForm(Me)
    
    Dim i As Integer
    For i = 1 To 4
        Me.optTermType(i).Caption = gTerminalTypes(i)
    Next i
    
End Sub

