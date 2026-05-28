#ifndef AppVersion
  #define AppVersion "1.0.0"
#endif

[Setup]
; 应用程序名称和版本
AppName=FH6Auto
; 自动跟进传入的版本号
AppVersion={#AppVersion}
AppPublisher=Sakura-wcs
AppPublisherURL=https://github.com/Sakura-wcs/FH6Auto-nuitka

; 默认安装目录 (通常在 Program Files 下)
DefaultDirName={autopf}\FH6Auto
DefaultGroupName=FH6Auto

; 输出安装包的路径和文件名，文件名也会自动带上版本号
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
; 将 Nuitka 编译出的 main.dist 文件夹内的所有内容打包
; 注意这里的 Source 路径，必须指向你实际生成的目录
Source: "build_out\main.dist\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; 在开始菜单和桌面创建快捷方式
; 这里的 main.exe 是 Nuitka 根据主入口 main.py 默认生成的执行文件名
Name: "{group}\FH6Auto"; Filename: "{app}\main.exe"
Name: "{autodesktop}\FH6Auto"; Filename: "{app}\main.exe"; Tasks: desktopicon

[Run]
; 安装完成后提供运行选项 (可选)
Filename: "{app}\main.exe"; Description: "{cm:LaunchProgram,FH6Auto}"; Flags: nowait postinstall skipifsilent
