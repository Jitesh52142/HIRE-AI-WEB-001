# Webhook Setup Guide

## 🎯 Your New Webhook URL
```
https://n8n.srv812138.hstgr.cloud/webhook/hireai
```

## 🚀 Quick Setup (Choose One Method)

### Method 1: Automatic Setup (Recommended)

**For Windows:**
```bash
# Run the batch file
set_webhook.bat
```

**For Linux/Mac:**
```bash
# Run the shell script
./set_webhook.sh
```

**For Python (Any OS):**
```bash
# Run the Python script
python set_webhook.py
```

### Method 2: Manual Setup

1. **Create/Edit `.env` file** in your project root:
   ```
   N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai
   ```

2. **Set environment variable** (optional, for current session):
   ```bash
   # Windows
   set N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai
   
   # Linux/Mac
   export N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai
   ```

## ✅ Verify Setup

After setting up, run your app:
```bash
python run.py
```

When you submit the hiring form, you should see:
```
SUCCESS: Webhook triggered successfully: [response from n8n]
```

## 🔧 How It Works

1. **User fills out the hiring form** on the dashboard
2. **Form data is collected** and structured
3. **Data is sent to your n8n webhook** at the URL above
4. **n8n processes the data** and triggers your automation workflow
5. **Success/error messages** are displayed to the user

## 📊 Data Structure Sent to Webhook

The webhook receives a JSON payload with all form fields:
```json
{
  "CompanyName": "Your Company",
  "CompanyWebsite": "https://yourcompany.com",
  "CompanyAddress": "123 Main St",
  "CompanyIndustry": "Technology",
  "PositionTitle": "Software Engineer",
  "Department": "Engineering",
  "JobType": "Full-time",
  "WorkMode": "Remote",
  "Location": "New York, NY",
  "ExperienceRequired": "3-5 Years",
  "Currency": "USD",
  "MinimumSalary": 80000,
  "MaximumSalary": 120000,
  "RequiredSkillsAndExperience": "Python, Flask, MongoDB",
  "KeyResponsibilities": "Develop web applications",
  "BenefitsAndPerks": "Health insurance, 401k",
  "InterviewProcess": "Technical interview + HR round",
  "HiringUrgency": "Within 1 month",
  "ExpectedStartDate": "2024-02-01",
  "EducationRequirements": "Bachelor's Degree",
  "NiceToHaveSkills": "Docker, AWS",
  "CompanyDescriptionAndMission": "We build amazing software",
  "CompanyCultureAndValues": "Innovation, teamwork",
  "fullName": "John Doe",
  "hrTitle": "HR Manager",
  "hrEmail": "hr@company.com",
  "hrPhone": "+1-555-0123",
  "hrLinkedIn": "https://linkedin.com/in/johndoe",
  "preferredTimezone": "EST"
}
```

## 🛠️ Troubleshooting

### Webhook Not Working?
1. **Check the URL** - Make sure it's exactly: `https://n8n.srv812138.hstgr.cloud/webhook/48edfceb-6f2e-45f6-8147-6e49064f7626`
2. **Check n8n status** - Ensure your n8n instance is running
3. **Check network** - Make sure your server can reach the webhook URL
4. **Check logs** - Look at the console output for error messages

### Common Errors:
- `ERROR: Webhook error: Connection timeout` - Network issue
- `ERROR: Webhook error: 404 Not Found` - Wrong webhook URL
- `ERROR: Webhook error: 500 Internal Server Error` - n8n workflow issue

## 🔄 Testing the Webhook

You can test the webhook directly using curl:
```bash
curl -X POST https://n8n.srv812138.hstgr.cloud/webhook/hireai \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}'
```

## 📝 Notes

- The webhook URL is configured in `config.py` and loaded from environment variables
- The webhook is triggered in `app/routes/dashboard.py` when the form is submitted
- All form data is sent as JSON to the webhook
- The app continues to work even if the webhook fails (with a warning message)
