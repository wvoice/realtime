VERSION 5.00
Object = "{D58B0E43-C5DF-4A4E-8635-84ADA7EAA339}#5.0#0"; "ctList.ocx"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Frm_Logon 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   " Desktop Login Agent"
   ClientHeight    =   4845
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3795
   FillStyle       =   0  'Solid
   Icon            =   "Frm_Logon.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4845
   ScaleWidth      =   3795
   Begin MSWinsockLib.Winsock myUDP 
      Left            =   2280
      Top             =   4200
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.Timer AutoLogon 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   3225
      Top             =   4200
   End
   Begin CTLISTLibCtl.ctList lst_Activity 
      Height          =   1965
      Left            =   0
      TabIndex        =   12
      Top             =   1920
      Width           =   3630
      _Version        =   327680
      _ExtentX        =   6403
      _ExtentY        =   3466
      _StockProps     =   77
      BackColor       =   12648447
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty TitleFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty HeaderFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TitleBackImage  =   "Frm_Logon.frx":6852
      CheckPicDown    =   "Frm_Logon.frx":686E
      CheckPicUp      =   "Frm_Logon.frx":688A
      CheckPicDisabled=   "Frm_Logon.frx":68A6
      BackImage       =   "Frm_Logon.frx":68C2
      MouseIcon       =   "Frm_Logon.frx":68DE
      PreColumnPicture=   "Frm_Logon.frx":68FA
      BorderType      =   5
      HeaderAlign     =   0
      HeaderBorder    =   5
      ShowHeader      =   -1  'True
      HeaderData      =   "Frm_Logon.frx":6916
      PicArray0       =   "Frm_Logon.frx":69A6
      PicArray1       =   "Frm_Logon.frx":69C2
      PicArray2       =   "Frm_Logon.frx":69DE
      PicArray3       =   "Frm_Logon.frx":69FA
      PicArray4       =   "Frm_Logon.frx":6A16
      PicArray5       =   "Frm_Logon.frx":6A32
      PicArray6       =   "Frm_Logon.frx":6A4E
      PicArray7       =   "Frm_Logon.frx":6A6A
      PicArray8       =   "Frm_Logon.frx":6A86
      PicArray9       =   "Frm_Logon.frx":6AA2
      PicArray10      =   "Frm_Logon.frx":6ABE
      PicArray11      =   "Frm_Logon.frx":6ADA
      PicArray12      =   "Frm_Logon.frx":6AF6
      PicArray13      =   "Frm_Logon.frx":6B12
      PicArray14      =   "Frm_Logon.frx":6B2E
      PicArray15      =   "Frm_Logon.frx":6B4A
      PicArray16      =   "Frm_Logon.frx":6B66
      PicArray17      =   "Frm_Logon.frx":6B82
      PicArray18      =   "Frm_Logon.frx":6B9E
      PicArray19      =   "Frm_Logon.frx":6BBA
      PicArray20      =   "Frm_Logon.frx":6BD6
      PicArray21      =   "Frm_Logon.frx":6BF2
      PicArray22      =   "Frm_Logon.frx":6C0E
      PicArray23      =   "Frm_Logon.frx":6C2A
      PicArray24      =   "Frm_Logon.frx":6C46
      PicArray25      =   "Frm_Logon.frx":6C62
      PicArray26      =   "Frm_Logon.frx":6C7E
      PicArray27      =   "Frm_Logon.frx":6C9A
      PicArray28      =   "Frm_Logon.frx":6CB6
      PicArray29      =   "Frm_Logon.frx":6CD2
      PicArray30      =   "Frm_Logon.frx":6CEE
      PicArray31      =   "Frm_Logon.frx":6D0A
      PicArray32      =   "Frm_Logon.frx":6D26
      PicArray33      =   "Frm_Logon.frx":6D42
      PicArray34      =   "Frm_Logon.frx":6D5E
      PicArray35      =   "Frm_Logon.frx":6D7A
      PicArray36      =   "Frm_Logon.frx":6D96
      PicArray37      =   "Frm_Logon.frx":6DB2
      PicArray38      =   "Frm_Logon.frx":6DCE
      PicArray39      =   "Frm_Logon.frx":6DEA
      PicArray40      =   "Frm_Logon.frx":6E06
      PicArray41      =   "Frm_Logon.frx":6E22
      PicArray42      =   "Frm_Logon.frx":6E3E
      PicArray43      =   "Frm_Logon.frx":6E5A
      PicArray44      =   "Frm_Logon.frx":6E76
      PicArray45      =   "Frm_Logon.frx":6E92
      PicArray46      =   "Frm_Logon.frx":6EAE
      PicArray47      =   "Frm_Logon.frx":6ECA
      PicArray48      =   "Frm_Logon.frx":6EE6
      PicArray49      =   "Frm_Logon.frx":6F02
      PicArray50      =   "Frm_Logon.frx":6F1E
      PicArray51      =   "Frm_Logon.frx":6F3A
      PicArray52      =   "Frm_Logon.frx":6F56
      PicArray53      =   "Frm_Logon.frx":6F72
      PicArray54      =   "Frm_Logon.frx":6F8E
      PicArray55      =   "Frm_Logon.frx":6FAA
      PicArray56      =   "Frm_Logon.frx":6FC6
      PicArray57      =   "Frm_Logon.frx":6FE2
      PicArray58      =   "Frm_Logon.frx":6FFE
      PicArray59      =   "Frm_Logon.frx":701A
      PicArray60      =   "Frm_Logon.frx":7036
      PicArray61      =   "Frm_Logon.frx":7052
      PicArray62      =   "Frm_Logon.frx":706E
      PicArray63      =   "Frm_Logon.frx":708A
      PicArray64      =   "Frm_Logon.frx":70A6
      PicArray65      =   "Frm_Logon.frx":70C2
      PicArray66      =   "Frm_Logon.frx":70DE
      PicArray67      =   "Frm_Logon.frx":70FA
      PicArray68      =   "Frm_Logon.frx":7116
      PicArray69      =   "Frm_Logon.frx":7132
      PicArray70      =   "Frm_Logon.frx":714E
      PicArray71      =   "Frm_Logon.frx":716A
      PicArray72      =   "Frm_Logon.frx":7186
      PicArray73      =   "Frm_Logon.frx":71A2
      PicArray74      =   "Frm_Logon.frx":71BE
      PicArray75      =   "Frm_Logon.frx":71DA
      PicArray76      =   "Frm_Logon.frx":71F6
      PicArray77      =   "Frm_Logon.frx":7212
      PicArray78      =   "Frm_Logon.frx":722E
      PicArray79      =   "Frm_Logon.frx":724A
      PicArray80      =   "Frm_Logon.frx":7266
      PicArray81      =   "Frm_Logon.frx":7282
      PicArray82      =   "Frm_Logon.frx":729E
      PicArray83      =   "Frm_Logon.frx":72BA
      PicArray84      =   "Frm_Logon.frx":72D6
      PicArray85      =   "Frm_Logon.frx":72F2
      PicArray86      =   "Frm_Logon.frx":730E
      PicArray87      =   "Frm_Logon.frx":732A
      PicArray88      =   "Frm_Logon.frx":7346
      PicArray89      =   "Frm_Logon.frx":7362
      PicArray90      =   "Frm_Logon.frx":737E
      PicArray91      =   "Frm_Logon.frx":739A
      PicArray92      =   "Frm_Logon.frx":73B6
      PicArray93      =   "Frm_Logon.frx":73D2
      PicArray94      =   "Frm_Logon.frx":73EE
      PicArray95      =   "Frm_Logon.frx":740A
      PicArray96      =   "Frm_Logon.frx":7426
      PicArray97      =   "Frm_Logon.frx":7442
      PicArray98      =   "Frm_Logon.frx":745E
      PicArray99      =   "Frm_Logon.frx":747A
   End
   Begin VB.Timer Inactivity 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2760
      Top             =   4200
   End
   Begin VB.Timer TimerJobs 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   600
      Top             =   4170
   End
   Begin VB.PictureBox Piclogoff 
      BorderStyle     =   0  'None
      Height          =   915
      Left            =   0
      ScaleHeight     =   915
      ScaleWidth      =   3765
      TabIndex        =   5
      Top             =   960
      Width           =   3765
      Begin VB.TextBox txt_SessionTimer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   11
         Top             =   480
         Width           =   585
      End
      Begin VB.CommandButton Cmd_Logoff 
         Caption         =   "&Logoff"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2640
         TabIndex        =   10
         TabStop         =   0   'False
         Top             =   480
         Width           =   915
      End
      Begin VB.TextBox txt_Balance 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   900
         Locked          =   -1  'True
         TabIndex        =   9
         Top             =   480
         Width           =   1065
      End
      Begin VB.TextBox txt_ActiveUser 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0FFFF&
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   900
         Locked          =   -1  'True
         TabIndex        =   7
         Top             =   90
         Width           =   2670
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Balance $:"
         Height          =   195
         Left            =   30
         TabIndex        =   8
         Top             =   480
         Width           =   765
      End
      Begin VB.Label txt_User 
         AutoSize        =   -1  'True
         Caption         =   "User:"
         Height          =   195
         Left            =   30
         TabIndex        =   6
         Top             =   120
         Width           =   375
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   135
      Top             =   4155
   End
   Begin VB.PictureBox Piclogon 
      BorderStyle     =   0  'None
      Height          =   1155
      Left            =   0
      ScaleHeight     =   1155
      ScaleWidth      =   3765
      TabIndex        =   2
      Top             =   0
      Width           =   3765
      Begin VB.CommandButton Cmd_Logon 
         Caption         =   "&Logon"
         Default         =   -1  'True
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   2460
         TabIndex        =   3
         Top             =   480
         Width           =   1110
      End
      Begin VB.TextBox txt_Badge 
         Appearance      =   0  'Flat
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         Left            =   1080
         TabIndex        =   0
         Top             =   90
         Width           =   2460
      End
      Begin VB.TextBox txt_Password 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   315
         IMEMode         =   3  'DISABLE
         Left            =   1125
         PasswordChar    =   "*"
         TabIndex        =   1
         Top             =   480
         Width           =   1320
      End
      Begin VB.Label lbl_Password 
         Caption         =   "Label1"
         Height          =   225
         Left            =   75
         TabIndex        =   13
         Top             =   450
         Width           =   1065
      End
      Begin VB.Label lbl_Badge 
         Caption         =   "Label1"
         Height          =   225
         Left            =   75
         TabIndex        =   4
         Top             =   150
         Width           =   1035
      End
   End
