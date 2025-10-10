# Hire AI - Deployment Guide

## Vercel Deployment

This Flask application is configured for deployment on Vercel.

### Prerequisites

1. A Vercel account
2. MongoDB Atlas account (for production database)
3. Environment variables configured

### Deployment Steps

1. **Install Vercel CLI** (optional but recommended):
   ```bash
   npm i -g vercel
   ```

2. **Deploy to Vercel**:
   ```bash
   vercel
   ```

3. **Configure Environment Variables** in Vercel Dashboard:
   - `SECRET_KEY`: A secure random string for Flask sessions
   - `MONGO_URI`: Your MongoDB connection string
   - `ADMIN_EMAIL`: Admin user email
   - `ADMIN_PASSWORD`: Admin user password
   - `N8N_WEBHOOK_URL`: Your webhook URL (optional)

### Environment Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `SECRET_KEY` | Flask secret key | `your-secret-key-here` |
| `MONGO_URI` | MongoDB connection string | `mongodb+srv://user:pass@cluster.mongodb.net/hire_ai` |
| `ADMIN_EMAIL` | Admin user email | `admin@hireai.com` |
| `ADMIN_PASSWORD` | Admin user password | `secure-password` |
| `N8N_WEBHOOK_URL` | Webhook URL for automation | `https://n8n.srv812138.hstgr.cloud/webhook/hireai` |

### Local Development

1. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Set environment variables** (create `.env` file):
   ```
   SECRET_KEY=dev-secret-key
   MONGO_URI=mongodb://localhost:27017/hire_ai
   ADMIN_EMAIL=admin@hireai.com
   ADMIN_PASSWORD=admin123
   ```

3. **Run the application**:
   ```bash
   python run.py
   ```

### Features

- ✅ Modern, responsive UI with animations
- ✅ Multi-step form with progress indicators
- ✅ MongoDB integration
- ✅ User authentication and admin panel
- ✅ Vercel deployment ready
- ✅ Mobile-friendly design
- ✅ Consistent logo sizing
- ✅ Smooth animations and transitions

### File Structure

```
hire_ai/
├── app/
│   ├── static/
│   │   ├── css/style.css
│   │   ├── js/main.js
│   │   └── images/
│   ├── templates/
│   │   ├── layouts/base.html
│   │   ├── main/index.html
│   │   ├── dashboard/dashboard.html
│   │   └── auth/
│   ├── models/
│   ├── routes/
│   └── utils/
├── config.py
├── run.py
├── wsgi.py
├── vercel.json
├── requirements.txt
└── .vercelignore
```
