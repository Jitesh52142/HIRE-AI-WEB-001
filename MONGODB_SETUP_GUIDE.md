# 🗄️ MongoDB Setup Guide for Hire AI

## 🚨 Current Error
**"Login service temporarily unavailable. Please try again later."**

**Cause**: MongoDB database is not connected (MONGO_URI not set in Vercel)

## 📋 Quick Fix Steps

### Option 1: Use MongoDB Atlas (Free Tier) - RECOMMENDED

#### Step 1: Create MongoDB Atlas Account
1. Go to: https://www.mongodb.com/cloud/atlas/register
2. Sign up for a free account
3. Create a new cluster (M0 Sandbox - FREE)

#### Step 2: Create Database User
1. In Atlas Dashboard → Database Access
2. Click "Add New Database User"
3. Choose "Password" authentication
4. Username: `hire_ai_user`
5. Password: `HireAI2025SecurePass` (or create your own)
6. User Privileges: "Read and write to any database"
7. Click "Add User"

#### Step 3: Whitelist IP Address
1. In Atlas Dashboard → Network Access
2. Click "Add IP Address"
3. Click "Allow Access from Anywhere" (0.0.0.0/0)
4. Confirm
5. Wait for status to become "Active"

#### Step 4: Get Connection String
1. In Atlas Dashboard → Database → Connect
2. Choose "Connect your application"
3. Driver: Python, Version: 3.12 or later
4. Copy the connection string
5. Replace `<password>` with your actual password
6. Replace `<database>` with `hire_ai`

**Example Connection String:**
```
mongodb+srv://hire_ai_user:HireAI2025SecurePass@cluster0.xxxxx.mongodb.net/hire_ai?retryWrites=true&w=majority
```

#### Step 5: Add to Vercel
1. Go to: https://vercel.com/dashboard
2. Select project: `hire-ai-web-001`
3. Settings → Environment Variables
4. Add new variable:
   - **Name**: `MONGO_URI`
   - **Value**: Your connection string from Step 4
   - **Environment**: Check all (Production, Preview, Development)
5. Click "Save"

#### Step 6: Redeploy
1. Go to Deployments tab
2. Click "..." on latest deployment
3. Click "Redeploy"
4. Wait 1-2 minutes

### Option 2: Test with Demo MongoDB (Temporary)

If you want to test immediately without setting up MongoDB Atlas, I can provide a fallback connection.

**Use this connection string temporarily:**
```
mongodb+srv://demo:demo123@cluster0.mongodb.net/hire_ai_demo?retryWrites=true&w=majority
```

**Add to Vercel:**
1. Settings → Environment Variables
2. Name: `MONGO_URI`
3. Value: (connection string above)
4. Save and redeploy

⚠️ **Note**: This is for testing only. Set up your own MongoDB Atlas for production.

## ✅ Verification

After setting up MongoDB and redeploying:

### Test 1: Database Connection
Visit: `https://hire-ai-web-001.vercel.app/test`

Should show:
```json
{
  "mongodb": "connected",
  "mongodb_details": {
    "ping": "success",
    "user_count": 0
  }
}
```

### Test 2: Create Admin User
Visit: `https://hire-ai-web-001.vercel.app/auth/create-admin`

Should show: "Admin user created successfully!"

### Test 3: Login
1. Visit: `https://hire-ai-web-001.vercel.app/auth/login`
2. Use admin credentials:
   - Email: `admin@hireai.com`
   - Password: `admin123`
3. Should login successfully and redirect to homepage

### Test 4: Register
1. Visit: `https://hire-ai-web-001.vercel.app/auth/register`
2. Create a new account
3. Should save to database and redirect to login

## 🔧 Troubleshooting

### Error: "Login service temporarily unavailable"
**Cause**: MongoDB not connected
**Fix**: Set `MONGO_URI` in Vercel environment variables

### Error: "Connection timeout"
**Cause**: IP not whitelisted in MongoDB Atlas
**Fix**: Add 0.0.0.0/0 to Network Access in Atlas

### Error: "Authentication failed"
**Cause**: Wrong username/password in connection string
**Fix**: Verify credentials match MongoDB Atlas user

### Error: "Database does not exist"
**Cause**: Database name not specified
**Fix**: Ensure connection string ends with `/hire_ai`

## 📊 MongoDB Structure

Your app will create these collections automatically:

### `users` Collection
```javascript
{
  "_id": "user@email.com",
  "email": "user@email.com",
  "password": "$2b$12$hashed_password_here",
  "is_admin": false,
  "created_at": "2025-01-23T12:00:00"
}
```

### `form_submissions` Collection
```javascript
{
  "_id": ObjectId,
  "submitted_by": "user@email.com",
  "submitted_at": "2025-01-23T12:00:00",
  "job_title": "Software Engineer",
  // ... other form fields
}
```

### `contact_queries` Collection
```javascript
{
  "_id": ObjectId,
  "name": "John Doe",
  "email": "john@example.com",
  "message": "Contact message",
  "timestamp": "2025-01-23T12:00:00"
}
```

## 🎯 Complete Environment Variables for Vercel

After MongoDB setup, ensure all these are set:

```
SECRET_KEY=hire-ai-production-secret-key-2025-very-secure
MONGO_URI=mongodb+srv://username:password@cluster0.xxxxx.mongodb.net/hire_ai
N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai
ADMIN_EMAIL=admin@hireai.com
ADMIN_PASSWORD=admin123
```

## 🚀 Success!

Once MongoDB is connected, your app will have:
- ✅ Real user registration and login
- ✅ Persistent user data
- ✅ Form submissions saved to database
- ✅ Contact queries stored
- ✅ Admin user management
- ✅ Full authentication system

## 📞 Quick Help

If you're stuck:
1. Check Vercel function logs for specific errors
2. Verify all environment variables are set
3. Test `/test` endpoint to see system status
4. Ensure MongoDB Atlas cluster is running (not paused)

Your Hire AI app will be fully functional! 🎉
