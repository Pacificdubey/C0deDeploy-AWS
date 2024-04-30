#!/bin/bash

# Get the process ID (PID) of the running application
APP_PID=$(ps aux | grep 'app.py' | grep -v grep | awk '{print $2}')

if [ -z "$APP_PID" ]; then
  echo "Application process not found"
  exit 1 
fi

# Attempt graceful termination with SIGTERM
kill -15 $APP_PID

# Wait for the process to stop (adjust timeout as needed)
sleep 5 

# Check if the process is still running
if kill -0 $APP_PID 2>/dev/null; then
  echo "Application did not stop gracefully, sending SIGKILL"
  kill -9 $APP_PID
fi

