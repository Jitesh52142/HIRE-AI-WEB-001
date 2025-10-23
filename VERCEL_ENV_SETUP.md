# 🔧 Vercel Environment Variables Setup Guide

## 🚨 Current Issue
**Error**: `"The session is unavailable because no secret key was set"`

**Solution**: Set environment variables in Vercel Dashboard

## 📋 Required Environment Variables

| Variable | Value | Purpose |
|----------|-------|---------|
| `SECRET_KEY` | `hire-ai-production-secret-key-2025` | Flask session security |
| `MONGO_URI` | Your MongoDB connection string | Database connection |
| `N8N_WEBHOOK_URL` | `https://n8n.srv812138.hstgr.cloud/webhook/hireai` | Webhook automation |
| `ADMIN_EMAIL` | `admin@hireai.com` | Admin user email |
| `ADMIN_PASSWORD` | `admin123` | Admin user password |

## 🚀 How to Set Environment Variables in Vercel

### Step 1: Access Vercel Dashboard
1. Go to: https://vercel.com/dashboard
2. Login to your account
3. Find and click on your project: **hire-ai-web-001**

### Step 2: Navigate to Settings
1. Click on **Settings** tab
2. Click on **Environment Variables** in the left sidebar

### Step 3: Add Variables
For each variable, click **Add New** and enter:

#### SECRET_KEY
- **Name**: `SECRET_KEY`
- **Value**: `hire-ai-production-secret-key-2025`
- **Environment**: Production, Preview, Development (all checked)

#### MONGO_URI
- **Name**: `MONGO_URI`
- **Value**: `mongodb+srv://username:password@cluster.mongodb.net/hire_ai`
- **Environment**: Production, Preview, Development (all checked)

#### N8N_WEBHOOK_URL
- **Name**: `N8N_WEBHOOK_URL`
- **Value**: `https://n8n.srv812138.hstgr.cloud/webhook/hireai`
- **Environment**: Production, Preview, Development (all checked)

#### ADMIN_EMAIL
- **Name**: `ADMIN_EMAIL`
- **Value**: `admin@hireai.com`
- **Environment**: Production, Preview, Development (all checked)

#### ADMIN_PASSWORD
- **Name**: `ADMIN_PASSWORD`
- **Value**: `admin123`
- **Environment**: Production, Preview, Development (all checked)

### Step 4: Save and Redeploy
1. Click **Save** for each variable
2. Go to **Deployments** tab
3. Click **Redeploy** on the latest deployment
4. Wait 1-2 minutes for redeployment

## ✅ Verification

After setting environment variables and redeploying:

### Test These URLs:
1. **Health Check**: `https://hire-ai-web-001.vercel.app/health`
   - Should return: `{"status": "healthy"}`

2. **System Test**: `https://hire-ai-web-001.vercel.app/test`
   - Should show all configurations

3. **Login Page**: `https://hire-ai-web-001.vercel.app/auth/login`
   - Should load without "secret key" error

4. **Register Page**: `https://hire-ai-web-001.vercel.app/auth/register`
   - Should load correctly

5. **Webhook Test**: `https://hire-ai-web-001.vercel.app/test-webhook`
   - Should test webhook connectivity

## 🔒 Security Notes

### SECRET_KEY
- **Current**: Uses fallback key for development
- **Production**: Set proper secret key in Vercel
- **Recommendation**: Use a long, random string

### MONGO_URI
- **Format**: `mongodb+srv://username:password@cluster.mongodb.net/database`
- **Security**: Ensure IP whitelist includes `0.0.0.0/0` for Vercel
- **Database**: Create database named `hire_ai`

### Admin Credentials
- **Default**: `admin@hireai.com` / `admin123`
- **Security**: Change in production
- **Creation**: Visit `/auth/create-admin` after setup

## 🐛 Troubleshooting

### Issue: "Secret key" error persists
**Solution**: 
1. Verify `SECRET_KEY` is set in Vercel
2. Redeploy the application
3. Clear browser cache

### Issue: Database connection fails
**Solution**:
1. Check MongoDB Atlas is running
2. Verify connection string format
3. Ensure IP whitelist includes `0.0.0.0/0`

### Issue: Webhook not working
**Solution**:
1. Verify n8n workflow is active
2. Check webhook URL is correct
3. Test with `/test-webhook` endpoint

## 📞 Quick Fix Commands

### If you need to redeploy quickly:
1. Go to Vercel Dashboard
2. Deployments → Latest → ... → Redeploy

### If environment variables aren't working:
1. Delete and re-add the variable
2. Make sure all environments are selected
3. Redeploy after changes

## 🎉 Success Indicators

When everything is working correctly:
- ✅ Login/Register pages load without errors
- ✅ `/health` returns healthy status
- ✅ `/test` shows all systems working
- ✅ `/test-webhook` connects successfully
- ✅ Dashboard loads and accepts form submissions

## 📝 Next Steps After Setup

1. **Create Admin User**: Visit `/auth/create-admin`
2. **Test Registration**: Create a test user account
3. **Test Dashboard**: Submit a form to test webhook
4. **Monitor Logs**: Check Vercel function logs for any issues

Your Hire AI application will be fully functional! 🚀
