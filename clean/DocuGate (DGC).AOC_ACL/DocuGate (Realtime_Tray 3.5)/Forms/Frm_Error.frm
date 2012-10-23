VERSION 5.00
Begin VB.Form frm_Error 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Notification"
   ClientHeight    =   1665
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4440
   Icon            =   "Frm_Error.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1665
   ScaleWidth      =   4440
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   960
      Left            =   225
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Frm_Error.frx":6852
      Top             =   150
      Width           =   4110
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Dismiss"
      Height          =   330
      Left            =   1725
      TabIndex        =   0
      Top             =   1200
      Width           =   960
   End
End
Attribute VB_Name = "frm_Error"
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


'Private skinOB As New SKINCRAFTERLib.SCSkin2

Private Sub Form_Initialize()
'    skinOB.InitLicenKeys "Network Printing Solutions", "Network Printing Solutions", "peterd@printstudy.com", "IV9ID7B49QT6WBDA0C4TMJZ15FUS2"
'    skinOB.DefineLanguage 2
'    skinOB.InitDecoration 1
End Sub

Private Sub Form_Load()
    
' skinOB.LoadSkinFromFile "c:\docugate.skf"
' skinOB.ApplySkin

End Sub



Private Sub Command1_Click()
Unload Me
End Sub
