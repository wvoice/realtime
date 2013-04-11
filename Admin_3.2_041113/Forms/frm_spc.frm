VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_spc 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Form1"
   ClientHeight    =   3300
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6660
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3300
   ScaleWidth      =   6660
   ShowInTaskbar   =   0   'False
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
      Left            =   3480
      TabIndex        =   9
      Top             =   2640
      Width           =   1455
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
      Left            =   5040
      TabIndex        =   8
      Top             =   2640
      Width           =   1455
   End
   Begin VB.Frame Frame5 
      Caption         =   "Server Usage charging:"
      Height          =   2295
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   6255
      Begin VB.TextBox camount 
         Height          =   375
         Left            =   4440
         TabIndex        =   7
         Text            =   "Text1"
         Top             =   840
         Width           =   1575
      End
      Begin VB.ComboBox ctype 
         Height          =   315
         ItemData        =   "frm_spc.frx":0000
         Left            =   4440
         List            =   "frm_spc.frx":000A
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   480
         Width           =   1575
      End
      Begin VB.PictureBox Picture1 
         AutoSize        =   -1  'True
         BackColor       =   &H8000000A&
         BorderStyle     =   0  'None
         Height          =   480
         Left            =   240
         Picture         =   "frm_spc.frx":0019
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   1
         Top             =   1440
         Width           =   480
      End
      Begin SCLABELLib.SCLabel lblPP 
         Height          =   315
         Index           =   0
         Left            =   360
         TabIndex        =   2
         Top             =   480
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Server usage charge method:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblPP 
         Height          =   315
         Index           =   1
         Left            =   360
         TabIndex        =   3
         Top             =   840
         Width           =   3645
         _Version        =   65536
         _ExtentX        =   6429
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Server usage charge amount:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   4200
         TabIndex        =   4
         Top             =   840
         Width           =   285
         _Version        =   65536
         _ExtentX        =   503
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "$ "
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   675
         Index           =   11
         Left            =   960
         TabIndex        =   5
         Top             =   1440
         Width           =   5085
         _Version        =   65536
         _ExtentX        =   8969
         _ExtentY        =   1191
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   $"frm_spc.frx":0616
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   -1  'True
      End
   End
End
Attribute VB_Name = "frm_spc"
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

Private Sub Cmd_Cancel_Click()
Unload Me
End Sub

Private Sub Cmd_Process_Click()
  If gObjSpc.SaveGlobals(Me) = True Then
        If gObjSpc.mLastError <> "" Then
            MsgBox gObjSpc.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Unload Me
    End If
End Sub

Private Sub Form_Load()
Call CentreForm(Me)
    Me.Caption = "DocuGate - Server Usage"
End Sub


