@echo off
chcp 65001 >nul
echo 📦 РАСПАКОВКА DECAP CMS
echo =================================
cd /d D:\photomaria.ru

echo 1. Проверяем ZIP архив...
if exist "static\admin\decap\decap-cms-main.zip" (
    echo ✅ ZIP архив найден
    echo 📁 Размер: 
    for %%F in ("static\admin\decap\decap-cms-main.zip") do echo   %%~zF байт
) else (
    echo ❌ ZIP архив не найден
    pause
    exit /b 1
)

echo.
echo 2. Очищаем папку decap-cms-main...
rmdir /s /q "static\admin\decap\decap-cms-main" 2>nul
mkdir "static\admin\decap\decap-cms-main" 2>nul

echo.
echo 3. Распаковываем архив...
echo 💡 Используем встроенную утилиту Windows...
powershell -command "Expand-Archive -Path 'static\admin\decap\decap-cms-main.zip' -DestinationPath 'static\admin\decap\decap-cms-main' -Force"

if %errorlevel% neq 0 (
    echo.
    echo ❌ Ошибка распаковки!
    echo 💡 Распакуйте вручную: static\admin\decap\decap-cms-main.zip
    echo 💡 В папку: static\admin\decap\decap-cms-main\
    pause
    exit /b 1
)

echo.
echo 4. Проверяем распакованные файлы...
dir "static\admin\decap\decap-cms-main" /B

echo.
echo ✅ Распаковка завершена!
echo.
pause