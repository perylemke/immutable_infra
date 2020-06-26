from flask import Flask, request
from flask_restplus import Resource, Api
import socket
import os.path

app = Flask(__name__)
api = Api(app)


@api.route('/request')
class Main(Resource):
    def get(self):
        host = socket.gethostname()
        return {'response': "Fiquem em casa!"}

@api.route('/status')
class Healthcheck(Resource):
    def get(self):
        msg = {'status': 'Ok!'}
        return msg

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
