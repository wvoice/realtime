VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frm_DBMigrate 
   AutoRedraw      =   -1  'True
   Caption         =   "Migrate to another MS SQL Server instance"
   ClientHeight    =   6420
   ClientLeft      =   915
   ClientTop       =   1785
   ClientWidth     =   9225
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "AdmnMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6420
   ScaleWidth      =   9225
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1425
      Left            =   4920
      TabIndex        =   13
      Top             =   2880
      Width           =   3135
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Caption         =   "Show &Properties"
      Enabled         =   0   'False
      Height          =   375
      Index           =   2
      Left            =   120
      TabIndex        =   3
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Caption         =   "Import / E&xport"
      Enabled         =   0   'False
      Height          =   375
      Index           =   3
      Left            =   1815
      TabIndex        =   4
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Caption         =   "&Update Statistics"
      Enabled         =   0   'False
      Height          =   375
      Index           =   4
      Left            =   5520
      TabIndex        =   5
      Top             =   1800
      Width           =   1695
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Caption         =   "&Login Security"
      Enabled         =   0   'False
      Height          =   375
      Index           =   5
      Left            =   5400
      TabIndex        =   6
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Caption         =   "&Disconnect"
      Enabled         =   0   'False
      Height          =   375
      Index           =   1
      Left            =   7560
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Caption         =   "&Connect"
      Height          =   375
      Index           =   0
      Left            =   7560
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton cmdDatabaseAction 
      Cancel          =   -1  'True
      Caption         =   "&Close"
      Height          =   375
      Index           =   6
      Left            =   7560
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Frame fraExecuteSQL 
      Caption         =   "Execute SQL Statement"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   4215
      Left            =   120
      TabIndex        =   11
      Top             =   1920
      Width           =   8775
      Begin VB.CommandButton cmdExecute 
         Caption         =   "&Execute"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   7440
         TabIndex        =   8
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear &Windows"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   7440
         TabIndex        =   9
         Top             =   720
         Width           =   1215
      End
      Begin RichTextLib.RichTextBox txtExecuteSQL 
         Height          =   1695
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   6975
         _ExtentX        =   12303
         _ExtentY        =   2990
         _Version        =   393217
         BackColor       =   -2147483633
         Enabled         =   0   'False
         TextRTF         =   $"AdmnMain.frx":5872
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin RichTextLib.RichTextBox txtResults 
         Height          =   1935
         Left            =   240
         TabIndex        =   10
         Top             =   2160
         Width           =   6975
         _ExtentX        =   12303
         _ExtentY        =   3413
         _Version        =   393217
         BackColor       =   -2147483633
         Enabled         =   0   'False
         ReadOnly        =   -1  'True
         ScrollBars      =   2
         TextRTF         =   $"AdmnMain.frx":58F2
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Courier New"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label Label1 
         Caption         =   "Results Window"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   240
         TabIndex        =   12
         Top             =   1970
         Width           =   1815
      End
   End
End
Attribute VB_Name = "frm_DBMigrate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Database Connection Variables
Private strServer As String
Private strDatabase As String
Private strUID As String
Private strPWD As String
Private strConnect As String
Dim varConnect As Variant

' SQL DMO Variables
Private oSQLServer As SQLDMO.SQLServer
Attribute oSQLServer.VB_VarHelpID = -1
Private oCurDB As SQLDMO.database
Private oCurTable As SQLDMO.Table

' SQL Namespace Variables
Private oSQLNSObj As SQLNamespaceObject
Private oSQLNS As SQLNamespace
Private nsArray(10) As Long

' Control Array Constants
Private Const cConnect As Integer = 0
Private Const cDisconnect As Integer = 1
Private Const cProperties As Integer = 2
Private Const cImportExport As Integer = 3
Private Const cUpdateStatistics As Integer = 4
Private Const cLoginSecurity As Integer = 5
Private Const cQuitApp As Integer = 6

