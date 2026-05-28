#ifndef AppVersion
  #define AppVersion "1.0.0"
#endif

[Setup]
; 应用程序名称和版本
AppName=FH6Auto
AppVersion={#AppVersion}
AppPublisher=YOUSTHEONE
AppPublisherURL=https://github.com/YOUSTHEONE/FH6Auto

; 默认安装目录 (通常在 Program Files 下)
DefaultDirName={autopf}\FH6Auto
DefaultGroupName=FH6Auto

; 输出安装包的路径和文件名
OutputDir=.\Release
OutputBaseFilename=FH6Auto_Installer_v{#AppVersion}

; 高效压缩算法
Compression=lzma2/ultra64
SolidCompression=yes

; 确保安装程序本身也以管理员权限运行
PrivilegesRequired=admin

[Tasks]
; 提供创建桌面快捷方式的选项
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; 1. 将 Nuitka 编译出的 main.dist 文件夹内的所有内容打包
Source: "build_out\main.dist\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

; 2. 将项目根目录下的 assets 文件夹打包到安装目录的 assets 文件夹中
Source: "assets\*"; DestDir: "{app}\assets"; Flags: ignoreversion recursesubdirs createallsubdirs

; 3. 将项目根目录下的 images 文件夹打包到安装目录的 images 文件夹中
Source: "images\*"; DestDir: "{app}\images"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; 在开始菜单和桌面创建快捷方式
Name: "{group}\FH6Auto"; Filename: "{app}\main.exe"
Name: "{autodesktop}\FH6Auto"; Filename: "{app}\main.exe"; Tasks: desktopicon

[Run]
; 安装完成后提供运行选项
Filename: "{app}\main.exe"; Description: "{cm:LaunchProgram,FH6Auto}"; Flags: nowait postinstall skipifsilent
