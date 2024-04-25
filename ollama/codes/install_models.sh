#!/bin/bash

# Define a log file
log_file="/var/logs/install_models.log"

# Function to log messages
log() {
    echo "$(date +"%Y-%m-%d %T") - $1" >> $log_file
    echo "$(date +"%Y-%m-%d %T") - $1"
}

log "Starting model installation."

# Initialize ollama service in the background
ollama serve &>> $log_file &
ollama_pid=$!
log "ollama service started with PID $ollama_pid"

# Pull model containers
log "Pulling model znbang/bge:large-zh-v1.5-f16"
ollama pull znbang/bge:large-zh-v1.5-f16 &>> $log_file
if [ $? -ne 0 ]; then
    log "Failed to pull model znbang/bge:large-zh-v1.5-f16."
    exit 1
fi

log "Pulling model all-minilm"
ollama pull all-minilm &>> $log_file
if [ $? -ne 0 ]; then
    log "Failed to pull model all-minilm."
    exit 1
fi

# Create model instance
log "Creating model instance 'taide'"
ollama create taide -f /ollama/models/taide.modelfile &>> $log_file
if [ $? -ne 0 ]; then
    log "Failed to create model instance 'taide'."
    exit 1
fi

log "Model installation completed successfully."

# Wait for the ollama service to exit
wait $ollama_pid
