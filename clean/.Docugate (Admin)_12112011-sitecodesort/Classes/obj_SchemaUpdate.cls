VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_SchemaUpdate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private m_Classname As String
Private m_rs As ADODB.Recordset

Private Sub Class_Initialize()
    m_Classname = "obj_206update"
End Sub

Public Function GetVersion() As String
    
    GetVersion = "205"
    
    On Error GoTo Err_Handler
  
    Set m_rs = New ADODB.Recordset
    m_rs.Open "SELECT VERSION FROM dbo.docugate_general_version", gConn, adOpenStatic, adLockOptimistic
          
    If m_rs.EOF = True Then
         GetVersion = "205"
    Else
         GetVersion = nchk(m_rs!Version)
    End If
    
    m_rs.Close
    
Err_Handler:
     Set m_rs = Nothing
End Function
    
Public Function Apply206Direct() As Boolean

On Error GoTo Err_Handler
    
    gConn.Execute "CREATE TABLE dbo.docugate_general_version (VERSION varchar(10))"
    gConn.Execute "INSERT INTO  dbo.docugate_general_version (VERSION) values ('206')"
    
    gConn.Execute "CREATE TABLE dbo.docugate_tran_codes  (GUID uniqueidentifier NOT NULL PRIMARY KEY default(newid()), CODE varchar(10) NOT NULL, REASON varchar(50) NOT NULL)"
    gConn.Execute "CREATE UNIQUE INDEX dbo.idx_tran_codes_code on dbo.docugate_tran_codes(CODE)"
    gConn.Execute "INSERT INTO  dbo.docugate_tran_codes  (CODE,REASON) values ('00000','Unspecified')"
    gConn.Execute "INSERT INTO  dbo.docugate_tran_codes  (CODE,REASON) values ('00001','Standard Debit')"
    gConn.Execute "INSERT INTO  dbo.docugate_tran_codes  (CODE,REASON) values ('00002','Standard Credit')"
    
    gConn.Execute "ALTER TABLE  dbo.docugate_tran_acc_funds ADD ACC_TRANS_CODE VARCHAR(10) NOT NULL DEFAULT '00000'"
    gConn.Execute "CREATE INDEX dbo.idx_docugate_tran_acc_funds_transcode on dbo.docugate_tran_acc_funds(ACC_TRANS_CODE)"
    
    gConn.Execute "ALTER TABLE  dbo.docugate_general_acc    ADD ACC_MAXSPEND decimal(10,2) NOT NULL DEFAULT 0.00"
    gConn.Execute "ALTER TABLE  dbo.docugate_general_acc    ADD ACC_MAXSPEND_ENABLED int DEFAULT 0"
    
    gConn.Execute "ALTER TABLE  dbo.docugate_general_ou     ADD OU_MAXSPEND decimal(10,2) NOT NULL DEFAULT 0.00"
    gConn.Execute "ALTER TABLE  dbo.docugate_general_ou     ADD OU_MAXSPEND_ENABLED int DEFAULT 0"
    
    gConn.Execute "ALTER TABLE  dbo.docugate_general_global   ADD GLOBAL_MAXSPEND decimal(10,2) NOT NULL DEFAULT 0.00"
    gConn.Execute "ALTER TABLE  dbo.docugate_general_global   ADD GLOBAL_MAXSPEND_ENABLED int DEFAULT 0"
        
    
Err_Handler:

    If (Err.Number <> 0) Then
        MsgBox "Error: obj_SchemaUpdate::Apply2006Direct(" & Err.Description & ")"
        Apply206Direct = False
    Else
        Apply206Direct = True
    End If

End Function
    
Public Function Apply206Sql() As Boolean
         
'    On Error GoTo handler
'    m_DBConnection.Execute m_NewProcedure
' use to modify the stored procedures

Err_Handler:

    If (Err.Number <> 0) Then
        MsgBox "Error: obj_SchemaUpdate::Apply2006SQL(" & Err.Description & ")"
        Apply206Sql = False
    Else
        Apply206Sql = True
    End If

End Function
    
Public Function Apply207Direct() As Boolean

On Error GoTo Err_Handler
    
    gConn.Execute "UPDATE  dbo.docugate_general_version SET VERSION = '207'"
    gConn.Execute "CREATE TABLE dbo.docugate_general_spc      (JOB_GUID uniqueidentifier NOT NULL PRIMARY KEY default(newid()), JOB_OWNER varchar(50) NOT NULL, JOB_HOST varchar(50) NOT NULL, JOB_QUEUE varchar(255) NOT NULL, JOB_NAME varchar(255) NOT NULL, JOB_COST DECIMAL(5,2) NOT NULL, JOB_DATE datetime DEFAULT (GETDATE()) NOT NULL)"
    gConn.Execute "CREATE TABLE dbo.docugate_general_spc_cost (ROW_GUID uniqueidentifier NOT NULL PRIMARY KEY default(newid()), CTYPE varchar(10) NOT NULL, CAMOUNT decimal(5,2) NOT NULL)"
    gConn.Execute "INSERT INTO  dbo.docugate_general_spc_cost (CTYPE,CAMOUNT) values ('PAGE',0.10)"
        
    Dim sql As String
    
    sql = "CREATE NONCLUSTERED INDEX [idx_docugate_general_spc] ON [dbo].[docugate_general_spc] " & _
    "(" & _
        "[JOB_OWNER] ASC, " & _
        "[JOB_HOST] ASC, " & _
        "[JOB_QUEUE] ASC, " & _
        "[JOB_DATE] Asc " & _
    ")WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY] "
        
    gConn.Execute sql
    
Err_Handler:

    If (Err.Number <> 0) Then
        MsgBox "Error: obj_SchemaUpdate::Apply2007Direct(" & Err.Description & ")"
        Apply207Direct = False
    Else
        Apply207Direct = True
    End If

End Function


Public Function Apply207Sql() As Boolean
         
'    On Error GoTo handler
'    m_DBConnection.Execute m_NewProcedure
' use to modify the stored procedures
Dim sql As String

sql = " CREATE VIEW dbo.docugate_spc_view AS " & _
"SELECT     dbo.docugate_general_spc.JOB_OWNER AS owner, dbo.docugate_general_acc.ACC_FIRSTNAME AS firstname," & _
"                      dbo.docugate_general_acc.ACC_LASTNAME AS lastname, dbo.docugate_general_acc.ACC_DEFAULT_CLIENT AS charge1," & _
"                      dbo.docugate_general_acc.ACC_DEFAULT_MATTER AS charge2, dbo.docugate_general_spc.JOB_NAME AS docname, " & _
"                      dbo.docugate_general_spc.JOB_COST AS jobcost, dbo.docugate_general_spc.JOB_DATE AS jobdate, dbo.docugate_general_spc.JOB_HOST AS server, " & _
"                       dbo.docugate_general_spc.JOB_QUEUE AS queue " & _
"FROM         dbo.docugate_general_acc INNER JOIN " & _
"                      dbo.docugate_general_spc ON " & _
"                      dbo.docugate_general_acc.ACC_BADGE COLLATE SQL_Latin1_General_CP1_CI_AS = dbo.docugate_general_spc.JOB_OWNER"


On Error GoTo Err_Handler
    
    gConn.Execute sql
  
Err_Handler:

    If (Err.Number <> 0) Then
        MsgBox "Error: obj_SchemaUpdate::Apply2007SQL(" & Err.Description & ")"
        Apply207Sql = False
    Else
        Apply207Sql = True
    End If

End Function

