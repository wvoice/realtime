; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Docugate Admin"
#define MyAppVersion "3.3.7"
#define MyAppPublisher "High Tech Accessory Items, Inc."
#define MyAppURL "http://www.hightech-ai.com"
#define MyAppExeName "RealTime.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A6C51D00-B4A4-45F3-935B-E74419FA3D64}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Docugate\Admin
DefaultGroupName=High Tech Accessory Items, Inc.
DisableProgramGroupPage=yes
OutputBaseFilename=DocugateAdminSetup
SetupIconFile=Z:\Inno Setup\{app}\Hightechs.ico
Compression=lzma
SolidCompression=yes
SignTool=SignTool sign /f Z:\certificate\hightech.pfx /p Big#hand1 $f

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
;Source: "Z:\Inno Setup\{app}\RealTime.exe"; DestDir: "{app}"; Flags: ignoreversion
;Source: "Z:\Inno Setup\{app}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
;Source: "Z:\Inno Setup\{pf}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
;Source: "Z:\Inno Setup\{sys}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
;Source: "Z:\Inno Setup\embedded\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "{pf}\Microsoft SQL Server\80\Tools\Binn\SQLDMO.DLL"; DestDir: "{pf}\Microsoft SQL Server\80\Tools\Binn"; Flags: uninsneveruninstall regserver sharedfile onlyifdoesntexist 
Source: "{pf}\Microsoft SQL Server\80\Tools\Binn\SQLSVC.DLL"; DestDir: "{pf}\Microsoft SQL Server\80\Tools\Binn"; Flags: uninsneveruninstall sharedfile onlyifdoesntexist 
Source: "{pf}\Microsoft SQL Server\80\Tools\Binn\W95SCM.DLL"; DestDir: "{pf}\Microsoft SQL Server\80\Tools\Binn"; Flags: uninsneveruninstall sharedfile onlyifdoesntexist 
Source: "{pf}\Microsoft SQL Server\80\Tools\Binn\SQLRESLD.DLL"; DestDir: "{pf}\Microsoft SQL Server\80\Tools\Binn"; Flags: uninsneveruninstall sharedfile onlyifdoesntexist 
Source: "{pf}\Microsoft SQL Server\80\Tools\Binn\Resources\1033\SQLDMO.RLL"; DestDir: "{pf}\Microsoft SQL Server\80\Tools\Binn\Resources\1033"; Flags: uninsneveruninstall sharedfile onlyifdoesntexist 
Source: "{pf}\Microsoft SQL Server\80\Tools\Binn\Resources\1033\SQLSVC.RLL"; DestDir: "{pf}\Microsoft SQL Server\80\Tools\Binn\Resources\1033"; Flags: uninsneveruninstall sharedfile onlyifdoesntexist 
Source: "{sys}\sqlunirl.DLL"; DestDir: "{sys}"; Flags: uninsneveruninstall sharedfile onlyifdoesntexist 
Source: "{app}\MSM\1033\TOOLS_RES.MSM"; DestDir: "{app}\MSM\1033"; 
Source: "{pf}\Microsoft SQL Server\90\Tools\binn\Resources\1033\SQLCMD.rll"; DestDir: "{pf}\Microsoft SQL Server\90\Tools\binn\Resources\1033"; 
Source: "{pf}\Microsoft SQL Server\90\Tools\binn\batchparser90.dll"; DestDir: "{pf}\Microsoft SQL Server\90\Tools\binn"; 
Source: "{pf}\Microsoft SQL Server\90\Tools\binn\sqlcmd.exe"; DestDir: "{pf}\Microsoft SQL Server\90\Tools\binn"; 
Source: "{pf}\Microsoft SQL Server\90\Tools\binn\License_SQLCMD_ENU.txt"; DestDir: "{pf}\Microsoft SQL Server\90\Tools\binn"; 
Source: "{pf}\Microsoft SQL Server\90\Tools\binn\License_SQLNCLI_ENU.txt"; DestDir: "{pf}\Microsoft SQL Server\90\Tools\binn"; 
Source: "{pf}\Common Files\System\MDAC_TYP.EXE"; DestDir: "{pf}\Common Files\System"; MinVersion: 4.1,4.0; OnlyBelowVersion: 0.0,5.0; Flags: ignoreversion 
Source: "{app}\RealTime.exe"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\Hightechs.ico"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\Docugate.ini"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\RealTime.chm"; DestDir: "{app}"; Flags: ignoreversion 
Source: "{app}\Docugate.skf"; DestDir: "{app}"; Flags: ignoreversion 
;Source: "{app}\realtime_dbconfig.exe"; DestDir: "{app}"; Flags: ignoreversion 
;Source: "{sys}\stdole2.tlb"; DestDir: "{sys}"; Flags: uninsneveruninstall restartreplace regtypelib sharedfile 
Source: "{sys}\MSVBVM60.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall restartreplace regserver sharedfile 
Source: "{sys}\OleAut32.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall restartreplace regserver sharedfile 
Source: "{sys}\OlePro32.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall restartreplace regserver sharedfile 
Source: "{sys}\asycfilt.dll"; DestDir: "{sys}"; Flags: uninsneveruninstall restartreplace sharedfile 
Source: "{sys}\MSCOMCTL.OCX"; DestDir: "{sys}"; Flags: uninsneveruninstall regserver sharedfile 
Source: "{sys}\MSCOMCT2.OCX"; DestDir: "{sys}"; Flags: uninsneveruninstall regtypelib sharedfile 
Source: "{sys}\COMDLG32.OCX"; DestDir: "{sys}"; Flags: uninsneveruninstall regtypelib sharedfile 
;Source: "{sys}\SCRRUN,1.DLL"; DestDir: "{sys}"; DestName: "SCRRUN.DLL"; Flags: uninsneveruninstall regtypelib sharedfile 
;Source: "{sys}\SCRRUN,2.DLL"; DestDir: "{sys}"; DestName: "SCRRUN.DLL"; Flags: uninsneveruninstall regserver sharedfile 
Source: "{app}\Dependencies\MSVCRT.DLL"; DestDir: "{app}\Dependencies"; Flags: sharedfile 
Source: "{app}\Dependencies\SCLabel.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\ctRadio.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\ctCheck.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\CoolXPButton.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\CoolXPPanel.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\vbalExpBar6.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\vbalGrid6.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\vbalIml6.ocx"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\SSubTmr6.dll"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\SkinCrafterDLL.dll"; DestDir: "{app}\Dependencies"; Flags: sharedfile 
Source: "{app}\Dependencies\SkinCrafter2.dll"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\actrpt.dll"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\Dependencies\pdfexpt.dll"; DestDir: "{app}\Dependencies"; Flags: regserver sharedfile 
Source: "{app}\images\HighTechs.bmp"; DestDir: "{app}\images"; Flags: ignoreversion 
Source: "{app}\images\uptriangle.gif"; DestDir: "{app}\images"; Flags: ignoreversion 
Source: "{app}\readme-admin.htm"; DestDir: "{app}"; 

[Registry]
Root: HKCU; Subkey: "Software\High Tech Accessory Items, Inc."; Flags: uninsdeletekeyifempty 
Root: HKCU; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0"; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings"; Flags: uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; Flags: uninsdeletekey 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "Path"; ValueType: String; ValueData: "{app}"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty 
;Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "Computer"; ValueType: String; ValueData: "{code:GetComputerName}"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "AppComponent"; ValueType: String; ValueData: "RealTime Administration Application"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "AppComponentVersion"; ValueType: String; ValueData: "1.0.1"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "LicencedUser"; ValueType: String; ValueData: "{userinfoname}"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty 
Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "LicencedOrg"; ValueType: String; ValueData: "{userinfoorg}"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty 
;Root: HKLM; Subkey: "Software\High Tech Accessory Items, Inc.\3.0.0\Settings\Install"; ValueName: "Servername"; ValueType: String; ValueData: "{code:GetDBServerName|x}"; Flags: createvalueifdoesntexist uninsdeletevalue uninsdeletekeyifempty

[Run]
;Filename: "{app}\readme-admin.htm"; 

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

