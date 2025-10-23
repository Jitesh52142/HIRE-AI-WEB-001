from flask import Blueprint, render_template, redirect, url_for, flash, request, session
from app import mongo, bcrypt
from app.models.user import User
from datetime import datetime

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/register', methods=['GET', 'POST'])
def register():
    try:
        # Skip authentication check for now - let templates handle it
        # This avoids Flask-Login issues in serverless environment

        if request.method == 'POST':
            email = request.form.get('email')
            password = request.form.get('password')
            
            if not email or not password:
                flash('Email and password are required.', 'danger')
                return render_template('auth/register.html')
            
            email = email.lower().strip()

            # Check if user already exists
            user_exists = False
            try:
                existing_user = mongo.db.users.find_one({'email': email})
                if existing_user:
                    user_exists = True
            except Exception as db_error:
                print(f"Database error checking user: {db_error}")
                # Continue with registration if DB check fails

            if user_exists:
                flash('An account with this email already exists. Please log in.', 'warning')
                return redirect(url_for('auth.login'))

            # Hash password and create user
            try:
                hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')
                
                user_data = {
                    '_id': email,
                    'email': email,
                    'password': hashed_password,
                    'is_admin': False,
                    'created_at': datetime.utcnow().isoformat()
                }
                
                mongo.db.users.insert_one(user_data)
                flash('Your account has been created successfully! You can now log in.', 'success')
                return redirect(url_for('auth.login'))
                
            except Exception as db_error:
                print(f"Database error creating user: {db_error}")
                flash('Registration failed. Please try again or contact support.', 'danger')

        return render_template('auth/register.html')
    except Exception as e:
        print(f"Error in register route: {e}")
        from flask import jsonify
        return jsonify({
            'error': 'Registration page error',
            'message': str(e),
            'status': 'error'
        }), 500

@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    try:
        # Skip authentication check for now - let templates handle it
        # This avoids Flask-Login issues in serverless environment

        if request.method == 'POST':
            email = request.form.get('email')
            password = request.form.get('password')
            
            if not email or not password:
                flash('Email and password are required.', 'danger')
                return render_template('auth/login.html')
            
            email = email.lower().strip()
            
            try:
                user_doc = mongo.db.users.find_one({'email': email})

                if user_doc and bcrypt.check_password_hash(user_doc['password'], password):
                    # Create session for the user
                    session['user_id'] = user_doc['_id']
                    session['user_email'] = user_doc['email']
                    session['is_admin'] = user_doc.get('is_admin', False)
                    session['logged_in'] = True
                    
                    flash('Login successful! Welcome to Hire AI.', 'success')
                    
                    # Redirect to dashboard if available, otherwise to home
                    next_page = request.args.get('next')
                    if next_page:
                        return redirect(next_page)
                    else:
                        return redirect(url_for('dashboard.main_dashboard') if user_doc.get('is_admin') else url_for('main.index'))
                else:
                    flash('Invalid email or password. Please try again.', 'danger')
                    
            except Exception as db_error:
                print(f"Database error during login: {db_error}")
                flash('Login service temporarily unavailable. Please try again later.', 'danger')

        return render_template('auth/login.html')
    except Exception as e:
        print(f"Error in login route: {e}")
        from flask import jsonify
        return jsonify({
            'error': 'Login page error',
            'message': str(e),
            'status': 'error'
        }), 500

@auth_bp.route('/logout')
def logout():
    try:
        # Clear the session
        session.clear()
        flash('You have been logged out successfully.', 'info')
        return redirect(url_for('main.index'))
    except Exception as e:
        print(f"Error during logout: {e}")
        session.clear()  # Clear session anyway
        flash('Logout completed.', 'info')
        return redirect(url_for('main.index'))

@auth_bp.route('/create-admin')
def create_admin():
    """Create admin user if it doesn't exist (for deployment setup)"""
    from app import create_admin_user_if_not_exists
    try:
        create_admin_user_if_not_exists()
        return "Admin user created successfully!", 200
    except Exception as e:
        return f"Error creating admin user: {str(e)}", 500

