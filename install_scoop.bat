@echo off
echo =========================================
echo        Scoop Package Manager Installer
echo =========================================
echo.

:: Check if PowerShell is available
where powershell >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] PowerShell was not found on this system.
    pause
    exit /b 1
)

echo [1/3] Setting PowerShell execution policy...
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
if %errorlevel% neq 0 (
    echo [ERROR] Failed to set execution policy.
    pause
    exit /b 1
)

echo [2/3] Installing Scoop...
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
if %errorlevel% neq 0 (
    echo [ERROR] Scoop installation failed. Check your internet connection and try again.
    pause
    exit /b 1
)

echo [3/3] Verifying Scoop installation...
powershell -Command "scoop --version"
if %errorlevel% neq 0 (
    echo [WARNING] Scoop may not be in PATH yet. Please restart your terminal.
) else (
    echo.
    echo [SUCCESS] Scoop was installed successfully!
)

echo.
echo =========================================
echo  You can now use: scoop install ^<app^>
echo  Example:         scoop install git
echo =========================================
echo.
pause
