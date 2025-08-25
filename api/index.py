# api/index.py
from app import create_app
from serverless_wsgi import handle_request  # Required for Vercel

app = create_app()

# Vercel expects a handler function
def handler(event, context):
    return handle_request(app, event, context)