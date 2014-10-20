VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_CtrlUnitMngr"
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
Private m_Loaded As Boolean
Private m_rs As ADODB.Recordset
Private m_cmd As ADODB.Command
Private m_LastError As String
Private m_TranOper As Integer
Private m_RecordGUID As String
Private m_SQL As String
Private m_TerminalType As Integer
Const ErrCodePrefix = "005-"

Public Property Get TranOper() As Integer
    TranOper = m_TranOper
End Property

Public Property Let TerminalType(InputVar As Integer)
    m_TerminalType = InputVar
End Property

Public Property Get RecordGUID() As String
    RecordGUID = m_RecordGUID
End Property

Private Sub Class_Initialize()
    m_Classname = "obj_CtrlUnitMngr"
    m_Loaded = False
End Sub

Public Property Get mLastError() As String
   mLastError = m_LastError
End Property

Public Function ShowUnitDetail(TranOper As Integer, RecordGUID As String)

On Error GoTo Err_Handler
    m_LastError = ""
    
    m_TranOper = TranOper
    m_TerminalType = 2
    
    If m_TranOper = gcAddRecord Then
        m_RecordGUID = ""
    Else
        m_RecordGUID = RecordGUID
    End If
    
    
    If m_TerminalType = 1 Then
        With Frm_CTLUNIT_detail_Type1

            .Caption = TranDesc(TranOper) & " Control Unit"
            .fraTerminalType.Caption = "Terminal Type: " & gTerminalTypes(m_TerminalType)
            
            If m_TranOper = gcAddRecord Then
                .Cmd_Delete.Visible = False
            Else
                .Cmd_Delete.Visible = True
            End If
           ' .cmdConfig.Visible = .Cmd_Delete.Visible
            
            Call Mod_Data.LoadComboFromSQL("select OU_NAME from docugate_general_ou", .Cbm_OU)
        
            If TranOper = gcUpdateRecord Then
                Call LoadUnitType1(Frm_CTLUNIT_detail_Type1)
            End If
            .Show vbModal
        End With
    End If
    
    
    If m_TerminalType = 2 Then
        With Frm_CTLUNIT_detail_Type2

            .Caption = TranDesc(TranOper) & " Control Unit"
            .fraTerminalType.Caption = "Terminal Type: " & gTerminalTypes(m_TerminalType)
            
            If m_TranOper = gcAddRecord Then
                If .cbm_KeyBoard.ListCount > 0 Then .cbm_KeyBoard.ListIndex = 0
                .Cmd_Delete.Visible = False
                .cmdConfig.Visible = False
            Else
                .Cmd_Delete.Visible = True
                .cmdConfig.Visible = True
            End If
            
            Call Mod_Data.LoadComboFromSQL("select OU_NAME from docugate_general_ou", .Cbm_OU)
            
            If TranOper = gcUpdateRecord Then
                Call LoadUnitType2(Frm_CTLUNIT_detail_Type2)
                Dim m_SQL As String
                m_SQL = "SELECT ou_name FROM dbo.docugate_general_ctlunit JOIN dbo.docugate_general_ou ON ou_guid = ctlunit_ou_guid WHERE CTLUNIT_GUID='" & m_RecordGUID
            End If
            .Show vbModal
        End With
    End If
    
    
    If m_TerminalType = 3 Then
        With Frm_CTLUNIT_detail_Type3

            .Caption = TranDesc(TranOper) & " Control Unit"
            .fraTerminalType.Caption = "Terminal Type: " & gTerminalTypes(m_TerminalType)
            
            If m_TranOper = gcAddRecord Then
                .Cmd_Delete.Visible = False
            Else
                .Cmd_Delete.Visible = True
            End If
           ' .cmdConfig.Visible = .Cmd_Delete.Visible
            
            Call Mod_Data.LoadComboFromSQL("select OU_NAME from docugate_general_ou", .Cbm_OU)
            
            If TranOper = gcUpdateRecord Then
                Call LoadUnitType3(Frm_CTLUNIT_detail_Type3)
            End If
            .Show vbModal
        End With
    End If
   
    If m_TerminalType = 4 Then
        With frm_ECashier
            .Caption = TranDesc(TranOper) & " Control Unit"
            .Show vbModal
        End With
    End If
    
    ShowUnitDetail = True
    Exit Function
        
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeShowDetail + Err.Description

