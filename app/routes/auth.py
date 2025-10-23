from flask import Blueprint, render_template, redirect, url_for, flash, request
from flask_login import login_user, logout_user, login_required, current_user
from app import mongo, bcrypt
from app.models.user import User

auth_bp = Blueprint('auth', __name__)

@auth_bp.route('/register', methods=['GET', 'POST'])
def register():
    try:
        # Safely check if user is authenticated
        if current_user and hasattr(current_user, 'is_authenticated') and current_user.is_authenticated:
            return redirect(url_for('dashboard.main_dashboard'))

        if request.method == 'POST':
            email = request.form.get('email').lower()
            password = request.form.get('password')

            # Check if user already exists
            try:
                if mongo.db.users.find_one({'email': email}):
                    flash('An account with this email already exists. Please log in.', 'warning')
                    return redirect(url_for('auth.login'))
            except Exception as db_error:
                print(f"Database error checking user: {db_error}")
                flash('Database temporarily unavailable. Please try again later.', 'danger')
                return render_template('auth/register.html')

            hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')
            
            # Use email as the _id for simplicity and uniqueness
            try:
                mongo.db.users.insert_one({
                    '_id': email,
                    'email': email,
                    'password': hashed_password,
                    'is_admin': False # Default users are not admins
                })
                flash('Your account has been created! You are now able to log in.', 'success')
                return redirect(url_for('auth.login'))
            except Exception as db_error:
                print(f"Database error creating user: {db_error}")
                flash('Registration failed. Please try again later.', 'danger')

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
        # Safely check if user is authenticated
        if current_user and hasattr(current_user, 'is_authenticated') and current_user.is_authenticated:
            return redirect(url_for('dashboard.main_dashboard'))

        if request.method == 'POST':
            email = request.form.get('email').lower()
            password = request.form.get('password')
            
            try:
                user_doc = mongo.db.users.find_one({'email': email})

                if user_doc and bcrypt.check_password_hash(user_doc['password'], password):
                    user_obj = User(user_doc)
                    login_user(user_obj, remember=True)
                    flash('Login successful!', 'success')
                    next_page = request.args.get('next')
                    return redirect(next_page) if next_page else redirect(url_for('dashboard.main_dashboard'))
                else:
                    flash('Login Unsuccessful. Please check email and password.', 'danger')
            except Exception as db_error:
                print(f"Database error during login: {db_error}")
                flash('Database temporarily unavailable. Please try again later.', 'danger')

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
@login_required
def logout():
    try:
        logout_user()
        flash('You have been logged out.', 'info')
        return redirect(url_for('main.index'))
    except Exception as e:
        print(f"Error during logout: {e}")
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

