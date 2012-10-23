Attribute VB_Name = "Mod_Translucent"
Option Explicit
Public Const LWA_COLORKEY = 1
Public Const LWA_ALPHA = 2
Public Const LWA_BOTH = 3
Public Const WS_EX_LAYERED = &H80000
Public Const GWL_EXSTYLE = -20
Public Declare Function SetLayeredWindowAttributes Lib "user32" (ByVal hwnd As Long, ByVal color As Long, ByVal x As Byte, ByVal alpha As Long) As Boolean
Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long

Sub SetTranslucent(ThehWnd As Long, nTrans As Integer)

On Error GoTo ErrorRtn

   Dim attrib As Long
   'put current GWL_EXSTYLE in attrib
   attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
   'change GWL_EXSTYLE to WS_EX_LAYERED - makes a window layered
   SetWindowLong ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED
   'Make transparent (RGB value does not have any effect at this
   'time, will in Part 2 of this article)
   SetLayeredWindowAttributes ThehWnd, RGB(0, 0, 0), nTrans, LWA_ALPHA
   Exit Sub

ErrorRtn:
MsgBox Err.Description & " Source : " & Err.Source

End Sub


Sub SetTranslucent2(ThehWnd As Long, nTrans As Integer)
    On Error GoTo ErrorRtn

    'SetWindowLong and SetLayeredWindowAttributes are API functions, see MSDN for details
    Dim attrib As Long
    attrib = GetWindowLong(ThehWnd, GWL_EXSTYLE)
    SetWindowLong ThehWnd, GWL_EXSTYLE, attrib Or WS_EX_LAYERED
    SetLayeredWindowAttributes ThehWnd, RGB(255, 255, 0), nTrans, LWA_ALPHA
    Exit Sub
ErrorRtn:
    MsgBox Err.Description & " Source : " & Err.Source
    
End Sub

