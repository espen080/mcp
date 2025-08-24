#!/bin/bash

# default to using qwen3:8b
MODEL="${1:-qwen3:8b}"
SERVER_URL=http://localhost:8000/mcp
HOST_URL=http://localhost:11434

# activate virtual environment
source ./venv/bin/activate

# make sure ollcmp is installed
pip install -r requirements.txt

# run client
ollmcp --mcp-server-url $SERVER_URL --host $HOST_URL --model $MODEL
