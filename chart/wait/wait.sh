#!/bin/bash

set -x

cat >clustersecretstore.yaml <<EOF
apiVersion: external-secrets.io/v1beta1
kind: SecretStore
metadata:
  name: external-secrets-wait-job-store
  namespace: external-secrets
spec:
  provider:
    kubernetes:
      auth:
        serviceAccount:
          name: external-secrets-wait-job-sa
      remoteNamespace: external-secrets
      server:
        caProvider:
          key: ca.crt
          name: kube-root-ca.crt
          type: ConfigMap
        url: kubernetes.default
EOF

kubectl apply -f clustersecretstore.yaml
if [[ $? -eq 0 ]]; then
  kubectl delete secretstore -n external-secrets external-secrets-wait-job-store
  exit $?
fi
exit 1