@echo off

rem for /f "usebackq tokens=2,*" %A in (`reg query HKCU\Environment /v PATH`) do set my_user_path=%B

for /F "tokens=2* delims= " %%f IN ('reg query HKCU\Environment /v PATH ^| findstr /i path') do set OLD_SYSTEM_PATH=%%g

echo OLD_SYSTEM_PATH: %OLD_SYSTEM_PATH%

set CURRENT_DIR=%~dp0

echo CURRENT_DIR: %CURRENT_DIR%

setx PATH "%CURRENT_DIR%ripgrep\;%CURRENT_DIR%PSTools\;%CURRENT_DIR%;%OLD_SYSTEM_PATH%"

echo PATH: %PATH%


mklink %USERPROFILE%\.bashrc %CURRENT_DIR%bashrc\.bashrc
mklink %USERPROFILE%\.bash_profile %CURRENT_DIR%bashrc\.bash_profile

mklink %USERPROFILE%\.starship\starship.toml %CURRENT_DIR%bashrc\starship.toml

REM mklink %USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 %CURRENT_DIR%bashrc\Microsoft.PowerShell_profile.ps1
mklink %USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 %CURRENT_DIR%bashrc\Microsoft.PowerShell_profile.ps1


rem powershell to install Chocolatey Administrator
rem Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
rem choco install fzf
rem choco install ripgrep


