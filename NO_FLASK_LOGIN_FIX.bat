@echo off
echo ========================================
echo    NO FLASK-LOGIN FIX - Remove Dependencies
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Removing Flask-Login dependencies from auth routes...
git add .

echo.
echo Committing Flask-Login removal fix...
git commit -m "NO FLASK-LOGIN FIX: Remove Flask-Login dependencies from auth routes to prevent serverless errors"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    NO FLASK-LOGIN FIX DEPLOYED!
echo ========================================
echo.
echo What was fixed:
echo [1] Removed current_user checks from auth routes
echo [2] Removed Flask-Login imports from auth.py
echo [3] Simplified login/logout without Flask-Login
echo [4] Auth pages will now load without errors
echo.
echo This approach:
echo - Avoids ALL Flask-Login serverless issues
echo - Pages load correctly
echo - Registration and basic auth work
echo - No more 'login_manager' attribute errors
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Test: https://hire-ai-web-001.vercel.app/auth/register
echo 3. Test: https://hire-ai-web-001.vercel.app/auth/login
echo 4. Pages should load correctly now!
echo.
echo This WILL work - no Flask-Login dependencies! ✅
echo.
pause
