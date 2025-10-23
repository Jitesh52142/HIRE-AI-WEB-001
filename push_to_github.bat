@echo off
echo ========================================
echo    Pushing Hire AI App to GitHub
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

REM Check if git is initialized
if not exist ".git" (
    echo Initializing git repository...
    git init
    echo.
)

REM Add all files
echo Adding all files to git...
git add .

REM Check git status
echo.
echo Git status:
git status

REM Commit changes
echo.
echo Committing changes...
git commit -m "Update: Fixed pandas version for Vercel deployment and added .gitignore"

REM Check if remote exists
echo.
echo Checking remote repository...
git remote -v

REM If no remote exists, prompt user to add one
if errorlevel 1 (
    echo.
    echo No remote repository found!
    echo Please run these commands manually:
    echo.
    echo 1. Create a new repository on GitHub
    echo 2. Add remote: git remote add origin https://github.com/YOUR_USERNAME/hire-ai-web-app.git
    echo 3. Push: git push -u origin main
    echo.
    pause
    exit /b 1
)

REM Push to GitHub
echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    Push completed successfully!
echo ========================================
pause
