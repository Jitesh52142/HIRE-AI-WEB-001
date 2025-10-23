@echo off
color 0A
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║        HIRE AI - COMPLETE DEPLOYMENT SETUP                 ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo [STEP 1] SET ENVIRONMENT VARIABLES IN VERCEL
echo ═══════════════════════════════════════════════════════════
echo.
echo Go to: https://vercel.com/dashboard
echo Navigate to: hire-ai-web-001 → Settings → Environment Variables
echo.
echo Add these 5 variables:
echo.
echo 1. SECRET_KEY
echo    Value: hire-ai-production-secret-key-2025-change-this
echo.
echo 2. MONGO_URI (MOST IMPORTANT!)
echo    Value: mongodb+srv://user:pass@cluster.mongodb.net/hire_ai
echo    ⚠️  This is why login isn't working!
echo.
echo 3. N8N_WEBHOOK_URL
echo    Value: https://n8n.srv812138.hstgr.cloud/webhook/hireai
echo.
echo 4. ADMIN_EMAIL
echo    Value: admin@hireai.com
echo.
echo 5. ADMIN_PASSWORD
echo    Value: admin123
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo [STEP 2] GET MONGODB URI (FREE - 5 MINUTES)
echo ═══════════════════════════════════════════════════════════
echo.
echo If you don't have MongoDB URI:
echo.
echo 1. Sign up: https://www.mongodb.com/cloud/atlas/register
echo 2. Create free M0 cluster
echo 3. Create database user: hire_ai_user
echo 4. Whitelist IP: 0.0.0.0/0
echo 5. Get connection string
echo 6. Format: mongodb+srv://user:pass@cluster.mongodb.net/hire_ai
echo.
echo Full guide in: MONGODB_SETUP_GUIDE.md
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo [STEP 3] REDEPLOY IN VERCEL
echo ═══════════════════════════════════════════════════════════
echo.
echo 1. Go to Deployments tab
echo 2. Click "..." on latest deployment
echo 3. Click "Redeploy"
echo 4. Wait 1-2 minutes
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo [STEP 4] TEST YOUR APP
echo ═══════════════════════════════════════════════════════════
echo.
echo Test 1: Database Connection
echo   URL: https://hire-ai-web-001.vercel.app/test
echo   Should show: "mongodb": "connected"
echo.
echo Test 2: Create Admin User
echo   URL: https://hire-ai-web-001.vercel.app/auth/create-admin
echo   Should show: "Admin user created successfully!"
echo.
echo Test 3: Login
echo   URL: https://hire-ai-web-001.vercel.app/auth/login
echo   Email: admin@hireai.com
echo   Password: admin123
echo   Should login successfully!
echo.
echo Test 4: Register
echo   URL: https://hire-ai-web-001.vercel.app/auth/register
echo   Create your own account!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo [SUCCESS CHECKLIST]
echo ═══════════════════════════════════════════════════════════
echo.
echo After completing steps above, your app will have:
echo   ✓ Beautiful homepage working
echo   ✓ User registration working
echo   ✓ User login working
echo   ✓ Session management working
echo   ✓ Database saving users
echo   ✓ Admin panel access
echo   ✓ Webhook integration
echo   ✓ All features functional!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo [DOCUMENTATION FILES]
echo ═══════════════════════════════════════════════════════════
echo.
echo Full setup guides:
echo   • ENV_VARIABLES.md - Environment variables guide
echo   • MONGODB_SETUP_GUIDE.md - MongoDB Atlas setup
echo   • VERCEL_ENV_SETUP.md - Vercel configuration
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo 🎉 Your Hire AI app is 95%% complete!
echo 🚀 Just set MONGO_URI and redeploy!
echo.
pause
