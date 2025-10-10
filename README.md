Got it 👍 — I’ll clean up the documentation so no sensitive `.env` values are shown. Instead, I’ll only **describe what needs to be added**, without revealing keys, emails, or passwords.

Here’s the updated **Hire AI documentation** with the `.env` section anonymized:

---

# Hire AI

Hire AI is a sophisticated, AI-driven recruitment platform built with Flask, designed to help companies streamline their hiring process. It provides a multi-step form for defining job requirements, automates data submission to a webhook for custom workflows, and displays real-time candidate insights pulled from public Google Sheets.

## Features

* **Multi-Step Form**: A clean, user-friendly form wizard for capturing detailed job descriptions.
* **AI Integration**: Submits data to an n8n webhook to trigger external AI-powered candidate searches.
* **Dynamic Dashboards**: Displays real-time candidate data and hiring history fetched directly from public Google Sheets.
* **Secure Authentication**: User registration and login managed with Flask-Login and Bcrypt.
* **Protected Admin Panel**: An administrative view of all database collections, accessible only to an admin user.
* **Modular Design**: Built with Flask Blueprints for a scalable and maintainable codebase.

---

## Prerequisites

* Python 3.8+
* MongoDB Atlas account (free tier is sufficient)
* A public Google Sheet with a specific format for candidate data
* An n8n webhook URL to receive form submissions

---

## Installation & Setup

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/hire_ai.git
   cd hire_ai
   ```

2. **Create a virtual environment and install dependencies:**

   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. **Configure environment variables:**
   Create a `.env` file in the root directory and add the following (replace with your values):

   ```ini
   # Flask App Secret Key
   SECRET_KEY=your_secret_key

   # MongoDB Atlas Connection URI
   MONGO_URI=your_mongodb_uri

   # n8n Webhook URL for form submissions
   N8N_WEBHOOK_URL=https://n8n.srv812138.hstgr.cloud/webhook/hireai

   # Admin User Credentials (used for first-time admin creation)
   ADMIN_EMAIL=your_admin_email
   ADMIN_PASSWORD=your_admin_password
   ```

4. **Run the application:**

   ```bash
   python run.py
   ```

   The app will be running at: `http://127.0.0.1:5000`

---

## n8n Setup (Basic Overview)

To make the automation work, you need an **n8n workflow** to process incoming form submissions from Hire AI.

1. **Install n8n (local or cloud):**

   * Local:

     ```bash
     npm install n8n -g
     n8n start
     ```
   * Or sign up for **n8n.cloud** (managed hosting).

2. **Create a new workflow in n8n:**

   * Add a **Webhook Node** → copy the webhook URL and paste it into your `.env` as `N8N_WEBHOOK_URL`.
   * Set **HTTP Method = POST**.

3. **Process the incoming job data:**

   * Connect nodes like:

     * **Webhook (Trigger)** → receives form data from Hire AI.
     * **OpenAI / HuggingFace / Function Node** → process job descriptions.
     * **Google Sheets Node** → store candidate/job data.
     * **Email/Slack Node** → notify HR teams.

4. **Activate the workflow:**

   * Save → Toggle **Active**.
   * Now, every new job posting from Hire AI will trigger your n8n automation.

---

## Deployment

Hire AI is deployment-ready with `Procfile` and `render.yaml` for **Heroku/Render**.
Just ensure all `.env` variables are properly set on the hosting platform.

---

## Contact

For any questions or support, please contact:
📧 **Jitesh Bawaskar** → `jiteshbawaskar05@gmail.com`


