# Login Issues - Troubleshooting Guide

## Common Login Problems & Solutions

### 1. **Database Connection Issues**

**Problem**: "Database connection error" or login fails silently
**Solution**: 
- Check your MongoDB URI in environment variables
- Ensure MongoDB is running (if using local instance)
- For MongoDB Atlas, verify your connection string and network access

**Test**: Visit `/auth/debug` to check database status

### 2. **No Users in Database**

**Problem**: "Login unsuccessful" even with correct credentials
**Solution**: 
- Create a test user: Visit `/auth/create-test-user`
- Or register a new user: Visit `/auth/register`

**Test Credentials** (after creating test user):
- Email: `test@hireai.com`
- Password: `test123`

### 3. **Environment Variables Not Set**

**Problem**: Admin user not created automatically
**Solution**: Set these environment variables:
```bash
SECRET_KEY=your-secret-key-here
MONGO_URI=mongodb://localhost:27017/hire_ai
ADMIN_EMAIL=admin@hireai.com
ADMIN_PASSWORD=admin123
```

### 4. **MongoDB Atlas Connection Issues**

**Problem**: Can't connect to MongoDB Atlas
**Solution**:
1. Check your connection string format:
   ```
   mongodb+srv://username:password@cluster.mongodb.net/hire_ai?retryWrites=true&w=majority
   ```
2. Ensure your IP is whitelisted in Atlas
3. Check if your database user has proper permissions

### 5. **Password Hashing Issues**

**Problem**: Passwords not matching
**Solution**: The app uses bcrypt for password hashing. Make sure:
- Passwords are properly hashed when creating users
- The same bcrypt instance is used for checking passwords

## Debug Steps

### Step 1: Check Database Connection
Visit: `http://localhost:5000/auth/debug`

This will show:
- Database connection status
- Number of users in database
- List of existing users
- Environment variable status

### Step 2: Create Test User
Visit: `http://localhost:5000/auth/create-test-user`

This creates a test user with known credentials.

### Step 3: Test Login
Use the test credentials:
- Email: `test@hireai.com`
- Password: `test123`

### Step 4: Check Console Output
Look for error messages in your terminal/console when running the app.

## Quick Fixes

### Fix 1: Reset Database
```python
# In Python console or debug route
mongo.db.users.drop()  # This will delete all users
# Then create test user again
```

### Fix 2: Manual User Creation
```python
# In Python console
from app import mongo, bcrypt
hashed_password = bcrypt.generate_password_hash("your_password").decode('utf-8')
mongo.db.users.insert_one({
    '_id': 'your_email@example.com',
    'email': 'your_email@example.com',
    'password': hashed_password,
    'is_admin': False
})
```

### Fix 3: Check Environment Variables
```python
import os
print("SECRET_KEY:", bool(os.environ.get('SECRET_KEY')))
print("MONGO_URI:", bool(os.environ.get('MONGO_URI')))
print("ADMIN_EMAIL:", os.environ.get('ADMIN_EMAIL'))
```

## Error Messages & Solutions

| Error Message | Cause | Solution |
|---------------|-------|----------|
| "Database connection error" | MongoDB not connected | Check MONGO_URI and MongoDB status |
| "Login unsuccessful" | Wrong credentials or no user | Check user exists, verify credentials |
| "Please fill in both email and password" | Empty fields | Fill in both fields |
| "An error occurred during login" | General error | Check console logs, try debug route |

## Still Having Issues?

1. **Check the console output** when running the app
2. **Visit the debug route** to see database status
3. **Create a test user** to verify the system works
4. **Check your environment variables** are properly set
5. **Verify MongoDB connection** is working

## Test URLs

- Login: `http://localhost:5000/auth/login`
- Register: `http://localhost:5000/auth/register`
- Debug: `http://localhost:5000/auth/debug`
- Create Test User: `http://localhost:5000/auth/create-test-user`
