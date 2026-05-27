#!/bin/bash

echo "========== AI Factory Status =========="
echo ""

echo "Running Node Processes:"
ps aux | grep node | grep -v grep

echo ""
echo "======================================="
echo ""

echo "Ports in Use (5173-5180):"

for port in {5173..5180}
do
  lsof -i :$port
done

echo ""
echo "======================================="
echo ""

echo "Projects:"
ls ~/AI-Factory/projects
