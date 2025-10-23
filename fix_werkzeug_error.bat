@echo off
echo ========================================
echo    Fixing Werkzeug Compatibility Error
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding Werkzeug compatibility fix...
git add requirements.txt

echo.
echo Committing fix...
git commit -m "Fix Werkzeug compatibility: Pin Werkzeug version to prevent url_quote import error"

echo.
echo Pushing fix to GitHub...
git push origin main

echo.
echo ========================================
echo    Werkzeug fix pushed!
echo ========================================
echo.
echo What was fixed:
echo - Added Werkzeug>=2.2.2,<3.0 to requirements.txt
echo - This prevents the url_quote import error
echo - Vercel will now use compatible Werkzeug version
echo.
echo Next steps:
echo 1. Wait for Vercel to redeploy (1-2 minutes)
echo 2. Test: https://your-app.vercel.app/health
echo 3. Your app should now work!
echo.
pause
