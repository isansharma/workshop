#!/usr/bin/env bash

set -u

echo "======================================"
echo " DevOps Workshop Environment"
echo "======================================"

echo
echo "---- OS ----"
cat /etc/os-release | grep -E '^(NAME|VERSION)='

echo
echo "---- CPU ----"
lscpu | grep -E 'Model name|CPU\(s\)' | head -2

echo
echo "---- MEMORY ----"
free -h

echo
echo "---- DISK ----"
df -h /

echo
echo "---- GPU ----"
nvidia-smi --query-gpu=name,memory.total,driver_version --format=csv,noheader

echo
echo "---- Docker ----"
docker --version

echo
echo "---- Docker Compose ----"
docker compose version

echo
echo "---- Kubernetes ----"
kubectl version --client

echo
echo "---- kind ----"
kind version

echo
echo "---- Terraform ----"
terraform version | head -1

echo
echo "---- Ansible ----"
ansible --version | head -1

echo
echo "---- Git ----"
git --version

echo
echo "---- Python ----"
python3 --version

echo
echo "---- Ollama ----"
ollama --version

echo
echo "---- Kubernetes Context ----"
kubectl config current-context 2>/dev/null || true

echo
echo "---- kind Clusters ----"
kind get clusters

echo
echo "======================================"
echo " Inventory complete"
echo "======================================"
