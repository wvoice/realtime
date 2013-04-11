VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_CTLUNIT_detail_Type1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Control Unit"
   ClientHeight    =   4755
   ClientLeft      =   1725
   ClientTop       =   4755
   ClientWidth     =   7170
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
   Icon            =   "Frm_CTLUNIT_detail_Type1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4755
   ScaleWidth      =   7170
   ShowInTaskbar   =   0   'False
   Begin VB.Frame Frame1 
      Height          =   2292
      Left            =   240
      TabIndex        =   15
      Top             =   1800
      Width           =   6492
      Begin VB.TextBox txt_CTLUNIT_DEVICE 
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
         TabIndex        =   4
         ToolTipText     =   "2"
         Top             =   720
         Width           =   4215
      End
      Begin VB.TextBox txt_CTLUNIT_MODEL 
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
         TabIndex        =   3
         ToolTipText     =   "2"
         Top             =   360
         Width           =   4215
      End
      Begin VB.TextBox txt_CTLUNIT_LOCATION 
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
         TabIndex        =   6
         ToolTipText     =   "4"
         Top             =   1440
         Width           =   4215
      End
      Begin VB.TextBox txt_CTLUNIT_STATUS 
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
         TabIndex        =   7
         ToolTipText     =   "7"
         Top             =   1800
         Width           =   4215
      End
      Begin VB.ComboBox Cbm_OU 
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
         ItemData        =   "Frm_CTLUNIT_detail_Type1.frx":6852
         Left            =   2040
         List            =   "Frm_CTLUNIT_detail_Type1.frx":6854
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   5
         ToolTipText     =   "8"
         Top             =   1080
         Width           =   4215
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   3
         Left            =   240
         TabIndex        =   16
         Top             =   720
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Device:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   9
         Left            =   240
         TabIndex        =   17
         Top             =   1800
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Status:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   5
         Left            =   240
         TabIndex        =   18
         Top             =   1080
         Width           =   1932
         _Version        =   65536
         _ExtentX        =   3408
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Organizational Unit:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   6
         Left            =   240
         TabIndex        =   19
         Top             =   1440
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Location:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   1
         Left            =   240
         TabIndex        =   20
         Top             =   360
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Model:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
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
      TabIndex        =   10
      ToolTipText     =   "11"
      Top             =   4200
      Width           =   1215
   End
   Begin VB.Frame fraTerminalType 
      Caption         =   "<Terminal Type=1>"
      Height          =   1572
      Left            =   240
      TabIndex        =   12
      Top             =   120
      Width           =   6492
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
         TabIndex        =   2
         ToolTipText     =   "4"
         Top             =   1080
         Width           =   4215
      End
      Begin VB.CheckBox chk_CTLUNIT_SPECIAL 
         Caption         =   "Special"
         Height          =   255
         Left            =   5040
         TabIndex        =   11
         Top             =   0
         Width           =   1212
      End
      Begin VB.TextBox txt_CTLUNIT_TERMINALNAME 
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
         ToolTipText     =   "3"
         Top             =   720
         Width           =   4215
      End
      Begin VB.TextBox txt_CTLUNIT_TERMINALID 
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
         Top             =   360
         Width           =   4215
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   0
         Left            =   240
         TabIndex        =   13
         Top             =   360
         Width           =   1932
         _Version        =   65536
         _ExtentX        =   3408
         _ExtentY        =   550
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Terminal ID:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   7
         Left            =   240
         TabIndex        =   14
         Top             =   720
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Terminal Name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   312
         Index           =   4
         Left            =   240
         TabIndex        =   21
         Top             =   1080
         Width           =   1608
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         ForeColor       =   -2147483630
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.75
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
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2160
      Top             =   6960
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
      TabIndex        =   9
      ToolTipText     =   "10"
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_Process 
      Caption         =   "&Process"
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
      TabIndex        =   8
      ToolTipText     =   "9"
      Top             =   4200
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   255
      Left            =   720
      TabIndex        =   22
      Top             =   4320
      Width           =   1215
   End
End
Attribute VB_Name = "Frm_CTLUNIT_detail_Type1"
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
    
    If gObjCtrlUnitMngr.DeleteUnit(gObjCtrlUnitMngr.RecordGUID) = False Then
        Caption = gObjCtrlUnitMngr.mLastError
    Else
        Unload Me
    End If
End Sub

Private Sub Cmd_Process_Click()
    
    If Validate() = False Then Exit Sub
    If gObjCtrlUnitMngr.SaveUnitType1(Me) = False Then
        Caption = gObjCtrlUnitMngr.mLastError
    Else
        Unload Me
    End If
End Sub

Private Function Validate() As Boolean
    If Trim(Me.txt_CTLUNIT_TERMINALNAME.Text) = "" Then
        MsgBox "Specify the Terminate Name of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        txt_CTLUNIT_TERMINALNAME.SetFocus
        Exit Function
    End If
    
    If Trim(Cbm_OU.Text) = "" Then
        MsgBox "Specify the Organizational Unit " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        Cbm_OU.SetFocus
        Exit Function
    End If
    Validate = True
End Function

Private Sub Form_Load()
    Call CentreForm(Me)
    '// The list of terminal types are in the ini file
    '//ClsConfig.ReadIniSetting ("TYPE-OF-TERMINAL")
    
    m_Entity = gTerminalTypes(1)
End Sub

Private Sub Reset_Timer()
    Reset.Enabled = False
    Me.Caption = "&Add Unit"
End Sub



