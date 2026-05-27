#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage:"
  echo "./start.sh project-name"
  exit 1
fi

PROJECT_PATH="$HOME/AI-Factory/projects/$PROJECT_NAME"

if [ ! -d "$PROJECT_PATH" ]; then
  echo "Project not found:"
  echo "$PROJECT_PATH"
  exit 1
fi

PORT=5173

while lsof -i :$PORT >/dev/null 2>&1
do
  PORT=$((PORT+1))
done

echo "Starting project: $PROJECT_NAME"
echo "Using port: $PORT"

cd "$PROJECT_PATH"

nohup npm run dev -- --host 0.0.0.0 --port $PORT > "$HOME/AI-Factory/logs/$PROJECT_NAME.log" 2>&1 &

sleep 3

echo ""
echo "Project started."
echo "URL: http://localhost:$PORT"
echo ""

lsof -i :$PORT

echo ""
echo "Log file:"
echo "$HOME/AI-Factory/logs/$PROJECT_NAME.log"
