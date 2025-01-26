#!/bin/bash

# Model name to use
MODEL_NAME="deepseek-r1:1.5b"

# Ollama API server port
SERVER_PORT=11434

# Function to check if a model is already pulled
check_model() {
  echo "Checking if model '$MODEL_NAME' is available..."
  ollama list | grep -q "$MODEL_NAME"
  if [ $? -ne 0 ]; then
    echo "Model '$MODEL_NAME' not found. Pulling the model..."
    ollama pull "$MODEL_NAME"
  else
    echo "Model '$MODEL_NAME' is already downloaded."
  fi
}

# Function to start the Ollama API server
start_server() {
  echo "Starting Ollama API server..."
  # Check if the server is already running
  if lsof -i:"$SERVER_PORT" >/dev/null 2>&1; then
    echo "Ollama server is already running on port $SERVER_PORT."
  else
    ollama serve &
    sleep 2  # Give the server time to start
    echo "Ollama server started on http://localhost:$SERVER_PORT"
  fi
}

# Main script execution
echo "Setting up Ollama model and API server..."
check_model
start_server

echo "Setup complete. You can query the model via the API:"
echo "Example CURL command:"
echo "curl -X POST http://localhost:$SERVER_PORT/api/chat -H 'Content-Type: application/json' -d '{\"model\": \"$MODEL_NAME\", \"prompt\": \"Hello!\"}'"

