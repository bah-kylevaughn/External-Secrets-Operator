# Deploying External Secrets Operator

The External Secrets Operator may be deployed like any other bigbang package. Use this YAML as an example:

```
packages:
  external-secrets:
    enabled: true
    git:
      repo: https://repo1.dso.mil/big-bang/apps/sandbox/external-secrets.git
      path: chart
```

... and you can deploy it normally, as part of the bigbang umbrella chart:

```
bbctl deploy bigbang -- -f externalsecrets.yaml
```

... or manually with helm (assuming an appropriately configured environment with a namespace, registry secrets, etc):

```
helm upgrade -i --wait external-secrets chart/ -n external-secrets
```
