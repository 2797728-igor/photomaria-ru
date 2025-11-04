@echo off
chcp 65001 >nul
echo 🚀 ЗАПУСК DECAP CMS PROXY SERVER
echo =================================
cd /d D:\photomaria.ru

echo Устанавливаем decap-cms-proxy-server...
npm install -g decap-cms-proxy-server

echo.
echo Запускаем прокси сервер на порту 8081...
echo 💡 Оставьте это окно открытым!
echo.
decap-cms-proxy-server