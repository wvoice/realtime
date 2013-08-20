VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form Frm_ACCOUNT_fund 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fund Account"
   ClientHeight    =   6465
   ClientLeft      =   6450
   ClientTop       =   3765
   ClientWidth     =   6420
   Icon            =   "Frm_Fund_Account.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6465
   ScaleWidth      =   6420
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
      Left            =   3240
      TabIndex        =   53
      Top             =   6000
      Width           =   1455
   End
   Begin VB.ListBox List1 
      Height          =   255
      ItemData        =   "Frm_Fund_Account.frx":08CA
      Left            =   3600
      List            =   "Frm_Fund_Account.frx":08D7
      TabIndex        =   50
      Top             =   6240
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.ComboBox cmb_test 
      Height          =   315
      ItemData        =   "Frm_Fund_Account.frx":08F2
      Left            =   1320
      List            =   "Frm_Fund_Account.frx":08F4
      TabIndex        =   49
      Text            =   "test"
      Top             =   6120
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox txt_DefaultDevice 
      Height          =   285
      Left            =   3360
      TabIndex        =   48
      Top             =   7440
      Visible         =   0   'False
      Width           =   855
   End
   Begin SCLABELLib.SCLabel scl_Activity 
      Height          =   255
      Left            =   5520
      TabIndex        =   47
      Top             =   7080
      Visible         =   0   'False
      Width           =   615
      _Version        =   65536
      _ExtentX        =   1085
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   ""
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_TimeLabel 
      Height          =   255
      Left            =   4440
      TabIndex        =   46
      Top             =   7080
      Visible         =   0   'False
      Width           =   735
      _Version        =   65536
      _ExtentX        =   1296
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   ""
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel scl_Cashier 
      Height          =   255
      Left            =   3000
      TabIndex        =   45
      Top             =   7080
      Visible         =   0   'False
      Width           =   1095
      _Version        =   65536
      _ExtentX        =   1931
      _ExtentY        =   450
      _StockProps     =   13
      Caption         =   ""
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin VB.TextBox txt_TransTime 
      Height          =   285
      Left            =   1680
      TabIndex        =   44
      Top             =   7080
      Visible         =   0   'False
      Width           =   855
   End
   Begin VB.TextBox txt_TransDate 
      Height          =   285
      Left            =   480
      TabIndex        =   43
      Top             =   7080
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox txt_FinalBalance 
      Height          =   375
      Left            =   4680
      TabIndex        =   42
      Top             =   6600
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.TextBox txt_BeginBalance 
      Height          =   375
      Left            =   3240
      TabIndex        =   41
      Top             =   6600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox txt_CurBalance 
      Height          =   375
      Left            =   1800
      TabIndex        =   40
      Top             =   6600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.TextBox txt_Account 
      Height          =   375
      Left            =   360
      TabIndex        =   39
      Top             =   6600
      Visible         =   0   'False
      Width           =   1215
   End
   Begin SCLABELLib.SCLabel scl_ActivityType 
      Height          =   135
      Left            =   1200
      TabIndex        =   36
      Top             =   7680
      Visible         =   0   'False
      Width           =   615
      _Version        =   65536
      _ExtentX        =   1085
      _ExtentY        =   238
      _StockProps     =   13
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin VB.TextBox txt_TransAmount 
      Height          =   405
      Left            =   2640
      TabIndex        =   35
      TabStop         =   0   'False
      Top             =   6120
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox txt_BeginningBalance 
      Height          =   375
      Left            =   240
      TabIndex        =   34
      TabStop         =   0   'False
      Top             =   6120
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.CommandButton cmd_FundAdj 
      Caption         =   "Command2"
      Height          =   375
      Left            =   120
      TabIndex        =   33
      Top             =   7560
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.CommandButton cmd_FundReceipt 
      Caption         =   "&Receipt"
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
      Left            =   4680
      TabIndex        =   32
      Top             =   7440
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Frame CC_Frame 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4932
      Left            =   6480
      TabIndex        =   27
      Top             =   120
      Width           =   3525
   End
   Begin VB.Frame Cash_Frame 
      Height          =   1750
      Left            =   120
      TabIndex        =   21
      Top             =   4080
      Width           =   6110
      Begin VB.CommandButton cmdReset 
         Caption         =   "&Reset"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Left            =   5160
         TabIndex        =   22
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$100.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   9
         Left            =   4320
         TabIndex        =   11
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$50.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   8
         Left            =   3480
         TabIndex        =   10
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$20.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   7
         Left            =   2640
         TabIndex        =   9
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$10.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   6
         Left            =   1800
         TabIndex        =   8
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$5.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   5
         Left            =   960
         TabIndex        =   7
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$1.00"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   4
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$.25"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   3
         Left            =   2640
         TabIndex        =   5
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.10"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   2
         Left            =   1800
         TabIndex        =   4
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.05"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   1
         Left            =   960
         TabIndex        =   3
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton CashCmd 
         Caption         =   "$0.01"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   795
      End
      Begin VB.CommandButton ccCmd 
         Caption         =   "&CC"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   645
         Left            =   5160
         TabIndex        =   12
         Top             =   960
         Width           =   795
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "  Account Badge/ID:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2172
      Left            =   120
      TabIndex        =   19
      Top             =   120
      Width           =   6110
      Begin VB.TextBox txt_Firstname 
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   26
         Top             =   480
         Width           =   3885
      End
      Begin VB.TextBox txt_LastName 
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   25
         Top             =   876
         Width           =   3885
      End
      Begin VB.TextBox txt_Email 
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   24
         Top             =   1260
         Width           =   3885
      End
      Begin VB.TextBox txt_ACC_FUNDS 
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
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   23
         Top             =   1656
         Width           =   3885
      End
      Begin VB.CommandButton Cmd_Search 
         Caption         =   "&S"
         Default         =   -1  'True
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   380
         Left            =   5520
         TabIndex        =   20
         Top             =   0
         Width           =   435
      End
      Begin VB.TextBox txt_Badge 
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
         Top             =   0
         Width           =   3345
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   375
         Index           =   1
         Left            =   240
         TabIndex        =   28
         Top             =   480
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   661
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.74
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "First name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   375
         Index           =   2
         Left            =   240
         TabIndex        =   29
         Top             =   840
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   661
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.74
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Last name:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel SCLabel1 
         Height          =   375
         Index           =   4
         Left            =   240
         TabIndex        =   30
         Top             =   1200
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   661
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.74
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Email:"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
      Begin SCLABELLib.SCLabel lblFundBalance 
         Height          =   375
         Left            =   240
         TabIndex        =   31
         Top             =   1680
         Width           =   1695
         _Version        =   65536
         _ExtentX        =   2990
         _ExtentY        =   661
         _StockProps     =   13
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Arial"
            Size            =   9.74
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Caption         =   "Running Balance: $"
         Alignment       =   1
         Enabled         =   -1  'True
         WordWrap        =   0   'False
      End
   End
   Begin VB.CommandButton Cmd_CC_Authorize 
      Caption         =   "&Authorize"
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
      Left            =   7440
      TabIndex        =   14
      Top             =   5160
      Width           =   1215
   End
   Begin VB.CommandButton Cmd_CC_Close 
      Caption         =   "&Close"
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
      Left            =   8760
      TabIndex        =   15
      Top             =   5160
      Width           =   1215
   End
   Begin VB.Frame Frame3 
      Caption         =   "Adjust Fund Balance with:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1695
      Left            =   120
      TabIndex        =   16
      Top             =   2400
      Width           =   6110
      Begin VB.CheckBox chk_enableTransDesc 
         Height          =   255
         Left            =   1920
         TabIndex        =   52
         Top             =   360
         Width           =   270
      End
      Begin VB.TextBox txt_transdesc 
         BackColor       =   &H80000011&
         Enabled         =   0   'False
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
         Left            =   2265
         TabIndex        =   51
         Top             =   330
         Width           =   3720
      End
      Begin VB.CheckBox chk_Receipt 
         Caption         =   "Receipt Required:"
         Height          =   255
         Left            =   240
         TabIndex        =   38
         Top             =   1200
         Width           =   1815
      End
      Begin VB.ComboBox cmb_Printers 
         Height          =   315
         ItemData        =   "Frm_Fund_Account.frx":08F6
         Left            =   2160
         List            =   "Frm_Fund_Account.frx":08F8
         TabIndex        =   37
         Text            =   "cmb_Printers"
         Top             =   1200
         Width           =   3855
      End
      Begin VB.CommandButton cmdCredit 
         Caption         =   "C&redit"
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
         TabIndex        =   18
         Top             =   720
         Width           =   1068
      End
      Begin VB.CommandButton cmdDebit 
         Caption         =   "&Debit"
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
         Left            =   3705
         TabIndex        =   17
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox txt_Amount 
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
         Left            =   120
         TabIndex        =   1
         Top             =   300
         Width           =   1485
      End
   End
   Begin VB.CommandButton Cmd_Close 
      Caption         =   "&Close"
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
      TabIndex        =   13
      Top             =   6000
      Width           =   1455
   End
   Begin VB.Timer Reset 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2640
      Top             =   7440
   End
