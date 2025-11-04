@echo off
chcp 65001
echo 🔧 ИСПРАВЛЕНИЕ HTML ФАЙЛА
echo =================================
cd /d D:\photomaria.ru

echo Создаем исправленный редактор...
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
echo   ^<div id="nc-root"^>^</div^>
echo   ^<script^>
echo     // Ждем загрузки Decap CMS
echo     if (typeof CMS !== 'undefined') ^{
echo       console.log('✅ Decap CMS загружена');
echo       CMS.init();
echo     ^} else ^{
echo       console.error('❌ Decap CMS не загружена');
echo     ^}
echo   ^</script^>
echo ^</body^>
echo ^</html^>
) > "static\admin\decap-fixed.html"

echo ✅ decap-fixed.html создан
echo.
echo 🌐 Откройте: http://localhost:1313/admin/decap-fixed.html
pause