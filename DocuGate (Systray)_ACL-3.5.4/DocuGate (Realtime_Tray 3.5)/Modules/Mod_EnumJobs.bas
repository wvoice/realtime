Attribute VB_Name = "Mod_EnumJobs"
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

' Win32 API declares
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrn As Long, pDefault As Any) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrn As Long) As Long
Private Declare Function GetPrinter Lib "winspool.drv" Alias "GetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Any, ByVal cbBuf As Long, pcbNeeded As Long) As Long
Private Declare Function EnumJobs Lib "winspool.drv" Alias "EnumJobsA" (ByVal hPrinter As Long, ByVal FirstJob As Long, ByVal NoJobs As Long, ByVal Level As Long, pJob As Any, ByVal cdBuf As Long, pcbNeeded As Long, pcReturned As Long) As Long
Private Declare Function SetJob Lib "winspool.drv" Alias "SetJobA" (ByVal hPrinter As Long, ByVal JobId As Long, ByVal Level As Long, pJob As Any, ByVal Command As Long) As Long
Private Declare Function GetJob Lib "winspool.drv" Alias "GetJobA" (ByVal hPrinter As Long, ByVal JobId As Long, ByVal Level As Long, pJob As Any, ByVal cdBuf As Long, pcbNeeded As Long) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExA" (lpVersionInformation As OSVERSIONINFO) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Private Type OSVERSIONINFO
   dwOSVersionInfoSize As Long
   dwMajorVersion As Long
   dwMinorVersion As Long
   dwBuildNumber As Long
   dwPlatformId As Long
   szCSDVersion As String * 128
End Type

'  dwPlatformId defines:
Private Const VER_PLATFORM_WIN32s = 0
Private Const VER_PLATFORM_WIN32_WINDOWS = 1
Private Const VER_PLATFORM_WIN32_NT = 2

' Need defaults to OpenPrinter in some cases
Private Type PRINTER_DEFAULTS
   pDatatype As String
   pDevMode As Long
   pDesiredAccess As Long
End Type

Private Const STANDARD_RIGHTS_REQUIRED = &HF0000
Private Const PRINTER_ACCESS_ADMINISTER = &H4
Private Const PRINTER_ACCESS_USE = &H8
Private Const PRINTER_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or PRINTER_ACCESS_ADMINISTER Or PRINTER_ACCESS_USE)

' The data area passed to a system call is too small.
Private Const ERROR_INSUFFICIENT_BUFFER As Long = 122

' Job control constants
Private Const JOB_CONTROL_PAUSE = 1
Private Const JOB_CONTROL_RESUME = 2
Private Const JOB_CONTROL_CANCEL = 3
Private Const JOB_CONTROL_RESTART = 4
Private Const JOB_CONTROL_DELETE = 5
Private Const JOB_CONTROL_SENT_TO_PRINTER = 6
Private Const JOB_CONTROL_LAST_PAGE_EJECTED = 7

Private Enum JobControlCodes
   jcPause = JOB_CONTROL_PAUSE
   jcResume = JOB_CONTROL_RESUME
   jcCancel = JOB_CONTROL_CANCEL
   jcRestart = JOB_CONTROL_RESTART
   jcDelete = JOB_CONTROL_DELETE
End Enum


Public Function EnumJobCount(Data As String) As Long

   Dim hPrn As Long
   Dim nJobs As Long
   Dim JobIds() As Long
   Dim Buffer() As Byte
   Dim BytesNeeded As Long
   Dim nReturned As Long
   Dim printer As String
   
   EnumJobCount = 0
   
    Call OpenPrinter(Data, hPrn, ByVal 0&)
    If hPrn Then
        EnumJobs hPrn, 0, 99, 1, ByVal 0&, 0, lNeeded, lReturned
        If lNeeded > 0 Then
            ReDim byteJobsBuffer(lNeeded - 1) As Byte
            EnumJobs hPrn, 0, 99, 1, byteJobsBuffer(0), lNeeded, lNeeded, lReturned
            If lReturned > 0 Then
                EnumJobCount = lReturned
            End If
            ReDim byteJobsBuffer(0)
        End If
      Call ClosePrinter(hPrn)
    End If
   
End Function


