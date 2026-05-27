#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Please provide a project name"
  exit 1
fi

BASE_DIR=~/AI-Factory/projects
TEMPLATE_DIR=~/AI-Factory/templates/react-vite-template
LOG_DIR=~/AI-Factory/logs

PROJECT_PATH=$BASE_DIR/$PROJECT_NAME

echo "Creating project..."

mkdir -p $BASE_DIR
cp -R $TEMPLATE_DIR $PROJECT_PATH

cd $PROJECT_PATH

rm -rf node_modules
rm -f package-lock.json

npm install

git init
git branch -M main

PORT=5173

while lsof -i :$PORT >/dev/null 2>&1; do
  PORT=$((PORT+1))
done

echo "Using port: $PORT"

nohup npm run dev -- --host 0.0.0.0 --port $PORT \
> $LOG_DIR/$PROJECT_NAME.log 2>&1 &

sleep 5

echo ""
echo "Project created successfully!"
echo "Location: $PROJECT_PATH"
echo "Running on: http://localhost:$PORT"
echo "Log file: $LOG_DIR/$PROJECT_NAME.log"
