VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Frm_Main 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   0  'None
   Caption         =   "DocuGate"
   ClientHeight    =   705
   ClientLeft      =   4560
   ClientTop       =   2760
   ClientWidth     =   2160
   ControlBox      =   0   'False
   Icon            =   "Frm_Main.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   705
   ScaleWidth      =   2160
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.Timer fpNoLogon_Timer 
      Enabled         =   0   'False
      Left            =   1320
      Top             =   120
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   840
      Top             =   120
   End
   Begin MSComctlLib.ImageList ImageList 
      Left            =   150
      Top             =   60
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   48
      ImageHeight     =   48
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Main.frx":6852
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Main.frx":D0B4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Frm_Main.frx":13916
            Key             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Frm_Main"
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


Option Explicit
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private WithEvents m_frmSysTray As Frm_SysTray
Attribute m_frmSysTray.VB_VarHelpID = -1
Private m_frmLogon   As Frm_Logon
Attribute m_frmLogon.VB_VarHelpID = -1
Dim StrCommand As String
Private IsHistoryOn As Boolean

Private m_historyitem As Long
Private m_aboutitem As Long
Private m_cmitem As Long
       
Public Sub SetIconColorAfterLogon()
        m_frmSysTray.IconHandle = ImageList.ListImages(2).Picture
End Sub
       
Public Sub ShowBalloonInformation(Message As String)
    Call m_frmSysTray.ShowBalloonTip(Message, "RealTime Workstation", NIIF_INFO, 15000)
End Sub

Public Sub ShowBalloonWarning(Message As String)
    Call m_frmSysTray.ShowBalloonTip(Message, "RealTime Workstation", NIIF_WARNING, 15000)
End Sub

Public Sub ShowBalloonError(Message As String)
    Call m_frmSysTray.ShowBalloonTip(Message, "RealTime Workstation", NIIF_ERROR, 15000)
End Sub

Private Sub Form_Load()
        
        Me.Caption = "RealTime Workstation"
        IsHistoryOn = False
        
        Set m_frmSysTray = New Frm_SysTray
        Set m_frmLogon = New Frm_Logon
        Dim m_item As Long
        
        With m_frmSysTray
            m_aboutitem = .AddMenuItem("&About...", "about")
            .AddMenuItem "-"
              m_historyitem = .AddMenuItem("&History", "history")
                    
              If (gClsCMActive.CMEnabled = True) Then
                  m_cmitem = .AddMenuItem("&Client/Matter", "cm")
              End If
              
            
            .IconHandle = ImageList.ListImages(1).Picture
            .ToolTip = "RealTime Workstation - Checking Connection"
        End With
   
End Sub


Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    
      If (Mod_Main.IsLoggedOn = True) Then
            Cancel = -1
            ShowBalloonError ("Docugate Workstation is still Logged on" & vbCrLf & "Docugate Workstation must be logged off before a workstation logoff is allowed")
      End If
        
End Sub

Private Sub Form_Unload(Cancel As Integer)
         Call Mod_Main.TerminateApp
End Sub

Private Sub fpNoLogon_Timer_Timer()
    
    If Not gclsfpNoLogon Is Nothing Then
        
        Select Case gclsfpNoLogon.Handle_fpNoLogon_Timer
        
        Case 2
                 m_frmSysTray.IconHandle = ImageList.ListImages(2).Picture
        Case 3
                 m_frmSysTray.IconHandle = ImageList.ListImages(3).Picture
        
        End Select
        
    End If
    
End Sub

Private Sub m_frmSysTray_SysTrayMouseDown(ByVal eButton As MouseButtonConstants)
    If (eButton = vbRightButton) Then
        m_frmSysTray.ShowMenu
    End If
End Sub