Private Sub cmdDatabaseAction_Click(Index As Integer)
On Error GoTo Err_Handler

    Screen.MousePointer = vbHourglass
    
    Select Case Index
        Case cConnect
            ConnectToDatabase
            
        Case cDisconnect
            DisconnectFromDatabase
            
        Case cProperties
            'oSQLNSObj.Commands("Properties").Execute
            oSQLNSObj.Commands("Backup Database").Execute
            Dim i As Integer
            For i = 1 To oSQLNSObj.Commands.Count - 1
                List1.AddItem oSQLNSObj.Commands(i).Name
            Next i
        
        Case cImportExport
            oSQLNSObj.Commands("Data Export").Execute
            
        Case cUpdateStatistics
            oCurDB.ExecuteImmediate ("sp_updatestats")
            MsgBox "Update Statistics was successfull.", vbInformation, "Finished"
            
        Case cLoginSecurity
            oSQLNSObj.Commands("Manage SQL Server Security").Execute
        
        Case cQuitApp
            DisconnectFromDatabase
            Unload Me: End

    End Select
    
    Screen.MousePointer = vbDefault
    
Exit_Here:
    Exit Sub
    
Err_Handler:
    MsgBox Err.Description & vbCrLf & vbCrLf & "Error #: " & Err.Number, vbOKOnly, "Error"
    GoTo Exit_Here

End Sub

Private Sub cmdClear_Click()
On Error Resume Next
    txtExecuteSQL = "Enter SQL String Here"
    txtResults = ""
End Sub

Private Sub cmdExecute_Click()
On Error Resume Next
' Always resume next, even if there is an error
' It will be reported to user in results window

Dim strTSQL As String
Dim strMsg As String
Dim fWildCardError As Boolean
Dim strWildCardErrorMsg As String
Dim qryResult As QueryResults
Dim strResult As String

    strTSQL = txtExecuteSQL.Text & "  "
    Err.Clear
    
    fWildCardError = InStr(1, Mid(strTSQL, InStr(1, LCase(strTSQL), "from")), "*")
    If fWildCardError Then strWildCardErrorMsg = "Asteriks is not a legal wildcard. Use % instead. (percent sign)" & vbCrLf & vbCrLf
    
    txtExecuteSQL = strTSQL
    
    If InStr(1, UCase(strTSQL), "SELECT") Then
        Set qryResult = oCurDB.ExecuteWithResults(strTSQL)
        If Err.Number = 0 Then
            strResult = "Commands completed successfully." & vbCrLf & vbCrLf & qryResult.GetRangeString
        Else
            strResult = strWildCardErrorMsg & Err.Description
        End If
        Set qryResult = Nothing
        
    ElseIf InStr(1, UCase(strTSQL), "DELETE") Then
        strMsg = "You are about to permenantly delete records." _
            & vbCrLf & vbCrLf & "This action cannot be undone." _
            & vbCrLf & vbCrLf & "Do you wish to continue?"
        If MsgBox(strMsg, vbCritical + vbYesNo, "DELETE PENDING!") = vbYes Then
            oCurDB.ExecuteImmediate (strTSQL)
            If Err.Number = 0 Then
                strResult = "Commands completed successfully."
            Else
                strResult = strWildCardErrorMsg & Err.Description
            End If
        Else
            strResult = "Action Cancelled.  No Records Deleted."
        End If
        
    Else
        oCurDB.ExecuteImmediate (strTSQL)
        If Err = 0 Then
            strResult = "Commands completed successfully."
        Else
            strResult = strWildCardErrorMsg & Err.Description
        End If
        
    End If
    
    txtExecuteSQL = Trim(txtExecuteSQL)
    txtResults = Trim(strResult)

End Sub

Private Sub ConnectToDatabase()
On Error Resume Next
' Always resume next, even if there is an error
' It will be reported to user via message box

    Screen.MousePointer = vbHourglass
    
    If UserInputIsValid Then
        ToggleConnectControlsEnabled True

        ' Set SQLDMO object
        Set oSQLServer = New SQLDMO.SQLServer
        oSQLServer.LoginTimeout = 10
        oSQLServer.ODBCPrefix = False
        
        'Attempt a connection, then fill the properties stuff
        oSQLServer.ApplicationName = "SQL-DMO Explorer"
        oSQLServer.Connect strServer, strUID, strPWD
        oSQLServer.Application.GroupRegistrationServer = ""
        'oSQLServer.Configuration.ShowAdvancedOptions = True
            
        ' Set Current SQLDMO Database object
        Set oCurDB = oSQLServer.Databases(strDatabase)
        
        ' If requested database (or server) doesn't exist, user will be informed
        ' Otherwise, continue by creating Namespace Object
        If Err.Number = 0 Then
            ' Create SQL Namespace Object
            Set oSQLNS = New SQLNamespace
            varConnect = "Server=" & strServer & ";UID=" & strUID & ";pwd=" & strPWD & ";"
            oSQLNS.Initialize "EMS Admin Namespace", SQLNSRootType_Server, varConnect, hwnd
            
            ' get a root object of type Server and walk down the hierarchy from there
            nsArray(0) = oSQLNS.GetRootItem
            ' get first level server->databases
            nsArray(1) = oSQLNS.GetFirstChildItem(nsArray(0), SQLNSOBJECTTYPE_DATABASES)
            ' get second level server->databases->database('pubs')
            nsArray(2) = oSQLNS.GetFirstChildItem(nsArray(1), SQLNSOBJECTTYPE_DATABASE, strDatabase)
            ' get a SQLNamespaceObject to execute commands against on the wanted level
            Set oSQLNSObj = oSQLNS.GetSQLNamespaceObject(nsArray(2))
        Else
            Err.Clear
            MsgBox "Connection Failed!" & vbCrLf & vbCrLf & "Check parameters and try again.", vbCritical, "Error"
            ToggleConnectControlsEnabled False
        End If
    End If
    
    Screen.MousePointer = vbDefault
        
