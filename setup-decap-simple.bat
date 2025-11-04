@echo off
chcp 65001 >nul
echo 🚀 БЫСТРАЯ НАСТРОЙКА DECAP CMS
echo =================================
cd /d D:\photomaria.ru

echo 1. Скачиваем готовые файлы Decap CMS...
powershell -command "
try {
    # Скачиваем decap-cms.js
    Write-Host '📥 Скачиваем decap-cms.js...' -ForegroundColor Cyan
    Invoke-WebRequest 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.js' -OutFile 'static\admin\decap-cms.js'
    Write-Host '✅ decap-cms.js скачан' -ForegroundColor Green
    
    # Скачиваем decap-cms.css  
    Write-Host '📥 Скачиваем decap-cms.css...' -ForegroundColor Cyan
    Invoke-WebRequest 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.css' -OutFile 'static\admin\decap-cms.css'
    Write-Host '✅ decap-cms.css скачан' -ForegroundColor Green
}
catch {
    Write-Host '❌ Ошибка скачивания: ' + $_.Exception.Message -ForegroundColor Red
    Write-Host '💡 Проверьте подключение к интернету' -ForegroundColor Yellow
    exit 1
}
"

echo.
echo 2. Создаем простой редактор...
(
echo ^<!DOCTYPE html^>
echo ^<html^>
echo ^<head^>
echo   ^<meta charset="utf-8" /^>
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^>
echo   ^<title^>Decap CMS - Photomaria^</title^>
echo   ^<script src="decap-cms.js"^>^</script^>
echo   ^<link rel="stylesheet" href="decap-cms.css"^>
echo ^</head^>
echo ^<body^>
echo   ^<div style="padding: 10px; background: #f0f0f0;"^>
echo     ^<a href="/admin/"^>← Назад в админку^</a^>
echo   ^</div^>
echo   ^<script^>
echo     CMS.init^(^);
echo   ^</script^>
echo ^</body^>
echo ^</html^>
) > "static\admin\decap-simple.html"

echo.
echo 3. Обновляем config.yml для локальной работы...
(
echo backend:
echo   name: git-gateway
echo.
echo local_backend: true
echo.
echo media_folder: "static/images/uploads"
echo public_folder: "/images/uploads"
echo.
echo collections:
echo   - name: "gallery"
echo     label: "Галереи"
echo     folder: "content/gallery"
echo     create: true
echo     slug: "{{slug}}"
echo     editor:
echo       preview: false
echo     fields:
echo       - ^{label: "Название альбома", name: "title", widget: "string"^}
echo       - ^{label: "Описание", name: "description", widget: "text", required: false^}
echo       - ^{label: "Дата съемки", name: "date", widget: "datetime"^}
echo       - label: "Фотографии"
echo         name: "images"
echo         widget: "list"
echo         fields:
echo           - ^{label: "Фото", name: "image", widget: "image"^}
) > "static\admin\config.yml"

echo.
echo 4. Проверяем результат...
if exist "static\admin\decap-cms.js" (
    echo ✅ decap-cms.js - ^(^%^%filesize^% байт^)
) else (
    echo ❌ decap-cms.js - отсутствует
)

if exist "static\admin\decap-cms.css" (
    echo ✅ decap-cms.css - ^(^%^%filesize^% байт^)
) else (
    echo ❌ decap-cms.css - отсутствует  
)

if exist "static\admin\decap-simple.html" (
    echo ✅ decap-simple.html - создан
) else (
    echo ❌ decap-simple.html - не создан
)

if exist "static\admin\config.yml" (
    echo ✅ config.yml - обновлен
) else (
    echo ❌ config.yml - не создан
)

echo.
echo 🌐 ССЫЛКА ДЛЯ ПРОВЕРКИ:
echo http://localhost:1313/admin/decap-simple.html
echo.
echo 💡 Убедитесь что Hugo сервер запущен:
echo hugo server --disableFastRender
echo.
pause