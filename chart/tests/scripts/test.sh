#!/bin/bash
set -ex

namespace=${EXTERNAL_SECRETS_NAMESPACE:-external-secrets}
label_selector="app.kubernetes.io/name=external-secrets"

echo "[INFO] Locating ESO pod..."
pod=$(kubectl get pods -n "$namespace" -l "$label_selector" -o jsonpath="{.items[0].metadata.name}")

sleep 1

if [ -z "$pod" ]; then
  echo "[ERROR] No ESO pod found in namespace $namespace"
  exit 1
fi

echo "[INFO] Checking ESO pod status: $pod"
status=$(kubectl get pod -n "$namespace" "$pod" -o jsonpath="{.status.phase}")

if [ "$status" != "Running" ]; then
  echo "[ERROR] ESO pod is not running, current status: $status"
  exit 1
fi

echo "[INFO] Checking ESO synced secret 'testsecret-target'..."
kubectl get secret -n "$namespace" testsecret-target -o jsonpath="{.data.secretkey}" | grep -q .

if [ $? -ne 0 ]; then
  echo "[ERROR] ESO secret testsecret-target is missing"
  exit 1
fi

echo "[SUCCESS] ESO server is running and secret is synced"   
exit 0  


               