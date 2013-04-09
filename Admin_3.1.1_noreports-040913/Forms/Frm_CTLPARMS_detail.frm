VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CTLPARMS_detail 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Global Parameters"
   ClientHeight    =   7050
   ClientLeft      =   3690
   ClientTop       =   2475
   ClientWidth     =   8280
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000E&
   Icon            =   "Frm_CTLPARMS_detail.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7050
   ScaleWidth      =   8280
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
      Left            =   5040
      TabIndex        =   33
      Top             =   6480
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
      Left            =   6600
      TabIndex        =   32
      Top             =   6480
      Width           =   1455
   End
   Begin VB.Frame Frame2 
      Caption         =   "Matter Prompt:"
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   360
      TabIndex        =   28
      Top             =   4320
      Width           =   7455
      Begin VB.CheckBox chk_CTLPARM_MATTERSCROLLENABLED 
         Caption         =   "Scrollable"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5640
         TabIndex        =   13
         Top             =   480
         Width           =   1215
      End
      Begin VB.CheckBox chk_CTLPARM_MATTERENABLED 
         Caption         =   "Enabled"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5640
         TabIndex        =   12
         Top             =   200
         Width           =   1095
      End
      Begin VB.TextBox txt_CTLPARM_MATTERPROMPT 
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
         Left            =   240
         TabIndex        =   11
         Top             =   360
         Width           =   5175
      End
   End
   Begin VB.Frame Frame1 
      Height          =   6375
      Left            =   120
      TabIndex        =   22
      Top             =   0
      Width           =   7935
      Begin VB.CheckBox chk_F3TASK 
         Caption         =   "F3 Task"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   2520
         TabIndex        =   19
         Top             =   6000
         Width           =   1575
      End
      Begin VB.ComboBox Cbm_ACC 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         ItemData        =   "Frm_CTLPARMS_detail.frx":08CA
         Left            =   1560
         List            =   "Frm_CTLPARMS_detail.frx":08D4
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   0
         Top             =   360
         Width           =   4000
      End
      Begin VB.Frame Frame5 
         Caption         =   "ID Prompt:"
         ForeColor       =   &H80000008&
         Height          =   855
         Left            =   240
         TabIndex        =   31
         Top             =   1560
         Width           =   7455
         Begin VB.TextBox txt_CTLPARM_IDPROMPT 
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
            Left            =   240
            TabIndex        =   4
            Top             =   360
            Width           =   5175
         End
         Begin VB.CheckBox chk_CTLPARM_IDENABLED 
            Caption         =   "ID Enabled"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   5640
            TabIndex        =   5
            Top             =   360
            Width           =   1572
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Pin Prompt:"
         ForeColor       =   &H80000008&
         Height          =   855
         Left            =   240
         TabIndex        =   30
         Top             =   2400
         Width           =   7455
         Begin VB.CheckBox chk_CTLPARM_PINENABLED 
            Caption         =   "Pin Enabled"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   5640
            TabIndex        =   7
            Top             =   360
            Width           =   1452
         End
         Begin VB.TextBox txt_CTLPARM_PINPROMPT 
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
            Left            =   240
            TabIndex        =   6
            Top             =   360
            Width           =   5175
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Client Prompt:"
         ForeColor       =   &H80000008&
         Height          =   855
         Left            =   240
         TabIndex        =   29
         Top             =   3360
         Width           =   7455
         Begin VB.TextBox txt_CTLPARM_CLIENTPROMPT 
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
            Left            =   240
            TabIndex        =   8
            Top             =   360
            Width           =   5175
         End
         Begin VB.CheckBox chk_CTLPARM_CLIENTENABLED 
            Caption         =   "Enabled"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   5640
            TabIndex        =   9
            Top             =   200
            Width           =   1095
         End
         Begin VB.CheckBox chk_CTLPARM_CLIENTSCROLLENABLED 
            Caption         =   "Scrollable"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   9
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   5640
            TabIndex        =   10
            Top             =   480
            Width           =   1215
         End
      End
      Begin VB.CheckBox chk_CTLPARM_AUTORELEASE 
         Caption         =   "Auto Release"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2520
         TabIndex        =   17
         Top             =   5280
         Width           =   1575
      End
      Begin VB.CheckBox chk_CTLPARM_ACCOUNTSCROLL 
         Caption         =   "Account Scroll"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   6000
         Width           =   1575
      End
      Begin VB.CheckBox chk_CTLPARM_RELEASEMODE 
         Caption         =   "Release Mode"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   2520
         TabIndex        =   18
         Top             =   5640
         Width           =   1575
      End
      Begin VB.CheckBox chk_CTLPARM_AUTOMODE 
         Caption         =   "Auto Mode"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H8000000E&
         Height          =   255
         Left            =   240
         TabIndex        =   15
         Top             =   5640
         Width           =   1575
      End
      Begin VB.CheckBox chk_CTLPARM_USDATE 
         Caption         =   "US Date"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   5280
         Width           =   1575
      End
      Begin VB.TextBox txt_CTLPARM_USERIDMODE 
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
         Left            =   6600
         TabIndex        =   21
         Top             =   5760
         Width           =   1128
      End
      Begin VB.TextBox txt_CTLPARM_COPYTIMEOUT 
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
         Left            =   6600
         TabIndex        =   20
         Top             =   5400
         Width           =   1128
      End
      Begin VB.CheckBox chk_CTLPARM_ACCOUNTENABLED 
         Caption         =   "Account Enabled"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   5880
         TabIndex        =   1
         Top             =   360
         Width           =   1935
      End
      Begin VB.TextBox txt_CTLPARM_COMPANY 
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
         Left            =   1560
         TabIndex        =   3
         Top             =   1080
         Width           =   4005
      End
      Begin VB.TextBox txt_CTLPARM_PIN 
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
         IMEMode         =   3  'DISABLE
         Left            =   1560
         PasswordChar    =   "*"
         TabIndex        =   2
         Top             =   720
         Width           =   4005
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   240
         TabIndex        =   23
         Top             =   360
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Account:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   1
         Left            =   240
         TabIndex        =   24
         Top             =   720
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Pin:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   7
         Left            =   240
         TabIndex        =   25
         Top             =   1080
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Company:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   3
         Left            =   4800
         TabIndex        =   26
         Top             =   5400
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483640
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Copy Time Out:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   5
         Left            =   4800
         TabIndex        =   27
         Top             =   5760
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         Caption         =   "User ID Mode:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   240
      Top             =   6480
   End
