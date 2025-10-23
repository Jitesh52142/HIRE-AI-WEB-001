# 🔐 Environment Variables Setup for Hire AI

## 📋 Required Environment Variables

Copy these to your Vercel Dashboard → Settings → Environment Variables:

```env
SECRET_KEY=hire-ai-production-secret-key-2025-change-this-to-random-string
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/hire_ai?retryWrites=true&w=majority
N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai
ADMIN_EMAIL=admin@hireai.com
ADMIN_PASSWORD=admin123
```

## 🚀 Quick Setup for Vercel (5 minutes)

### Step 1: Go to Vercel Dashboard
1. Visit: https://vercel.com/dashboard
2. Select project: **hire-ai-web-001**
3. Click **Settings** → **Environment Variables**

### Step 2: Add Each Variable

#### Variable 1: SECRET_KEY
```
Name: SECRET_KEY
Value: hire-ai-production-secret-key-2025-change-this-to-random-string
Environments: ✓ Production ✓ Preview ✓ Development
```

#### Variable 2: MONGO_URI (MOST IMPORTANT!)
```
Name: MONGO_URI
Value: mongodb+srv://hire_ai_user:YourPassword123@cluster0.xxxxx.mongodb.net/hire_ai?retryWrites=true&w=majority
Environments: ✓ Production ✓ Preview ✓ Development
```

**⚠️ This is why login isn't working! MongoDB URI is not set.**

#### Variable 3: N8N_WEBHOOK_URL
```
Name: N8N_WEBHOOK_URL
Value: https://n8n.srv812138.hstgr.cloud/webhook/hireai
Environments: ✓ Production ✓ Preview ✓ Development
```

#### Variable 4: ADMIN_EMAIL
```
Name: ADMIN_EMAIL
Value: admin@hireai.com
Environments: ✓ Production ✓ Preview ✓ Development
```

#### Variable 5: ADMIN_PASSWORD
```
Name: ADMIN_PASSWORD
Value: admin123
Environments: ✓ Production ✓ Preview ✓ Development
```

### Step 3: Save and Redeploy
1. Click **Save** after adding each variable
2. Go to **Deployments** tab
3. Click **...** on latest deployment → **Redeploy**
4. Wait 1-2 minutes

## 🗄️ MongoDB Atlas Setup (Free - 5 minutes)

If you don't have MongoDB URI yet:

### 1. Create Account
- Go to: https://www.mongodb.com/cloud/atlas/register
- Sign up (it's FREE)

### 2. Create Cluster
- Click **Build a Database**
- Choose **M0 FREE** tier
- Select cloud provider (AWS recommended)
- Click **Create**

### 3. Create Database User
- Go to **Database Access** (left sidebar)
- Click **Add New Database User**
- Authentication: **Password**
- Username: `hire_ai_user`
- Password: Create a strong password (save it!)
- Database User Privileges: **Read and write to any database**
- Click **Add User**

### 4. Whitelist All IPs (for Vercel)
- Go to **Network Access** (left sidebar)
- Click **Add IP Address**
- Click **Allow Access from Anywhere**
- Enter: `0.0.0.0/0`
- Description: "Vercel deployment"
- Click **Confirm**
- Wait until status shows **Active**

### 5. Get Connection String
- Go to **Database** (left sidebar)
- Click **Connect** on your cluster
- Choose **Connect your application**
- Driver: **Python** / Version: **3.12 or later**
- Copy the connection string
- It looks like: `mongodb+srv://hire_ai_user:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`

### 6. Format Your Connection String
Replace:
- `<password>` → Your actual password from step 3
- Add `/hire_ai` before the `?` to specify database name

**Final format:**
```
mongodb+srv://hire_ai_user:YourPassword123@cluster0.xxxxx.mongodb.net/hire_ai?retryWrites=true&w=majority
```

### 7. Add to Vercel
- Copy your formatted connection string
- Add it as `MONGO_URI` in Vercel (Step 2 above)
- Redeploy

## ✅ Verification

After setting all variables and redeploying:

### Test 1: Check System Status
```
https://hire-ai-web-001.vercel.app/test
```

Should show:
```json
{
  "status": "test_successful",
  "mongodb": "connected",
  "mongodb_details": {
    "ping": "success",
    "user_count": 0
  }
}
```

### Test 2: Create Admin User
```
https://hire-ai-web-001.vercel.app/auth/create-admin
```

Should show: **"Admin user created successfully!"**

### Test 3: Login with Admin
```
https://hire-ai-web-001.vercel.app/auth/login
```

Credentials:
- Email: `admin@hireai.com`
- Password: `admin123`

Should redirect to homepage with success message!

### Test 4: Register New User
```
https://hire-ai-web-001.vercel.app/auth/register
```

Create your own account and test login!

## 🔧 Troubleshooting

### Error: "Login service temporarily unavailable"
**Cause**: MONGO_URI not set or invalid
**Fix**: 
1. Check MONGO_URI is added in Vercel
2. Verify connection string format
3. Ensure password is correct (no special characters like @, <, >)
4. Redeploy after adding variable

### Error: "Connection timeout"
**Cause**: IP not whitelisted in MongoDB Atlas
**Fix**: Add 0.0.0.0/0 in Network Access

### Error: "Authentication failed"
**Cause**: Wrong username or password in MONGO_URI
**Fix**: Verify credentials match MongoDB Atlas user

### Error: "No database selected"
**Cause**: Missing database name in connection string
**Fix**: Add `/hire_ai` before `?` in connection string

## 🎯 Complete Checklist

Before your app works completely:

- [ ] SECRET_KEY set in Vercel
- [ ] MONGO_URI set in Vercel (with correct password and database name)
- [ ] N8N_WEBHOOK_URL set in Vercel (optional)
- [ ] ADMIN_EMAIL set in Vercel
- [ ] ADMIN_PASSWORD set in Vercel
- [ ] All variables have all environments checked
- [ ] App redeployed after adding variables
- [ ] MongoDB Atlas IP whitelist includes 0.0.0.0/0
- [ ] MongoDB cluster is active (not paused)
- [ ] Database user created with correct permissions

## 🎉 Success!

Once all variables are set and app is redeployed:
- ✅ Login will work
- ✅ Registration will work
- ✅ User data saved to database
- ✅ Admin panel accessible
- ✅ Form submissions saved
- ✅ Webhook integration active

Your Hire AI app will be fully functional! 🚀

## 📞 Quick Help Commands

Test database connection:
```bash
curl https://hire-ai-web-001.vercel.app/test
```

Create admin user:
```bash
curl https://hire-ai-web-001.vercel.app/auth/create-admin
```

Test webhook:
```bash
curl https://hire-ai-web-001.vercel.app/test-webhook
```
