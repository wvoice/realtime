VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CTLUNIT_detail_Type4 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Control Unit"
   ClientHeight    =   4920
   ClientLeft      =   4335
   ClientTop       =   2355
   ClientWidth     =   7215
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   10.5
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm_CTLUNIT_detail_Type4.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4920
   ScaleWidth      =   7215
   ShowInTaskbar   =   0   'False
   Begin VB.Frame fraConfigFile 
      Caption         =   "Configuration file settings:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1575
      Left            =   3000
      TabIndex        =   27
      Top             =   1440
      Visible         =   0   'False
      Width           =   4095
      Begin VB.CommandButton cmdCloseConfig 
         Caption         =   "&Hide"
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
         Left            =   240
         TabIndex        =   30
         Top             =   1080
         Width           =   1215
      End
      Begin VB.TextBox txtConfig 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   495
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   28
         Top             =   600
         Width           =   3615
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   8
         Left            =   240
         TabIndex        =   31
         Top             =   320
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   556
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
         Caption         =   "Last saved entry:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.CommandButton cmdConfig 
      Caption         =   "Con&fig"
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
      Left            =   1560
      TabIndex        =   29
      Top             =   4320
      Width           =   1215
   End
   Begin VB.TextBox txt_CTLUNIT_GUID 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6600
      TabIndex        =   26
      Top             =   0
      Visible         =   0   'False
      Width           =   2535
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
      Left            =   480
      TabIndex        =   25
      Top             =   3720
      Visible         =   0   'False
      Width           =   1215
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
      Left            =   480
      TabIndex        =   24
      Top             =   4200
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Height          =   2412
      Left            =   240
      TabIndex        =   17
      Top             =   1800
      Width           =   6735
      Begin VB.CheckBox chk_CTLUNIT_COPYPIN_ENABLED 
         Caption         =   "Copy Pin Enabled"
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
         Height          =   255
         Left            =   4080
         TabIndex        =   8
         Top             =   1200
         Width           =   2535
      End
      Begin VB.ComboBox cbm_KeyBoard 
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
         ItemData        =   "Frm_CTLUNIT_detail_Type4.frx":08CA
         Left            =   2040
         List            =   "Frm_CTLUNIT_detail_Type4.frx":08D4
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   1440
         Width           =   1812
      End
      Begin VB.TextBox txtPulse 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   2040
         TabIndex        =   7
         Text            =   "10"
         Top             =   1800
         Width           =   1812
      End
      Begin VB.TextBox txtReset 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         TabIndex        =   5
         Text            =   "60"
         Top             =   1080
         Width           =   1812
      End
      Begin VB.TextBox txtPort 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         TabIndex        =   4
         Text            =   "1070"
         Top             =   720
         Width           =   4452
      End
      Begin VB.TextBox txtIP 
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         TabIndex        =   3
         Top             =   360
         Width           =   4452
      End
      Begin VB.CheckBox chk_CTLUNIT_REQ_CLIENT 
         Caption         =   "Request Client Code"
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
         Height          =   255
         Left            =   4080
         TabIndex        =   9
         Top             =   1560
         Width           =   2532
      End
      Begin VB.CheckBox chk_CTLUNIT_REQ_MATTER 
         Caption         =   "Request Matter Code"
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
         Height          =   255
         Left            =   4080
         TabIndex        =   10
         Top             =   1920
         Width           =   2535
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   1
         Left            =   240
         TabIndex        =   18
         Top             =   1800
         Width           =   972
         _Version        =   65536
         _ExtentX        =   1714
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Pulse Idle:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   2
         Left            =   240
         TabIndex        =   19
         Top             =   1440
         Width           =   1572
         _Version        =   65536
         _ExtentX        =   2773
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Keyboard Mode:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   3
         Left            =   240
         TabIndex        =   20
         Top             =   1080
         Width           =   972
         _Version        =   65536
         _ExtentX        =   1714
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Connection:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   4
         Left            =   240
         TabIndex        =   21
         Top             =   720
         Width           =   972
         _Version        =   65536
         _ExtentX        =   1714
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Port #:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   5
         Left            =   240
         TabIndex        =   22
         Top             =   360
         Width           =   1572
         _Version        =   65536
         _ExtentX        =   2773
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "IP Address:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.Frame fraTerminalType 
      Caption         =   "<Terminal Type=2>"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1572
      Left            =   240
      TabIndex        =   14
      Top             =   120
      Width           =   6735
      Begin VB.TextBox txt_CTLUNIT_TERMINAL_LOCATION 
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
         Left            =   2040
         TabIndex        =   2
         Top             =   1080
         Width           =   4452
      End
      Begin VB.TextBox txt_CTLUNIT_DESCRIPTION 
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
         Left            =   2040
         TabIndex        =   1
         ToolTipText     =   "4"
         Top             =   720
         Width           =   4452
      End
      Begin VB.TextBox txt_CTLUNIT_SN 
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
         Left            =   2040
         TabIndex        =   0
         ToolTipText     =   "3"
         Top             =   360
         Width           =   4452
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   7
         Left            =   240
         TabIndex        =   15
         Top             =   360
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "DCS Nickname:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   6
         Left            =   240
         TabIndex        =   16
         Top             =   720
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "DCS Description:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   0
         Left            =   240
         TabIndex        =   23
         Top             =   1080
         Width           =   1455
         _Version        =   65536
         _ExtentX        =   2566
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483634
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "DCS Location:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
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
      Left            =   5520
      TabIndex        =   11
      Top             =   4320
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
      Left            =   4200
      TabIndex        =   12
      Top             =   4320
      Width           =   1215
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
      Left            =   2880
      TabIndex        =   13
      Top             =   4320
      Width           =   1215
   End
