# Microsoft Developer Studio Generated NMAKE File, Based on TheApp.dsp
!IF "$(CFG)" == ""
CFG=TheApp - Win32 Debug
!MESSAGE No configuration specified. Defaulting to TheApp - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "TheApp - Win32 Release" && "$(CFG)" != "TheApp - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "TheApp.mak" CFG="TheApp - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "TheApp - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "TheApp - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "TheApp - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\DGC_MCR.exe"


CLEAN :
	-@erase "$(INTDIR)\ActivationTimer.obj"
	-@erase "$(INTDIR)\ActiveAccounts.obj"
	-@erase "$(INTDIR)\Database.obj"
	-@erase "$(INTDIR)\Discovery.obj"
	-@erase "$(INTDIR)\IniEx.obj"
	-@erase "$(INTDIR)\Logger.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\TheApp.obj"
	-@erase "$(INTDIR)\TheApp.pch"
	-@erase "$(INTDIR)\TheApp.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\Worker.obj"
	-@erase "$(OUTDIR)\DGC_MCR.exe"
	-@erase "$(OUTDIR)\DGC_MCR.map"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MD /W3 /GX /Zd /O2 /I "..\support\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\TheApp.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TheApp.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TheApp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=RPCRT4.LIB netapi32.lib ws2_32.lib netcashapi.lib ipworks5.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:no /pdb:"$(OUTDIR)\DGC_MCR.pdb" /map:"$(INTDIR)\DGC_MCR.map" /machine:I386 /out:"$(OUTDIR)\DGC_MCR.exe" /libpath:"..\support\lib" /MAPINFO:LINES /MAPINFO:EXPORTS 
LINK32_OBJS= \
	"$(INTDIR)\ActivationTimer.obj" \
	"$(INTDIR)\ActiveAccounts.obj" \
	"$(INTDIR)\Database.obj" \
	"$(INTDIR)\Discovery.obj" \
	"$(INTDIR)\IniEx.obj" \
	"$(INTDIR)\Logger.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\TheApp.obj" \
	"$(INTDIR)\Worker.obj" \
	"$(INTDIR)\TheApp.res"

"$(OUTDIR)\DGC_MCR.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TheApp - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\DGC_MCR.exe"


CLEAN :
	-@erase "$(INTDIR)\ActivationTimer.obj"
	-@erase "$(INTDIR)\ActiveAccounts.obj"
	-@erase "$(INTDIR)\Database.obj"
	-@erase "$(INTDIR)\Discovery.obj"
	-@erase "$(INTDIR)\IniEx.obj"
	-@erase "$(INTDIR)\Logger.obj"
	-@erase "$(INTDIR)\StdAfx.obj"
	-@erase "$(INTDIR)\TheApp.obj"
	-@erase "$(INTDIR)\TheApp.pch"
	-@erase "$(INTDIR)\TheApp.res"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(INTDIR)\Worker.obj"
	-@erase "$(OUTDIR)\DGC_MCR.exe"
	-@erase "$(OUTDIR)\DGC_MCR.ilk"
	-@erase "$(OUTDIR)\DGC_MCR.map"
	-@erase "$(OUTDIR)\DGC_MCR.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\support\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\TheApp.pch" /Yu"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\TheApp.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TheApp.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=RPCRT4.LIB netapi32.lib ws2_32.lib netcashapi.lib ipworks5.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /incremental:yes /pdb:"$(OUTDIR)\DGC_MCR.pdb" /map:"$(INTDIR)\DGC_MCR.map" /debug /machine:I386 /out:"$(OUTDIR)\DGC_MCR.exe" /pdbtype:sept /libpath:"..\support\lib" 
LINK32_OBJS= \
	"$(INTDIR)\ActivationTimer.obj" \
	"$(INTDIR)\ActiveAccounts.obj" \
	"$(INTDIR)\Database.obj" \
	"$(INTDIR)\Discovery.obj" \
	"$(INTDIR)\IniEx.obj" \
	"$(INTDIR)\Logger.obj" \
	"$(INTDIR)\StdAfx.obj" \
	"$(INTDIR)\TheApp.obj" \
	"$(INTDIR)\Worker.obj" \
	"$(INTDIR)\TheApp.res"

"$(OUTDIR)\DGC_MCR.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("TheApp.dep")
!INCLUDE "TheApp.dep"
!ELSE 
!MESSAGE Warning: cannot find "TheApp.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "TheApp - Win32 Release" || "$(CFG)" == "TheApp - Win32 Debug"
SOURCE=.\ActivationTimer.cpp

"$(INTDIR)\ActivationTimer.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\ActiveAccounts.cpp

"$(INTDIR)\ActiveAccounts.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\Database.cpp

"$(INTDIR)\Database.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\Discovery.cpp

"$(INTDIR)\Discovery.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\IniEx.cpp

"$(INTDIR)\IniEx.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\Logger.cpp

"$(INTDIR)\Logger.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\StdAfx.cpp

!IF  "$(CFG)" == "TheApp - Win32 Release"

CPP_SWITCHES=/nologo /MD /W3 /GX /Zd /O2 /I "..\support\include" /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\TheApp.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\TheApp.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ELSEIF  "$(CFG)" == "TheApp - Win32 Debug"

CPP_SWITCHES=/nologo /MDd /W3 /Gm /GX /ZI /Od /I "..\support\include" /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /D "_AFXDLL" /Fp"$(INTDIR)\TheApp.pch" /Yc"stdafx.h" /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /GZ /c 

"$(INTDIR)\StdAfx.obj"	"$(INTDIR)\TheApp.pch" : $(SOURCE) "$(INTDIR)"
	$(CPP) @<<
  $(CPP_SWITCHES) $(SOURCE)
<<


!ENDIF 

SOURCE=.\TheApp.cpp

"$(INTDIR)\TheApp.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"


SOURCE=.\TheApp.rc

"$(INTDIR)\TheApp.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) $(RSC_PROJ) $(SOURCE)


SOURCE=.\Worker.cpp

"$(INTDIR)\Worker.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\TheApp.pch"



!ENDIF 

