# Deploying External Secrets Operator

The External Secrets Operator may be deployed like any other bigbang package. Use this YAML as an example:

```
addons:
  externalSecrets:
    enabled: true
    git:
      repo: https://repo1.dso.mil/big-bang/product/packages/external-secrets.git
      path: chart
    values:
      bbtests:
        enabled: true
```

... and you can deploy it normally, as part of the bigbang umbrella chart:

```
bbctl deploy bigbang -- -f externalsecrets.yaml
```

... or manually with helm (assuming an appropriately configured environment with a namespace, registry secrets, etc):

```
helm upgrade -i --wait external-secrets chart/ -n external-secrets
```

# Helm tests

If you want to run helm tests against your deployment, you will need to deploy with bbtests enabled:

```
addons:
  externalSecrets:
    values:
      bbtests:
        enabled: true
```

This will create a skeleton secret store that is sufficient to prove that ESO is working. Then you can execute the helm tests:

```
$ helm test external-secrets -n external-secrets
```