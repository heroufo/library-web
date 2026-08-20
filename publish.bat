@echo off
chcp 65001 >nul
rem ============================================================
rem  一键发布：更新在线只读浏览站（霍格沃茨图书馆）
rem  流程：从本地书库导出最新数据 -> 拷贝封面 -> git 提交并推送
rem  第一次使用请先确认下方两处路径，并已完成 GitHub 仓库创建
rem ============================================================

set SITE=%~dp0
set EXPORT_SCRIPT=C:\Users\Administrator\WorkBuddy\图书管理\export_data.py
set PYTHON=C:\Users\Administrator\.workbuddy\binaries\python\envs\default\Scripts\python.exe

echo [1/3] 导出书库数据…
"%PYTHON%" "%EXPORT_SCRIPT%" "%SITE%"
if errorlevel 1 (echo 导出失败，中止 & pause & exit /b 1)

cd /d "%SITE%"
echo [2/3] 提交更新…
git add -A
git commit -m "update library data %date% %time%"

echo [3/3] 推送到 GitHub…
git push

echo.
echo 完成！约 1-2 分钟后 GitHub Pages 自动更新。
echo 在线地址: https://heroufo.github.io/library-web/
pause
