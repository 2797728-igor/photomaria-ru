@echo off
chcp 65001 >nul
echo ===============================================
echo    АНАЛИЗ ПРОЕКТА PHOTOMARIA.RU
echo ===============================================
echo.

echo 📅 Дата анализа: %date% %time%
echo.

echo 📁 ОСНОВНАЯ СТРУКТУРА ПРОЕКТА:
echo ===============================
dir /a | findstr /v "<DIR>" | findstr /v "байт"

echo.
echo 📝 СОДЕРЖИМОЕ HUGO.CONFIG:
echo ===========================
if exist hugo.toml (
  echo ✅ Найден hugo.toml
  type hugo.toml | findstr /v "^#" | findstr /v "^$"
) else if exist config.toml (
  echo ✅ Найден config.toml  
  type config.toml | findstr /v "^#" | findstr /v "^$"
) else (
  echo ❌ Конфиг не найден
)

echo.
echo 🖼️ СТРУКТУРА КОНТЕНТА:
echo =====================
if exist content (
  echo 📂 CONTENT:
  dir content /a
  echo.
  if exist content\gallery (
    echo 📷 GALLERY:
    dir content\gallery /s
  )
)

echo.
echo 🎨 STATIC ФАЙЛЫ:
echo ================
if exist static (
  echo 📂 STATIC:
  dir static /a
  echo.
  if exist static\admin (
    echo 🔐 ADMIN:
    dir static\admin /a
  )
  echo.
  if exist static\images (
    echo 🖼️ IMAGES:
    dir static\images /s
  )
)

echo.
echo 🎯 ADMIN ПАНЕЛЬ:
echo ================
if exist static\admin (
  echo 📊 Файлы админки:
  dir static\admin\*.html /b
  echo.
  if exist static\admin\decap (
    echo 🔧 DECAP CMS:
    dir static\admin\decap /a
  )
)

echo.
echo 🚀 HUGO СБОРКА:
echo ===============
hugo version
echo.
echo Проверка сборки...
hugo --minify --verbose

echo.
echo 📊 СВОДКА:
echo ==========
set /a files_count=0
set /a images_count=0
set /a galleries_count=0

if exist content\gallery (
  for /f %%i in ('dir content\gallery\*.md /b 2^>nul ^| find /c /v ""') do set galleries_count=%%i
)

if exist static\images (
  for /f %%i in ('dir static\images\*.jpg /b 2^>nul ^| find /c /v ""') do set /a images_count+=%%i
  for /f %%i in ('dir static\images\*.png /b 2^>nul ^| find /c /v ""') do set /a images_count+=%%i
  for /f %%i in ('dir static\images\*.webp /b 2^>nul ^| find /c /v ""') do set /a images_count+=%%i
)

echo ✅ Галерей: %galleries_count%
echo ✅ Изображений: %images_count%
echo ✅ Hugo: Установлен
if exist static\admin\decap\decap-cms.js echo ✅ Decap CMS: Скачан
if exist static\admin\main.html echo ✅ Админка: Настроена
if exist static\admin\index.html echo ✅ Telegram Auth: Настроен

echo.
echo 🔗 ДОСТУПНЫЕ ССЫЛКИ:
echo ===================
echo 🌐 Сайт: http://localhost:1313/
echo 🔐 Админка: http://localhost:1313/admin/
echo 📝 Редактор: http://localhost:1313/admin/editor.html
echo 🛡️ Telegram Auth: http://localhost:1313/admin/index.html

echo.
echo 💡 РЕКОМЕНДАЦИИ ДЛЯ ПРОДОЛЖЕНИЯ:
echo ================================
if %galleries_count%==0 echo ❌ Создайте первую галерею
if %images_count%==0 echo ❌ Добавьте изображения
if not exist content\gallery echo ❌ Настройте структуру галерей

echo.
echo 📋 Сохраните этот отчет для следующей сессии!
echo =============================================
pause