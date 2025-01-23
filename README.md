# Tweet Generator v2

A web application that generates engaging tweets based on user-provided ideas and tone preferences.

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [License](#license)

## Requirements

- Python 3.6 or higher
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

- Create a `.env` file in the project root directory and add the following content:

```
HUGGING_FACE_API_KEY=your_hugging_face_api_key
PORT=5000  # Optional, default is 5000
```

Replace `your_hugging_face_api_key` with your actual Hugging Face API key.

5. Run the application:

```bash
python app.py
```

The application will start running on `http://localhost:5000` (or the specified port).

## Usage

Open your web browser and navigate to `http://localhost:5000`. You will see a simple interface where you can enter a topic or idea, select a tone preference, and generate a tweet.

The generated tweet will be displayed below the input fields. You can also copy the tweet to your clipboard by clicking the "Copy to Clipboard" button.

## API Reference

The application provides a RESTful API for generating tweets. You can use the following endpoints:

- `POST /generate`: Generate a tweet based on the provided text and tone preference.

  Request body:
  ```json
  {
    "text": "Your topic or idea",
    "tone": "professional"  // Optional, can be "professional", "casual", or "funny"
  }
  ```

  Response:
  ```json
  {
    "generated_text": "Generated tweet text"
  }
  ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.