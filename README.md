## Project Structure

- `requirements.txt`: Contains the list of required Python packages.
- `__init__.py`: Empty file to make the directory a Python package.
- `startup.sh`: Shell script to set up the virtual environment, install dependencies, and start the Flask application.
- `app.py`: Main Flask application file for generating tweets using the Hugging Face API.
- `local_llm_version/app_llm.py`: Flask application file for generating tweets using a local LLM.
- `local_llm_version/setup_ollama_model.sh`: Shell script to set up the Ollama model and API server.
- `templates/index.html`: HTML template for the web application.

## Usage

The web application provides a user-friendly interface where users can enter their topic or idea, select a tone, and generate a tweet. The generated tweet is displayed on the screen. Users can also copy the tweet to their clipboard.

## Installation and Running

1. Install the required dependencies by running:
   ```
   pip install -r requirements.txt
   ```

2. Set up the Hugging Face API key by creating an environment variable called `HUGGING_FACE_API_KEY` with your API key.

3. To use the local LLM version, follow these steps:
   - Install the Ollama model and API server by following the instructions in the `local_llm_version/setup_ollama_model.sh` script.
   - Set up an environment variable called `OLLAMA_API_URL` with the URL of the Ollama API server (e.g., `http://localhost:11434/api/generate`).

4. Start the Flask application by running:
   ```
   python3 app.py
   ```
   or
   ```
   gunicorn app:app
   ```
   (for the local LLM version, use `python3 local_llm_version/app_llm.py` or `gunicorn local_llm_version.app_llm:app`)

5. Open your web browser and navigate to `http://localhost:8000` (or the appropriate port if you changed it).

## Troubleshooting

If you encounter any issues, check the following:

- Ensure that you have the required dependencies installed.
- Verify that the Hugging Face API key is set correctly in the environment variable `HUGGING_FACE_API_KEY`.
- If using the local LLM version, make sure the Ollama model and API server are set up correctly.
- Check the Flask application logs for any error messages.

## Contributing

Contributions are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.

## Acknowledgments

This project uses the Hugging Face API and the Ollama model for generating tweets.

## Disclaimer

This project is for educational purposes only and should not be used for commercial purposes without proper licensing and permissions.