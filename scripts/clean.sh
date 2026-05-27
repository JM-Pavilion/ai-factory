#!/bin/bash

echo "Cleaning AI Factory..."

echo ""
echo "Stopping running services..."

pkill -f vite
pkill -f node

sleep 2

echo ""
echo "Removing logs..."

rm -rf ~/AI-Factory/logs/*.log

echo ""
echo "Cleaning npm cache..."

npm cache clean --force

echo ""
echo "Removing .DS_Store..."

find ~/AI-Factory -name ".DS_Store" -delete

echo ""
echo "AI Factory cleaned."
