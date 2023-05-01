import hashlib
from datetime import datetime
import os
from uuid import uuid4
from flask import Flask, request, jsonify
from flask_marshmallow import Marshmallow
from flask_sqlalchemy import SQLAlchemy

# Main
app = Flask(__name__)

basedir = os.path.abspath(os.path.dirname(__file__))
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, '../database/user_db.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

user_db = SQLAlchemy(app)
ma = Marshmallow(app)


# User Table Model
class User(user_db.Model):
    id = user_db.Column(user_db.Integer, primary_key=True)
    name = user_db.Column(user_db.String(100))
    contact = user_db.Column(user_db.String(100), unique=True)

    def __init__(self, name, contact):
        self.name = name
        self.contact = contact


class UserSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'contact')


user_schema = UserSchema()
users_schema = UserSchema(many=True)


# Login Credentials Table Model
class LoginCredential(user_db.Model):
    __tablename__ = 'login_credentials'

    id = user_db.Column(user_db.String(36), primary_key=True, default=str(uuid4()))
    first_name = user_db.Column(user_db.String(50))
    last_name = user_db.Column(user_db.String(50))
    birthdate = user_db.Column(user_db.DateTime)
    gender = user_db.Column(user_db.String(10))
    phone_number = user_db.Column(user_db.String(20), unique=True)
    email = user_db.Column(user_db.String(50), unique=True)
    institution = user_db.Column(user_db.String(50))
    username = user_db.Column(user_db.String(50), unique=True)
    password_hash = user_db.Column(user_db.String(128))  # store the hashed password

    def __repr__(self):
        return f'<LoginCredential id={self.id} username={self.username}>'

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def set_password(self, password):
        # Hash the password using SHA-256
        self.password_hash = hashlib.sha256(password.encode()).hexdigest()

    def check_password(self, password):
        # Hash the password using SHA-256 and compare it to the stored hash
        return self.password_hash == hashlib.sha256(password.encode()).hexdigest()


class LoginCredentialSchema(ma.Schema):
    class Meta:
        model = LoginCredential
        fields = ('id', 'first_name', 'last_name', 'birthdate', 'gender', 'phone_number',
                  'email', 'institution', 'username', 'password')


login_credential_schema = LoginCredentialSchema()
login_credentials_schema = LoginCredentialSchema(many=True)


# Add New User to 'login_credentials' table
@app.route('/login-credential', methods=['POST'])
def add_login_credential():
    first_name = request.json['first_name']
    last_name = request.json['last_name']
    birthdate_str = request.json['birthdate']
    birthdate = datetime.strptime(birthdate_str, '%Y-%m-%d')
    gender = request.json['gender']
    phone_number = request.json['phone_number']
    email = request.json['email']
    institution = request.json['institution']
    username = request.json['username']
    password = request.json['password']

    new_login_credential = LoginCredential(first_name=first_name, last_name=last_name, birthdate=birthdate,
                                           gender=gender, phone_number=phone_number, email=email,
                                           institution=institution, username=username)

    # Hash the password using set_password method
    new_login_credential.set_password(password)

    user_db.session.add(new_login_credential)
    try:
        print('Attempt to commit')
        user_db.session.commit()
    except Exception as e:
        print('Exception caught:', e)
        user_db.session.rollback()
        return jsonify({'message': 'Username/Email/Phone Number already exists \n or session id already exists '
                                   'meaning you already signed up'}), 400

    return login_credential_schema.jsonify(new_login_credential)


# Show All Credentials
@app.route('/login-credential', methods=['GET'])
def get_all_login_credentials():
    all_login_credentials = LoginCredential.query.all()
    result = login_credentials_schema.dump(all_login_credentials)
    return jsonify(result)


# Add New User to 'user' table
@app.route('/user', methods=['POST'])
def add_user():
    name = request.json['name']
    contact = request.json['contact']
    new_user = User(name=name, contact=contact)
    user_db.session.add(new_user)
    try:
        print('Attempt to commit')
        user_db.session.commit()
    except Exception as e:
        print('Exception caught:', e)
        user_db.session.rollback()
        return jsonify({'message': 'Contact already exists'}), 400
    return user_schema.jsonify(new_user)


# Show All User
@app.route('/user', methods=['GET'])
def getAllUser():
    all_users = User.query.all()
    result = users_schema.dump(all_users)
    return jsonify(result)


# Show User By ID
@app.route('/user/<id>', methods=['GET'])
def getUserByid(id):
    user = User.query.get(id)
    name = request.json['name']
    contact = request.json['contact']
    return user_schema.jsonify(user)


# Update User By ID
@app.route('/user/<id>', methods=['PUT'])
def UpdateUser(id):
    user = User.query.get(id)
    name = request.json['name']
    contact = request.json['contact']
    user.name = name
    user.contact = contact
    user_db.session.commit()
    return user_schema.jsonify(user)


# Delete User By ID
@app.route('/user/<id>', methods=['DELETE'])
def DeleteUserByID(id):
    user = User.query.get(id)
    if user:
        user_db.session.delete(user)
        user_db.session.commit()
        return user_schema.jsonify(user)
    else:
        return jsonify({'message': 'User not found'}), 404


# Login Route
@app.route('/login', methods=['POST'])
def login():
    # Get the user's credentials from the request
    username = request.json.get('username')
    password = request.json.get('password')

    # Query the database to check if user exists
    credential = LoginCredential.query.filter_by(username=username).first()

    if not credential:
        # User doesn't exist
        return jsonify({'error': 'Invalid username or password'}), 401
    elif not credential.check_password(password):
        # Password is incorrect
        return jsonify({'error': 'Invalid username or password'}), 401
    else:
        # Login successful
        return jsonify({'message': 'Login successful'}), 200


@app.route('/login', methods=['GET'])
def getLogin():
    all_sessions = LoginCredential.query.all()
    result = login_credentials_schema.dump(all_sessions)
    return jsonify(result)


if __name__ == '__main__':
    with app.app_context():
        user_db.create_all()
    app.run(debug=True, port=5000)
