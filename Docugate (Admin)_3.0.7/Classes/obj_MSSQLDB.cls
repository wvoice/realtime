VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_MSSQLDB"
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

Private m_LastError As String
Private bConnected As Boolean

Private oSQLServer As SQLDMO.SQLServer2
Private oBackup As SQLDMO.Backup2
Private oRestore As SQLDMO.Restore2

Dim WithEvents oBackEvents As SQLDMO.Backup2
Attribute oBackEvents.VB_VarHelpID = -1
Dim WithEvents oRestEvents As SQLDMO.Restore2
Attribute oRestEvents.VB_VarHelpID = -1
Const ErrCodePrefix = "010-"

Public Property Get LastError() As String
    LastError = m_LastError
End Property

Private Sub Class_Initialize()
    bConnected = False
    
    Set oSQLServer = Nothing
    Set oBackup = Nothing
    Set oRestore = Nothing
    Set oBackEvents = Nothing
    Set oRestEvents = Nothing

End Sub

Private Sub Class_Terminate()

On Error Resume Next

    If Not oBackEvents Is Nothing Then Set oBackEvents = Nothing
    If Not oRestEvents Is Nothing Then Set oRestEvents = Nothing
    
    If Not oBackup Is Nothing Then Set oBackup = Nothing
    If Not oRestore Is Nothing Then Set oRestore = Nothing
    
    If bConnected Then Disconnect
    If Not oSQLServer Is Nothing Then Set oSQLServer = Nothing
    
End Sub

Private Sub Connect(Server As String, UserLogin As String, Password As String, Integrated As Boolean)
    Debug.Print "Connect " & Server
    
    On Error GoTo errHandler
    m_LastError = ""
    bConnected = False
    
    If bConnected Then Disconnect
    
    'If oSQLServer Is Nothing Then Set oSQLServer = New SQLDMO.SQLServer2
    If oSQLServer Is Nothing Then Set oSQLServer = New SQLDMO.SQLServer

    oSQLServer.LoginSecure = Integrated
    
    If (Integrated) Then
        oSQLServer.Connect Server
    Else
        oSQLServer.Connect Server, UserLogin, Password
    End If
    
    bConnected = True
    Exit Sub
    
errHandler:
     m_LastError = ErrCodePrefix + gcOperCodeDBConnect + Err.Description
End Sub

Private Sub Disconnect()
    On Error Resume Next
    m_LastError = ""
    
    If bConnected Then
        oSQLServer.Disconnect
        bConnected = False
        Set oSQLServer = Nothing
    End If
    
End Sub

Public Sub DropDatabase(database As String)
    On Error GoTo errHandler
    m_LastError = ""
    
    If Not bConnected Then Err.Raise 9999, "Application", "Not connected"
    
    Dim oDatabase As SQLDMO.Database2
    Set oDatabase = oSQLServer.Databases(database)
    
    If Not oDatabase Is Nothing Then
        oDatabase.Remove
    Else
        Err.Raise 9998, "Application", "database does not exist"
    End If
    
    If Not oDatabase Is Nothing Then Set oDatabase = Nothing
    
    Exit Sub
    
errHandler:
     m_LastError = ErrCodePrefix + gcOperCodeDBDrop + Err.Description
End Sub

Public Sub BackupDatabaseToFile(servername As String, DatabaseName As String, IntegratedSecurity As Boolean, _
    Login As String, Password As String, database As String, FileName As String)
    Debug.Print "BackupDatabaseToFile " & database & FileName
    
    On Error GoTo errHandler
    m_LastError = ""
    
    On Error GoTo errHandler
        
    Call Connect(servername, Login, Password, IntegratedSecurity)
    If bConnected = False Then Exit Sub
    
    If oBackup Is Nothing Then Set oBackup = New SQLDMO.Backup2
    If oBackEvents Is Nothing Then Set oBackEvents = oBackup
    
    oBackup.database = database
    oBackup.Files = "c:\backup.bak"
    oBackup.Initialize = True
    oBackup.Action = SQLDMOBackup_Database
    Call oBackup.SQLBackup(oSQLServer)
    
    Set oBackEvents = Nothing
    Set oBackup = Nothing
    
    Call oSQLServer.Disconnect
    Exit Sub

errHandler:
     m_LastError = ErrCodePrefix + gcOperCodeDBBackup + Err.Description
    
    On Error Resume Next
    oSQLServer.Disconnect
End Sub

Public Sub BackupAllDatabases(servername As String, DatabaseName As String, IntegratedSecurity As Boolean, _
    Login As String, Password As String, ScriptFileDestPath As String)
    
    On Error GoTo errHandler
    m_LastError = ""
        
    Call Connect(servername, Login, Password, IntegratedSecurity)
    If bConnected = False Then Exit Sub
    
    Dim oDatabase As SQLDMO.Database2
    Set oDatabase = oSQLServer.Databases(DatabaseName)

    Dim oBackup
    Dim sBAKFilePath
    sBAKFilePath = "C:\Backup"
    Set oSQLServer = CreateObject("SQLDmo.SqlServer")
    Set oBackup = CreateObject("SQLDmo.Backup")
    oSQLServer.LoginSecure = True
    oSQLServer.Connect "(local)"
    For Each oDatabase In oSQLServer.Databases

    If UCase(oDatabase.Name) = "DOCUGATE" Or UCase(oDatabase.Name) = "ADMIN" Then

        oBackup.database = oDatabase.Name

        'remove any previous backup - same as using T-SQL with init

        oBackup.Initialize = True

        'dynamically create the name of the backup file
        
        If gFSObj.FolderExists(sBAKFilePath) = False Then CreateFolder (sBAKFilePath)
        
        oBackup.Files = sBAKFilePath & "\" & oDatabase.Name & "_full_" & Format(Now(), "yyyymmdd_hhmmss") & ".bak"

        'set the action property as needed

        '0 = Full backup

        '1 = Differential

        '2 = Specified files only

        '3 = Log backup

        oBackup.Action = 0
        oBackup.SQLBackup oSQLServer
    End If
