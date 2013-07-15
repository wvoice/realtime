VERSION 5.00
Begin {82282820-C017-11D0-A87C-00A0C90F29FC} rpt_ActiveAccounts 
   Caption         =   "ActiveReport1"
   ClientHeight    =   7590
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   15015
   _ExtentX        =   26485
   _ExtentY        =   13388
   SectionData     =   "rpt_ActiveAccounts.dsx":0000
End
Attribute VB_Name = "rpt_ActiveAccounts"
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

Dim SysDate As Variant
Dim TranRs As New ADODB.Recordset

Private Sub ActiveReport_Initialize()
    DoEvents
    Me.Caption = UCase("Active Accounts")
    Me.txtAppInfo.Text = gAppVersion
    Me.WindowState = 2
End Sub

Private Sub ActiveReport_ReportEnd()
    TranRs.Close
    Set TranRs = Nothing
End Sub

Private Sub ActiveReport_ReportStart()

  On Error GoTo Err_Handler
    
    TranRs.Open "Select acc_badge,acc_firstname,acc_lastname,ou_name,acc_funds from docugate_acc_view order by acc_lastname", gConn, adOpenForwardOnly, adLockReadOnly
 
Err_Handler:
    If (Err.Number <> 0) Then
       MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
       Err.Clear
    End If
    
End Sub

Private Sub Detail_Format()

  On Error GoTo Err_Handler
     
    If TranRs.EOF = False Then
       
       Me.txtAccountNum = nchk(TranRs!acc_badge)
       Me.txtFirstName = nchk(TranRs!acc_firstname)
       Me.txtLastName = nchk(TranRs!acc_lastname)
       Me.txtOU = numchk(TranRs!OU_NAME)
       Me.txtBalance = Format(numchk(TranRs!acc_funds), "#,##0.00")
       Me.Detail.PrintSection
       TranRs.MoveNext
    End If
    
Err_Handler:
    If (Err.Number <> 0) Then
       MsgBox Err.Description, vbExclamation + vbOKOnly, "Error"
       Err.Clear
    End If
    
End Sub

Private Sub PageFooter_Format()
    Me.txtPage.Text = "Page " & Trim(Str(Me.pageNumber)) & " of "
End Sub



