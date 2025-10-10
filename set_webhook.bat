@echo off
echo Setting up webhook URL for Hire AI...

REM Set the webhook URL environment variable
set N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai

echo Webhook URL set to: %N8N_WEBHOOK_URL%

REM Create or update .env file
echo N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai > .env

echo.
echo ✅ Webhook URL configured successfully!
echo ✅ You can now run: python run.py
echo.
pause
