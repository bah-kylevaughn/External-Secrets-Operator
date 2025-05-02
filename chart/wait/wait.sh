#!/bin/bash

set -x
namespace=${EXTERNAL_SECRETS_NAMESPACE:-'external-secrets'}

cat >clustersecretstore.yaml <<EOF
apiVersion: external-secrets.io/v1
kind: SecretStore
metadata:
  name: external-secrets-wait-job-store
  namespace: $namespace
spec:
  provider:
    kubernetes:
      auth:
        serviceAccount:
          name: external-secrets-wait-job-sa
      remoteNamespace: $namespace
      server:
        caProvider:
          key: ca.crt
          name: kube-root-ca.crt
          type: ConfigMap
        url: kubernetes.default
EOF

kubectl apply -f clustersecretstore.yaml
if [[ $? -eq 0 ]]; then
  kubectl delete secretstore -n $namespace external-secrets-wait-job-store
  exit $?
fi
exit 1