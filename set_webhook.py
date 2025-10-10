#!/usr/bin/env python3
"""
Simple script to set the webhook URL for the Hire AI application.
This script helps you set the N8N_WEBHOOK_URL environment variable.
"""

import os
import sys

def set_webhook_url():
    """Set the webhook URL environment variable."""
    
    # Your new webhook URL
    webhook_url = "https://n8n.srv812138.hstgr.cloud/webhook/hireai"
    
    print("Setting up webhook URL for Hire AI...")
    print(f"Webhook URL: {webhook_url}")
    
    # Set environment variable for current session
    os.environ['N8N_WEBHOOK_URL'] = webhook_url
    
    # Create or update .env file
    env_file = '.env'
    env_content = []
    
    # Read existing .env file if it exists
    if os.path.exists(env_file):
        with open(env_file, 'r') as f:
            env_content = f.readlines()
    
    # Update or add N8N_WEBHOOK_URL
    webhook_found = False
    for i, line in enumerate(env_content):
        if line.startswith('N8N_WEBHOOK_URL='):
            env_content[i] = f'N8N_WEBHOOK_URL={webhook_url}\n'
            webhook_found = True
            break
    
    if not webhook_found:
        env_content.append(f'N8N_WEBHOOK_URL={webhook_url}\n')
    
    # Write back to .env file
    with open(env_file, 'w') as f:
        f.writelines(env_content)
    
    print(f"SUCCESS: Webhook URL set successfully!")
    print(f"SUCCESS: Updated {env_file} file")
    print(f"SUCCESS: Environment variable set for current session")
    
    # Verify the setting
    current_value = os.environ.get('N8N_WEBHOOK_URL')
    print(f"SUCCESS: Current N8N_WEBHOOK_URL: {current_value}")
    
    return True

if __name__ == "__main__":
    try:
        set_webhook_url()
        print("\nSUCCESS: You can now run your Flask app with the new webhook URL!")
        print("Run: python run.py")
    except Exception as e:
        print(f"ERROR: Error setting webhook URL: {e}")
        sys.exit(1)
