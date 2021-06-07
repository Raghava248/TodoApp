from flask_restful import Resource
from flask import request
from userModel import User
from db import db
import random
import string


class Register(Resource):

    def get(self):
        request.get_json(force=True)
        if request.is_json:
            users = User.query.all()
            user_list = []
            for i in range(0, len(users)):
                user_list.append(users[i].serialize())
            return {"status": "success", "data": str(user_list)}, 200

    def post(self):
        data = request.get_json()
        user = User.query.filter_by(username=data['username']).first()
        if user:
            return {'message': 'Username not avaliable'}, 400
        user = User.query.filter_by(email=data['email']).first()
        if user:
            return {'message': 'Email already exists'}, 400
        api_key = self.generate_key()
        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'API key already exists'}, 400

        user = User(
            api_key=api_key,
            firstname=data['firstname'],
            lastname=data['lastname'],
            email=data['email'],
            password=data['password'],
            username=data['username'], )
        db.session.add(user)
        db.session.commit()

        result = User.serialize(user)

        return {"status": 'success', 'data': result}, 201

    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))
