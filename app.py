from flask import Flask, request, jsonify, render_template
from huggingface_hub import InferenceClient
import os

app = Flask(__name__)
HUGGING_FACE_API_KEY=os.getenv("HUGGING_FACE_API_KEY")
client = InferenceClient(api_key=HUGGING_FACE_API_KEY)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/generate', methods=['POST'])
def generate_tweet():
    try:
        data = request.get_json()
        text = data.get('text', '')
        tone = data.get('tone', 'professional')

        messages = [{ 
            "role": "user",
            "content": f"Generate a {tone} tweet about: {text}"
        }]

        completion = client.chat.completions.create(
            model="google/gemma-1.1-2b-it",
            messages=messages,
            max_tokens=280
        )

        return jsonify({"generated_text": completion.choices[0].message.content})

    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    port = int(os.getenv("PORT", 8000))  # Default to 8000 if PORT is not set
    # app.run(host="0.0.0.0", port=port, debug=True)
    app.run(host="0.0.0.0") # Let Gunicorn handle the port