End
Attribute VB_Name = "Frm_Logon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

''DISCLAIMER OF WARRANTY
''
''IN NO EVENT SHALL THE AUTHOR AND/OR NPS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL,
''OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
''EVEN IF THE AUTHOR AND/OR NPS HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
''THE AUTHOR AND NPS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
''OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
''THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS PROVIDED "AS IS".
''THE AUTHOR AND NPS HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

''The author and/or distributors of this source code may have made statements about this source code.
''Any such statements do not constitute warranties and shall not be relied on by the user in deciding
''whether to use this source code.
''This source code is provided without any express or implied warranties whatsoever.
''Because of the diversity of conditions and hardware under which this source code may be used,
''no warranty of fitness for a particular purpose is offered.
''The user is advised to test the source code thoroughly before relying on it.
''The user must assume the entire risk of using the source code.

Dim lFormTopMouseDown  As Long
Dim lFormLeftMouseDown As Long
Dim CursorLoc          As POINTAPI
Dim lpwndpl            As WINDOWPLACEMENT
Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long


Private PWDREQ As Long
Private IdleSeconds As Long

Const SW_SHOWNORMAL = 1

Private Type POINTAPI
    x As Long
    Y As Long
End Type

Private Type RECT
    Left   As Long
    Top    As Long
    Right  As Long
    Bottom As Long
