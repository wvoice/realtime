VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_Disclaimer 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "End User License Agreement"
   ClientHeight    =   6885
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8460
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6885
   ScaleWidth      =   8460
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton Command1 
      Caption         =   "&Close"
      Height          =   375
      Left            =   3360
      TabIndex        =   1
      Top             =   6360
      Width           =   1695
   End
   Begin SCLABELLib.SCLabel scDisclaimer 
      Height          =   6015
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   7935
      _Version        =   65536
      _ExtentX        =   13996
      _ExtentY        =   10610
      _StockProps     =   13
      Caption         =   "SCLabel"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frm_Disclaimer"
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

Public Disclaimer As String

Private Sub Command1_Click()
Unload Me
End Sub

Private Sub Form_Load()
    
 Disclaimer = "END USER LICENSE AGREEMENT" & vbCrLf & _
 "The Software is protected by the copyright laws and treaties of the " & _
 "United States (U.S.) and other countries and is subject to the terms " & _
 "of this Agreement. The Software is licensed to HighTech Accessory Items, Inc. " & _
 vbCrLf & vbCrLf & _
 "The Software may be bundled with other software programs (Bundled " & _
 "Programs). Your license rights with respect to Bundled Programs " & _
 "accompanied by separate license terms are defined by those terms; " & _
 "nothing in this Agreement shall restrict, limit, or otherwise affect " & _
 "any rights or obligations You may have, or conditions to which You may " & _
 "be subject, under such license terms. " & _
 vbCrLf & vbCrLf & _
 "THE SOFTWARE IS ONLY COMPATIBLE WITH CERTAIN COMPUTERS AND OPERATING " & _
 "SYSTEMS. THE SOFTWARE IS NOT WARRANTED FOR NON-COMPATIBLE SYSTEMS. " & _
 "Call HighTech Accessory Items or Your dealer for information about compatibility. " & _
 vbCrLf & vbCrLf

 scDisclaimer.Caption = Disclaimer
End Sub

