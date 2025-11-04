@echo off
chcp 65001 >nul
echo 🔍 ПРОВЕРКА СТРУКТУРЫ DECAP
echo =================================
cd /d D:\photomaria.ru

echo Проверяем папку decap...
dir "static\admin\decap" /B

echo.
echo Проверяем наличие decap-cms-main...
dir "static\admin\decap\decap-cms-main" /B 2>nul
if %errorlevel% neq 0 (
    echo ❌ decap-cms-main не найдена!
    echo 💡 Распакуйте decap-cms-main.zip
)

echo.
echo Проверяем package.json...
if exist "static\admin\decap\decap-cms-main\package.json" (
    echo ✅ package.json найден
    type "static\admin\decap\decap-cms-main\package.json" | findstr "name version"
) else (
    echo ❌ package.json не найден
)

pause