End Type

Private Type WINDOWPLACEMENT
    length           As Long
    flags            As Long
    ShowCmd          As Long
    ptMinPosition    As POINTAPI
    ptMaxPosition    As POINTAPI
    rcNormalPosition As RECT
End Type

Private Declare Function GetCursorPos Lib "user32" (lpPoint As POINTAPI) As Long
Private Declare Function SetWindowPlacement Lib "user32" (ByVal hwnd As Long, lpwndpl As WINDOWPLACEMENT) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Const HTCAPTION = 2
Const WM_NCLBUTTONDOWN = &HA1
Const HTLEFT = 10
Const HTRight = 11
    

'Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Call ReleaseCapture
'Call SendMessage(hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
'End Sub


'Private Sub cmdResize_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Dim nParam As Long

'With cmdResize
'    If X > 0 And X < 100 Then
'        nParam = HTLEFT
'    ElseIf X > .Width - 100 And X < .Width Then
'        nParam = HTRight
'    End If
'    If nParam Then
'        Call ReleaseCapture
'        Call SendMessage(.hwnd, WM_NCLBUTTONDOWN, nParam, 0)
'    End If
'End With
'End Sub


'Private Sub CmdResize_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Dim NewPointer As MousePointerConstants

'With cmdResize
'    If X > 0 And X < 100 Then
'        NewPointer = vbSizeWE
'    ElseIf X > .Width - 100 And X < .Width Then
'        NewPointer = vbSizeWE
'    Else
'        NewPointer = vbDefault
'    End If
'    If NewPointer <> .MousePointer Then
'        .MousePointer = NewPointer
'    End If
'End With

