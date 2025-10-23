import os
from flask import Flask
from flask_pymongo import PyMongo
from flask_login import LoginManager
from flask_bcrypt import Bcrypt
from .models.user import User
from config import Config

# Initialize extensions
mongo = PyMongo()
bcrypt = Bcrypt()
login_manager = LoginManager()
login_manager.login_view = 'auth.login' # Redirect to login page if user is not authenticated
login_manager.login_message_category = 'info'

# Define AnonymousUser class for Flask-Login
from flask_login import AnonymousUserMixin
class AnonymousUser(AnonymousUserMixin):
    @property
    def is_admin(self):
        return False

login_manager.anonymous_user = AnonymousUser

def create_app(config_class=Config):
    """
    Application factory function to create and configure the Flask app.
    """
    app = Flask(__name__)
    app.config.from_object(config_class)

    # Initialize extensions with the app
    try:
        mongo.init_app(app)
        bcrypt.init_app(app)
        login_manager.init_app(app)
    except Exception as e:
        print(f"Warning: Error initializing extensions: {e}")
        # Continue with app creation even if some extensions fail

    @login_manager.user_loader
    def load_user(user_id):
        """Load user from the database."""
        try:
            user_json = mongo.db.users.find_one({'_id': user_id})
            if user_json:
                return User(user_json)
        except Exception as e:
            print(f"Error loading user: {e}")
        return None

    # Add template context processor to make current_user available globally
    @app.context_processor
    def inject_user():
        # Create a safe anonymous user that always works
        class SafeAnonymousUser:
            is_authenticated = False
            is_active = False
            is_anonymous = True
            is_admin = False
            
            def get_id(self):
                return None
        
        try:
            # Try to get the real current_user from Flask-Login
            from flask_login import current_user as flask_login_current_user
            
            # If we can access it and it's authenticated, use it
            if hasattr(flask_login_current_user, 'is_authenticated') and flask_login_current_user.is_authenticated:
                return dict(current_user=flask_login_current_user)
        except Exception as e:
            # If Flask-Login fails, log it but continue
            print(f"Flask-Login current_user not available: {e}")
        
        # Return safe anonymous user as fallback
        return dict(current_user=SafeAnonymousUser())

    # Register blueprints
    from .routes.main import main_bp
    from .routes.auth import auth_bp
    from .routes.dashboard import dashboard_bp
    from .routes.candidates import candidates_bp
    from .routes.admin import admin_bp

    app.register_blueprint(main_bp)
    app.register_blueprint(auth_bp, url_prefix='/auth')
    app.register_blueprint(dashboard_bp)
    app.register_blueprint(candidates_bp)
    app.register_blueprint(admin_bp, url_prefix='/admin')

    # Note: Admin user creation moved to lazy initialization
    # to avoid blocking deployment startup

    return app

def create_admin_user_if_not_exists():
    """Checks for and creates a default admin user from .env credentials."""
    try:
        admin_email = os.environ.get('ADMIN_EMAIL')
        admin_password = os.environ.get('ADMIN_PASSWORD')

        if not admin_email or not admin_password:
            print("Warning: ADMIN_EMAIL or ADMIN_PASSWORD not set in environment. Skipping admin creation.")
            return

        # Check if admin user already exists
        if not mongo.db.users.find_one({'email': admin_email}):
            hashed_password = bcrypt.generate_password_hash(admin_password).decode('utf-8')
            mongo.db.users.insert_one({
                '_id': admin_email, # Using email as a unique ID
                'email': admin_email,
                'password': hashed_password,
                'is_admin': True
            })
            print(f"Admin user '{admin_email}' created successfully.")
    except Exception as e:
        print(f"Error creating admin user: {e}")
        # Don't crash the app if admin creation fails