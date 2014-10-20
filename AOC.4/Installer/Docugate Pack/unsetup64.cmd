:: Register the sql related DLLs
C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\sqldmo\SQLDMO.DLL

:: Register the DLL files

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\actrpt.dll

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\pdfexpt.dll

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\SkinCrafter2.dll

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\SkinCrafterDLL.dll

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\SSubTmr6.dll





:: Register dependent OCX files

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\CoolXPButton.ocx
C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\CoolXPPanel.ocx

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\SCLabel.ocx

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\ctCheck.ocx

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\ctRadio.ocx

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\vbalExpBar6.ocx

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\vbalGrid6.ocx

C:\Windows\SysWOW64\regsvr32.exe /u /s Dependencies\vbalIml6.ocx



:: Copy & Register COM files

copy Dependencies\system32\MSCOMCTL.OCX \WINDOWS\system32\

copy Dependencies\system32\MSCOMCT2.OCX \WINDOWS\system32\

C:\Windows\SysWOW64\regsvr32.exe /u /s \WINDOWS\system32\MSCOMCTL.OCX

C:\Windows\SysWOW64\regsvr32.exe /u /s \WINDOWS\system32\MSCOMCT2.OCX

