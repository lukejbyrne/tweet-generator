# Tweet Generator

This web application generates engaging tweets based on user-provided text and tone preferences. It uses the Hugging Face API and a local LLM (Large Language Model) for generating tweets.

## Installation

To set up the project, follow these steps:

1. Install Python 3.7 or higher.
2. Create a virtual environment (optional, but recommended):
   ```
   python3 -m venv venv
   source venv/bin/activate
   ```
3. Install the required dependencies:
   ```
   pip install -r requirements.txt
   ```

## Usage

1. Set up the local LLM model and API server:
   - For the Hugging Face API, you don't need to do anything as it's already included in the code.
   - For the local LLM model, follow the instructions in the `local_llm_version/setup_ollama_model.sh` script. Make sure you have the `ollama` CLI installed (`pip install ollama-cli`).

2. Set the following environment variables:
   - `HUGGING_FACE_API_KEY`: Your Hugging Face API key.
   - `OLLAMA_API_URL` (optional): The URL of your local LLM API server (default is `http://localhost:11434/api/generate`).

3. Run the application:
   ```
   python3 app.py
   ```

4. Open your browser and navigate to `http://localhost:8000`.

## Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

## Acknowledgments

- The Hugging Face API for generating tweets.
- The Ollama LLM for generating tweets locally.

## Badges

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

This README provides a brief overview of the Tweet Generator project. It includes installation instructions, usage details, and information about contributing, licensing, and acknowledgments. The project uses the Hugging Face API and a local LLM for generating tweets, and it's designed to be easy to set up and use for both hobby developers and professionals.