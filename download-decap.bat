@echo off
echo 📥 Скачиваем Decap CMS для оффлайн работы...
echo.

cd static\admin

echo Создаем папку decap...
mkdir decap 2>nul

echo Скачиваем Decap CMS...
powershell -Command "Invoke-WebRequest -Uri 'https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.js' -OutFile 'decap/decap-cms.js'"

echo Скачиваем CSS стили...
powershell -Command "Invoke-WebRequest -Uri 'https://unpkg.com/decap-cms@^3.0.0/dist/decap-cms.css' -OutFile 'decap/decap-cms.css'"

echo.
echo ✅ Decap CMS успешно скачан!
echo 📁 Файлы находятся в: static\admin\decap\
echo.
pause