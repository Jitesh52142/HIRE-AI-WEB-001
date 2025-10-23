@echo off
color 0A
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║              HIRE AI - FINAL DEPLOYMENT                    ║
echo ║           Clean Code Ready for Production                  ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo Current directory: %CD%
echo.
echo ════════════════════════════════════════════════════════════
echo   STEP 1: COMMITTING CLEAN CODE
echo ════════════════════════════════════════════════════════════
echo.
echo Adding all files...
git add .

echo.
echo Committing...
git commit -m "FINAL DEPLOYMENT: Clean production-ready code with proper authentication and documentation"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ════════════════════════════════════════════════════════════
echo   STEP 2: SET ENVIRONMENT VARIABLES IN VERCEL
echo ════════════════════════════════════════════════════════════
echo.
echo Go to: https://vercel.com/dashboard
echo Project: hire-ai-web-001
echo Settings → Environment Variables
echo.
echo Add these 5 variables:
echo.
echo 1. SECRET_KEY
echo    hire-ai-production-secret-key-2025
echo.
echo 2. MONGO_URI (REQUIRED!)
echo    mongodb+srv://user:pass@cluster.mongodb.net/hire_ai
echo.
echo 3. N8N_WEBHOOK_URL
echo    https://n8n.srv812138.hstgr.cloud/webhook/hireai
echo.
echo 4. ADMIN_EMAIL
echo    admin@hireai.com
echo.
echo 5. ADMIN_PASSWORD
echo    admin123
echo.
echo ════════════════════════════════════════════════════════════
echo   STEP 3: REDEPLOY ON VERCEL
echo ════════════════════════════════════════════════════════════
echo.
echo 1. Go to Deployments tab
echo 2. Click "Redeploy" on latest
echo 3. Wait 1-2 minutes
echo.
echo ════════════════════════════════════════════════════════════
echo   STEP 4: TEST YOUR APP
echo ════════════════════════════════════════════════════════════
echo.
echo ✓ Homepage: https://hire-ai-web-001.vercel.app/
echo ✓ Test: https://hire-ai-web-001.vercel.app/test
echo ✓ Login: https://hire-ai-web-001.vercel.app/auth/login
echo ✓ Register: https://hire-ai-web-001.vercel.app/auth/register
echo.
echo ════════════════════════════════════════════════════════════
echo   DOCUMENTATION
echo ════════════════════════════════════════════════════════════
echo.
echo • ENV_VARIABLES.md - Environment setup guide
echo • MONGODB_SETUP_GUIDE.md - Database setup
echo • DEPLOYMENT_COMPLETE.md - Complete overview
echo • README.md - Project documentation
echo.
echo ════════════════════════════════════════════════════════════
echo   ✨ YOUR APP IS READY FOR PRODUCTION!
echo ════════════════════════════════════════════════════════════
echo.
pause
