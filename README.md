# Tweet Generator

A web application that generates engaging tweets based on user input and tone preferences.

Made by Luke Byrne on codecmd.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [License](#license)

## Requirements

- Python 3.x
- Flask
- Hugging Face Hub

## Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/tweet-generator.git
cd tweet-generator
```

2. Create a virtual environment (optional but recommended):

```bash
python -m venv venv
source venv/bin/activate  # On Windows, use `venv\Scripts\activate`
```

3. Install the required packages:

```bash
pip install -r requirements.txt
```

4. Set up environment variables:

- Create a `.env` file in the project root directory.
- Add your Hugging Face API key to the `.env` file:

```
HUGGING_FACE_API_KEY=your_hugging_face_api_key
```

## Usage

1. Run the Flask application:

```bash
python app.py
```

2. Open your browser and navigate to `http://localhost:5000`.

3. Enter your topic or idea in the input field.

4. Select a tone preference (Professional, Casual, or Funny).

5. Click on the corresponding button to generate a tweet.

6. Copy the generated tweet to the clipboard by clicking on the "Copy to Clipboard" button.

## API Reference

### POST /generate

Generates a tweet based on the provided text and tone preference.

#### Request Body

```json
{
  "text": "Your topic or idea",
  "tone": "professional"  // Optional: "professional", "casual", or "funny" (default: "professional")
}
```

#### Response

```json
{
  "generated_text": "Generated tweet text"
}
```

#### Error Response

```json
{
  "error": "Error message"
}
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.