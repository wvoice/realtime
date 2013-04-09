VERSION 5.00
Object = "{FE666755-7DB5-47B5-9F9E-ABC3D730AF26}#1.0#0"; "SCLabel.ocx"
Object = "{15519D4E-5365-4718-B5E8-8F541C781688}#1.1#0"; "CoolXPPanel.ocx"
Begin VB.Form frm_ABOUT_Appl 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Info VB6_CHM"
   ClientHeight    =   4245
   ClientLeft      =   3735
   ClientTop       =   2040
   ClientWidth     =   7515
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
   Icon            =   "frm_ABOUT_Appl.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4245
   ScaleWidth      =   7515
   ShowInTaskbar   =   0   'False
   Tag             =   "1048"
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   6000
      TabIndex        =   2
      Tag             =   "1050"
      Top             =   2985
      Width           =   1350
   End
   Begin VB.CommandButton cmdSysInfo 
      Caption         =   "&System-Info..."
      Height          =   345
      Left            =   6000
      TabIndex        =   1
      Tag             =   "1049"
      Top             =   3435
      Width           =   1335
   End
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
      Height          =   1185
      Left            =   120
      Picture         =   "frm_ABOUT_Appl.frx":08CA
      ScaleHeight     =   1125
      ScaleMode       =   0  'User
      ScaleWidth      =   1110
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   120
      Width           =   1170
   End
   Begin CoolXPPanel.xpPanel xpPanel2 
      Align           =   3  'Align Left
      Height          =   4245
      Left            =   0
      Top             =   0
      Width           =   915
      _ExtentX        =   1614
      _ExtentY        =   7488
      PanelStyle      =   0
      BackColor       =   16777215
   End
   Begin SCLABELLib.SCLabel SCLabel2 
      Height          =   315
      Left            =   2760
      TabIndex        =   3
      Top             =   2880
      Width           =   2055
      _Version        =   65536
      _ExtentX        =   3625
      _ExtentY        =   556
      _StockProps     =   13
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Microsoft Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "This product is licenced to:"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lblWorkstationName 
      Height          =   255
      Left            =   1800
      TabIndex        =   4
      Top             =   3360
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BackColor       =   -2147483633
      Caption         =   "Workstation name"
      Alignment       =   2
      Enabled         =   -1  'True
      WordWrap        =   -1  'True
   End
   Begin SCLABELLib.SCLabel lblLicence 
      Height          =   255
      Left            =   1800
      TabIndex        =   5
      Top             =   3600
      Width           =   3855
      _Version        =   65536
      _ExtentX        =   6800
      _ExtentY        =   450
      _StockProps     =   13
      BackColor       =   -2147483633
      Caption         =   "Product ID: XXXXX-XXX-XXXXXX-XXXXX"
      Alignment       =   2
      Enabled         =   -1  'True
      WordWrap        =   -1  'True
   End
   Begin SCLABELLib.SCLabel lblTitle 
      Height          =   315
      Left            =   1800
      TabIndex        =   6
      Top             =   120
      Width           =   5535
      _Version        =   65536
      _ExtentX        =   9763
      _ExtentY        =   556
      _StockProps     =   13
      BackColor       =   -2147483633
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Microsoft Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "Title"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lblVersion 
      Height          =   315
      Left            =   1800
      TabIndex        =   7
      Top             =   480
      Width           =   5535
      _Version        =   65536
      _ExtentX        =   9763
      _ExtentY        =   556
      _StockProps     =   13
      BackColor       =   -2147483633
      Caption         =   "Version"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   0   'False
   End
   Begin SCLABELLib.SCLabel lblComments 
      Height          =   1815
      Left            =   1800
      TabIndex        =   8
      Top             =   960
      Width           =   5535
      _Version        =   65536
      _ExtentX        =   9763
      _ExtentY        =   3201
      _StockProps     =   13
      BackColor       =   -2147483633
      Caption         =   "Comments"
      Alignment       =   1
      Enabled         =   -1  'True
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frm_ABOUT_Appl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
''****************************************************************************
''
'' Copyright (C) 2007-2013 Hightech Accessory Items,Inc. and/or its subsidiary(-ies)
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
''   * Neither the name of Hightech Accessory Items,its Subsidiary(-ies)
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
  Me.Caption = "About " & gAppName
  
  lblTitle.Caption = gAppName
  
  lblVersion.Caption = gAppVersion
  
  lblComments.Caption = "©2007 – 2013, A Licensed Product of Hightech Accessory Items,Inc." & vbCrLf & vbCrLf _
    & "All Rights Reserved" & vbCrLf & vbCrLf _
    & "Website: http://www.Hightech-ai.com" & vbCrLf & vbCrLf _
    & "Sales: sales@Hightech-ai.com" & vbCrLf & vbCrLf _
    & "Support: support@Hightech-ai.com"
    
  lblWorkstationName.Caption = "High Tech Accessory Items, Inc"
  lblLicence.Caption = "Product ID: Realtime Admin 3.1.1"
  
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

Private Sub picIcon_Click()

End Sub
