VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_spc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
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
''
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

Private m_Classname As String
Private m_rs As ADODB.Recordset
Private m_LastError As String
Const ErrCodePrefix = "007-"

Private Sub Class_Initialize()
    m_Classname = "obj_SPC"
End Sub

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property


Public Function ShowGlobals()

On Error GoTo Err_Handler
    m_LastError = ""

    Dim f As New frm_spc
    With f
          Dim i As Integer
          Set m_rs = New ADODB.Recordset
          m_rs.Open "SELECT * FROM dbo.DOCUGATE_GENERAL_SPU_COST", gConn, adOpenStatic, adLockOptimistic
          
          If m_rs.EOF = True Then
                .ctype.Text = "PAGE"
                .camount.Text = Format("0.10", "0.00")
          Else
                .ctype.Text = numchk(m_rs!ctype)
                .camount.Text = Format(numchk(m_rs!camount), "0.00")
              End If
         m_rs.Close
    End With
    
    f.Show vbModal
    ShowGlobals = True
    Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description
End Function


Public Function SaveGlobals(MyForm As frm_spc) As Boolean
    
On Error GoTo Err_Handler
    m_LastError = ""
    
    With MyForm
         Set m_rs = New ADODB.Recordset
         m_rs.Open "SELECT * FROM dbo.DOCUGATE_GENERAL_SPU_COST", gConn, adOpenStatic, adLockOptimistic
         If m_rs.EOF = True Then m_rs.AddNew
          
         m_rs!ctype = MyForm.ctype.Text
         m_rs!camount = MyForm.camount
         m_rs.Update
         m_rs.Close
    End With
    
    SaveGlobals = True
    Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
End Function