'End Sub
Public Function wslogoff()

End Function

Private Sub AutoLogon_Timer()
    AutoLogon.Enabled = False
    txt_Badge = Get_User_Name
    Call Cmd_Logon_Click
End Sub

Private Sub Cmd_Logoff_Click()

     ''''''''''''''''''''''''''''''''''''''''''''''''''''
     ' Project #: dgp-0001
     ' do we have any active jobs in any monitored queues
     ' if we do then do not allow logoff to happen
     ''''''''''''''''''''''''''''''''''''''''''''''''''''
     ' are we minimized if so then restore
     If Me.WindowState = 1 Then
        Me.WindowState = 0
        DoEvents
     End If
     
     Dim totalactivejobs As Long
     Dim curactivejobs   As Long
     
     activejobs = 0
     curactivejobs = 0
     
     Dim mInst As cls_Monitor
     For Each mInst In MyMonitors
          curactivejobs = 0
          curactivejobs = mInst.mJobCount
          activejobs = activejobs + curactivejobs
     Next
     
     If (activejobs > 0) Then
         Frm_Main.ShowBalloonError ("Active jobs were detected on monitored queue" & vbCrLf & "Active jobs must be processed before a logoff can be processed")
         Exit Sub
     End If
    
    
    
    
     If (VerifyNetWork = False) Then
            IdleSeconds = gClsConfig.InactivityThreshold
            processNoNetwork
            Exit Sub
     End If
     
     If (gCmOpen = True) Then
         Unload Frm_ClientMatter
     End If
          
     If (gClsDatabase.ConnectDB = False) Then
         IdleSeconds = gClsConfig.InactivityThreshold
         processnodb
         Exit Sub
     Else
        gClsDatabase.CloseDB
     End If
     
     
     ''''''''''''''''''''''''''''''''''
     ' end
     ' Project #: DGP-0001
     ''''''''''''''''''''''''''''''''
         
     If (gClsDatabase.ConnectDB = True) Then
       
          If (gClsSessionManager.GetSessionState() = True) Then
               
               TimerJobs.Enabled = False
    
               If (processLogoff = False) Then
                   TimerJobs.Enabled = True
                   Exit Sub
               End If
               
               lst_Activity.ClearList
           
               Piclogoff.Visible = False
               Piclogoff.Top = 0
               Piclogoff.Left = 0
           
              lst_Activity.Visible = False
              lst_Activity.Top = 0
              lst_Activity.Left = 0
           
              Piclogon.Visible = True
              Piclogon.Top = 0
              Piclogon.Left = 0
           
              Me.Height = 1300
                  
              txt_Badge.Text = ""
              txt_Password.Text = ""
              txt_Badge.SetFocus
              SetTranslucent Me.hwnd, 128
        End If
       
       Call gClsDatabase.CloseDB
       Mod_Main.IsLoggedOn = False
    
    End If
    
      
End Sub

Private Sub Cmd_Logon_Click()
    
      If Me.WindowState = 1 Then
        Me.WindowState = 0
        DoEvents
     End If
    
    If (txt_Badge = "") Then
      txt_Badge.SetFocus
      Exit Sub
    End If
        
    If (PWDREQ) And (txt_Password = "") Then
      txt_Password.SetFocus
      Exit Sub
    End If
    
    If (VerifyNetWork = False) Then
            processNoNetwork
            Exit Sub
    End If
    
    If (gClsDatabase.ConnectDB = False) Then
            processnodb
            Exit Sub
    End If
       
       
       If (gClsSessionManager.GetSessionState() = True) Then
            processActiveSession
            GoTo Terminate
       End If
       
       If (gClsaccountManager.VerifyBadgeCount(Me.txt_Badge) = 0) Then
            processInvalid
            SetTopMostWindow Me.hwnd, True
            txt_Badge.SetFocus
            GoTo Terminate
       End If
                  
       If (PWDREQ) Then
            Call gClsaccountManager.VerifyBadgePassword(Me.txt_Badge, Me.txt_Password)
       Else
            Call gClsaccountManager.VerifyBadge(Me.txt_Badge)
       End If
                  
       If (gClsaccountManager.isLogonValid = False) Then
                processInvalid
                SetTopMostWindow Me.hwnd, True
                txt_Badge.SetFocus
                GoTo Terminate
       End If
              
       '' check to make sure not already logged on elsewhere
       ''''''''''''''''''''''''''''''''''''''''''''''''''''
       If (gClsaccountManager.DB_IsAlreadyActive(gClsaccountManager.ActiveAccount_GUID) = True) Then
                processAlreadyLoggedOn
                SetTopMostWindow Me.hwnd, True
                txt_Badge.SetFocus
                GoTo Terminate
       End If
              
              
       Call gClsaccountManager.GetOU
       Call gClsaccountManager.GetPrintCosts
                       
       If (gClsaccountManager.mActive_OU_Locked = True) Then
              processOULocked
              SetTopMostWindow Me.hwnd, True
              txt_Badge.SetFocus
              GoTo Terminate
       End If
                       
       If (gClsaccountManager.mActive_OU_Valid = False) Then
             processOUNotFound
             SetTopMostWindow Me.hwnd, True
             txt_Badge.SetFocus
             GoTo Terminate
       End If
       
       
       If (gClsaccountManager.mActive_OU_CMethod = "DEBIT") And (gClsaccountManager.mActive_OU_AllowNeg = False) Then
                  If (gClsaccountManager.mActiveInitFunds < ActiveCost.m_HIGHEST) Then
                              processNoFunds
                              GoTo Terminate
                  End If
       End If
                       
       ' good logon
       
       processLogon
       Piclogon.Visible = False
       Piclogon.Top = 0
       Piclogon.Left = 0
                  
       Piclogoff.Visible = True
       Piclogoff.Top = 0
       Piclogoff.Left = 0
                  
       lst_Activity.Visible = True
       lst_Activity.Top = Piclogoff.Height + 10
       lst_Activity.Left = 0
       Me.Height = 1300 'Piclogoff.Height + picActivity.Height + 100
     ''  PositionForm Me
       SetTranslucent Me.hwnd, 128
                  
       '' show units or currency
       '''''''''''''''''''''''''
       If (gclsUnitCurrency.mIsEnabled) Then
            Label1.Caption = "Units: "
            lst_Activity.ColumnText(2) = "Units"
            txt_Balance = gclsUnitCurrency.ConvertCurToUnits(gClsaccountManager.mActiveInitFunds)
       Else
           txt_Balance = Format(gClsaccountManager.mActiveInitFunds, "currency")
       End If
       
       'txt_ActiveUser = gClsaccountManager.mActiveLastName & "," & gClsaccountManager.mActiveFirstname & "," & gClsaccountManager.mActiveOUName
       txt_ActiveUser = gClsaccountManager.mActiveLastName & "/" & ComputerName & "/" & gClsaccountManager.mActiveOUName
       
       
       Mod_Main.IsLoggedOn = True
       Frm_Main.SetIconColorAfterLogon
       
