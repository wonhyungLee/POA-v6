@echo off
echo Starting POA v6...
FOR %%A IN (%~dp0\.) DO SET folder=%%~dpA
call %folder%\.venv\Scripts\activate.bat
call %folder%\.venv\Scripts\python.exe %folder%\run.py
pause
