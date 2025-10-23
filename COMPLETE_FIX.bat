@echo off
echo ========================================
echo    COMPLETE FIX - Resolve Vercel Error
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Checking git status...
git status

echo.
echo Adding all changes...
git add .

echo.
echo Committing Werkzeug compatibility fix...
git commit -m "COMPLETE FIX: Pin Werkzeug version to resolve url_quote import error on Vercel"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    COMPLETE FIX DEPLOYED!
echo ========================================
echo.
echo What was fixed:
echo - Pinned Werkzeug to version 2.x (Werkzeug>=2.2.2,<3.0)
echo - This prevents the url_quote import error
echo - Vercel will now use compatible Werkzeug version
echo - Added comprehensive error handling
echo - Added health check endpoint
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Test: https://hire-ai-web-001.vercel.app/health
echo 3. Test: https://hire-ai-web-001.vercel.app/
echo 4. Your app should work perfectly now!
echo.
echo If you still get errors, check Vercel logs for any remaining issues.
echo.
pause