End
Attribute VB_Name = "Frm_ACCOUNT_fund"
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

Private RunningTotal As Single
Const cHideWidth = 6504
Const cShowWidth = 10308

'09112008 - added by Jeff
Private mFormLoading As Boolean
Private mRunningTotal As Single
Private mJobCost As Double
Private mRefund As Double
'Const cHideWidth = 6765
'Const cShowWidth = 105603
Private m_Acctype As String
Dim X As Printer
Dim d As Printer
Dim PI As Integer
Dim PP As String


Private Sub CashCmd_Click(Index As Integer)
    Select Case Index
    Case 0
            RunningTotal = RunningTotal + 0.01
    Case 1
            RunningTotal = RunningTotal + 0.05
    Case 2
            RunningTotal = RunningTotal + 0.1
    Case 3
            RunningTotal = RunningTotal + 0.25
    Case 4
            RunningTotal = RunningTotal + 1#
    Case 5
            RunningTotal = RunningTotal + 5#
    Case 6
            RunningTotal = RunningTotal + 10#
    Case 7
            RunningTotal = RunningTotal + 20#
    Case 8
            RunningTotal = RunningTotal + 50#
    Case 9
            RunningTotal = RunningTotal + 100#
    End Select
    
    txt_Amount = "$" & CCur(RunningTotal)
  
