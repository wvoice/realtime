VERSION 5.00
Object = "{15519D4E-5365-4718-B5E8-8F541C781688}#1.1#0"; "CoolXPPanel.ocx"
Begin VB.Form frm_ABOUT 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Info VB6_CHM"
   ClientHeight    =   5010
   ClientLeft      =   4950
   ClientTop       =   2040
   ClientWidth     =   7620
   ClipControls    =   0   'False
   BeginProperty Font 
      Name            =   "Microsoft Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5010
   ScaleWidth      =   7620
   ShowInTaskbar   =   0   'False
   Tag             =   "1048"
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      ClipControls    =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1455
      Left            =   120
      Picture         =   "frmAbout.frx":0CCA
      ScaleHeight     =   1395
      ScaleMode       =   0  'User
      ScaleWidth      =   1500
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   120
      Width           =   1560
   End
   Begin CoolXPPanel.xpPanel xpPanel1 
      Align           =   3  'Align Left
      Height          =   5010
      Left            =   0
      Top             =   0
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   8837
      PanelStyle      =   0
      BackColor       =   16777215
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   5535
      TabIndex        =   0
      Tag             =   "1050"
      Top             =   2505
      Width           =   1467
   End
   Begin VB.CommandButton cmdSysInfo 
      Caption         =   "&System-Info..."
      Height          =   345
      Left            =   5550
      TabIndex        =   1
      Tag             =   "1049"
      Top             =   2955
      Width           =   1452
   End
   Begin VB.Shape Shape1 
      Height          =   615
      Left            =   1320
      Top             =   3960
      Width           =   3615
   End
   Begin VB.Label lblURL 
      Caption         =   "http://www.help-info.de"
      BeginProperty Font 
         Name            =   "Microsoft Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   735
      Left            =   1530
      TabIndex        =   7
      Top             =   3000
      Width           =   4005
   End
   Begin VB.Label lblDescription 
      Caption         =   "Description"
      ForeColor       =   &H00000000&
      Height          =   1170
      Left            =   1800
      TabIndex        =   6
      Tag             =   "1054"
      Top             =   840
      Width           =   3855
   End
   Begin VB.Label lblTitle 
      Caption         =   "Title"
      ForeColor       =   &H00000000&
      Height          =   240
      Left            =   1800
      TabIndex        =   5
      Tag             =   "1053"
      Top             =   120
      Width           =   5175
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00808080&
      BorderStyle     =   6  'Inside Solid
      Index           =   1
      X1              =   1515
      X2              =   6947
      Y1              =   2310
      Y2              =   2310
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      BorderWidth     =   2
      Index           =   0
      X1              =   1560
      X2              =   6977
      Y1              =   2280
      Y2              =   2280
   End
   Begin VB.Label lblVersion 
      Caption         =   "Version"
      Height          =   225
      Left            =   1800
      TabIndex        =   4
      Tag             =   "1052"
      Top             =   480
      Width           =   3855
   End
   Begin VB.Label lblDisclaimer 
      Caption         =   "Disclaimer:"
      ForeColor       =   &H00000000&
      Height          =   345
      Left            =   1545
      TabIndex        =   3
      Tag             =   "1051"
      Top             =   2505
      Width           =   3870
   End
End
Attribute VB_Name = "frm_About"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'******************************************************************************
'----- frmAbout, (c) Ulrich Kulle, http://www.help-info.de
'----- 2005-07-17 Version 1.0
'******************************************************************************

' Registrierungsschlüssel - Sicherheitsoptionen...
Const KEY_ALL_ACCESS = &H2003F
                     
' Registrierungsschlüssel - Sicherheitsoptionen...
Const HKEY_LOCAL_MACHINE = &H80000002
Const ERROR_SUCCESS = 0
Const REG_SZ = 1                         ' Null-terminierte Unicode-Zeichenfolge
Const REG_DWORD = 4                      ' 32-Bit-Zahl

Const gREGKEYSYSINFOLOC = "SOFTWARE\Microsoft\Shared Tools Location"
Const gREGVALSYSINFOLOC = "MSINFO"
Const gREGKEYSYSINFO = "SOFTWARE\Microsoft\Shared Tools\MSINFO"
Const gREGVALSYSINFO = "PATH"

Private Declare Function RegOpenKeyEx Lib "advapi32" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, ByRef phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32" (ByVal hKey As Long) As Long

Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Const SW_SHOW = 5

Private Sub Form_Load()
  Call CentreForm(Me)
  'Me.Caption = "About " & GApp.Title
  '//LoadResStrings Me
  lblVersion.Caption = "Version " & App.Major & "." & App.Minor & "." & App.Revision
  lblTitle.Caption = App.Title
