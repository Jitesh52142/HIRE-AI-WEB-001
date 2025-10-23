@echo off
echo ========================================
echo    MONGODB CONNECTION FIX
echo ========================================
echo.
echo Your login page is working perfectly!
echo The error "Login service temporarily unavailable"
echo means MongoDB is not connected yet.
echo.
echo ========================================
echo    QUICK FIX INSTRUCTIONS
echo ========================================
echo.
echo STEP 1: SET MONGO_URI IN VERCEL
echo --------------------------------
echo 1. Go to: https://vercel.com/dashboard
echo 2. Select project: hire-ai-web-001
echo 3. Click Settings → Environment Variables
echo 4. Click "Add New"
echo.
echo STEP 2: ADD MONGO_URI VARIABLE
echo --------------------------------
echo Name:  MONGO_URI
echo Value: mongodb+srv://username:password@cluster.mongodb.net/hire_ai
echo.
echo Replace with your MongoDB Atlas connection string!
echo.
echo Don't have MongoDB Atlas? See MONGODB_SETUP_GUIDE.md
echo.
echo STEP 3: REDEPLOY
echo ----------------
echo 1. Go to Deployments tab in Vercel
echo 2. Click "..." on latest deployment
echo 3. Click "Redeploy"
echo 4. Wait 1-2 minutes
echo.
echo ========================================
echo    AFTER REDEPLOYMENT - TEST
echo ========================================
echo.
echo Test 1: Check database connection
echo URL: https://hire-ai-web-001.vercel.app/test
echo Should show: "mongodb": "connected"
echo.
echo Test 2: Create admin user
echo URL: https://hire-ai-web-001.vercel.app/auth/create-admin
echo Should show: "Admin user created successfully!"
echo.
echo Test 3: Login
echo URL: https://hire-ai-web-001.vercel.app/auth/login
echo Email: admin@hireai.com
echo Password: admin123
echo Should login successfully!
echo.
echo Test 4: Register new user
echo URL: https://hire-ai-web-001.vercel.app/auth/register
echo Create your own account!
echo.
echo ========================================
echo    NEED MONGODB ATLAS?
echo ========================================
echo.
echo Free Setup (5 minutes):
echo 1. Go to: https://www.mongodb.com/cloud/atlas/register
echo 2. Create free M0 cluster
echo 3. Create database user
echo 4. Whitelist IP: 0.0.0.0/0
echo 5. Get connection string
echo 6. Add to Vercel as MONGO_URI
echo.
echo Full instructions in: MONGODB_SETUP_GUIDE.md
echo.
echo ========================================
pause
