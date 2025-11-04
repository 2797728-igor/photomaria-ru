@echo off
chcp 65001 >nul
echo 📥 Скачиваем Decap CMS для оффлайн работы...
echo.

cd /d "%~dp0"
cd static\admin

echo Создаем папку decap...
if not exist "decap" mkdir "decap"

echo.
echo 🔍 Ищем актуальные версии Decap CMS...
echo.

echo 📦 Скачиваем Decap CMS (JavaScript)...
powershell -Command "& {
    try {
        $url = 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.js'
        $output = 'decap\decap-cms.js'
        Write-Host 'Скачиваем: ' $url -ForegroundColor Yellow
        Invoke-WebRequest -Uri $url -OutFile $output -UserAgent 'Mozilla/5.0'
        Write-Host '✅ JS файл скачан успешно!' -ForegroundColor Green
    }
    catch {
        Write-Host '❌ Ошибка скачивания JS: ' $_.Exception.Message -ForegroundColor Red
    }
}"

echo.
echo 🎨 Скачиваем Decap CMS (CSS)...
powershell -Command "& {
    try {
        $url = 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.css'
        $output = 'decap\decap-cms.css'
        Write-Host 'Скачиваем: ' $url -ForegroundColor Yellow
        Invoke-WebRequest -Uri $url -OutFile $output -UserAgent 'Mozilla/5.0'
        Write-Host '✅ CSS файл скачан успешно!' -ForegroundColor Green
    }
    catch {
        Write-Host '❌ Ошибка скачивания CSS: ' $_.Exception.Message -ForegroundColor Red
        Write-Host '🔄 Пробуем альтернативный URL...' -ForegroundColor Yellow
        try {
            $url = 'https://cdn.jsdelivr.net/npm/decap-cms@3.8.4/dist/decap-cms.css'
            Invoke-WebRequest -Uri $url -OutFile $output -UserAgent 'Mozilla/5.0'
            Write-Host '✅ CSS файл скачан с альтернативного источника!' -ForegroundColor Green
        }
        catch {
            Write-Host '❌ Ошибка скачивания CSS с альтернативного источника' -ForegroundColor Red
        }
    }
}"

echo.
echo 📁 Проверяем скачанные файлы...
dir decap

echo.
if exist "decap\decap-cms.js" (
    if exist "decap\decap-cms.css" (
        echo 🎉 Decap CMS успешно скачан для оффлайн работы!
        echo 📁 Файлы находятся в: static\admin\decap\
        echo.
        echo 🚀 Теперь можете открыть: http://localhost:1313/admin/editor-offline.html
    ) else (
        echo ⚠️ CSS файл не скачан, но JS файл доступен
    )
) else (
    echo ❌ Основные файлы не скачаны. Проверьте подключение к интернету.
)

echo.
pause