End
Attribute VB_Name = "Frm_CTLUNIT_detail_Type4"
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

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    
    If gObjCtrlUnitMngr.DeleteUnit(gObjCtrlUnitMngr.RecordGUID) = False Then
        If gObjCtrlUnitMngr.mLastError <> "" Then
            MsgBox gObjCtrlUnitMngr.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Sub
        End If
    Else
        Call gObjIni.Delete_ini_entry(gAppIniPath, "MCR-STATIONS", gObjCtrlUnitMngr.RecordGUID)
        If gObjCtrlUnitMngr.mLastError <> "" Then
            MsgBox gObjCtrlUnitMngr.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Sub
        End If
        
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()

On Error GoTo Err_Handler
    If Validate() = False Then Exit Sub

    '// save the values to the database
    If gObjCtrlUnitMngr.SaveUnitType2(Me) = False Then
        If gObjCtrlUnitMngr.mLastError <> "" Then
            MsgBox gObjCtrlUnitMngr.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Sub
        End If
    Else

        '// write the values to the ini file
        '//
        Dim Line As String
        'Line = txtIP & ";" & txtPort & ";" & txtReset _
        '    & ";0;0;" & cbm_KeyBoard.Text & ";" & txtPulse & ";0;" _
        '    & Trim(Str(chk_CTLUNIT_COPYPIN_ENABLED.Value))
        
        '//Below Changed made 11-18-2008
        '//27/02/2008 - as per email instruction from Jeff
        'Line = txtIP & ";" & txtPort & ";" & txtReset _
            '& ";0;0;" & cbm_KeyBoard.Text & ";" & txtPulse & ";" _
            '& Trim(Str(chk_CTLUNIT_COPYPIN_ENABLED.Value)) & ";" _
            '& Trim(Str(chk_CTLUNIT_REQ_CLIENT.Value)) & ";" _
            '& Trim(Str(chk_CTLUNIT_REQ_MATTER.Value))
        '//Above Change Made 11-18-2008
        
        '//11/18/2008 - Fix made for the Client/Matter location within the string
        'fix made by Jeff
        'Line = txtIP & ";" & txtPort & ";" & txtReset & ";" _
           ' & Trim(Str(chk_CTLUNIT_REQ_CLIENT.Value)) & ";" _
           ' & Trim(Str(chk_CTLUNIT_REQ_MATTER.Value)) & ";" _
           ' & cbm_KeyBoard.Text & ";" & txtPulse & ";" _
           ' & Trim(Str(chk_CTLUNIT_COPYPIN_ENABLED.Value)) & ";" _
           ' & "0" & ";" _
           ' & "0"
        
        '//03/03/2009 - fix to client value location in DocuGate.ini
        Line = txtIP & ";" & txtPort & ";" & txtReset & ";" _
            & "0" & ";" _
            & Trim(Str(chk_CTLUNIT_REQ_MATTER.Value)) & ";" _
            & cbm_KeyBoard.Text & ";" & txtPulse & ";" _
            & Trim(Str(chk_CTLUNIT_COPYPIN_ENABLED.Value)) & ";" _
            & Trim(Str(chk_CTLUNIT_REQ_CLIENT.Value)) & ";" _
            & "0"
                
                
                
        Call WritePrivateProfileString("MCR-STATIONS", gObjCtrlUnitMngr.RecordGUID, Line, gAppIniPath)
        
           
        Unload Me
    End If
    Exit Sub
    