End Sub

Private Sub ccCmd_Click()
    Me.Width = cShowWidth
    Call CentreForm(Me)
    MsgBox gcFeatureNotAvailable, vbInformation + vbOKOnly, "Information"
End Sub


Private Sub chk_enableTransDesc_Click()
If (chk_enableTransDesc.Value = 1) Then
    txt_transdesc.Enabled = True
    txt_transdesc.BackColor = &H8000000E
    txt_transdesc.SetFocus
Else
    txt_transdesc.Text = ""
    txt_transdesc.Enabled = False
    txt_transdesc.BackColor = &H80000011
End If
    
End Sub

Private Sub Cmd_Cancel_Click()
    gObjFormEvent.Cancelled = True
    gObjFormEvent.FundingBadge = ""
    gObjFormEvent.ShowFundingForm = False
    Unload Me
End Sub

Private Sub Cmd_CC_Authorize_Click()
    Me.Width = cHideWidth
    Call CentreForm(Me)
End Sub

Private Sub Cmd_CC_Close_Click()
    Me.Width = cHideWidth
    Call CentreForm(Me)
End Sub

Private Sub Cmd_Close_Click()
    gObjFormEvent.FundingBadge = ""
    gObjFormEvent.ShowFundingForm = False
    Unload Me
End Sub

