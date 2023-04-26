from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

app = Flask(__name__)

basedir = os.path.abspath(os.path.dirname(__file__))
# print(basedir)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, '../database/db.sqlite')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
ma = Marshmallow(app)


# User Tabel Model
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    contact = db.Column(db.String(100), unique=True)

    def __init__(self, name, contact):
        self.name = name
        self.contact = contact


class UserSchema(ma.Schema):
    class Meta:
        fields = ('id', 'name', 'contact')


user_schema = UserSchema()
users_schema = UserSchema(many=True)


# Add New User
@app.route('/user', methods=['POST'])
def add_user():
    name = request.json['name']
    contact = request.json['contact']
    new_user = User(name=name, contact=contact)
    db.session.add(new_user)
    try:
        print('Attempt to commit')
        db.session.commit()
    except Exception as e:
        print('Exception caught:', e)
        db.session.rollback()
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
    db.session.commit()
    return user_schema.jsonify(user)


# Delete User By ID
@app.route('/user/<id>', methods=['DELETE'])
def DeleteUserByID(id):
    user = User.query.get(id)
    if user:
        db.session.delete(user)
        db.session.commit()
        return user_schema.jsonify(user)
    else:
        return jsonify({'message': 'User not found'}), 404


if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True, port=5000)

"""
@app.route('/', methods=['GET'])
def home():
    return jsonify({'name': 'Andrew', 'msg': 'Welcome'})
"""