Next

Set oBackup = Nothing
oSQLServer.Disconnect
Exit Sub

errHandler:
     m_LastError = ErrCodePrefix + gcOperCodeDBBackup + Err.Description
    On Error Resume Next
    oSQLServer.Disconnect
End Sub

Public Sub RestoreDatabaseFromFile(servername As String, DatabaseName As String, IntegratedSecurity As Boolean, _
    Login As String, Password As String, FileName As String)
    
    On Error GoTo errHandler
    m_LastError = ""
        
    Call Connect(servername, Login, Password, IntegratedSecurity)
    If bConnected = False Then Exit Sub
    
    If oRestore Is Nothing Then Set oRestore = New SQLDMO.Restore2
    If oRestEvents Is Nothing Then Set oRestEvents = oRestore
    
    oRestore.database = DatabaseName
    oRestore.Files = "[" & FileName & "]"
   'oRestore.RelocateFiles = False
    oRestore.ReplaceDatabase = True 'Force restore over existing database


    Call oRestore.SQLRestore(oSQLServer)
    
   'Set oRestEvents = Nothing
    Set oRestore = Nothing
    
    Call oSQLServer.Disconnect
    
    Exit Sub

errHandler:
     m_LastError = ErrCodePrefix + gcOperCodeDBRestore + Err.Description
    
    On Error Resume Next
    oSQLServer.Disconnect
End Sub

Public Sub ScriptSchema(servername As String, DatabaseName As String, IntegratedSecurity As Boolean, _
    Login As String, Password As String, ScriptFileDestPath As String)
    
    On Error GoTo errHandler
    m_LastError = ""
        
    Call Connect(servername, Login, Password, IntegratedSecurity)
    If bConnected = False Then Exit Sub
    
    Dim oDatabase As SQLDMO.Database2
    Set oDatabase = oSQLServer.Databases(DatabaseName)
    
    Dim oTransfer As SQLDMO.Transfer2
    Set oTransfer = New SQLDMO.Transfer2
    
    With oTransfer
        .CopyAllObjects = True
        
        ' implied by CopyAllObjects = False
        '.CopyAllDefaults = False
        '.CopyAllFunctions = False
        '.CopyAllRules = False
        '.CopyAllStoredProcedures = False
        '.CopyAllTables = False
        '.CopyAllTriggers = False
        '.CopyAllUserDefinedDatatypes = False
        '.CopyAllViews = False

        .CopyData = SQLDMOCopyData_False ' SQLDMOCopyData_Append or SQLDMOCopyData_Replace
        .CopySchema = True
        
        .IncludeDB = False
        .IncludeDependencies = False
        .IncludeUsers = False
        .IncludeGroups = False
        .IncludeLogins = False
        
        .DropDestObjectsFirst = False
        
        .ScriptType = SQLDMOScript_Default + _
                        SQLDMOScript_Drops + _
                        SQLDMOScript_NoDRI + _
                        SQLDMOScript_Bindings + _
                        SQLDMOScript_OwnerQualify
                        
        .Script2Type = SQLDMOScript2_Default
        
        Dim oView As SQLDMO.View2
        For Each oView In oDatabase.Views
            If oView.SystemObject = False Then
                .AddObjectByName oView.Name, SQLDMOObj_View, oView.Owner
            End If
        Next
    
    End With
    
    ' single file
    oDatabase.ScriptTransfer oTransfer, SQLDMOXfrFile_SingleFile, ScriptFileDestPath
    
    ' directory
    ' oDatabase.ScriptTransfer oTransfer, SQLDMOXfrFile_SingleFilePerObject, "c:\temp"
    
    Set oTransfer = Nothing
    Set oDatabase = Nothing
    
    Call oSQLServer.Disconnect
    
    Exit Sub

errHandler:
     m_LastError = ErrCodePrefix + gcOperCodeDBScript + Err.Description
    
    On Error Resume Next
    oSQLServer.Disconnect
End Sub

Private Sub oBackEvents_Complete(ByVal message As String)
    Debug.Print "oBackEvents_Complete(" & message & ")"
End Sub

Private Sub oBackEvents_NextMedia(ByVal message As String)
    Debug.Print "oBackEvents_NextMedia(" & message & ")"
End Sub

Private Sub oBackEvents_PercentComplete(ByVal message As String, ByVal Percent As Long)
    Debug.Print "oBackEvents_PercentComplete(" & message & "," & Percent & ")"
End Sub

Private Sub oRestEvents_Complete(ByVal message As String)
    Debug.Print "oRestEvents_Complete(" & message & ")"
End Sub

Private Sub oRestEvents_NextMedia(ByVal message As String)
    Debug.Print "oRestEvents_NextMedia(" & message & ")"
End Sub

Private Sub oRestEvents_PercentComplete(ByVal message As String, ByVal Percent As Long)
    Debug.Print "oRestEvents_PercentComplete(" & message & "," & Percent & ")"
End Sub