'09112008 - added by Jeff
Private Sub cmd_FundReceipt_Click()
 
 If gReceiptNo = "" Then
        'MsgBox "There are no previous receipts!", vbInformation + vbOKOnly, "Receipt"
        'Exit Sub
        If gObjAccountMngr.CashierCheckOut(gObjAccountMngr.mBadge) = True Then
        'Unload Me
        End If
        If gObjAccountMngr.CashierCheckIn(gObjAccountMngr.mBadge, _
        Format(mJobCost, "0.00"), Format(mRefund, "0.00")) = False Then Exit Sub
    
    '// show the fund balance as it is on the accounts table
    lblFundBalance.Caption = "Fund Balance: "
    Me.txt_ACC_FUNDS = gObjAccountMngr.mFunds
    
    'Me.cmd_CheckIn.Enabled = False
    'Me.cmd_PrintReceipt.Enabled = True
    'cmd_CloseChkIn.Caption = "&Close"
    End If
    
    Dim oReceipt As New rpt_Cashier_Funding_Receipt
    With oReceipt
       .PageLeftMargin = gReport_PO_RightMargin
       .PageRightMargin = gReport_LS_RightMargin
       .PageTopMargin = gReport_LS_TopMargin
       .PageBottomMargin = gReport_LS_BottomMargin
       .Printer.Orientation = ddOPortrait
       .Show vbModal
    End With
    
End Sub

Private Sub Cmd_Search_Click()
    
    If Me.txt_Badge.Text <> "" Then
       Call LookupAccount
    Else
      Me.txt_Badge.SetFocus
    End If
    
End Sub

Private Sub cmdCredit_Click()
    
    'added 09122008 - To handle the beginning balance in the transaction report.
    txt_BeginningBalance = "$" & Format(gObjAccountMngr.mFunds, "0.00")
     
     'MsgBox "running balance =" & Format(gObjAccountMngr.mFunds, "0.00")
    
    'added by Jeff - 09122008 - Added to handle the transaction amount for the report.
    
    Me.txt_TransAmount = Me.txt_Amount
     Dim a As String
    a = FormatCurrency(txt_Amount, 2, True, False, True)

     
     'MsgBox "tran amount =" & Me.txt_Amount
     
     'added 09122008 - to label the receipt as a debit activity
    scl_ActivityType.Caption = "The account has been credited by this transaction:"
     
     'MsgBox "receipt has been labeled"
    
    If MsgBox("Are you sure you would like to credit the account with " & a & "?", vbYesNo, "Verify") = vbNo Then Exit Sub
    
    'MsgBox "verify window"
    
    If gObjAccountMngr.CashierAdjustFunds(gObjAccountMngr.mBadge, Val(RemoveCurrency(Me.txt_Amount))) = True Then
       Call gObjAccountMngr.AddCashierJournel(a, gObjAccountMngr.mValidAccGUID, Me.txt_transdesc, "ACCOUNT CREDIT")
        RunningTotal = 0
        Call LookupAccount
    End If
    
     '09122008 - jeff - to load the receipt form
    If chk_Receipt.Value = 1 Then
          Load frm_FundingReceipt
          '09222010 force the correct papersize orientation
          'Version 3.0.4
          Printer.PaperSize = vbPRPSLetter
          Printer.Orientation = vbPRORPortrait
          frm_FundingReceipt.PrintForm
          Unload frm_FundingReceipt
    End If
    
    
    'added by Jeff - 09062008 - Added to handle the request to quickly allow accounts to be reset to zero.
    'txt_Amount = "$" & CCur(RunningTotal)
    
    Cmd_Close.SetFocus
    
End Sub

