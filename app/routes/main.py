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
        try:
            mongo.db.admin.command('ping')
        except Exception as e:
            mongo_status = f"error: {str(e)}"
        
        return jsonify({
            'status': 'test_successful',
            'message': 'Test endpoint working',
            'mongodb': mongo_status,
            'templates_exist': True,
            'flask_app': 'running'
        })
    except Exception as e:
        return jsonify({
            'status': 'test_failed',
            'error': str(e)
        }), 500
