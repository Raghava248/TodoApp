from db import db


class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String())
    lastname = db.Column(db.String())
    firstname = db.Column(db.String())
    password = db.Column(db.String())
    email = db.Column(db.String())
    api_key = db.Column(db.String())

    def __init__(self, username, firstname, lastname, email, password, api_key):
        self.username = username
        self.api_key = api_key
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password

    def __repr__(self):
        return '<id {}>'.format(self.username)

    def serialize(self):
        return {
            'api_key': self.api_key,
            'id': self.id,
            'username': self.username,
            'first_name': self.firstname,
            'last_name': self.lastname,
            'email': self.email,
            'password': self.password,

        }
