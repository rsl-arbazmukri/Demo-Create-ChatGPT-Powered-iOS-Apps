# Demo-Create-ChatGPT-Powered-iOS-Apps

### Mobile - Server Communication Architecture
<img width="400" height="400" alt="Demo_Architecture" src="https://github.com/rsl-arbazmukri/Demo-Create-ChatGPT-Powered-iOS-Apps/assets/136612143/73d95190-7759-4ba6-8800-ddf4a4f8cab2">


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
- Get local server running. Run `$ python server.py` in your terminal.
- Run the iOS app from the Xcode and start chatting with it.

This code/software is NOT licensed and is not open for use/change/distribution. Please open an issue / pull-request if you require the same.
