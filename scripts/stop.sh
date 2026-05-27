#!/bin/bash

echo "Stopping AI Factory..."

pkill -f vite
pkill -f node

sleep 2

echo ""
echo "Remaining ports:"

lsof -i :5173
lsof -i :5174
lsof -i :5175
lsof -i :5176
lsof -i :5177

echo ""
echo "AI Factory stopped."
