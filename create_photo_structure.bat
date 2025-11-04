@echo off
echo Создаем структуру папок для фотографий...

mkdir "static\images\uploads\gallery" 2>nul
mkdir "static\images\uploads\hero" 2>nul
mkdir "static\images\uploads\portfolio" 2>nul

echo Папки созданы!
echo.
echo static\images\uploads\
echo ├── gallery\     - для галерей
echo ├── hero\        - для главных фото  
echo └── portfolio\   - для портфолио
echo.
pause