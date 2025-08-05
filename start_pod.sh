#!/usr/bin/env bash
set -euo pipefail

POD_NAME="hsqc-atong"
YAML_PATH="$HOME/Documents/UCSD/Projects/GURU/GURU-Research/pods/hsqc.yaml"
WAIT_TIMEOUT=60s

echo "Deleting pod ${POD_NAME} (if it exists)…"
kubectl delete pod "${POD_NAME}" --ignore-not-found
echo "Waiting up to ${WAIT_TIMEOUT} for deletion…"
kubectl wait --for=delete pod/"${POD_NAME}" --timeout=${WAIT_TIMEOUT} || true

echo "Re-creating pod from ${YAML_PATH}…"
kubectl create -f "${YAML_PATH}"
echo "Done."
