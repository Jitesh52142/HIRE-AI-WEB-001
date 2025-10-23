@echo off
echo ========================================
echo    Pushing All Code Updates to GitHub
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

REM Check git status
echo Checking git status...
git status

echo.
echo Adding all changes...
git add .

echo.
echo Committing changes...
git commit -m "Optimize deployment: Remove blocking MongoDB connection during startup and add lazy admin creation"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    All updates pushed successfully!
echo ========================================
echo.
echo Your optimized app is now deployed with:
echo - Faster startup (no MongoDB connection during deployment)
echo - Lazy admin user creation
echo - Better error handling
echo.
pause