Private Sub m_frmSysTray_MenuClick(ByVal lIndex As Long, ByVal sKey As String)
    
    Dim a As Menu
    
    If (sKey = "history") Then
       
       If (Mod_Main.IsLoggedOn = False) Then
           Load frm_Error
           frm_Error.Show 0
           SetTopMostWindow frm_Error.hwnd, True
           Exit Sub
       Else
       
            If (m_frmSysTray.GetMenuItemChecked(m_historyitem) = True) Then
           
                If Frm_Logon.WindowState = 1 Then
                    Frm_Logon.WindowState = 0
                    DoEvents
                End If
                Call m_frmSysTray.SetMenuItemChecked(m_historyitem, False)
                Frm_Logon.Height = 1300
            Else
       
               If Frm_Logon.WindowState = 1 Then
                  Frm_Logon.WindowState = 0
                  DoEvents
               End If
           
              Frm_Logon.Height = Frm_Logon.Piclogoff.Height + Frm_Logon.lst_Activity.Height + 400
              Call m_frmSysTray.SetMenuItemChecked(m_historyitem, True)
            End If
        End If
     
   End If
  
   If (sKey = "about") Then
        Load Frm_About
        Frm_About.Show 0
        SetTopMostWindow Frm_About.hwnd, True
   End If
    
   
   If (sKey = "cm") Then
       If (Mod_Main.IsLoggedOn = False) Then
           Load frm_Error
           frm_Error.Show 0
           SetTopMostWindow frm_Error.hwnd, True
           Exit Sub
       Else
           
           If (VerifyNetWork = False) Then
              ShowBalloonError "RealTime Workstation (No Network Connection)"
              Exit Sub
           End If
           Load Frm_ClientMatter
           Frm_ClientMatter.Show 0
           SetTopMostWindow Frm_ClientMatter.hwnd, True
           gCmOpen = True
      End If
   End If

End Sub

Private Sub Timer1_Timer()
         
        Timer1.Enabled = False
        
        If (VerifyNetWork = False) Then
              ShowBalloonError "RealTime Workstation (No Network Connection enabled)"
              Timer1.Interval = 1000
              Timer1.Enabled = True
              Frm_Logon.Hide
              Exit Sub
        End If
                
        If (gClsDatabase.ConnectDB = False) Then
              
             Frm_Logon.Hide
             If (gclsOfflineManager.mOffLinePermitted = False) Then
                 ShowBalloonError "RealTime Workstation (Database = " & gClsConfig.DatabaseServer & ")" & vbCrLf & "Database is not responding"
                 Timer1.Interval = 1000
                 Timer1.Enabled = True
             Else
                 m_frmSysTray.ToolTip = "RealTime Workstation Standalone Mode Enabled"
                 m_frmSysTray.IconHandle = ImageList.ListImages(3).Picture
                 Timer1.Interval = 1000
                 Timer1.Enabled = True
             End If
             
        Else
             Call gclsLabPrint.LP_Installed
             If (gclsLabPrint.mLPInstalled) Then
                 gclsLabPrint.LP_LabParams
                 gclsLabPrint.LP_AddLab
                 gclsLabPrint.LP_AddMachine
                 
                 '' if labprint is installed then
                 '' then start the class to allow printing if no logon
                 '' and fp is active
                 '' the timer on this form will call the class method
                 '' to do the work
                 Set gclsfpNoLogon = New cls_fpNoLogon
                 fpNoLogon_Timer.Interval = 1000
                 fpNoLogon_Timer.Enabled = True
             Else
                 ShowBalloonInformation "LabPrint Functionality is not availible"
             End If
                          
             gClsDatabase.CloseDB
             m_frmSysTray.ToolTip = "RealTime Workstation (Database = " & gClsConfig.DatabaseServer & ")"
             m_frmSysTray.IconHandle = ImageList.ListImages(2).Picture
             Frm_Logon.Show 0
             Frm_Logon.SetFocus
             Timer1.Interval = 1000
             Timer1.Enabled = False 'Changed to False by Mike Young on 7/10/2011 to stop flashing taskbar.
       End If
   
End Sub