End Function

Public Function VerifyCtrlUnit_Exists(FieldName As String, FieldValue As String) As Boolean
          
On Error GoTo Err_Handler
   m_LastError = ""
   Dim sql As String
   
   Set m_rs = New ADODB.Recordset
   sql = "SELECT * FROM dbo.docugate_ctlunit_view WHERE " & FieldName & "='" & FieldValue & "'"
   If m_TranOper = gcUpdateRecord Then
        sql = sql & " and CTLUNIT_GUID <> '" & m_RecordGUID & "'"
   End If
        
   m_rs.Open sql, gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = True Then
        VerifyCtrlUnit_Exists = False
   Else
        VerifyCtrlUnit_Exists = True
   End If
   m_rs.Close
   Exit Function
    
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeExists + Err.Description
 
End Function

Public Function DeleteUnit(guid As String) As Boolean
    
On Error GoTo Err_Handler
   m_LastError = ""
   gConn.Execute ("Delete from dbo.docugate_general_ctlunit WHERE CTLUNIT_GUID='" & guid & "'")
   DeleteUnit = True
   Exit Function
    
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeDelete + Err.Description
 
End Function

Public Function LoadUnitType1(MyForm As Frm_CTLUNIT_detail_Type1)

On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   
   m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view WHERE CTLUNIT_GUID='" & _
        m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   With MyForm
        
         Call SetComboListItem(nchk(m_rs!OU_NAME), .Cbm_OU)
        .txt_CTLUNIT_DEVICE = nchk(m_rs!CTLUNIT_DEVICE)
        '.txt_CTLUNIT_GUID = nchk(m_rs!CTLUNIT_GUID)
        .txt_CTLUNIT_MODEL = nchk(m_rs!CTLUNIT_MODEL)
        .txt_CTLUNIT_TERMINALNAME = nchk(m_rs!CTLUNIT_TERMINALNAME)
        .txt_CTLUNIT_LOCATION = nchk(m_rs!CTLUNIT_LOCATION)
        .txt_CTLUNIT_DESCRIPTION = nchk(m_rs!CTLUNIT_DESCRIPTION)
        .chk_CTLUNIT_SPECIAL.Value = numchk(m_rs!CTLUNIT_SPECIAL)
        .txt_CTLUNIT_STATUS = nchk(m_rs!CTLUNIT_STATUS)
   End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   LoadUnitType1 = True
   Exit Function
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function

Public Function LoadUnitType2(MyForm As Frm_CTLUNIT_detail_Type2)

On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   ' ACL added by Mike on 12/14/11
   m_SQL = "SELECT ctlunit_ou_guid FROM dbo.docugate_general_ctlunit WHERE ctlunit_guid = '" & m_RecordGUID & "'"
   If GetSQLValue(m_SQL) > 0 Then
        m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view JOIN docugate_general_ou ON ctlunit_ou_guid = ou_guid WHERE CTLUNIT_GUID='" & _
            m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   Else
        m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view  WHERE CTLUNIT_GUID='" & _
            m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   End If
'   m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view JOIN docugate_general_ou ON ctlunit_ou_guid = ou_guid WHERE CTLUNIT_GUID='" & _
        m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
