:: Register the sql related DLLs
regsvr32 /s Dependencies\sqldmo\SQLDMO.DLL

:: Register the DLL files

regsvr32 /s Dependencies\actrpt.dll

regsvr32 /s Dependencies\pdfexpt.dll

regsvr32 /s Dependencies\SkinCrafter2.dll

regsvr32 /s Dependencies\SkinCrafterDLL.dll

regsvr32 /s Dependencies\SSubTmr6.dll



:: Register dependent OCX files

regsvr32 /s Dependencies\CoolXPButton.ocx
regsvr32 /s Dependencies\CoolXPPanel.ocx

regsvr32 /s Dependencies\SCLabel.ocx

regsvr32 /s Dependencies\ctCheck.ocx

regsvr32 /s Dependencies\ctRadio.ocx

regsvr32 /s Dependencies\vbalExpBar6.ocx

regsvr32 /s Dependencies\vbalGrid6.ocx

regsvr32 /s Dependencies\vbalIml6.ocx



:: Copy & Register COM files

copy Dependencies\system32\MSCOMCTL.OCX \WINDOWS\system32\

copy Dependencies\system32\MSCOMCT2.OCX \WINDOWS\system32\

regsvr32 /s \WINDOWS\system32\MSCOMCTL.OCX

regsvr32 /s \WINDOWS\system32\MSCOMCT2.OCX

