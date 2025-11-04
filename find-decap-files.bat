@echo off
chcp 65001 >nul
echo 🔍 ПОИСК ФАЙЛОВ DECAP CMS
echo =================================
cd /d D:\photomaria.ru

echo Ищем собранные файлы в decap-cms-main...
dir "static\admin\decap\decap-cms-main\packages\decap-cms\dist\" /B 2>nul

if %errorlevel% neq 0 (
    echo.
    echo ❌ Файлы не найдены в dist/
    echo 📁 Проверим другие места...
    dir "static\admin\decap\decap-cms-main\packages\decap-cms\" /B
)

echo.
echo 💡 Если файлов нет, нужно собрать Decap CMS из исходников
pause