'    m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view  WHERE CTLUNIT_GUID='" & _
        m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   ' End ACL added by Mike on 12/14/11
   If m_rs.EOF = False Then
   With MyForm
        '
         Call SetComboListItem(nchk(m_rs!CTLUNIT_KEYBRD_MODE), .cbm_KeyBoard)
         Call SetComboListItem(nchk(m_rs!OU_NAME), .Cbm_OU)
         
        .txt_CTLUNIT_GUID = RemoveBrackets(nchk(m_rs!CTLUNIT_GUID))
        .txt_CTLUNIT_SN = nchk(m_rs!CTLUNIT_SERIAL_NO)
        .txt_CTLUNIT_DESCRIPTION = nchk(m_rs!CTLUNIT_DESCRIPTION)
        .txt_CTLUNIT_TERMINAL_LOCATION = nchk(m_rs!CTLUNIT_LOCATION)
        '.txt_OU_NAME = nchk(m_rs!OU_NAME)
        
        .txtIP = nchk(m_rs!CTLUNIT_IP)
        .txtPort = nchk(m_rs!CTLUNIT_PORT_NO)
        .txtReset = nchk(m_rs!CTLUNIT_CONN_RESET)
        .txtPulse = nchk(m_rs!CTLUNIT_PULSE_IDLE_MIN)
        .chk_CTLUNIT_COPYPIN_ENABLED.Value = numchk(m_rs!CTLUNIT_COPYPIN_ENABLED)
        .chk_CTLUNIT_REQ_CLIENT.Value = numchk(m_rs!CTLUNIT_REQ_CLIENT)
        .chk_CTLUNIT_REQ_MATTER.Value = numchk(m_rs!CTLUNIT_REQ_MATTER)
   End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   
   
   Set m_rs = New ADODB.Recordset
   
   m_rs.Open "SELECT * FROM dbo.docugate_general_ctlunit_custom_pl WHERE CTLUNIT_GUID='" & m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   With MyForm
        .chk_custompl.Value = nchk(m_rs!Enabled)
        .PL(0) = nchk(m_rs!pl1)
        .PL(1) = nchk(m_rs!pl2)
        .PL(2) = nchk(m_rs!pl3)
        .PL(3) = nchk(m_rs!pl4)
   End With
   End If
   m_rs.Close
   Set m_rs = Nothing
      
   LoadUnitType2 = True
   Exit Function
    
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function

Private Function RemoveBrackets(InGUID As String) As String
    RemoveBrackets = Replace(Replace(InGUID, "{", ""), "}", "")
End Function

Public Function LoadUnitType3(MyForm As Frm_CTLUNIT_detail_Type3)

On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   
   m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view WHERE CTLUNIT_GUID='" & _
        m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   With MyForm
        Call SetComboListItem(nchk(m_rs!OU_NAME), .Cbm_OU)
   
       '.txt_CTLUNIT_GUID = m_rs!CTLUNIT_GUID
       .txt_CTLUNIT_TERMINALNAME = m_rs!CTLUNIT_TERMINALNAME
       .txt_CTLUNIT_DESCRIPTION = m_rs!CTLUNIT_DESCRIPTION
       .txt_CTLUNIT_DEVICE = m_rs!CTLUNIT_DEVICE
       .txt_CTLUNIT_IP = m_rs!CTLUNIT_IP
       .txt_CTLUNIT_MAC = m_rs!CTLUNIT_MAC
       .txt_CTLUNIT_SN = m_rs!CTLUNIT_SERIAL_NO
       .txt_CTLUNIT_MODEL = m_rs!CTLUNIT_MODEL
       .txt_CTLUNIT_DEVICE = m_rs!CTLUNIT_DEVICE
       .txt_CTLUNIT_STATUS = m_rs!CTLUNIT_STATUS
       .txt_CTLUNIT_LOCATION = m_rs!CTLUNIT_LOCATION
   End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   LoadUnitType3 = True
   Exit Function
    
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function

Public Function LoadUnitType4(MyForm As Frm_CTLUNIT_detail_Type4)

