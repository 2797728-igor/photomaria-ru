@echo off
chcp 65001 >nul
echo 🛠️  СБОРКА DECAP CMS ИЗ ИСХОДНИКОВ
echo =================================
cd /d D:\photomaria.ru\static\admin\decap\decap-cms-main

echo 1. Устанавливаем зависимости...
npm install

echo.
echo 2. Собираем Decap CMS...
npm run build

echo.
echo 3. Копируем файлы в папку admin...
xcopy "packages\decap-cms\dist\*" "..\..\" /Y

echo.
echo ✅ Сборка завершена!
echo 📁 Файлы скопированы в static\admin\
pause