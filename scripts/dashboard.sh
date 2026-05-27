#!/bin/bash

clear

echo "================================="
echo "        AI FACTORY DASHBOARD"
echo "================================="

echo ""
echo "Projects:"
echo "---------------------------------"

ls ~/AI-Factory/projects

echo ""
echo "Ports:"
echo "---------------------------------"

lsof -i :5173
lsof -i :5174
lsof -i :5175
lsof -i :5176
lsof -i :5177

echo ""
echo "Logs:"
echo "---------------------------------"

ls ~/AI-Factory/logs

echo ""
echo "Node Processes:"
echo "---------------------------------"

ps aux | grep node | grep -v grep