On Error GoTo Err_Handler
   m_LastError = ""
   Set m_rs = New ADODB.Recordset
   
   m_rs.Open "SELECT * FROM dbo.docugate_ctlunit_view WHERE CTLUNIT_GUID='" & _
        m_RecordGUID & "'", gConn, adOpenStatic, adLockOptimistic
   If m_rs.EOF = False Then
   With MyForm
        
         Call SetComboListItem(nchk(m_rs!CTLUNIT_KEYBRD_MODE), .cbm_KeyBoard)
    
        .txt_CTLUNIT_GUID = RemoveBrackets(nchk(m_rs!CTLUNIT_GUID))
        .txt_CTLUNIT_SN = nchk(m_rs!CTLUNIT_SERIAL_NO)
        .txt_CTLUNIT_DESCRIPTION = nchk(m_rs!CTLUNIT_DESCRIPTION)
        .txt_CTLUNIT_TERMINAL_LOCATION = nchk(m_rs!CTLUNIT_LOCATION)
    
        .txtIP = nchk(m_rs!CTLUNIT_IP)
        .txtPort = nchk(m_rs!CTLUNIT_PORT_NO)
        .txtReset = nchk(m_rs!CTLUNIT_CONN_RESET)
       .txtPulse = nchk(m_rs!CTLUNIT_PULSE_IDLE_MIN)
        .chk_CTLUNIT_COPYPIN_ENABLED.Value = numchk(m_rs!CTLUNIT_COPYPIN_ENABLED)
        .chk_CTLUNIT_REQ_CLIENT.Value = numchk(m_rs!CTLUNIT_REQ_CLIENT)
        .chk_CTLUNIT_REQ_MATTER.Value = numchk(m_rs!CTLUNIT_REQ_MATTER)
   End With
   End If
   m_rs.Close
   Set m_rs = Nothing
   LoadUnitType4 = True
   Exit Function
    
    
Err_Handler:
     m_LastError = ErrCodePrefix + gcOperCodeLoadDetail + Err.Description
 
End Function

Public Function SaveUnitType1(MyForm As Frm_CTLUNIT_detail_Type1) As Boolean
   
On Error GoTo Err_Handler
    m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM docugate_general_ctlunit where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM docugate_general_ctlunit WHERE CTLUNIT_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    With MyForm
        m_rs!CTLUNIT_TERMINALTYPE = m_TerminalType
        m_rs!CTLUNIT_MODEL = Mid(.txt_CTLUNIT_MODEL, 1, 10)
        m_rs!CTLUNIT_TERMINALNAME = Mid(.txt_CTLUNIT_TERMINALNAME, 1, 50)
        m_rs!CTLUNIT_LOCATION = Mid(.txt_CTLUNIT_LOCATION, 1, 50)
        m_rs!CTLUNIT_DESCRIPTION = Mid(.txt_CTLUNIT_DESCRIPTION, 1, 50)
        m_rs!CTLUNIT_SPECIAL = .chk_CTLUNIT_SPECIAL.Value
        m_rs!CTLUNIT_STATUS = Mid(.txt_CTLUNIT_STATUS, 1, 255)
        m_rs!CTLUNIT_DEVICE = Mid(.txt_CTLUNIT_DEVICE, 1, 50)
        If MyForm.Cbm_OU.Text <> "" Then
            m_rs!CTLUNIT_OU_GUID = GetSQLValue("Select OU_GUID from dbo.docugate_general_ou where OU_Name = '" & MyForm.Cbm_OU.Text & "'")
        Else
             m_rs!CTLUNIT_OU_GUID = Null
        End If
        
    End With
   
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
    SaveUnitType1 = True
    Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
End Function

Public Function SaveUnitType2(MyForm As Frm_CTLUNIT_detail_Type2) As Boolean
   
