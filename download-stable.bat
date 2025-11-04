@echo off
chcp 65001
echo 📥 Скачиваем стабильную версию Decap CMS...

cd static\admin\decap

echo Удаляем старые файлы...
del decap-cms.js 2>nul
del decap-cms.css 2>nul

echo Скачиваем стабильную версию 2.10...
powershell -Command "Invoke-WebRequest 'https://unpkg.com/decap-cms@2.10.0/dist/decap-cms.js' -OutFile 'decap-cms.js'"
powershell -Command "Invoke-WebRequest 'https://unpkg.com/decap-cms@2.10.0/dist/decap-cms.css' -OutFile 'decap-cms.css'"

echo.
echo ✅ Стабильная версия скачана!
echo 🚀 Теперь откройте: http://localhost:1313/admin/editor-stable.html
pause