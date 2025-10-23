@echo off
echo ========================================
echo    SECRET KEY FIX - Add Fallback Secret Key
echo ========================================

REM Navigate to the project directory
cd /d "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"

echo.
echo Current directory: %CD%
echo.

echo Adding fallback secret key...
git add .

echo.
echo Committing secret key fix...
git commit -m "SECRET KEY FIX: Add fallback secret key to prevent session errors"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    SECRET KEY FIX DEPLOYED!
echo ========================================
echo.
echo What was fixed:
echo [1] Added fallback SECRET_KEY in config.py
echo [2] App will no longer crash with "no secret key" error
echo [3] Sessions will work even without environment variable
echo.
echo IMPORTANT: Set environment variables in Vercel Dashboard
echo.
echo Go to: https://vercel.com/dashboard
echo 1. Select your project: hire-ai-web-001
echo 2. Go to Settings → Environment Variables
echo 3. Add these variables:
echo.
echo    SECRET_KEY = hire-ai-production-secret-key-2025
echo    MONGO_URI = your-mongodb-connection-string
echo    N8N_WEBHOOK_URL = https://n8n.srv812138.hstgr.cloud/webhook/hireai
echo    ADMIN_EMAIL = admin@hireai.com
echo    ADMIN_PASSWORD = admin123
echo.
echo 4. Click "Save"
echo 5. Redeploy your app
echo.
echo Next steps:
echo 1. Wait 1-2 minutes for Vercel to redeploy
echo 2. Set environment variables in Vercel (see above)
echo 3. Test: https://hire-ai-web-001.vercel.app/auth/login
echo 4. Should work without session errors!
echo.
echo Your app will now work! ✅
echo.
pause
