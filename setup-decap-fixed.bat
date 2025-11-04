@echo off
chcp 65001
echo =================================
echo    НАСТРОЙКА DECAP CMS
echo =================================
cd /d D:\photomaria.ru
echo.

echo 1. Скачиваем decap-cms.js...
powershell -Command "Invoke-WebRequest 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.js' -OutFile 'static\admin\decap-cms.js'"
if exist "static\admin\decap-cms.js" (
    echo ✅ decap-cms.js скачан
) else (
    echo ❌ Ошибка скачивания decap-cms.js
    pause
    exit /b 1
)

echo.
echo 2. Скачиваем decap-cms.css...
powershell -Command "Invoke-WebRequest 'https://unpkg.com/decap-cms@3.8.4/dist/decap-cms.css' -OutFile 'static\admin\decap-cms.css'"
if exist "static\admin\decap-cms.css" (
    echo ✅ decap-cms.css скачан
) else (
    echo ❌ Ошибка скачивания decap-cms.css
)

echo.
echo 3. Создаем простой редактор...
echo ^<!DOCTYPE html^> > static\admin\decap-simple.html
echo ^<html^> >> static\admin\decap-simple.html
echo ^<head^> >> static\admin\decap-simple.html
echo   ^<meta charset="utf-8" /^> >> static\admin\decap-simple.html
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1.0" /^> >> static\admin\decap-simple.html
echo   ^<title^>Decap CMS - Photomaria^</title^> >> static\admin\decap-simple.html
echo   ^<script src="decap-cms.js"^>^</script^> >> static\admin\decap-simple.html
echo   ^<link rel="stylesheet" href="decap-cms.css"^> >> static\admin\decap-simple.html
echo ^</head^> >> static\admin\decap-simple.html
echo ^<body^> >> static\admin\decap-simple.html
echo   ^<script^> >> static\admin\decap-simple.html
echo     CMS.init^(^); >> static\admin\decap-simple.html
echo   ^</script^> >> static\admin\decap-simple.html
echo ^</body^> >> static\admin\decap-simple.html
echo ^</html^> >> static\admin\decap-simple.html

echo ✅ decap-simple.html создан

echo.
echo 4. Создаем config.yml...
echo backend: > static\admin\config.yml
echo   name: git-gateway >> static\admin\config.yml
echo. >> static\admin\config.yml
echo local_backend: true >> static\admin\config.yml
echo. >> static\admin\config.yml
echo media_folder: "static/images/uploads" >> static\admin\config.yml
echo public_folder: "/images/uploads" >> static\admin\config.yml
echo. >> static\admin\config.yml
echo collections: >> static\admin\config.yml
echo   - name: "gallery" >> static\admin\config.yml
echo     label: "Галереи" >> static\admin\config.yml
echo     folder: "content/gallery" >> static\admin\config.yml
echo     create: true >> static\admin\config.yml
echo     slug: "{{slug}}" >> static\admin\config.yml
echo     editor: >> static\admin\config.yml
echo       preview: false >> static\admin\config.yml
echo     fields: >> static\admin\config.yml
echo       - ^%7Blabel: "Название альбома", name: "title", widget: "string"^%7D >> static\admin\config.yml
echo       - ^%7Blabel: "Описание", name: "description", widget: "text", required: false^%7D >> static\admin\config.yml
echo       - ^%7Blabel: "Дата съемки", name: "date", widget: "datetime"^%7D >> static\admin\config.yml
echo       - label: "Фотографии" >> static\admin\config.yml
echo         name: "images" >> static\admin\config.yml
echo         widget: "list" >> static\admin\config.yml
echo         fields: >> static\admin\config.yml
echo           - ^%7Blabel: "Фото", name: "image", widget: "image"^%7D >> static\admin\config.yml

echo ✅ config.yml создан

echo.
echo =================================
echo           ГОТОВО!
echo =================================
echo.
echo Файлы созданы в static\admin\:
echo 📄 decap-cms.js
echo 📄 decap-cms.css  
echo 📄 decap-simple.html
echo 📄 config.yml
echo.
echo Чтобы проверить:
echo 1. Запустите: hugo server --disableFastRender
echo 2. Откройте: http://localhost:1313/admin/decap-simple.html
echo.
pause