Terminate:
      Call gClsDatabase.CloseDB

End Sub

Private Sub Form_Load()
    
    Me.Width = 3690
    Me.Height = 1300
    
    lpwndpl.length = Len(lpwndpl)
    lpwndpl.ShowCmd = SW_SHOWNORMAL
    lbl_Badge.Caption = gClsConfig.LogonPanel_UID_TXT
    txt_User.Caption = "Account:"
     
    lbl_Password.Caption = "Pin #"
    txt_Password.Visible = True
    lbl_Password.Visible = True
  
    
    PWDREQ = gClsConfig.LogonPanel_PWD_REQ
    If (PWDREQ) Then
          lbl_Password.Caption = gClsConfig.LogonPanel_PWD_TXT
          txt_Password.Enabled = True
          txt_Password.BackColor = &H80000005
    End If
 
 '10152008 - Added by Jeff
 'Used to disable the Close button on the form
  DisableCloseWindowButton Me
  Cmd_Logon.Default = True
  Timer1.Enabled = True
    
  If (gClsConfig.AutoLogon = True) Then
    AutoLogon.Enabled = True
  End If
    
  
End Sub



Private Sub Inactivity_Timer()
    
     Dim totalactivejobs As Long
     Dim curactivejobs   As Long
     activejobs = 0
     curactivejobs = 0
    
    
     IdleSeconds = IdleSeconds - 1
     txt_SessionTimer.Text = TimeString(IdleSeconds, False)
    
     If (IdleSeconds = 0) Then
       
        Dim mInst As cls_Monitor
        For Each mInst In MyMonitors
          curactivejobs = 0
          curactivejobs = mInst.mJobCount
          activejobs = activejobs + curactivejobs
        Next
   
       If (activejobs > 0) Then
          IdleSeconds = gClsConfig.InactivityThreshold
          Exit Sub
       Else
         Call Cmd_Logoff_Click
       End If
    
    End If

