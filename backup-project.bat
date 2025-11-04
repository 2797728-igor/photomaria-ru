@echo off
chcp 65001 >nul
set backup_folder=backup_%date:~0,2%%date:~3,2%%date:~6,4%_%time:~0,2%%time:~3,2%
echo 📦 Создаю резервную копию в %backup_folder%...
xcopy . %backup_folder% /E /I /H
echo ✅ Резервная копия создана!
dir %backup_folder% /a
pause