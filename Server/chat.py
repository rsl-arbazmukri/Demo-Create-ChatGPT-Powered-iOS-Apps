import os
from dotenv import load_dotenv
from langchain.chat_models import ChatOpenAI
from langchain.schema import (
    AIMessage,
    HumanMessage,
    SystemMessage
)
from flask import Request

load_dotenv()

chat = ChatOpenAI(
    model='gpt-3.5-turbo',
    temperature=1.5,
    openai_api_key=os.getenv('OPENAI_API_KEY')
)

def chat_message_received(request: Request):
    data = request.get_json()
    messages = process_chat_messages(data)
    ai_message = chat(messages)
    content = ai_message.content
    return content

def process_chat_messages(data):
    messages = []

    for message in data:
        message_type, content = next(iter(message.items()))

        if message_type == 'HumanMessage':
            messages.append(HumanMessage(content=content))
        elif message_type == 'AIMessage':
            messages.append(AIMessage(content=content))

    last_10_messages = messages[-10:]
    return last_10_messages