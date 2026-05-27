#!/bin/bash

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: factory <project-name>"
  exit 1
fi

BASE_DIR="$HOME/AI-Factory/projects"
TEMPLATE_DIR="$HOME/AI-Factory/templates/react-vite-template"
PROJECT_DIR="$BASE_DIR/$PROJECT_NAME"

if [ -d "$PROJECT_DIR" ]; then
  echo "Project already exists."
  exit 1
fi

echo "================================="
echo "Creating AI Factory project..."
echo "================================="

# 创建项目目录
cp -R "$TEMPLATE_DIR" "$PROJECT_DIR"

cd "$PROJECT_DIR" || exit 1

# 清理模板缓存
rm -rf node_modules
rm -rf dist
rm -rf .git
rm -rf package-lock.json

# 安装依赖
echo ""
echo "Installing dependencies..."
npm install

# 自动寻找空闲端口
PORT=$(comm -23 <(seq 5173 5200 | sort) <(lsof -i -P -n | grep LISTEN | awk '{print $9}' | sed 's/.*://g' | sort -u) | head -n 1)

echo ""
echo "Using port: $PORT"

# 创建 Dockerfile
cat > Dockerfile <<EOF
FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
EOF

# 创建 docker-compose.yml
cat > docker-compose.yml <<EOF
services:
  $PROJECT_NAME:
    build: .

    container_name: $PROJECT_NAME

    ports:
      - "$PORT:5173"

    volumes:
      - .:/app
      - /app/node_modules

    restart: unless-stopped
EOF

# 自动启动 Docker
echo ""
echo "Starting Docker container..."

docker compose up -d

echo ""
echo "================================="
echo "AI Factory Project Ready"
echo "================================="
echo "Project : $PROJECT_NAME"
echo "Port    : $PORT"
echo "URL     : http://localhost:$PORT"
echo "================================="
