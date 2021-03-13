from flask import Flask, request
from flask_restful import Resource, Api
app = Flask(__name__)
api = Api(app)

class HelloWorld(Resource):
    def get(self):
        return {'hello': 'world'}


class HelloAnybody(Resource):
    def get(self):
        name = request.args.get('name')
        return {'hello': name}

api.add_resource(HelloWorld, '/')
api.add_resource(HelloAnybody, '/anybody')
