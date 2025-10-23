@echo off
echo ========================================
echo    Fixing Vercel 500 Error
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding error handling fixes...
git add .

echo.
echo Committing fixes...
git commit -m "Fix Vercel 500 error: Add comprehensive error handling and health check endpoint"

echo.
echo Pushing fixes to GitHub...
git push origin main

echo.
echo ========================================
echo    Fixes pushed! Vercel will auto-deploy
echo ========================================
echo.
echo What was fixed:
echo - Added error handling for MongoDB connections
echo - Added health check endpoint at /health
echo - Made app more resilient to missing environment variables
echo - Added try-catch blocks to prevent crashes
echo.
echo Next steps:
echo 1. Wait for Vercel to redeploy (1-2 minutes)
echo 2. Test: https://your-app.vercel.app/health
echo 3. Set environment variables in Vercel dashboard
echo.
pause