End Sub

Private Sub ToggleConnectControlsEnabled(ByVal fConnected As Boolean)
On Error Resume Next
' Always resume next, even if there is an error
' Not necessary to inform user any problems here

Dim i As Integer
Dim ctl As Control
Dim strTest As String

    Me.txtServer.Enabled = Not fConnected
    Me.txtDatabase.Enabled = Not fConnected
    Me.txtUID.Enabled = Not fConnected
    Me.txtPWD.Enabled = Not fConnected
    
    Me.cmdDatabaseAction(6).SetFocus
    
    ' Connect Button
    Me.cmdDatabaseAction(0).Enabled = Not fConnected
    ' Disconnect Button
    Me.cmdDatabaseAction(1).Enabled = fConnected
    
    If fConnected Then
        Me.cmdDatabaseAction(1).SetFocus
    Else
        Me.cmdDatabaseAction(0).SetFocus
    End If
    
    ' Database Action Buttons
    For i = 2 To 5
        Me.cmdDatabaseAction(i).Enabled = fConnected
    Next
    
    Me.txtExecuteSQL.Text = ""
    Me.txtExecuteSQL.Enabled = fConnected
    If fConnected Then Me.txtExecuteSQL.Text = "Enter SQL String Here"
    
    Me.txtResults.Enabled = fConnected
    Me.cmdExecute.Enabled = fConnected
    Me.cmdClear.Enabled = fConnected
    
    For Each ctl In Me.Controls
        strTest = ctl.Text
        If Err.Number = 0 Then
            If ctl.Enabled Then
                ctl.BackColor = vbWhite
            Else
                ctl.BackColor = &H8000000F
            End If
        Else
            Err.Clear
        End If
    Next

End Sub

Private Sub DisconnectFromDatabase()
On Error Resume Next
' Always resume next, even if there is an error
' Not necessary to inform user any problems here
    
    Set oCurDB = Nothing
    oSQLServer.Close
    Set oSQLServer = Nothing
    
    Set oSQLNSObj = Nothing
    Set oSQLNS = Nothing
    
    ToggleConnectControlsEnabled False

End Sub

Private Function UserInputIsValid() As Boolean
On Error Resume Next
' Always resume next, even if there is an error
' It will be reported to user via message box

    ' Assume Success
    UserInputIsValid = True
    
    ' Server Name is required
    If Len(txtServer & "") Then
        strServer = txtServer
    Else
        MsgBox "Enter a valid SQL Server name.", vbExclamation, "Error"
        UserInputIsValid = False
        txtServer.SetFocus
    End If
    
    ' User Login Name is required
    If Len(txtUID & "") Then
        strUID = txtUID
    Else
        MsgBox "Enter a valid user name.", vbExclamation, "Error"
        UserInputIsValid = False
        txtUID.SetFocus
    End If
    
    ' Database Name Not Required At Login
    If Len(txtDatabase & "") Then
        strDatabase = txtDatabase & ""
    Else
        MsgBox "Enter a database name.", vbExclamation, "Error"
        UserInputIsValid = False
        txtDatabase.SetFocus
    End If
    
    ' Password may be Blank
    strPWD = txtPWD & ""
    
End Function

Private Sub Form_Load()
    Call CentreForm(Me)
End Sub