End Sub

Private Sub myUDP_DataArrival(ByVal bytesTotal As Long)
    Dim packet As String
    myUDP.GetData packet
    gClsSessionManager.AddJob packet
    
    IdleSeconds = gClsConfig.InactivityThreshold
    txt_SessionTimer.Text = TimeString(IdleSeconds, False)
    
    If (gClsaccountManager.ForceLogoff = True) Then
            Call gClsConfig.ForcedLogoff
            Call Cmd_Logoff_Click
            processNoFunds
            Exit Sub
    End If
       
    If (gclsMaxSpend.HasMaxSpendReached = True) Then
            Call gClsConfig.ForcedLogoff
                   processMaxSessionSpend
            Exit Sub
    End If
    
    If (gClsCMActive.CMEnabled = True) Then
           If (gClsCMActive.overThreshold = True) Then
              Load Frm_ClientMatter
              Frm_ClientMatter.Show 0
              SetTopMostWindow Frm_ClientMatter.hwnd, True
           End If
    End If
    
End Sub

Private Sub myUDP_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
' we have an error
End Sub

Private Sub Timer1_Timer()
    Timer1.Enabled = False
    PositionForm Me
    SetTranslucent Me.hwnd, 128
    SetTopMostWindow Me.hwnd, True
    Me.AutoRedraw = True
    