End Sub

Private Sub lblURL_Click()
   ShellExecute Me.hwnd, "open", lblURL.Caption, 0, 0, SW_SHOW
End Sub

Private Sub cmdSysInfo_Click()
    Call StartSysInfo
End Sub

Private Sub cmdOK_Click()
    Unload Me
End Sub

Public Sub StartSysInfo()
  On Error GoTo SysInfoErr

    Dim rc As Long
    Dim SysInfoPath As String
    
    ' Versuchen Namen und Pfad des Systeminfo-Programms aus der Registrierung zu lesen...
    If GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFO, gREGVALSYSINFO, SysInfoPath) Then
    ' Versuchen nur den Pfad des Systeminfo-Programms aus der Registrierung zu lesen...
    ElseIf GetKeyValue(HKEY_LOCAL_MACHINE, gREGKEYSYSINFOLOC, gREGVALSYSINFOLOC, SysInfoPath) Then
        ' Sicherstellen, daß es sich um bekannte 32-Bit-Version handelt.
        If (Dir(SysInfoPath & "\MSINFO32.EXE") <> "") Then
            SysInfoPath = SysInfoPath & "\MSINFO32.EXE"
            
        ' Fehler - Datei nicht gefunden...
        Else
            GoTo SysInfoErr
        End If
    ' Fehler - Registrierungseintrag nicht gefunden...
    Else
        GoTo SysInfoErr
    End If
    
    Call Shell(SysInfoPath, vbNormalFocus)
    
    Exit Sub
SysInfoErr:
    MsgBox "Systeminformationsprogramm zur Zeit nicht verfügbar.", vbOKOnly
End Sub

Public Function GetKeyValue(KeyRoot As Long, KeyName As String, SubKeyRef As String, ByRef KeyVal As String) As Boolean
    Dim i As Long               ' Schleifenzähler
    Dim rc As Long              ' Rückgabe-Code
    Dim hKey As Long            ' Handle für geöffneten Registrierungsschlüssel
    Dim hDepth As Long          '
    Dim KeyValType As Long      ' Datentyp eines Registrierungsschlüssels
    Dim tmpVal As String        ' Teporärer Speicher für einen Registrierungswert
    Dim KeyValSize As Long      ' Größe der Registrierungsschlüssel-Variablen
    '------------------------------------------------------------
    ' Registrierungsschlüssel unter Stammverzeichnis
    ' öffnen {HKEY_LOCAL_MACHINE...}
    '------------------------------------------------------------
    rc = RegOpenKeyEx(KeyRoot, KeyName, 0, KEY_ALL_ACCESS, hKey) ' Open Registry Key
    
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Fehlerbehandlung...
    
    tmpVal = String$(1024, 0)                               ' Speicher für Variable reservieren
    KeyValSize = 1024                                       ' Größe der Variablen speichern
    
    '------------------------------------------------------------
    ' Registrierungswert abrufen...
    '------------------------------------------------------------
    rc = RegQueryValueEx(hKey, SubKeyRef, 0, KeyValType, tmpVal, KeyValSize)    ' Get/Create Key Value
                        
    If (rc <> ERROR_SUCCESS) Then GoTo GetKeyError          ' Fehlerbehandlung
    
    tmpVal = VBA.Left(tmpVal, InStr(tmpVal, VBA.Chr(0)) - 1)
    '------------------------------------------------------------
    ' Bestimmen des Datentyps für die Konvertierung...
    '------------------------------------------------------------
    Select Case KeyValType                                  ' Durchsuchen der Datentypen...
    Case REG_SZ                                             ' Datentyp Zeichenfolge
        KeyVal = tmpVal                                     ' Kopieren der Zeichenfolge
    Case REG_DWORD                                          ' Datentyp Doppelwort
        For i = Len(tmpVal) To 1 Step -1                    ' Konvertieren der einzelnen Bits
            KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))   ' Wert Zeichen für Zeichen erstellen
        Next
        KeyVal = Format$("&h" + KeyVal)                     ' Doppelwort in Zeichenfoge umwandeln
    End Select
    
    GetKeyValue = True                                      ' Wert für Erfolg zurückgeben
    rc = RegCloseKey(hKey)                                  ' Registrierungsschlüssel schließen
    Exit Function                                           ' Funktion verlassen
    
GetKeyError:    ' Aufräumen, nachdem ein Fehler aufgetreten ist...
    KeyVal = ""                                             ' Rückgabewert auf leere Zeichenfolge setzen
    GetKeyValue = False                                     ' Wert für Fehler zurückliefern
    rc = RegCloseKey(hKey)                                  ' Registrierungsschlüssel schließen
End Function

