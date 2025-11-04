@echo off
chcp 65001 >nul
echo 🚀 Быстрый статус проекта:
echo.
hugo version
echo.
dir content\gallery\*.md /b 2>nul && echo ✅ Галереи есть || echo ❌ Нет галерей
dir static\images\*.jpg /b 2>nul && echo ✅ Фото есть || echo ❌ Нет фото
dir static\admin\*.html /b 2>nul && echo ✅ Админка есть || echo ❌ Нет админки
echo.
echo 🔗 http://localhost:1313/
pause