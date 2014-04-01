:: Register the sql related DLLs
regsvr32 /u /s Dependencies\sqldmo\SQLDMO.DLL

:: Register the DLL files

regsvr32 /u /s Dependencies\actrpt.dll

regsvr32 /u /s Dependencies\pdfexpt.dll

regsvr32 /u /s Dependencies\SkinCrafter2.dll

regsvr32 /u /s Dependencies\SkinCrafterDLL.dll

regsvr32 /u /s Dependencies\SSubTmr6.dll



:: Register dependent OCX files

regsvr32 /u /s Dependencies\CoolXPButton.ocx
regsvr32 /u /s Dependencies\CoolXPPanel.ocx

regsvr32 /u /s Dependencies\SCLabel.ocx

regsvr32 /u /s Dependencies\ctCheck.ocx

regsvr32 /u /s Dependencies\ctRadio.ocx

regsvr32 /u /s Dependencies\vbalExpBar6.ocx

regsvr32 /u /s Dependencies\vbalGrid6.ocx

regsvr32 /u /s Dependencies\vbalIml6.ocx



:: Copy & Register COM files

copy Dependencies\system32\MSCOMCTL.OCX \WINDOWS\system32\

copy Dependencies\system32\MSCOMCT2.OCX \WINDOWS\system32\

regsvr32 /u /s \WINDOWS\system32\MSCOMCTL.OCX

regsvr32 /u /s \WINDOWS\system32\MSCOMCT2.OCX

