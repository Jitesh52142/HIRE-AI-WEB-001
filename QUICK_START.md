# 🚀 Hire AI - Quick Start Guide

## ✅ Current Status

Your Hire AI app is **deployed and working**! 

- ✅ Homepage loads beautifully
- ✅ Login page functional
- ✅ Register page functional  
- ✅ All UI elements working
- ⚠️ **Database needs connection** (1 step remaining)

## 🔥 Fix "Login service temporarily unavailable" Error

This error appears because MongoDB is not connected yet. Here's how to fix it:

### 5-Minute Fix

**1. Go to Vercel Dashboard**
```
https://vercel.com/dashboard
```

**2. Select your project**
- Click: `hire-ai-web-001`

**3. Add Environment Variables**
- Go to: **Settings** → **Environment Variables**
- Click: **Add New**

**4. Add MONGO_URI** (Critical!)
```
Name: MONGO_URI
Value: mongodb+srv://username:password@cluster.mongodb.net/hire_ai
Environments: ✓ Production ✓ Preview ✓ Development
```

**5. Add Other Variables**
```
SECRET_KEY = hire-ai-production-secret-key-2025
N8N_WEBHOOK_URL = https://n8n.srv812138.hstgr.cloud/webhook/hireai  
ADMIN_EMAIL = admin@hireai.com
ADMIN_PASSWORD = admin123
```

**6. Redeploy**
- Deployments tab → **... → Redeploy**
- Wait 1-2 minutes

**7. Done!** ✨
- Login will work
- Registration will work
- All database features active

## 🗄️ Need MongoDB? (Free Setup)

**Quick MongoDB Atlas Setup:**

1. **Sign up** (Free): https://www.mongodb.com/cloud/atlas/register
2. **Create cluster**: Choose M0 (FREE tier)
3. **Create user**: 
   - Username: `hire_ai_user`
   - Password: Create strong password
4. **Whitelist IP**: Add `0.0.0.0/0` (allow all)
5. **Get connection string**: 
   ```
   mongodb+srv://hire_ai_user:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/hire_ai?retryWrites=true&w=majority
   ```
6. **Add to Vercel** as `MONGO_URI`

**Full guide**: See `MONGODB_SETUP_GUIDE.md`

## 🧪 After Setup - Test These

**1. Database Status**
```
https://hire-ai-web-001.vercel.app/test
```
Should show: `"mongodb": "connected"`

**2. Create Admin**
```
https://hire-ai-web-001.vercel.app/auth/create-admin
```
Should show: "Admin user created successfully!"

**3. Login**
```
https://hire-ai-web-001.vercel.app/auth/login
```
- Email: `admin@hireai.com`
- Password: `admin123`

**4. Register**
```
https://hire-ai-web-001.vercel.app/auth/register
```
Create your own account!

## 📚 Documentation

- `ENV_VARIABLES.md` - Complete environment setup
- `MONGODB_SETUP_GUIDE.md` - Database setup guide  
- `DEPLOYMENT_COMPLETE.md` - Full deployment overview
- `README.md` - Project documentation

## 🎯 Your App is 95% Done!

Just add `MONGO_URI` in Vercel → Redeploy → **100% Working!** 🎉

---

**Run this script for guided setup:**
```
FINAL_DEPLOYMENT.bat
```

Your Hire AI app will be fully functional! 🚀
