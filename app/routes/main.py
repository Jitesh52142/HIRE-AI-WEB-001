from flask import Blueprint, render_template, request, flash, redirect, url_for, jsonify
from app import mongo
from datetime import datetime

main_bp = Blueprint('main', __name__)

@main_bp.route('/')
def index():
    try:
        return render_template('main/index.html')
    except Exception as e:
        print(f"Error rendering index template: {e}")
        return jsonify({
            'error': 'Template rendering failed',
            'message': str(e),
            'status': 'error'
        }), 500

@main_bp.route('/about')
def about():
    try:
        return render_template('main/about.html')
    except Exception as e:
        print(f"Error rendering about template: {e}")
        return jsonify({
            'error': 'About page failed',
            'message': str(e),
            'status': 'error'
        }), 500

@main_bp.route('/contact', methods=['GET', 'POST'])
def contact():
    try:
        if request.method == 'POST':
            name = request.form.get('name')
            email = request.form.get('email')
            message = request.form.get('message')

            if not name or not email or not message:
                flash('All fields are required.', 'danger')
                return redirect(url_for('main.contact'))

            # Try to save to MongoDB, but don't fail if it's not available
            try:
                mongo.db.contact_queries.insert_one({
                    'name': name,
                    'email': email,
                    'message': message,
                    'timestamp': datetime.utcnow()
                })
                flash('Thank you for your message! We will get back to you soon.', 'success')
            except Exception as db_error:
                print(f"MongoDB error: {db_error}")
                flash('Message received! (Note: Database temporarily unavailable)', 'warning')

            return redirect(url_for('main.contact'))

        return render_template('main/contact.html')
    except Exception as e:
        print(f"Error in contact route: {e}")
        return jsonify({
            'error': 'Contact page failed',
            'message': str(e),
            'status': 'error'
        }), 500

@main_bp.route('/health')
def health():
    """Health check endpoint for Vercel"""
    return jsonify({
        'status': 'healthy',
        'message': 'Hire AI app is running successfully!'
    })

@main_bp.route('/test')
def test():
    """Test endpoint to debug issues"""
    try:
        # Test MongoDB connection
        mongo_status = "connected"
        mongo_details = {}
        try:
            result = mongo.db.admin.command('ping')
            mongo_details['ping'] = 'success'
            # Try to count users
            user_count = mongo.db.users.count_documents({})
            mongo_details['user_count'] = user_count
        except Exception as e:
            mongo_status = f"error: {str(e)}"
            mongo_details['error'] = str(e)
        
        # Test webhook configuration
        from flask import current_app
        webhook_url = current_app.config.get('N8N_WEBHOOK_URL')
        webhook_status = "configured" if webhook_url else "not_configured"
        
        return jsonify({
            'status': 'test_successful',
            'message': 'Test endpoint working',
            'mongodb': mongo_status,
            'mongodb_details': mongo_details,
            'webhook_url': webhook_url,
            'webhook_status': webhook_status,
            'templates_exist': True,
            'flask_app': 'running'
        })
    except Exception as e:
        return jsonify({
            'status': 'test_failed',
            'error': str(e)
        }), 500

@main_bp.route('/test-webhook')
def test_webhook():
    """Test webhook functionality"""
    try:
        from flask import current_app
        import requests
        
        webhook_url = current_app.config.get('N8N_WEBHOOK_URL')
        
        if not webhook_url:
            return jsonify({
                'status': 'error',
                'message': 'N8N_WEBHOOK_URL not configured'
            }), 400
        
        # Send test data to webhook
        test_data = {
            'test': True,
            'message': 'Test webhook from Hire AI',
            'timestamp': datetime.utcnow().isoformat(),
            'source': 'test_endpoint'
        }
        
        try:
            response = requests.post(webhook_url, json=test_data, timeout=10)
            response.raise_for_status()
            
            return jsonify({
                'status': 'success',
                'message': 'Webhook test successful',
                'webhook_url': webhook_url,
                'response_status': response.status_code,
                'response_text': response.text[:200]  # First 200 chars
            })
        except requests.exceptions.RequestException as e:
            return jsonify({
                'status': 'error',
                'message': 'Webhook test failed',
                'webhook_url': webhook_url,
                'error': str(e)
            }), 500
            
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': 'Test webhook endpoint error',
            'error': str(e)
        }), 500