On Error GoTo Err_Handler
    m_LastError = ""
    
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM docugate_general_ctlunit where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM docugate_general_ctlunit WHERE CTLUNIT_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    With MyForm
        m_rs!CTLUNIT_TERMINALTYPE = m_TerminalType
        m_rs!CTLUNIT_SERIAL_NO = UCase(Mid(.txt_CTLUNIT_SN, 1, 50))
        m_rs!CTLUNIT_LOCATION = UCase(Mid(.txt_CTLUNIT_TERMINAL_LOCATION, 1, 50))
        m_rs!CTLUNIT_DESCRIPTION = UCase(Mid(.txt_CTLUNIT_DESCRIPTION, 1, 50))
        
        m_rs!CTLUNIT_IP = UCase(Mid(.txtIP, 1, 50))
        m_rs!CTLUNIT_PORT_NO = Val(.txtPort)
        m_rs!CTLUNIT_CONN_RESET = Val(.txtReset)
        m_rs!CTLUNIT_KEYBRD_MODE = UCase(Mid(.cbm_KeyBoard, 1, 50))
        m_rs!CTLUNIT_PULSE_IDLE_MIN = Val(.txtPulse)
        m_rs!CTLUNIT_COPYPIN_ENABLED = .chk_CTLUNIT_COPYPIN_ENABLED.Value
        m_rs!CTLUNIT_REQ_CLIENT = .chk_CTLUNIT_REQ_CLIENT.Value
        m_rs!CTLUNIT_REQ_MATTER = .chk_CTLUNIT_REQ_MATTER.Value
        If MyForm.Cbm_OU.Text <> "" Then
            m_rs!CTLUNIT_OU_GUID = GetSQLValue("Select OU_GUID from dbo.docugate_general_ou where OU_Name = '" & MyForm.Cbm_OU.Text & "'")
'            m_rs!OU_NAME = GetSQLValue("Select OU_NAME from dbo.docugate_general_ou where OU_Name = '" & MyForm.Cbm_OU.Text & "'")
        Else
             m_rs!CTLUNIT_OU_GUID = Null
        End If
        
    End With
   
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
        
    m_RecordGUID = nchk(GetSQLValue("Select TOP 1 CTLUNIT_GUID from docugate_general_ctlunit" _
        & " where CTLUNIT_SERIAL_NO = '" & UCase(Mid(MyForm.txt_CTLUNIT_SN, 1, 50)) & "'"))
   
    gConn.Execute ("DELETE FROM docugate_general_ctlunit_custom_pl where CTLUNIT_GUID = '" & m_RecordGUID & "'")
    
    Set m_rs = New ADODB.Recordset
    m_rs.Open "SELECT top 1 * FROM docugate_general_ctlunit_custom_pl where 0=1", gConn, adOpenDynamic, adLockOptimistic
    m_rs.AddNew
    m_rs!CTLUNIT_GUID = m_RecordGUID
    
    With MyForm
        m_rs!Enabled = .chk_custompl.Value
        m_rs!pl1 = Mid(.PL(0), 1, 50)
        m_rs!pl2 = Mid(.PL(1), 1, 50)
        m_rs!pl3 = Mid(.PL(2), 1, 50)
        m_rs!pl4 = Mid(.PL(3), 1, 50)
    End With
        
    
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
    
    
    SaveUnitType2 = True
    Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
 
End Function

