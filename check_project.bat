@echo off
echo ===============================
echo    ПРОВЕРКА ПРОЕКТА HUGO
echo ===============================
echo.

echo 1. ВЕРСИЯ HUGO:
hugo version
echo.

echo 2. СТРУКТУРА ПРОЕКТА:
dir /a
echo.

echo 3. ПАПКА CONTENT:
if exist content (
    dir content /a
) else (
    echo Папка content не найдена!
)
echo.

echo 4. ПАПКА STATIC:
if exist static (
    dir static /a  
) else (
    echo Папка static не найдена!
)
echo.

echo 5. КОНФИГУРАЦИОННЫЕ ФАЙЛЫ:
if exist config.toml (
    echo Найден config.toml
) else if exist config.yaml (
    echo Найден config.yaml
) else if exist config.yml (
    echo Найден config.yml
) else (
    echo Конфиг не найден!
)
echo.

echo 6. ПАПКА LAYOUTS:
if exist layouts (
    dir layouts /a
) else (
    echo Папка layouts не найдена!
)
echo.

echo Проверка завершена!
pause