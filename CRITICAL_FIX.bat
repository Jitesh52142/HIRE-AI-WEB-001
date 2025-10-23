@echo off
echo ========================================
echo    CRITICAL FIX - Flask-Login Issue
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding Flask-Login anonymous user fix...
git add .

echo.
echo Committing critical fix...
git commit -m "CRITICAL FIX: Add AnonymousUser class and improved context processor for Flask-Login compatibility"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    CRITICAL FIX DEPLOYED!
echo ========================================
echo.
echo What was fixed:
echo [1] Added AnonymousUser class for Flask-Login
echo [2] Improved context processor with fallback mock user
echo [3] Fixed 'flask' object has no attribute 'login_manager' error
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Test: https://hire-ai-web-001.vercel.app/auth/register
echo 3. Test: https://hire-ai-web-001.vercel.app/auth/login
echo 4. Test: https://hire-ai-web-001.vercel.app/
echo.
echo This should resolve the login_manager attribute error!
echo.
pause
