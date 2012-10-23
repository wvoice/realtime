VERSION 5.00
Begin VB.Form Frm_About 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "About"
   ClientHeight    =   3705
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6465
   Icon            =   "Frm_About.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3705
   ScaleWidth      =   6465
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text2 
      Height          =   945
      Left            =   90
      MultiLine       =   -1  'True
      TabIndex        =   5
      Text            =   "Frm_About.frx":6852
      Top             =   1275
      Width           =   6195
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   5820
      Picture         =   "Frm_About.frx":68B4
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   3
      Top             =   375
      Width           =   480
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "Frm_About.frx":717E
      Top             =   375
      Width           =   5625
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Dismiss"
      Default         =   -1  'True
      Height          =   330
      Left            =   2640
      TabIndex        =   0
      Top             =   3225
      Width           =   960
   End
   Begin VB.Label Label3 
      Caption         =   $"Frm_About.frx":71C3
      Height          =   705
      Left            =   105
      TabIndex        =   6
      Top             =   2325
      Width           =   6165
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Additional Information:"
      Height          =   195
      Left            =   120
      TabIndex        =   4
      Top             =   1050
      Width           =   1560
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "This product is licensed only for distribution and resell by:"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   90
      Width           =   3990
   End
End
Attribute VB_Name = "Frm_About"
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


Private Sub Command1_Click()
    Unload Me
End Sub

Private Sub Form_Load()
'txt_version = "Version     : " & App.Major & "." & App.Minor
'txt_copyright = "Copyright(C): Network Printing Solutions Inc.Tampa,FL"
End Sub
