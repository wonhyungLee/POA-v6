@echo off
echo ====================================
echo POA v6 Installation Script
echo ====================================
echo.

REM Get the directory where this script is located
FOR %%A IN (%~dp0\.) DO SET folder=%%~dpA

echo Creating virtual environment...
call python -m venv %folder%\.venv

echo Activating virtual environment...
call %folder%\.venv\Scripts\activate.bat

echo Upgrading pip...
call %folder%\.venv\Scripts\python.exe -m pip install --upgrade pip

echo Installing requirements...
call pip install -r %folder%\requirements.txt

echo Running post-installation setup...
call %folder%\.venv\Scripts\python.exe %folder%\setup.py

echo.
echo ====================================
echo Installation Complete!
echo ====================================
echo.
echo Please edit the .env file with your API keys before running the application.
echo To start POA v6, run: start.bat
echo.
pause