Private Sub cmdDebit_Click()

    'added 09122008 - To handle the beginning balance in the transaction report.
    txt_BeginningBalance = "$" & Format(gObjAccountMngr.mFunds, "0.00")
         
    'added by Jeff - 09122008 - Added to handle the transaction amount for the report.
    Me.txt_TransAmount = Me.txt_Amount
    
    Dim a As String
    a = FormatCurrency(txt_Amount, 2, True, False, True)
    
    'added 09122008 - to label the receipt as a debit activity
    scl_ActivityType.Caption = "The account has been debited by this transaction:"
         
    If MsgBox("Are you sure you would like to debit the account with " & a & "?", vbYesNo, "Verify") = vbNo Then Exit Sub
    If gObjAccountMngr.CashierAdjustFunds(gObjAccountMngr.mBadge, -1 * Val(RemoveCurrency(Me.txt_Amount))) = True Then
        Call gObjAccountMngr.AddCashierJournel(a, gObjAccountMngr.mValidAccGUID, Me.txt_transdesc, "ACCOUNT DEBIT")
        RunningTotal = 0
        Call LookupAccount
    End If
    
    '09122008 - jeff - to load the receipt form
    If chk_Receipt.Value = 1 Then
          
          Load frm_FundingReceipt
          '09222010 force the correct papersize orientation
          'Version 3.0.4
           Printer.PaperSize = vbPRPSLetter
           Printer.Orientation = vbPRORPortrait
          
          frm_FundingReceipt.PrintForm
          Unload frm_FundingReceipt
    
    End If
    
    'added by Jeff - 09062008 - Added to handle the request to quickly allow accounts to be reset to zero.
    'txt_Amount = "$" & CCur(RunningTotal)
    
    Cmd_Close.SetFocus
        
End Sub

Private Sub cmdReset_Click()
    RunningTotal = 0#
    txt_Amount = "$" & CCur(RunningTotal)
End Sub

Private Sub Form_Activate()

If (gObjFormEvent.FundingBadge <> "") Then
    txt_Badge = gObjFormEvent.FundingBadge
    Call LookupAccount
End If

End Sub

Private Sub Form_Load()
    
    Me.Width = cHideWidth
    Me.Caption = "Fund Account"
    Call CentreForm(Me)
    Call SetButtons(False)
    
    'added09152008 - to print receipts or not.
    chk_Receipt.Enabled = False
    chk_Receipt.Value = 0
    cmb_Printers.Enabled = False
       
    'get the cashier name
    scl_Cashier.Caption = gObjLogonMngr.mFullname
    scl_TimeLabel.Caption = "The time and date of this transaction was as follows:"
      
  '  Call gObjAccountMngr.GetFundingReasons(cbm_Transcode)
    
    Call SetPrinters
    
    
End Sub

Private Sub SetButtons(InputVar As Boolean)
    Dim i As Integer
    For i = 0 To 9
        CashCmd(i).Enabled = InputVar
    Next i
    cmdDebit.Enabled = InputVar
    cmdCredit.Enabled = InputVar
    cmdReset.Enabled = InputVar
    ccCmd.Enabled = InputVar
    
    
    
End Sub

Private Sub SetPrinters()
    'Populate combo box with available printers
    'Dim x As Printer
    Dim d As Printer
    'Dim PI As Integer
    'Dim PP As String
    
    'cmb_Printers.Clear
        
     For Each d In Printers
    txt_DefaultDevice = Printer.DeviceName
    
    '06052009 - commented out
    'txt_DefaultDevice = Printer.DeviceName
    Next
    
 For Each X In Printers
   If X.DeviceName = Printer.DeviceName Then 'txt_DefaultDevice Then
      Set Printer = X
      PI = cmb_Printers.ListIndex
      PP = cmb_Printers.ListIndex
      Exit For
   End If
 Next
    
    
    For Each d In Printers
    'For Each d In Printers
    txt_DefaultDevice = Printer.DeviceName
    
    '06052009 - commented out
    'txt_DefaultDevice = Printer.DeviceName
    'Next
    'd.DeviceName = Printer.DeviceName '--- shows the default printer
    'd.DeviceName = d
    '.DeviceName = d
    If X.DeviceName = d.DeviceName Then
       Set Printer = X
        ' Exit For 'Exit
    End If
    Next
    
'// was already active
    For Each X In Printers
        cmb_Printers.AddItem X.DeviceName
            
    Next
      
        'cmb_Printers.ListIndex = 0
'// end already active

   'Exit For
           
       cmb_Printers.Text = txt_DefaultDevice
       'cmb_Printers. = txt_DefaultDevice
    
    'Exit For
    'rbOrientation(0).Value = True

