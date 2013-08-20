VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_AVS_detail 
   Caption         =   "Form1"
   ClientHeight    =   5250
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6285
   LinkTopic       =   "Form1"
   ScaleHeight     =   5250
   ScaleWidth      =   6285
   StartUpPosition =   3  'Windows Default
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
      Left            =   1920
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   4680
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "eCashier Alias/Identifier:"
      Height          =   4455
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   6015
      Begin VB.CommandButton Command1 
         Caption         =   "reset"
         Height          =   375
         Left            =   5040
         TabIndex        =   18
         TabStop         =   0   'False
         Top             =   1920
         Width           =   615
      End
      Begin VB.TextBox txt_avs_funds 
         BackColor       =   &H00C0FFFF&
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
         Left            =   3960
         Locked          =   -1  'True
         TabIndex        =   16
         TabStop         =   0   'False
         Top             =   1920
         Width           =   1005
      End
      Begin VB.TextBox txt_AVS_INSTITUTION 
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
         Left            =   2280
         TabIndex        =   3
         Top             =   1440
         Width           =   3405
      End
      Begin VB.TextBox txt_AVS_LOCATION 
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
         Left            =   2280
         TabIndex        =   2
         Top             =   1080
         Width           =   3405
      End
      Begin VB.TextBox txt_AVS_ADDRESS 
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
         Left            =   2280
         TabIndex        =   1
         Top             =   720
         Width           =   3405
      End
      Begin VB.TextBox txt_AVS_IDENTIFIER 
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
         Left            =   2280
         MaxLength       =   50
         TabIndex        =   0
         Top             =   0
         Width           =   3405
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
         ItemData        =   "frm_AVS_detail.frx":0000
         Left            =   2280
         List            =   "frm_AVS_detail.frx":0002
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   2880
         Width           =   3405
      End
      Begin VB.Frame Frame3 
         Caption         =   "Account Options:"
         Height          =   855
         Left            =   2280
         TabIndex        =   8
         Top             =   3360
         Width           =   3375
         Begin VB.CheckBox chk_Pin_Required 
            Caption         =   "Pin Required"
            Height          =   255
            Left            =   120
            TabIndex        =   14
            TabStop         =   0   'False
            Top             =   480
            Width           =   1575
         End
         Begin VB.CheckBox chk_Enable_Acct_AVS 
            Caption         =   "Enable New Account"
            Height          =   255
            Left            =   120
            TabIndex        =   9
            TabStop         =   0   'False
            Top             =   240
            Visible         =   0   'False
            Width           =   2175
         End
      End
      Begin SCLABELLib.SCLabel lbl_ACC_FIRSTNAME 
         Height          =   315
         Index           =   1
         Left            =   360
         TabIndex        =   10
         Top             =   720
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "eCashier Add:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lbl_ACC_LASTNAME 
         Height          =   315
         Index           =   2
         Left            =   360
         TabIndex        =   11
         Top             =   1080
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "eCashier Loc:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   315
         Index           =   4
         Left            =   360
         TabIndex        =   12
         Top             =   1440
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Institution Desc:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lbl_OU 
         Height          =   315
         Index           =   5
         Left            =   360
         TabIndex        =   13
         Top             =   2880
         Width           =   1725
         _Version        =   65536
         _ExtentX        =   3043
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
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
         Height          =   315
         Index           =   0
         Left            =   2280
         TabIndex        =   17
         Top             =   1920
         Width           =   1605
         _Version        =   65536
         _ExtentX        =   2831
         _ExtentY        =   556
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.76
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Current Balance:"
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
      Left            =   4800
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   4680
      Width           =   1335
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
      Left            =   3360
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   4680
      Width           =   1335
   End
End
Attribute VB_Name = "frm_AVS_detail"
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

Private Sub Cmd_Delete_Click()
    If MsgBox("Are you sure?", vbQuestion + vbYesNo, "Delete") = vbNo Then Exit Sub
    If gObjAccountMngr.DeleteAccount(gObjAccountMngr.RecordGUID) = False Then
        Caption = gObjAccountMngr.mLastError
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
    Else
        Unload Me
    End If

End Sub

Private Sub Cmd_Process_Click()
    
    If Validate() = False Then Exit Sub
    If gObjAccountMngr.SaveAVS(Me) = False Then
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
        End If
        Exit Sub
    Else
        Unload Me
    End If

End Sub

Private Sub Command1_Click()
    txt_avs_funds = "0"
End Sub

Private Sub Form_Load()
        Call CentreForm(Me)
        Frame1.Caption = "eCashier Alias/Identifier:"
        chk_Enable_Acct_AVS.Visible = True
End Sub



Private Function Validate() As Boolean
    If Trim(txt_AVS_IDENTIFIER.Text) = "" Then
        MsgBox "Specify the Alias/Identifier/ID of the AVS Unit!", vbExclamation + vbOKOnly, "Required"
        txt_AVS_IDENTIFIER.SetFocus
        Exit Function
    End If
    
    If Trim(txt_AVS_ADDRESS.Text) = "" Then
        MsgBox "Specify the Address name of the AVS Unit!", vbExclamation + vbOKOnly, "Required"
        txt_AVS_ADDRESS.SetFocus
        Exit Function
    End If
    
    
'    If Trim(Cbm_ACC_TYPE.Text) = "" Then
'        MsgBox "Specify the Type of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
'        Cbm_ACC_TYPE.SetFocus
'        Exit Function
'    End If
    
    If Trim(Cbm_OU.Text) = "" Then
        MsgBox "Specify the Organizational Unit " & " of the " & m_Entity & "!", vbExclamation + vbOKOnly, "Required"
        Cbm_OU.SetFocus
        Exit Function
    End If

    If gObjAccountMngr.VerifyAccBadge_Exists(Me.txt_AVS_IDENTIFIER.Text) = True Then
        If gObjAccountMngr.mLastError <> "" Then
            MsgBox gObjAccountMngr.mLastError, vbExclamation + vbOKOnly, "Error"
            Exit Function
        End If
        MsgBox "Attempt to create a duplicate Alias/Identifier!", vbExclamation + vbOKOnly, "Error"
        txt_AVS_IDENTIFIER.SetFocus
        Exit Function
    End If
        If Not Cbm_OU.Text = "ECASHIER" Then
            MsgBox "When creating an Electronic Cashier please select the 'ECASHIER' OU!", vbExclamation + vbOKOnly, "Error"
            Cbm_OU.SetFocus
            Exit Function
           End If
       
    Validate = True
End Function

