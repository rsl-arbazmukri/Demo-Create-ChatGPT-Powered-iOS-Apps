# Demo-Create-ChatGPT-Powered-iOS-Apps

### Working demo
![image3](https://github.com/RajaSoftwareLabs/Demo-Create-ChatGPT-Powered-iOS-Apps/assets/136612143/8dfac624-ae0a-4636-b71d-4b70a7783b28)


### Mobile - Server Communication Architecture

We could directly consume the OpenAI API in our apps, but that may not be an ideal design decision for following reasons:
- Mobile does not have advanced library support like LangChain (Python) for complex use cases in LLMs.
- We should not save the OpenAI API key directly in the mobile apps due to security issues, limits, token cost issues. We want to control the usage at server level for multiple users.
- We would want a way to remember chat histories, save context if there is a business need.
- We would want to use our own custom data if we like.
- We would like the option to switch to different LLMs at choice.

We will use below architecture to handle those challenges:

<img width="400" height="400" alt="Demo_Architecture" src="https://github.com/RajaSoftwareLabs/Demo-Create-ChatGPT-Powered-iOS-Apps/assets/136612143/f50ec6c6-a3c4-4548-beca-0f472831fc04">

#### Overview of Design
- We will create a bridge between OpenAI API and a mobile app through our own server.
- Core part of our server is the /chat endpoint, which will be consumed by the iOS mobile app. 
- The /chat endpoint will call the OpenAI APIs when the mobile app makes a request (through libraries we will use).
- Importantly, our server's versatility extends beyond iOS — it can power Android, Web, and more. While our focus is on the iOS app, the server's impact reaches across platforms, ensuring consistency.

This simple design makes our solution flexible to add more functionality later on (saving chats, history, maintaining context across sessions, custom data, etc.).

### Create API Key for OpenAPI
To authenticate to OpenAI through API or python library, you would need to get your OpenAI API key:
- Log into https://platform.openai.com/
- In the top-right corner go to "View API keys" 
- Generate your API key. Free trial users get $5 worth of credit which expires after 3 months, so use it wisely. For step by step guidance refer https://www.howtogeek.com/885918/how-to-get-an-openai-api-key/.
- Add the API key in `.env` file under `Server`folder - `OPENAI_API_KEY=YOUR_API_KEY`

### Running the demo
- Install necessary libraries 
	- `$ pip install openai`
	- `$ pip install langchain`
	- `$ pip install python-dotenv`
- Get the local server running. Run `$ python server.py` in your terminal.
- Run the iOS app from the Xcode and start chatting with it.

This code/software is NOT licensed and is not open for use/change/distribution. Please open an issue / pull-request if you require the same.
