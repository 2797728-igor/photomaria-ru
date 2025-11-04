@echo off
chcp 65001
echo 🔧 ИСПРАВЛЕНИЕ CSS ФАЙЛА
echo =================================
cd /d D:\photomaria.ru

echo Попробуем скачать CSS с другого URL...
powershell -Command "Invoke-WebRequest 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.css' -OutFile 'static\admin\decap-cms.css'"

if exist "static\admin\decap-cms.css" (
    echo ✅ decap-cms.css скачан
) else (
    echo ❌ Не удалось скачать CSS
    echo Создаем минимальный CSS...
    echo "/* Minimal Decap CSS */ body{margin:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;}" > static\admin\decap-cms.css
    echo ✅ Минимальный CSS создан
)

echo.
echo 📁 Проверяем файлы:
dir "static\admin\decap-cms.*" /B

pause