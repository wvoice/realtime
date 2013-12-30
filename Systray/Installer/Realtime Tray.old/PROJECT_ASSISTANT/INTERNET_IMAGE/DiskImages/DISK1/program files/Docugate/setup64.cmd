:: Register the sql related DLLs
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\SQLDMO.DLL
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\sqlresld.dll
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\sqlsvc.dll
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\w95scm.DLL
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\Sqlsvc.rll
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\Sqldmo.rll
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\sqldmo\Sqlunirl.dll

:: Register the DLL files

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\actrpt.dll

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\pdfexpt.dll

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\SkinCrafter2.dll

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\SkinCrafterDLL.dll

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\SSubTmr6.dll





:: Register dependent OCX files

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\CoolXPButton.ocx
C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\CoolXPPanel.ocx

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\SCLabel.ocx

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\ctCheck.ocx

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\ctRadio.ocx

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\vbalExpBar6.ocx

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\vbalGrid6.ocx

C:\Windows\SysWOW64\regsvr32.exe /s Dependencies\vbalIml6.ocx



:: Copy & Register COM files

copy Dependencies\system32\MSCOMCTL.OCX \WINDOWS\system32\

copy Dependencies\system32\MSCOMCT2.OCX \WINDOWS\system32\

C:\Windows\SysWOW64\regsvr32.exe /s \WINDOWS\system32\MSCOMCTL.OCX

C:\Windows\SysWOW64\regsvr32.exe /s \WINDOWS\system32\MSCOMCT2.OCX

