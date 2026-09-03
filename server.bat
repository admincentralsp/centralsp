@echo off
set NODE_OPTIONS=--trace-warnings
artifacts\FXServer.exe +set gamename gta5 +exec server.cfg
pause
