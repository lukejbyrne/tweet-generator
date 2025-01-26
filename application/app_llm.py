from flask import Flask, request, jsonify, render_template
import os
import requests

app = Flask(__name__)

# Local Ollama API endpoint
OLLAMA_API_URL = os.getenv("OLLAMA_API_URL", "http://localhost:11434/api/generate")

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/generate', methods=['POST'])
def generate_tweet():
    try:
        # Get request data
        data = request.get_json()
        text = data.get('text', '')
        tone = data.get('tone', 'professional')

        # Construct prompt for the local LLM
        prompt = f"As a copywriter, generate a {tone} tweet about: {text}. Do not respond with your thinking, only the resulting tweet. Your response has a hard limit of 280 chars."

        # Make a request to the Ollama API
        payload = {
            "model": "tinyllama",
            "prompt": prompt,
            "stream": False  # Set to False to get full response at once
        }

        response = requests.post(OLLAMA_API_URL, json=payload)
        
        print(f"HERE\n{response.json()}")

        # Check for successful response
        if response.status_code == 200:
            generated_text = response.json().get("response", "")
            return jsonify({"generated_text": generated_text})
        else:
            return jsonify({"error": f"Error from Ollama API: {response.text}"}), response.status_code

    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    port = int(os.getenv("PORT", 5001))
    app.run(host="0.0.0.0", port=port, debug=True)