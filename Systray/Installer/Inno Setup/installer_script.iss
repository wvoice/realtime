; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Realtime Workstation"
#define MyAppVersion "3.3"
#define DefaultGroupName "Realtime"
#define MyAppPublisher "High Tech Accessory Items, Inc."
#define MyAppURL "http://www.hightech-ai.com"
#define MyAppExeName "realtime_tray.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{1B26C844-6A57-429B-BB97-F58ED15F11AA}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\Docugate\workstation
DefaultGroupName={#MyAppName}
OutputBaseFilename=RealtimeWorkstationService
SetupIconFile={app}\HighTechs.ico
Compression=lzma
SolidCompression=yes
PrivilegesRequired=admin
SignTool=SignTool sign /f Z:\certificate\hightech.pfx /p Big#hand1 $f

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

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
Source: "{app}\elevate.cmd"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Source: "{app}\elevate.vbs"; DestDir: "{app}"; MinVersion: 0.0,5.01.2600;

[Registry]
Root: HKLM; Subkey: "SOFTWARE\High Tech Accessory Items, Inc."; ValueType: String; MinVersion: 0.0,5.01.2600; Flags: uninsdeletekey 
;Root: HKLM; Subkey: "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN"; ValueName: "realtime"; ValueType: String; ValueData: """{app}\elevate.cmd"" realtime_tray.exe"; MinVersion: 0.0,5.01.2600; Flags: uninsdeletevalue 
;Root: HKLM; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers\"; ValueType: String; ValueName: "{app}\realtime_tray.exe"; ValueData: "RUNASADMIN"; Flags: uninsdeletekeyifempty uninsdeletevalue; MinVersion: 0.0,5.01.2600

[Run]
Filename: "{app}\realtime_service.exe"; Parameters: "-i"; WorkingDir: "{app}"; StatusMsg: "Installing Service"; MinVersion: 0.0,5.01.2600; 
Filename: "{sys}\NET"; Parameters: "START ""Realtime_service"""; WorkingDir: "{sys}"; StatusMsg: "Starting Service"; MinVersion: 0.0,5.01.2600; 
Filename: "{app}\realtime_configurator.exe"; WorkingDir: "{app}"; MinVersion: 0.0,5.01.2600; 
;Filename: "{app}\realtime_tray.exe"; WorkingDir: "{app}"; MinVersion: 0.0,5.01.2600; 
Filename: "{app}\elevate.cmd"; Parameters: "{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
;Filename: "{sys}\NET"; Parameters: "START ""Realtime_tray"""; WorkingDir: "{sys}"; StatusMsg: "Starting Service"; MinVersion: 0.0,5.01.2600;


[UninstallRun]
Filename: "{sys}\TASKKILL"; Parameters: "/F /IM realtime_tray.EXE"; MinVersion: 0.0,5.01.2600; 
Filename: "{sys}\NET"; Parameters: "STOP ""Realtime_service"""; WorkingDir: "{sys}"; StatusMsg: "Starting Service"; MinVersion: 0.0,5.01.2600; 
Filename: "{app}\realtime_service.exe"; Parameters: "-u"; WorkingDir: "{app}"; MinVersion: 0.0,5.01.2600;

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\elevate.cmd"; Parameters: "{#MyAppExeName}"; IconFilename: "{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\elevate.cmd"; Parameters: "{#MyAppExeName}"; Tasks: desktopicon; IconFilename: "{#MyAppExeName}"
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\elevate.cmd"; Parameters: "{#MyAppExeName}"; Tasks: quicklaunchicon; IconFilename: "{#MyAppExeName}"