Err_Handler:
     MsgBox "005-" + "Process():" + Err.Description, vbExclamation + vbOKOnly, "Error"
End Sub

Private Function Validate() As Boolean

    If Trim(Me.txt_CTLUNIT_SN.Text) = "" Then
        MsgBox "Specify the Serial Number of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_CTLUNIT_SN.SetFocus
        Exit Function
    End If
    
    If gObjCtrlUnitMngr.VerifyCtrlUnit_Exists("CTLUNIT_SERIAL_NO", Me.txt_CTLUNIT_SN.Text) = True Then
        MsgBox "Attempt to create a duplicate " & m_Entity & " with this Serial Number!", vbExclamation + vbOKOnly, "Error"
        txt_CTLUNIT_SN.SetFocus
        Exit Function
    End If
        
    If Trim(Me.txtIP.Text) <> "" Then
        If gObjCtrlUnitMngr.VerifyCtrlUnit_Exists("CTLUNIT_IP", Me.txtIP.Text) = True Then
            MsgBox "Attempt to create a duplicate " & m_Entity & " with this IP Address!", vbExclamation + vbOKOnly, "Error"
            txtIP.SetFocus
            Exit Function
        End If
    End If
    
    Validate = True
End Function

Private Sub Cmd_Close_Click()
    Unload Me
End Sub

Private Sub cmdCloseConfig_Click()
    fraConfigFile.Visible = False
End Sub

Private Sub cmdConfig_Click()
    Dim Buffer As String * 255
    Buffer = Space(255)
    Call GetPrivateProfileString("MCR-STATIONS", gObjCtrlUnitMngr.RecordGUID, "", Buffer, 255, gAppIniPath)
    Me.txtConfig.Text = Left(Buffer, InStr(Buffer, Chr(0)) - 1)
    fraConfigFile.Visible = True
End Sub

Private Sub Form_Load()
    Call CentreForm(Me)
    '//gObjIni.ReadIniSetting ("TYPE-OF-TERMINAL")
    m_Entity = gTerminalTypes(2)
End Sub

Private Sub txt_CTLUNIT_DESCRIPTION_GotFocus()
    Call HighLightField(txt_CTLUNIT_DESCRIPTION)
End Sub

Private Sub txt_CTLUNIT_TERMINAL_LOCATION_GotFocus()
    Call HighLightField(Me.txt_CTLUNIT_TERMINAL_LOCATION)
End Sub

Private Sub txt_CTLUNIT_SN_GotFocus()
    Call HighLightField(txt_CTLUNIT_SN)
End Sub

'Private Sub txt_CTLUNIT_SN_LostFocus()
'    Call ValidatePosNumTxtBLANK(txt_CTLUNIT_SN)
'End Sub

Private Sub txtIP_GotFocus()
    Call HighLightField(txtIP)
End Sub

'Private Sub txtPort_LostFocus()
'    Call ValidatePosNumTxtBLANK(txtPort)
'End Sub

Private Sub txtPort_GotFocus()
    Call HighLightField(txtPort)
End Sub

Private Sub txtPulse_GotFocus()
    Call HighLightField(txtPulse)
End Sub

'Private Sub txtPulse_LostFocus()
'    Call ValidatePosNumTxtBLANK(txtPulse)
'End Sub

'Private Sub txtReset_LostFocus()
'    Call ValidatePosNumTxtBLANK(txtReset)
'End Sub

Private Sub txtReset_GotFocus()
    Call HighLightField(txtReset)
End Sub
