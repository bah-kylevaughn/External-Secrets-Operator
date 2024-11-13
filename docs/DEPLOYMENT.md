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

# Deploy Standardized ESO ClusterSecretStore for AWS Secret Manager 

The complete data model/schema is located in the ESO package values.yaml file under secretConfiguration section.

This section is to demo what is required to deploy ClusterSecretStore and ExternalSecrets.  User needs to look at what is required and adjust to what is feasible in their own environment.

### Create a secret containing your AWS credentials
```
echo -n 'KEYID' > ./access-key
echo -n 'SECRETKEY' > ./secret-access-key
kubectl create secret generic awssm-secret --from-file=./access-key --from-file=./secret-access-key [-n namespace]
```

### Examples of the override file - required to provide AWS information 

There are three types of authentication methods: accesskey, serveraccount or identity.  Pick one of the methods and reference an example below.

##### Authentication method: accesskey example

Note: When using the accesskey method for authentication, the kubernetes secret that stores the access key pair (as create in the section Create a secret containing your AWS credentials) need to be present in the same name space as the target or the namespace specified in the secretConfiguration.secretList.

```
packages:
  external-secrets:
    enabled: true
    git:
      repo: https://repo1.dso.mil/big-bang/apps/sandbox/external-secrets.git
      tag: 0.10.2-bb.3 
    values:
      bbtests:
        enabled: true
      secretConfiguration:
        enabled: true
        secretList:
          - name: "team-a-store"
            namespace: ""
            labels: ""
            annotations: ""
            ## define types of authentication: ##
            source: 
              ## AWS secrets manager only - other services can be added later ##
              provider: aws 
              ## Specify type of service, i.e., SecretsManager (default) ##
              service: SecretsManager 
              ## Specify AWS region, i.e. us-gov-west-1 (default) ##
              region: "us-gov-west-1"
              ## Frequency to check for updates ##
              refreshInterval: "1m"
              auth:
                ## Specify authType is required: identity, accesskey or serviceaccount ##
                authType: "accesskey" 
                ## Optional: Role that defines fine-grained access control ##  
                role: "" 
                ## Name of the accessKeyID and secretAccessKey pair ##
                accessKeyName: "awssm-secret" 
                ## Specify AWS Access Key ID file ##
                accessKeyID: "access-key"
                ## Specify AWS Secret Access Key file ##
                secretAccessKey: "secret-access-key"                
```

##### Authentication method: serviceaccount example

Note: Be sure to provide namespace where the service account resides.

```
packages:
  external-secrets:
    enabled: true
    git:
      repo: https://repo1.dso.mil/big-bang/apps/sandbox/external-secrets.git
      tag: 0.10.2-bb.3 
    values:
      bbtests:
        enabled: true
      secretConfiguration:
        enabled: true
        secretList:
          - name: "team-b-store"
            namespace: default
            source: 
              provider: aws 
              service: SecretsManager
              region: "us-gov-west-1"
              refreshInterval: "1m"
              auth:
                authType: "serviceaccount" 
                ## Optional: Name of role that defines fine-grained access ##  
                role: ""  
                # Required: Specify the service account ##
                serviceAccount: "my-serviceaccount"                
```

##### Authentication method: identity example

```
packages:
  external-secrets:
    enabled: true
    git:
      repo: https://repo1.dso.mil/big-bang/apps/sandbox/external-secrets.git
      tag: 0.10.2-bb.3 
    values:
      bbtests:
        enabled: true
      secretConfiguration:
        enabled: true
        secretList:
          - name: "team-c-store"
            source: 
              provider: aws 
              service: SecretsManager 
              region: "us-gov-west-1"
              refreshInterval: "1m"
              auth:
                ## Specify authType is required: identity ##
                authType: "identity"   
                ## Optional: Name of role that defines fine-grained access ##  
                role: ""
```
For the identity example, please also see AWS_INTEGRATION.md and follow the steps in the Identity Authentication Method section to setup the IAM roles and trust relationships.