Option Strict Off
Option Explicit On
Module Mod_EnumJobs
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
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function OpenPrinter Lib "winspool.drv"  Alias "OpenPrinterA"(ByVal pPrinterName As String, ByRef phPrn As Integer, ByRef pDefault As Any) As Integer
	Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrn As Integer) As Integer
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function GetPrinter Lib "winspool.drv"  Alias "GetPrinterA"(ByVal hPrinter As Integer, ByVal Level As Integer, ByRef pPrinter As Any, ByVal cbBuf As Integer, ByRef pcbNeeded As Integer) As Integer
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function EnumJobs Lib "winspool.drv"  Alias "EnumJobsA"(ByVal hPrinter As Integer, ByVal FirstJob As Integer, ByVal NoJobs As Integer, ByVal Level As Integer, ByRef pJob As Any, ByVal cdBuf As Integer, ByRef pcbNeeded As Integer, ByRef pcReturned As Integer) As Integer
	'UPGRADE_NOTE: Command was upgraded to Command_Renamed. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="A9E4979A-37FA-4718-9994-97DD76ED70A7"'
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function SetJob Lib "winspool.drv"  Alias "SetJobA"(ByVal hPrinter As Integer, ByVal JobId As Integer, ByVal Level As Integer, ByRef pJob As Any, ByVal Command_Renamed As Integer) As Integer
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Function GetJob Lib "winspool.drv"  Alias "GetJobA"(ByVal hPrinter As Integer, ByVal JobId As Integer, ByVal Level As Integer, ByRef pJob As Any, ByVal cdBuf As Integer, ByRef pcbNeeded As Integer) As Integer
	'UPGRADE_WARNING: Structure OSVERSIONINFO may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="C429C3A5-5D47-4CD9-8F51-74A1616405DC"'
	Private Declare Function GetVersionEx Lib "kernel32"  Alias "GetVersionExA"(ByRef lpVersionInformation As OSVERSIONINFO) As Integer
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	'UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="FAE78A8D-8978-4FD4-8208-5B7324A8F795"'
	Private Declare Sub CopyMemory Lib "kernel32"  Alias "RtlMoveMemory"(ByRef Destination As Any, ByRef Source As Any, ByVal Length As Integer)
	
	Private Structure OSVERSIONINFO
		Dim dwOSVersionInfoSize As Integer
		Dim dwMajorVersion As Integer
		Dim dwMinorVersion As Integer
		Dim dwBuildNumber As Integer
		Dim dwPlatformId As Integer
		'UPGRADE_WARNING: Fixed-length string size must fit in the buffer. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="3C1E4426-0B80-443E-B943-0627CD55D48B"'
		<VBFixedString(128),System.Runtime.InteropServices.MarshalAs(System.Runtime.InteropServices.UnmanagedType.ByValArray,SizeConst:=128)> Public szCSDVersion() As Char
	End Structure
	
	'  dwPlatformId defines:
	Private Const VER_PLATFORM_WIN32s As Short = 0
	Private Const VER_PLATFORM_WIN32_WINDOWS As Short = 1
	Private Const VER_PLATFORM_WIN32_NT As Short = 2
	
	' Need defaults to OpenPrinter in some cases
	Private Structure PRINTER_DEFAULTS
		Dim pDatatype As String
		Dim pDevMode As Integer
		Dim pDesiredAccess As Integer
	End Structure
	
	Private Const STANDARD_RIGHTS_REQUIRED As Integer = &HF0000
	Private Const PRINTER_ACCESS_ADMINISTER As Integer = &H4
	Private Const PRINTER_ACCESS_USE As Integer = &H8
	Private Const PRINTER_ALL_ACCESS As Boolean = (STANDARD_RIGHTS_REQUIRED Or PRINTER_ACCESS_ADMINISTER Or PRINTER_ACCESS_USE)
	
	' The data area passed to a system call is too small.
	Private Const ERROR_INSUFFICIENT_BUFFER As Integer = 122
	
	' Job control constants
	Private Const JOB_CONTROL_PAUSE As Short = 1
	Private Const JOB_CONTROL_RESUME As Short = 2
	Private Const JOB_CONTROL_CANCEL As Short = 3
	Private Const JOB_CONTROL_RESTART As Short = 4
	Private Const JOB_CONTROL_DELETE As Short = 5
	Private Const JOB_CONTROL_SENT_TO_PRINTER As Short = 6
	Private Const JOB_CONTROL_LAST_PAGE_EJECTED As Short = 7
	
	Private Enum JobControlCodes
		jcPause = JOB_CONTROL_PAUSE
		jcResume = JOB_CONTROL_RESUME
		jcCancel = JOB_CONTROL_CANCEL
		jcRestart = JOB_CONTROL_RESTART
		jcDelete = JOB_CONTROL_DELETE
	End Enum
	
	
	Public Function EnumJobCount(ByRef Data As String) As Integer
		Dim lReturned As Object
		Dim lNeeded As Object
		
		Dim hPrn As Integer
		Dim nJobs As Integer
		Dim JobIds() As Integer
		Dim Buffer() As Byte
		Dim BytesNeeded As Integer
		Dim nReturned As Integer
		Dim printer As String
		
		EnumJobCount = 0
		
		Call OpenPrinter(Data, hPrn, 0)
		If hPrn Then
			'UPGRADE_WARNING: Couldn't resolve default property of object lReturned. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			'UPGRADE_WARNING: Couldn't resolve default property of object lNeeded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			EnumJobs(hPrn, 0, 99, 1, 0, 0, lNeeded, lReturned)
			'UPGRADE_WARNING: Couldn't resolve default property of object lNeeded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
			If lNeeded > 0 Then
				'UPGRADE_WARNING: Couldn't resolve default property of object lNeeded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				Dim byteJobsBuffer(lNeeded - 1) As Byte
				'UPGRADE_WARNING: Couldn't resolve default property of object lReturned. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				'UPGRADE_WARNING: Couldn't resolve default property of object lNeeded. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				EnumJobs(hPrn, 0, 99, 1, byteJobsBuffer(0), lNeeded, lNeeded, lReturned)
				'UPGRADE_WARNING: Couldn't resolve default property of object lReturned. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
				If lReturned > 0 Then
					'UPGRADE_WARNING: Couldn't resolve default property of object lReturned. Click for more: 'ms-help://MS.VSCC.v90/dv_commoner/local/redirect.htm?keyword="6A50421D-15FE-4896-8A1B-2EC21E9037B2"'
					EnumJobCount = lReturned
				End If
				ReDim byteJobsBuffer(0)
			End If
			Call ClosePrinter(hPrn)
		End If
		
	End Function
End Module