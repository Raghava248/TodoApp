from flask import Flask, request, json, jsonify
from flask_migrate import Migrate
from flask_restful import Api
from reigster import Register
from db import db

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://postgres:1234@localhost/productivity_app"
# db = SQLAlchemy(app)
migrate = Migrate(app, db)

api = Api(app)
api.add_resource(Register, '/register')
db.init_app(app)

if __name__ == "__main__":
     app.run()
# class User(db.Model):
#     __tablename__ = 'users'
#
#     id = db.Column(db.Integer, primary_key=True)
#     username = db.Column(db.String())
#     lastname = db.Column(db.String())
#     firstname = db.Column(db.String())
#     password = db.Column(db.String())
#     email = db.Column(db.String())
#
#     def __init__(self, username, firstname, lastname, email, password):
#         self.username = username
#
#         self.firstname = firstname
#         self.lastname = lastname
#         self.email = email
#         self.password = password
#
#     def __repr__(self):
#         return '<id {}>'.format(self.username)
#
#     def serialize(self):
#         return {
#             'id': self.id,
#             'username': self.username,
#             'first_name': self.firstname,
#             'last_name': self.lastname,
#             'email': self.email,
#             'password': self.password,
#
#         }



# @app.route('/register', methods=['GET','POST'])
# def registration():
#
#     if request.method == 'GET':
#         request.get_json(force=True)
#         if request.is_json:
#             users = User.query.all()
#             user_list = []
#             for i in range(0,len(users)):
#                 user_list.append(users[i].serialize())
#             return {"status": "success","data":str(user_list)}, 200
#
#     elif request.method == 'POST':
#         data = request.get_json()
#
#         user = User.query.filter_by(username=data['username']).first()
#         if  user :
#             return {'message': 'Username not avaliable'}, 400
#
#         user = User.query.filter_by(email=data['email']).first()
#         if user:
#             return {'message': 'Email already exists'}, 400
#
#         user = User(firstname = data['firstname'],
#                     lastname =  data['lastname'],
#                     email =     data['email'],
#                     password =  data['password'],
#                     username =  data['username'],)
#         db.session.add(user)
#         db.session.commit()
#
#         result = User.serialize(user)
#
#         return {"status": 'success', 'data': result}, 201
