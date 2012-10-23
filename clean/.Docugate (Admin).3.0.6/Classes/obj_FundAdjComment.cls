VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "obj_FundAdjComment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private m_rs As ADODB.Recordset
Private m_Classname As String

Private Sub Class_Initialize()
    m_Classname = "obj_FundAdjComment"
End Sub

Public Sub GetComments(ByRef mGrid As vbalGrid)

   mGrid.Clear (True)
   mGrid.Redraw = False
      
   Set m_rs = New ADODB.Recordset
   m_rs.Open "SELECT * FROM dbo.docugate_tran_acc_comments", gConn, adOpenStatic, adLockOptimistic
      
   While Not m_rs.EOF
        
        With mGrid
            .AddRow
            .CellDetails .Rows, 1, gRs!comment
        End With
        
        m_rs.MoveNext
   Wend
   
   mGrid.Redraw = True
   m_rs.Close
   Set m_rs = Nothing
   
   
End Sub

Public Sub SaveComments(ByRef mGrid As vbalGrid)

     gConn.Execute "TRUNCATE TABLE dbo.docugate_tran_acc_comments"
   
   
End Sub

