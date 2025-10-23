@echo off
echo ========================================
echo    TEMPLATE FIX - Resolve current_user Error
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding template context processor fix...
git add .

echo.
echo Committing template fix...
git commit -m "TEMPLATE FIX: Add global current_user context processor to resolve template errors"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    TEMPLATE FIX DEPLOYED!
echo ========================================
echo.
echo What was fixed:
echo - Added global current_user context processor
echo - Templates can now access current_user without errors
echo - App should render properly now
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Test: https://hire-ai-web-001.vercel.app/
echo 3. Test: https://hire-ai-web-001.vercel.app/test
echo 4. Your app should work perfectly now!
echo.
echo This should resolve the 'current_user is undefined' error!
echo.
pause