End Sub

Private Sub cmb_Printers_Click()
   Dim i As Integer
   i = cmb_Printers.ListIndex
   Set Printer = Printers(i)
End Sub

Private Sub Reset_Timer()
    Reset.Enabled = False
    Me.Caption = "Fund Account"
End Sub

Private Sub txt_Amount_LostFocus()
    If Not IsNumeric(RemoveCurrency(txt_Amount.Text)) Then txt_Amount.Text = ""
End Sub

Private Sub txt_Badge_LostFocus()
''    If Me.txt_Badge.Text <> "" Then Call LookupAccount
End Sub
' Below Sub LookupAccount() was commented out on 7/31/2011 by Mike Young
'Private Sub LookupAccount()
'
'    Call gObjAccountMngr.VerifyBadge(Me.txt_Badge)
'    If gObjAccountMngr.mValid = False Then
'        MsgBox "Invalid Badge/ID!", vbExclamation + vbOKOnly, "Invalid"
'        Call SetButtons(False)
'        Me.txt_Badge.SetFocus
'        Exit Sub
'    End If
'
'    ' check that this account is not already logged on
'    '' 3.0.1
'    '' added to version 3.0.1
'    If (gObjAccountMngr.IsLoggedOn() = True) Then
'        MsgBox "Badge/ID has an active logon session!", vbExclamation + vbOKOnly
'        Call SetButtons(False)
'        Me.txt_Badge.SetFocus
'        Exit Sub
'    End If
'
'
'    Me.txt_Firstname = gObjAccountMngr.mFirstname
'    Me.txt_LastName = gObjAccountMngr.mLastname
'    Me.txt_Email = gObjAccountMngr.mEmail
'    Me.txt_ACC_FUNDS = "$" & Format(gObjAccountMngr.mFunds, "0.00")
'
'        'MsgBox "reset the running balnce = " & Me.txt_ACC_FUNDS
'
'    'added by Jeff - 09062008 - Added to handle the request to quickly allow accounts to be reset to zero.
'    Me.txt_Amount = Me.txt_ACC_FUNDS
'
'        'MsgBox "reset the adjustment amount = " & Me.txt_Amount
'
'    'added 09122008 - To handle the quick debit/credit issue
'    'me.txt_Amount = "$" & CCur(RunningTotal)
'
'    'added 09122008 - To handle the beginning balance in the transaction report.
'    'txt_BeginningBalance = "$" & Format(gObjAccountMngr.mFunds, "0.00")
'
'    Me.txt_Amount.SetFocus
'
'    'added 09152008
'    chk_Receipt.Enabled = True
'        'chk_Receipt.Value = 2
'    cmb_Printers.Enabled = True
'
'    Call SetButtons(True)
'End Sub

' New Sub LookupAccount() added by Mike on 7/31/2011
Private Sub LookupAccount()

    Call gObjAccountMngr.VerifyBadge(Me.txt_Badge)
    If gObjAccountMngr.mValid = False Then
        MsgBox "Invalid Badge/ID!", vbExclamation + vbOKOnly, "Invalid"
        Call SetButtons(False)
        Me.txt_Badge.SetFocus
        Exit Sub
    End If
    
    If (gObjAccountMngr.IsLoggedOn() = True) Then
        MsgBox "Badge/ID has an active logon session! Please logout before continuing.", vbExclamation + vbOKOnly
        gConn.Close 'Closing the Db connection to get rid of multiple session problem *added 7/31/2011
        Call SetButtons(False)
        Me.txt_Badge.SetFocus
        Exit Sub
    End If
        
    Me.txt_Firstname = gObjAccountMngr.mFirstname
    Me.txt_LastName = gObjAccountMngr.mLastname
    Me.txt_Email = gObjAccountMngr.mEmail
    Me.txt_ACC_FUNDS = "$" & Format(gObjAccountMngr.mFunds, "0.00")

    Me.txt_Amount.SetFocus

    chk_Receipt.Enabled = True
    cmb_Printers.Enabled = True

    Call SetButtons(True)
