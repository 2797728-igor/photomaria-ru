@echo off
chcp 65001 >nul
echo ✅ ПРОВЕРКА НАСТРОЙКИ DECAP CMS
echo =================================
cd /d D:\photomaria.ru

echo 📁 Файлы в static\admin\:
dir "static\admin\*.js" /B
dir "static\admin\*.css" /B
dir "static\admin\*.html" | findstr "decap"

echo.
echo 🔧 Рекомендации:
if exist "static\admin\decap-cms.js" (
    echo ✅ Decap CMS настроен! Откройте:
    echo    http://localhost:1313/admin/decap-simple.html
) else (
    echo ❌ Decap CMS не настроен.
    echo 💡 Запустите unpack-decap.bat или setup-decap-simple.bat
)

echo.
pause