Public Function SaveUnitType3(MyForm As Frm_CTLUNIT_detail_Type3) As Boolean
On Error GoTo Err_Handler
    m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM docugate_general_ctlunit where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM docugate_general_ctlunit WHERE CTLUNIT_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    With MyForm
        m_rs!CTLUNIT_TERMINALTYPE = m_TerminalType
        m_rs!CTLUNIT_TERMINALNAME = Mid(.txt_CTLUNIT_TERMINALNAME, 1, 50)
        m_rs!CTLUNIT_DESCRIPTION = Mid(.txt_CTLUNIT_DESCRIPTION, 1, 50)
        m_rs!CTLUNIT_DEVICE = Mid(.txt_CTLUNIT_DEVICE, 1, 50)
        m_rs!CTLUNIT_TERMINALTYPE = m_TerminalType
        m_rs!CTLUNIT_IP = Mid(.txt_CTLUNIT_IP, 1, 50)
        m_rs!CTLUNIT_MAC = .txt_CTLUNIT_MAC
        m_rs!CTLUNIT_SN = .txt_CTLUNIT_SN
        m_rs!CTLUNIT_MODEL = Mid(.txt_CTLUNIT_MODEL, 1, 10)
        m_rs!CTLUNIT_DEVICE = Mid(.txt_CTLUNIT_DEVICE, 1, 50)
        m_rs!CTLUNIT_STATUS = Mid(.txt_CTLUNIT_STATUS, 1, 255)
        m_rs!CTLUNIT_LOCATION = Mid(.txt_CTLUNIT_LOCATION, 1, 50)
        
        If MyForm.Cbm_OU.Text <> "" Then
            m_rs!CTLUNIT_OU_GUID = GetSQLValue("Select OU_GUID from dbo.docugate_general_ou where OU_Name = '" & MyForm.Cbm_OU.Text & "'")
        Else
             m_rs!CTLUNIT_OU_GUID = Null
        End If
    End With
   
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
    SaveUnitType3 = True
    Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
End Function

Public Function SaveUnitType4(MyForm As Frm_CTLUNIT_detail_Type4) As Boolean
   
On Error GoTo Err_Handler
    m_LastError = ""
    Set m_rs = New ADODB.Recordset
    
    If m_TranOper = gcAddRecord Then
        m_rs.Open "SELECT top 1 * FROM docugate_general_ctlunit where 0=1", gConn, adOpenDynamic, adLockOptimistic
        m_rs.AddNew
    Else
        m_rs.Open "SELECT * FROM docugate_general_ctlunit WHERE CTLUNIT_GUID='" & m_RecordGUID & "'", gConn, adOpenDynamic, adLockOptimistic
    End If
    
    With MyForm
        m_rs!CTLUNIT_TERMINALTYPE = m_TerminalType
        m_rs!CTLUNIT_SERIAL_NO = UCase(Mid(.txt_CTLUNIT_SN, 1, 50))
        m_rs!CTLUNIT_LOCATION = UCase(Mid(.txt_CTLUNIT_TERMINAL_LOCATION, 1, 50))
        m_rs!CTLUNIT_DESCRIPTION = UCase(Mid(.txt_CTLUNIT_DESCRIPTION, 1, 50))
        
        m_rs!CTLUNIT_IP = UCase(Mid(.txtIP, 1, 50))
        m_rs!CTLUNIT_PORT_NO = Val(.txtPort)
        m_rs!CTLUNIT_CONN_RESET = Val(.txtReset)
        m_rs!CTLUNIT_KEYBRD_MODE = UCase(Mid(.cbm_KeyBoard, 1, 50))
        m_rs!CTLUNIT_PULSE_IDLE_MIN = Val(.txtPulse)
        m_rs!CTLUNIT_COPYPIN_ENABLED = .chk_CTLUNIT_COPYPIN_ENABLED.Value
        m_rs!CTLUNIT_REQ_CLIENT = .chk_CTLUNIT_REQ_CLIENT.Value
        m_rs!CTLUNIT_REQ_MATTER = .chk_CTLUNIT_REQ_MATTER.Value
        
    End With
   
    m_rs.Update
    m_rs.Close
    Set m_rs = Nothing
    
    m_RecordGUID = nchk(GetSQLValue("Select TOP 1 CTLUNIT_GUID from docugate_general_ctlunit" _
       & " where CTLUNIT_SERIAL_NO = '" & UCase(Mid(MyForm.txt_CTLUNIT_SN, 1, 50)) & "'"))
    
    SaveUnitType4 = True
    Exit Function
    
Err_Handler:
   If m_TranOper = gcAddRecord Then
       m_LastError = ErrCodePrefix + gcOperCodeAddNew + Err.Description
   Else
       m_LastError = ErrCodePrefix + gcOperCodeUpdate + Err.Description
   End If
 
End Function
