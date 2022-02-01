@echo off
cls

set "InstallDir=C:\"
set "UtilsDirs=D:/sources"
set "BootloaderDir=W:"

echo WARNING: To use this script, you must partion the disk manually with the diskpart utility.[0m

echo The windows install will be installed on this drive: %InstallDir%
echo If this is not correct, please change the InstallDir value in the script

set /P INPUT=Is this correct? [y/n]: %=%
If %INPUT%=="y" goto yes 
If %INPUT%=="n" goto no

:yes
cls
echo Installing The Windows Image... [dism]
cd %UtilsDirs%
dism /apply-image /imagefile:install.wim /index:1 /applydir:%InstallDir%
echo Setting up the bootloader... [bcdboot]
bcdboot C:\Windows /s %BootloaderDir% 
echo Installed!
echo Restart the system and boot to windows
pause

:no 
cls
echo k bye

pause