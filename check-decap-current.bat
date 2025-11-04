@echo off
chcp 65001 >nul
echo 🔍 ДИАГНОСТИКА DECAP CMS
echo =================================
cd /d D:\photomaria.ru

echo.
echo 📁 СТРУКТУРА АДМИНКИ:
echo =================================
dir static\admin /B

echo.
echo 📄 СОДЕРЖИМОЕ CONFIG.YML:
echo =================================
if exist "static\admin\config.yml" (
  type "static\admin\config.yml"
) else (
  echo ❌ config.yml не найден!
)

echo.
echo 🔧 ФАЙЛЫ DECAP CMS:
echo =================================
if exist "static\admin\decap\decap-cms-main\packages\decap-cms\dist\decap-cms.js" (
  echo ✅ decap-cms.js найден
  dir "static\admin\decap\decap-cms-main\packages\decap-cms\dist\"
) else (
  echo ❌ decap-cms.js не найден
  echo 📋 Доступные файлы в decap:
  dir "static\admin\decap\" /B
)

echo.
echo 🌐 ССЫЛКИ ДЛЯ ПРОВЕРКИ:
echo =================================
echo 1. Главная админка: http://localhost:1313/admin/
echo 2. Decap редактор: http://localhost:1313/admin/editor.html
echo 3. Index страница: http://localhost:1313/admin/index.html
echo 4. Simple редактор: http://localhost:1313/admin/simple-editor.html

echo.
echo 📝 СТАТУС HUGO СЕРВЕРА:
echo =================================
tasklist | findstr "hugo.exe" >nul
if %errorlevel%==0 (
  echo ✅ Hugo сервер запущен
) else (
  echo ❌ Hugo сервер не запущен
  echo 💡 Запустите: hugo server --disableFastRender
)

echo.
echo 🎯 РЕКОМЕНДАЦИИ:
echo =================================
echo 1. Проверьте консоль браузера (F12) на ошибки
echo 2. Убедитесь что config.yml имеет правильный синтаксис
echo 3. Проверьте доступность Decap CSS/JS файлов

pause