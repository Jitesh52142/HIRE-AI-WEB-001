@echo off
echo ========================================
echo    QUICK FIX - Push Werkzeug Fix
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding all changes...
git add .

echo.
echo Committing Werkzeug fix...
git commit -m "Fix Werkzeug compatibility: Pin Werkzeug version to prevent url_quote import error"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    FIX PUSHED! Vercel will redeploy
echo ========================================
echo.
echo What was fixed:
echo - Pinned Werkzeug to version 2.x (compatible with Flask 2.2.3)
echo - This prevents the url_quote import error
echo - Vercel will now use the correct Werkzeug version
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Test: https://hire-ai-web-001.vercel.app/health
echo 3. Your app should work now!
echo.
pause