End Sub

Function HandleLogoff() As Boolean
    Call gClsDatabase.ConnectDB
    Call gClsDatabase.CloseDB
End Function
Function ComputerName() As String
    Dim buffer As String * 512, length As Long
    length = Len(buffer)
    'GetComputerName returns zero on failure
    If GetComputerName(buffer, length) Then
        ComputerName = UCase(Left$(buffer, length))
    End If
End Function

Private Function processLogon() As Boolean
        
        IdleSeconds = gClsConfig.InactivityThreshold
        Inactivity.Enabled = True
        txt_SessionTimer.Text = TimeString(IdleSeconds, False)
        gClsaccountManager.GetPrintCosts
        gClsSessionManager.OpenSession (gClsaccountManager.mActiveBadge)
        
        Call gclsMaxSpend.InitSession
        Call gclsMaxSpend.GetGlobalMaxSpend
        Call gclsMaxSpend.GetOUMaxSpend(gClsaccountManager.ActiveOu_GUID)
        Call gclsMaxSpend.GetAccountMaxSpend(gClsaccountManager.ActiveAccount_GUID)
                
        Call gclsUnitCurrency.InitSession
        
        gClsConfig.Update_ActiveLogon
        gClsaccountManager.DB_InsertActive (gClsaccountManager.ActiveAccount_GUID)
        
        myUDP.Bind 2203
        
        Call gclsLabPrint.LP_Installed
        If (gclsLabPrint.mLPInstalled) Then
            gclsLabPrint.LP_LabParams
            gclsLabPrint.LP_AddLab
            gclsLabPrint.LP_AddMachine
            gclsLabPrint.LP_GetExpire       '' get expire date and time for lab
            gclsLabPrint.LP_MachineLogon    '' update lp_lab_machines to active
        End If
                
        gclspcpl.ResetLog
        TimerJobs.Enabled = True
        Cmd_Logon.Default = False
        Cmd_Logoff.Default = True

End Function

Private Function processLogoff() As Boolean
      
      
      processLogoff = gClsSessionManager.CloseSession
      If (processLogoff = True) Then
      
            gClsaccountManager.UpdateAccountFunds
            gClsConfig.Update_ActiveLogon
            gClsaccountManager.DB_RemoveActive (gClsaccountManager.ActiveAccount_GUID)
            gclspcpl.ResetLog
            myUDP.Close
            
            
            If (gclsLabPrint.mLPInstalled) Then
             Call gclsLabPrint.LP_MachineLogoff '' update lp_lab_machines to idle
            End If
            
            TimerJobs.Enabled = False
            Cmd_Logon.Default = True
            Cmd_Logoff.Default = False
            IdleSeconds = 0
            Inactivity.Enabled = False
            txt_SessionTimer.Text = "0.00"
      
      Else
        IdleSeconds = gClsConfig.InactivityThreshold
        txt_SessionTimer.Text = TimeString(IdleSeconds, False)
      End If
        
      
End Function

Private Function processTailGate() As Boolean
    Call Frm_Main.ShowBalloonWarning("Tailgate")
End Function
Private Function processnodb() As Boolean
    Call Frm_Main.ShowBalloonWarning("The database server at (" & gClsConfig.DatabaseServer & ") is not responding")
End Function

Private Function processActiveSession() As Boolean
    Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " Account Aready Logged On")
End Function

Private Function processInvalid() As Boolean
    Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " not valid")
End Function

Private Function processAlreadyLoggedOn() As Boolean
    Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " Already Logged On")
End Function

Private Function processNoNetwork() As Boolean
    Call Frm_Main.ShowBalloonWarning("No Network Detected")
End Function

Private Function processNoFunds() As Boolean
    Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " Insufficent Funds")
End Function

Private Function processOULocked() As Boolean
    Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " OU Is Locked")
End Function

Private Function processOUNotFound() As Boolean
    Call Frm_Main.ShowBalloonWarning(gClsConfig.LogonPanel_UID_TXT & " OU Not Located")
End Function

