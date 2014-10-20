VERSION 5.00
Begin VB.Form Frm_View_Acc 
   Caption         =   "Form1"
   ClientHeight    =   3330
   ClientLeft      =   5430
   ClientTop       =   3165
   ClientWidth     =   8895
   LinkTopic       =   "Form1"
   ScaleHeight     =   3330
   ScaleWidth      =   8895
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Frm_View_Acc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' You will need an Access DB with Data
' Add a Reference to Microsoft Active X Data Objects 2.X Library
' Add a MSFlexGrid Control, 3 Command Buttons, a Status Bar and
' a Microsoft Common Dialog Control X.0
' to your form leave the default names
' Copy the following code into the code section of the form

Dim strDataBaseName As String
Dim strDBCursorType As String
Dim strDBLockType As String
Dim strDBOptions As String
Dim rs As ADODB.Recordset
Dim cn As ADODB.Connection
Dim a As Long
Dim strSQL As String
Dim strTable As String

Private Sub Command1_Click()
    Call GetFile
End Sub

Private Sub Command2_Click()
On Error GoTo Command2_Click_Error
Dim intMax As Integer
Dim a As Integer
Dim b As Integer
Dim sUserInfo As String

strDBCursorType = adOpenDynamic  'CursorType
strDBLockType = adLockOptimistic   'LockType
strDBOptions = adCmdText         'Options

TheTop:

Set cn = New ADODB.Connection

cn.Open ConnectString()
    
    With cn
        .CommandTimeout = 0
        .CursorLocation = adUseClient
    End With

    Set rs = New ADODB.Recordset       'Creates record set
        strSQL = "SELECT * FROM Table1;" 'Change SQL to your Table's name
        rs.Open strSQL, cn, strDBCursorType, strDBLockType, strDBOptions

    If rs.EOF Then
        MsgBox "The criteria didn't return any records, try again."
    Else
        intMax = rs.Fields.Count - 1
        MSFlexColumnSetup (intMax)
    
        With Me.StatusBar1
            .Panels(1).AutoSize = sbrContents
            .Panels(1).Text = rs.RecordCount & " - Total Records"
        End With
        
        For a = 1 To rs.RecordCount
            For b = 0 To intMax
                sUserInfo = sUserInfo & rs.Fields(b).Value & vbTab
            Next b
                
            Me.MSFlexGrid1.AddItem sUserInfo
            rs.MoveNext
            sUserInfo = vbNullString
        Next a
    End If

rs.Close
Set rs = Nothing
cn.Close
Set cn = Nothing

On Error GoTo 0
Exit Sub

Command2_Click_Error:
    If Err.Number = -2147467259 Then
        MsgBox "Make sure the the MSFlex Database File is in the Path of the Application:" & vbCrLf & vbCrLf & _
                        App.Path, vbCritical, "File not found"
    
    GetFile
    GoTo TheTop
    Else
        MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Command2_Click of Form " & Me.Name
    End If
End Sub

Private Sub Command3_Click()
    Unload Me
End Sub

Private Function ConnectString()
                
    ConnectString = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
                    "Data Source=" & strTable & _
                    ";Jet OLEDB:Engine Type=5;"

End Function

Private Sub Form_Load()
On Error GoTo Form_Load_Error

    strTable = App.Path & "\MSFlex.mdb"
    
    With Me.StatusBar1.Panels
        .Add
        .Item(2).AutoSize = sbrSpring
        .Item(2).Text = "Target Database: " & Mid(strTable, InStrRev(strTable, "\") + 1)
    End With

    With Me.MSFlexGrid1
        .FixedCols = 0
        .FixedRows = 1
        .Rows = 1
        .Cols = 1
    End With
    
    Me.Command1.Caption = "Find Database"
    Me.Command2.Caption = "Load FlexGrid"
    Me.Command3.Caption = "Exit"
    
    
    Call FormResize
    Me.WindowState = vbNormal

On Error GoTo 0
Exit Sub

Form_Load_Error:

MsgBox "Error " & Err.Number & " (" & Err.Description & ") in procedure Form_Load of Form " & Me.Name
End Sub

Private Sub Form_Resize()
    Call FormResize
End Sub

Private Sub FormResize()
Dim sglTop As Single

    With Me.Command1
            .Move 100, 10
            Me.Command2.Move .Left + .Width, 10
            Me.Command3.Move Me.Command2.Left + Me.Command2.Width, 10
            sglTop = .Top + .Height
    End With
    
    If Me.WindowState <> vbMinimized Then
        With Me.MSFlexGrid1
            .Move 0, sglTop, Me.ScaleWidth, Me.ScaleHeight - sglTop
        End With
    End If
End Sub

Private Sub GetFile()
    
    With Me.CommonDialog1
        .InitDir = App.Path
        .FileName = strTable
        .DialogTitle = "Select Sample Database"
        .CancelError = False
        .Filter = "Access Database (*.MDB)|*.mdb"
        .ShowOpen
    End With
    
    strTable = Me.CommonDialog1.FileName
    
    With Me.StatusBar1.Panels
        .Item(2).Text = "Target Database: " & Mid(strTable, InStrRev(strTable, "\") + 1)
    End With

End Sub

Private Sub MSFlexColumnSetup(intNumCol As Integer)
Dim a As Integer

    With Me.MSFlexGrid1
        .Cols = .Cols + intNumCol

        For a = 0 To intNumCol
            .Row = 0
            .Col = a
            .ColWidth(a) = 2000
            .Text = rs.Fields(a).Name
        Next a
    End With
End Sub


