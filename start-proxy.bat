@echo off
chcp 65001
echo 🚀 ЗАПУСК DECAP CMS PROXY SERVER
echo =================================
cd /d D:\photomaria.ru

echo 1. Устанавливаем decap-cms-proxy-server...
npm install -g decap-cms-proxy-server

echo.
echo 2. Запускаем прокси сервер...
echo 💡 ОСТАВЬТЕ ЭТО ОКНО ОТКРЫТЫМ!
echo 📍 Сервер будет работать на http://localhost:8081
echo.
decap-cms-proxy-server