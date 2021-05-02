# import stuff
from flask import Flask, request, jsonify
import threading
import time
import os 
import sys

# configure banner at startup  
cli = sys.modules['flask.cli']
user = os.environ['MYVAR']
log = open('./secret.txt', "r")

cli.show_server_banner = lambda *x: print(user, log.read())
app = Flask(__name__)



# GET method to /
@app.route('/', methods=['GET'])
def index():
    if request.method == 'GET':
        return 'Hello World'
    else:
        'Nothing Found', 404

# POST method for /<something>
@app.route('/<name>', methods=['POST'])
def print_name(name):
    if request.method == 'POST':
        return 'hello {}'.format(name)
    else:
        'Nothing Found', 404

# how to run the app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port='5000')