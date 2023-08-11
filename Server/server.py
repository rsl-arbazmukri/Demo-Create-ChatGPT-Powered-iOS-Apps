from flask import Flask, request
from chat import chat_message_received

app = Flask(__name__)

@app.route('/test', methods=['GET'])
def test():
    return "Server running at: http://localhost:5000/"

@app.route('/chat', methods=['POST'])
def chat():
    return chat_message_received(request)

if __name__ == '__main__':
    app.run()