Private Function processFreePrintEnabled(msg As String) As Boolean
    Call Frm_Main.ShowBalloonWarning(msg)
End Function

Private Function processMaxSessionSpend() As Boolean

On Error GoTo handler
    If (gclsUnitCurrency.mIsEnabled) Then
        Dim a As String
        a = gclsUnitCurrency.ConvertCurToUnits(gclsMaxSpend.GetMaxSpendPerSessionUnits)
        Call Frm_Main.ShowBalloonWarning("The max spend limit of " & a & " has been reached" & vbCrLf & "No more Print jobs will be allowed" & vbCrLf & "Please logoff")
    Else
        Call Frm_Main.ShowBalloonWarning("The max spend limit of " & gclsMaxSpend.GetMaxSpendPerSessionCur & " has been reached" & vbCrLf & "No more Print jobs will be allowed" & vbCrLf & "Please logoff")
    End If
    
handler:
    
    If (Err.Number <> 0) Then
            Call Frm_Main.ShowBalloonWarning("ProcessMaxSessionSpend()" & vbCrLf & "Generated Error :" & Err.Description)
    End If
        
End Function


Private Sub TimerJobs_Timer()
     
     TimerJobs.Enabled = False
          
        Call gClsSessionManager.RefreshJobList(lst_Activity)
        
        ''''''''''''''''''''''''''''''''''''''
        '' show curfunds as units or currecny'
        ''''''''''''''''''''''''''''''''''''''
       If (gclsUnitCurrency.mIsEnabled) Then
            Label1.Caption = "Units: "
            txt_Balance = gclsUnitCurrency.ConvertCurToUnits(gClsaccountManager.mActiveCurFunds)
       Else
            txt_Balance = Format(gClsaccountManager.mActiveCurFunds, "currency")
       End If
        
    
     
     TimerJobs.Enabled = True
      
End Sub

Public Function TimeString(Seconds As Long, Optional Verbose As Boolean = False) As String

'if verbose = false, returns
'something like
'02:22.08
'if true, returns
'2 hours, 22 minutes, and 8 seconds

Dim lHrs As Long
Dim lMinutes As Long
Dim lSeconds As Long

lSeconds = Seconds

lHrs = Int(lSeconds / 3600)
lMinutes = (Int(lSeconds / 60)) - (lHrs * 60)
lSeconds = Int(lSeconds Mod 60)

Dim sAns As String


If lSeconds = 60 Then
    lMinutes = lMinutes + 1
    lSeconds = 0
End If

If lMinutes = 60 Then
    lMinutes = 0
    lHrs = lHrs + 1
End If

sAns = Format(CStr(lMinutes), "00") & "." & _
       Format(CStr(lSeconds), "00")

If Verbose Then sAns = TimeStringtoEnglish(sAns)
TimeString = sAns

End Function

Private Function TimeStringtoEnglish(sTimeString As String) As String

Dim sAns As String
Dim sHour, sMin As String, sSec As String
Dim iTemp As Integer, sTemp As String
Dim iPos As Integer
iPos = InStr(sTimeString, ":") - 1

sHour = Left$(sTimeString, iPos)
If CLng(sHour) <> 0 Then
    sAns = CLng(sHour) & " hour"
    If CLng(sHour) > 1 Then sAns = sAns & "s"
    sAns = sAns & ", "
End If

sMin = Mid$(sTimeString, iPos + 2, 2)

iTemp = sMin

If sMin = "00" Then
   sAns = IIf(Len(sAns), sAns & "0 minutes, and ", "")
Else
   sTemp = IIf(iTemp = 1, " minute", " minutes")
   sTemp = IIf(Len(sAns), sTemp & ", and ", sTemp & " and ")
   sAns = sAns & Format$(iTemp, "##") & sTemp
End If

iTemp = Val(Right$(sTimeString, 2))
sSec = Format$(iTemp, "#0")
sAns = sAns & sSec & " second"
If iTemp <> 1 Then sAns = sAns & "s"

TimeStringtoEnglish = sAns

End Function

