VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Begin VB.Form frm_Disclaimer 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Disclaimer and Limitation of Liability"
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
    
 Disclaimer = "DISCLAIMER" & vbCrLf & _
 "USER expressly acknowledge and agree that use of the software is at USER's sole risk and that the entire risk as to satisfactory quality, " & _
 "performance, accuracy and effort is with USER. The software is provided 'AS IS', with all faults and without warranty of any kind, and NPS, " & _
 "its suppliers and contributors hereby disclaim all warranties and conditions with respect to the SOFTWARE, either express, implied or statutory, " & _
 "including, but not limited to, the implied warranties and/or conditions of merchantability, of satisfactory quality, of fitness for a particular " & _
 "purpose, of accuracy, of quiet enjoyment, of title and non-infringement of third party rights. NPS does not warrant against interference with " & _
 "USERS's enjoyment of the SOFTWARE, that the functions contained in the SOFTWARE will meet USERS requirements, that the operation of the " & _
 "SOFTWARE will be uninterrupted or error-free, or that defects in the SOFTWARE will be corrected. No oral or written information or advice given by NPS, " & _
 "its suppliers and contributors shall create a warranty. Should the software prove defective, USER assumes the entire cost of all necessary servicing, " & _
 "repair or correction. Some jurisdictions do not allow the exclusion of implied warranties or limitations on applicable statutory rights of a consumer, " & _
 "so the above exclusion and limitations may not apply to you. " & _
  vbCrLf & vbCrLf & _
 "LIMITATION OF LIABILITY" & vbCrLf & _
 "To the extent not prohibited by law, in no event shall NPS (including its officers, directors, employees, affiliates, independent contractors, distributors, " & _
 "agents and successors), its suppliers or contributors be liable for personal injury, or any direct, indirect, incidental, exemplary, special, consequential " & _
 "or punitive damages whatsoever, including, without limitation, damages for loss of profits, loss of revenue, loss of data, business interruption, breach of " & _
 "contract ,negligence or any other commercial damages or losses,  arising out of or related to USERS's use or inability to use the SOFTWARE, however caused, " & _
 "regardless of the theory of liability (contract, tort or otherwise) even if NPS has been advised of the possibility of such damages. Some jurisdictions do not " & _
 "allow the limitation of liability for personal  injury,or of incidental or consequential damages, so this limitation may not apply to you.  In no event shall " & _
 "NPS 's total liability to USER for all damages whether in  contract, tort (including negligence), or otherwise, exceed the amount of money received by " & _
 "NPS pursuant to the terms of  this Agreement. The foregoing limitations will apply even if the above stated remedy fails of its essential purpose"
   
 scDisclaimer.Caption = Disclaimer
End Sub

