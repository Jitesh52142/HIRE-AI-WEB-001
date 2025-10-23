# ✅ Fix Login & Signup - Simple Checklist

## 🎯 Your Goal
Make login and signup work on Vercel by connecting MongoDB database.

## 📝 Quick Checklist (10 Minutes)

### Part 1: MongoDB Atlas (5 min)
- [ ] **1.** Sign up at https://www.mongodb.com/cloud/atlas/register
- [ ] **2.** Create M0 FREE cluster
- [ ] **3.** Create database user:
  - Username: `hire_ai_admin`
  - Password: (save it!)
- [ ] **4.** Whitelist IP: `0.0.0.0/0`
- [ ] **5.** Get connection string
- [ ] **6.** Format it: Add `/hire_ai` before `?`

### Part 2: Vercel Setup (3 min)
- [ ] **7.** Go to https://vercel.com/dashboard
- [ ] **8.** Select project: `hire-ai-web-001`
- [ ] **9.** Settings → Environment Variables
- [ ] **10.** Add `MONGO_URI` with your connection string
- [ ] **11.** Add 4 other variables (see below)
- [ ] **12.** Check all 3 environments for each

### Part 3: Deploy & Test (2 min)
- [ ] **13.** Deployments → ... → Redeploy
- [ ] **14.** Wait for "Ready" status
- [ ] **15.** Test: `your-app.vercel.app/test`
- [ ] **16.** Visit: `your-app.vercel.app/auth/create-admin`
- [ ] **17.** Login at: `your-app.vercel.app/auth/login`

## 📋 Environment Variables to Add

```
MONGO_URI = mongodb+srv://hire_ai_admin:YOUR_PASSWORD@cluster.mongodb.net/hire_ai?retryWrites=true&w=majority

SECRET_KEY = hire-ai-production-secret-key-2025

ADMIN_EMAIL = admin@hireai.com

ADMIN_PASSWORD = admin123

N8N_WEBHOOK_URL = https://n8n.srv812138.hstgr.cloud/webhook/hireai
```

## 🎯 Success Indicators

✅ `/test` shows: `"mongodb": "connected"`
✅ Login page doesn't show error message
✅ Can create account and login
✅ User data saves to database

## 📚 Need Detailed Guide?

See **`VERCEL_MONGODB_SETUP.md`** for step-by-step screenshots and troubleshooting.

---

**Once completed:** Your login and signup will work perfectly! 🚀
