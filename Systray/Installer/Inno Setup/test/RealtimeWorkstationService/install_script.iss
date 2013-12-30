;InnoSetupVersion=5.2.1

[Setup]
AppName=Realtime Workstation 3.2 ( Service Mode)
AppVerName=3.2
DefaultDirName={pf}\RealTime\workstation
DefaultGroupName=Realtime
OutputBaseFilename=RealtimeWorkstationService
Compression=lzma
WizardImageFile=embedded\WizardImage.bmp
WizardSmallImageFile=embedded\WizardSmallImage.bmp

[Files]
Source: "{sys}\ctList.ocx"; DestDir: "{sys}"; MinVersion: 0.0,5.01.2600; Flags: regserver onlyifdoesntexist 
Source: "{sys}\MSCOMCTL.OCX"; DestDir: "{sys}"; MinVersion: 0.0,5.01.2600; Flags: regserver onlyifdoesntexist 
Source: "{sys}\MSSTDFMT.DLL"; DestDir: "{sys}"; MinVersion: 0.0,5.01.2600; Flags: regserver onlyifdoesntexist 
Source: "{sys}\MSWINSCK.OCX"; DestDir: "{sys}"; MinVersion: 0.0,5.01.2600; Flags: regserver onlyifdoesntexist 
Source: "{app}\realtime_tray.exe"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Source: "{app}\Realtime_Configurator.exe"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Source: "{app}\realtime.conf"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Source: "{app}\HighTechs.ico"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Source: "{app}\realtime_service.exe"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Source: "{app}\realtime_service.log"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Realtime Systems"; ValueType: String; MinVersion: 0.0,5.01.2600; Flags: uninsdeletekey 
Root: HKLM; Subkey: "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN"; ValueName: "realtime"; ValueType: String; ValueData: "{app}\realtime_tray.exe"; MinVersion: 0.0,5.01.2600; Flags: uninsdeletevalue 

[Run]
Filename: "{app}\realtime_configurator.exe"; WorkingDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Filename: "{app}\realtime_tray.exe"; WorkingDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Filename: "{app}\realtime_service.exe"; Parameters: "-i"; WorkingDir: "{app}"; StatusMsg: "Installing Service"; MinVersion: 0.0,5.01.2600; 
Filename: "{sys}\NET"; Parameters: "START ""Realtime_service"""; WorkingDir: "{sys}"; StatusMsg: "Starting Service"; MinVersion: 0.0,5.01.2600; 

[UninstallRun]
Filename: "{sys}\TASKKILL"; Parameters: "/F /IM realtime_tray.EXE"; MinVersion: 0.0,5.01.2600; 
Filename: "{sys}\NET"; Parameters: "STOP ""Realtime_service"""; WorkingDir: "{sys}"; StatusMsg: "Starting Service"; MinVersion: 0.0,5.01.2600; 
Filename: "{app}\realtime_service.exe"; Parameters: "-u"; WorkingDir: "{app}"; MinVersion: 0.0,5.01.2600; 

[CustomMessages]
default.NameAndVersion=%1 version %2
default.AdditionalIcons=Additional icons:
default.CreateDesktopIcon=Create a &desktop icon
default.CreateQuickLaunchIcon=Create a &Quick Launch icon
default.ProgramOnTheWeb=%1 on the Web
default.UninstallProgram=Uninstall %1
default.LaunchProgram=Launch %1
default.AssocFileExtension=&Associate %1 with the %2 file extension
default.AssocingFileExtension=Associating %1 with the %2 file extension...

[Languages]
; These files are stubs
; To achieve better results after recompilation, use the real language files
Name: "default"; MessagesFile: "embedded\default.isl"; 
