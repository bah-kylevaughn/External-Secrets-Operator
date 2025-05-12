#!/bin/bash
set -euo pipefail

namespace=${EXTERNAL_SECRETS_NAMESPACE:-external-secrets}
label_selector="app.kubernetes.io/name=external-secrets"

echo "[INFO] Locating external-secrets in namespace: $namespace..."
pod=$(kubectl get pods -n "$namespace" -l "$label_selector" -o jsonpath="{.items[0].metadata.name}" || true)


if [[ -z "$pod" ]]; then
  echo "[ERROR] No external-secrets found in namespace $namespace"
  exit 1
fi

echo "[INFO] External-secrets found: $pod. Status..."
status=$(kubectl get pod -n "$namespace" "$pod" -o jsonpath="{.status.phase}" || true)

if [[ "$status" != "Running" ]]; then
  echo "[ERROR] External-secrets not found. Current status: $status"
  exit 1
fi

# Wait for external-secrets sync
secret_name="testsecret-target"
max_retries=6
retry_interval=5
echo "[INFO] Waiting for secret sync: '$secret_name' (max wait: $((max_retries * retry_interval))s)..."

for attempt in $(seq 1 $max_retries); do
  if kubectl get secret -n "$namespace" "$secret_name" &>/dev/null; then
    kubectl get secret -n "$namespace" "$secret_name" -o jsonpath="{.data.secretkey}" | grep -q . && {
      echo "[SUCCESS] External-secrets is running and secret '$secret_name' is synced."
      kubectl get secret -n "$namespace" "$secret_name" -o jsonpath="{.data.secretkey}" | base64 --decode || {
        echo "[ERROR] Failed to decode 'secretkey' in secret '$secret_name'"
        exit 1
      }
      exit 0
    }
    echo "[ERROR] Secret 'secretkey' not found."
    exit 1
  fi
  sleep "$retry_interval"
done
    
echo "[ERROR] Secret '$secret_name' not found.
exit 1