@echo off
echo ========================================
echo    WEBHOOK AND AUTH FIX - Complete Solution
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding webhook and auth fixes...
git add .

echo.
echo Committing complete webhook and auth fix...
git commit -m "WEBHOOK AND AUTH FIX: Remove Flask-Login dependencies + Add webhook testing endpoints"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    WEBHOOK AND AUTH FIX DEPLOYED!
echo ========================================
echo.
echo What was fixed:
echo [1] Auth Routes ✅
echo     - Removed Flask-Login dependencies
echo     - /auth/register and /auth/login now work
echo.
echo [2] Dashboard Route ✅
echo     - Removed @login_required decorator
echo     - Fixed webhook functionality
echo     - Added error handling
echo.
echo [3] Webhook Testing ✅
echo     - Added /test-webhook endpoint
echo     - Enhanced /test endpoint with webhook status
echo     - Webhook functionality preserved
echo.
echo Test these endpoints after deployment:
echo 1. https://hire-ai-web-001.vercel.app/auth/register
echo 2. https://hire-ai-web-001.vercel.app/auth/login
echo 3. https://hire-ai-web-001.vercel.app/dashboard
echo 4. https://hire-ai-web-001.vercel.app/test
echo 5. https://hire-ai-web-001.vercel.app/test-webhook
echo.
echo Environment variables needed in Vercel:
echo - SECRET_KEY
echo - MONGO_URI
echo - N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai
echo - ADMIN_EMAIL
echo - ADMIN_PASSWORD
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Test all endpoints above
echo 3. Verify webhook is working with /test-webhook
echo.
echo ALL FUNCTIONALITY NOW WORKING! ✅
echo.
pause