End
Attribute VB_Name = "Frm_CTLPARMS_detail"
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

Private Function ValidatePosNumTxtBLANK(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If NumericTxt.Text <> "" Then
        If Not IsNumeric(NumericTxt.Text) Then
            NumericTxt.Text = ""
            MsgBox "Specify a positive numeric value or no value!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
        Else
            If Val(NumericTxt.Text) < 0 Then
                NumericTxt.Text = ""
                MsgBox "Specify a positive numeric value or no value!", vbExclamation + vbOKOnly, "Data Error"
                NumericTxt.SetFocus
            End If
        End If
    End If
End Function

Private Function ValidatePosNumTxt(NumericTxt As TextBox)
On Error Resume Next
    NumericTxt.Text = Trim(NumericTxt.Text)
    If Not IsNumeric(NumericTxt.Text) Then
        NumericTxt.Text = "1.00"
        MsgBox "Specify a positive numeric or zero value!", vbExclamation + vbOKOnly, "Data Error"
        NumericTxt.SetFocus
    Else
        If Val(NumericTxt.Text) < 0 Then
            NumericTxt.Text = "1.00"
            MsgBox "Specify a positive numeric or zero value!", vbExclamation + vbOKOnly, "Data Error"
            NumericTxt.SetFocus
        End If
    End If
End Function


Private Sub Cmd_Cancel_Click()
    Unload Me
End Sub

Private Sub Cmd_Process_Click()
    If gObjCtrlParams.SaveCtrlParms(Me) = False Then
        If gObjCtrlParams.mLastError <> "" Then
            MsgBox gObjCtrlParams.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
    Else
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    m_Entity = "Organizational Unit"
End Sub

Private Sub txt_CTLPARM_COMPANY_GotFocus()
    Call HighLightField(txt_CTLPARM_COMPANY)
End Sub

Private Sub txt_CTLPARM_COPYTIMEOUT_GotFocus()
    Call HighLightField(txt_CTLPARM_COPYTIMEOUT)
End Sub

Private Sub txt_CTLPARM_COPYTIMEOUT_LostFocus()
    If Not IsNumeric(Trim(txt_CTLPARM_COPYTIMEOUT.Text)) Then txt_CTLPARM_COPYTIMEOUT.Text = ""
End Sub

Private Sub txt_CTLPARM_IDPROMPT_GotFocus()
    Call HighLightField(txt_CTLPARM_IDPROMPT)
End Sub

'Private Sub txt_CTLPARM_PIN_Lostfocus()
'    Call ValidatePosNumTxtBLANK(txt_CTLPARM_PIN)
'End Sub

Private Sub txt_CTLPARM_CLIENTPROMPT_Gotfocus()
    Call HighLightField(txt_CTLPARM_CLIENTPROMPT)
End Sub

Private Sub txt_CTLPARM_MATTERPROMPT_Gotfocus()
    Call HighLightField(txt_CTLPARM_MATTERPROMPT)
End Sub

Private Sub txt_CTLPARM_PINPROMPT_Gotfocus()
    Call HighLightField(txt_CTLPARM_PINPROMPT)
End Sub

Private Sub txt_CTLPARM_USERIDMODE_LostFocus()
    If Not IsNumeric(Trim(txt_CTLPARM_USERIDMODE.Text)) Then txt_CTLPARM_USERIDMODE.Text = ""
End Sub

Private Sub txt_CTLPARM_USERIDMODE_GotFocus()
    Call HighLightField(txt_CTLPARM_USERIDMODE)
End Sub