End Sub

Private Sub Print_Click()

 On Error GoTo handler
     
   Printer.Font.Name = "Comic Sans MS"
   Printer.PaperSize = vbPRPSLetter
   Printer.Orientation = vbPRORPortrait
   Printer.ScaleMode = vbInches
   Printer.Font.Bold = True
         
   'Start the page heading section
   Printer.Font.Size = 24
   Printer.CurrentX = 1.1
   Printer.Print "RealTime Chargeback Solution Suite"
   Printer.CurrentX = 2.1
   Printer.Print "Account Funding Receipt"
   Printer.Font.Size = 12
   Printer.Print ""
   Printer.Print ""
   'End the page heading section
         
   'start the account details section
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print "Account details:"
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Account Name: " & gObjAccountMngr.mFirstname & " " & "," & " " & gObjAccountMngr.mLastname
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Account Balance: " & "$" & Format(gObjAccountMngr.mFunds, "0.00")
   Printer.Print ""
   'End the account details section
      
   'Start the receipt detail section
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print Frm_ACCOUNT_fund.scl_ActivityType.Caption
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Beginning Balance: " & Me.txt_BeginningBalance
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Amount: " & Format(Me.txt_TransAmount, "Currency")
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Final Balance: " & "$" & Format(gObjAccountMngr.mFunds, "0.00") 'Me.txt_FinalBalance
   Printer.Print ""
   'End the Receipt details section
   
   'Start the timestamp seciton
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print Me.scl_TimeLabel.Caption
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Date: " & MyDate 'txt_TransDate '; Spc(20); "Transaction Time: " & txt_TransTime
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Time: " & MyTime
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Your cashier was: " & scl_Cashier.Caption
   Printer.Print ""
   'End the receipt section
  
  'End the page heading section
   Printer.Print ""
   Printer.Font.Size = 12
   Printer.CurrentX = 0.5
   Printer.Print "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
   Printer.Print ""
  
   'start duplicate copy...
  'Printer.NewPage
     
   Printer.Font.Name = "Comic Sans MS"
   Printer.ScaleMode = vbInches
   Printer.Font.Bold = True
         
   'Start the page heading section
   Printer.Font.Size = 24
   Printer.CurrentX = 1.1
   Printer.Print "RealTime Chargeback Solution Suite"
   Printer.CurrentX = 2.1
   Printer.Print "Account Funding Receipt"
   Printer.Font.Size = 12
   Printer.Print ""
   Printer.Print ""
   
   'start the account details section
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print "Account details:"
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Account Name: " & gObjAccountMngr.mFirstname & " " & "," & " " & gObjAccountMngr.mLastname
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Account Balance: " & "$" & Format(gObjAccountMngr.mFunds, "0.00")
   Printer.Print ""
   'End the account details section
      
   'Start the receipt detail section
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print Frm_ACCOUNT_fund.scl_ActivityType.Caption
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Beginning Balance: " & Me.txt_BeginningBalance
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Amount: " & Format(Me.txt_TransAmount, "Currency")
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Final Balance: " & "$" & Format(gObjAccountMngr.mFunds, "0.00") 'Me.txt_FinalBalance
   Printer.Print ""
   'End the Receipt details section
   
   'Start the timestamp seciton
   Printer.Font.Size = 14
   Printer.CurrentX = 1.5
   Printer.Print Me.scl_TimeLabel.Caption
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Date: " & MyDate 'txt_TransDate '; Spc(20); "Transaction Time: " & txt_TransTime
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Transaction Time: " & MyTime
   Printer.Font.Size = 12
   Printer.CurrentX = 2.2
   Printer.Print "Your cashier was: " & scl_Cashier.Caption
   Printer.Print ""
   'End the receipt section
   
handler:
   
   Printer.EndDoc
     
End Sub

Public Function MyDate() As String
  MyDate = Format(Now, "dd-MMM-yyyy")
End Function

Public Function MyTime() As String
   MyTime = Format(Time$, "Long Time")
End Function


