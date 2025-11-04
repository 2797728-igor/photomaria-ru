@echo off
chcp 65001
echo 🔧 ИСПРАВЛЕНИЕ CONFIG.YML
echo =================================
cd /d D:\photomaria.ru

echo Создаем правильный config.yml...
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
echo       - label: "Название альбома"
echo         name: "title"
echo         widget: "string"
echo       - label: "Описание"
echo         name: "description"
echo         widget: "text"
echo         required: false
echo       - label: "Дата съемки"
echo         name: "date"
echo         widget: "datetime"
echo       - label: "Фотографии"
echo         name: "images"
echo         widget: "list"
echo         fields:
echo           - label: "Фото"
echo             name: "image"
echo             widget: "image"
) > "static\admin\config.yml"

echo ✅ config.yml исправлен
echo.
pause