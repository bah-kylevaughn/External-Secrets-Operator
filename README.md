<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# external-secrets

![Version: 0.10.2-bb.1](https://img.shields.io/badge/Version-0.10.2--bb.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.10.2](https://img.shields.io/badge/AppVersion-v0.10.2-informational?style=flat-square)

External secret management for Kubernetes

## Upstream References
* <https://github.com/external-secrets/external-secrets>

### Upstream Release Notes

This package has no upstream release note links on file. Please add some to [chart/Chart.yaml](chart/Chart.yaml) under `annotations.bigbang.dev/upstreamReleaseNotesMarkdown`.
Example:
```yaml
annotations:
  bigbang.dev/upstreamReleaseNotesMarkdown: |
    - [Find our upstream chart's CHANGELOG here](https://link-goes-here/CHANGELOG.md)
    - [and our upstream application release notes here](https://another-link-here/RELEASE_NOTES.md)
```

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Kubernetes: `>= 1.19.0-0`

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install external-secrets chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| openshift | bool | `false` |  |
| global.nodeSelector | object | `{}` |  |
| global.tolerations | list | `[]` |  |
| global.topologySpreadConstraints | list | `[]` |  |
| global.affinity | object | `{}` |  |
| global.compatibility.openshift.adaptSecurityContext | string | `"auto"` | Manages the securityContext properties to make them compatible with OpenShift. Possible values: auto - Apply configurations if it is detected that OpenShift is the target platform. force - Always apply configurations. disabled - No modification applied. |
| replicaCount | int | `1` |  |
| bitwarden-sdk-server.enabled | bool | `false` |  |
| revisionHistoryLimit | int | `10` | Specifies the amount of historic ReplicaSets k8s should keep (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#clean-up-policy) |
| image.repository | string | `"registry1.dso.mil/ironbank/opensource/external-secrets/external-secrets"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.tag | string | `"v0.10.2"` | The image tag to use. The default is the chart appVersion. |
| image.flavour | string | `""` | The flavour of tag you want to use There are different image flavours available, like distroless and ubi. Please see GitHub release notes for image tags for these flavors. By default, the distroless image is used. |
| installCRDs | bool | `false` | If set, install and upgrade CRDs through helm chart. |
| crds.createClusterExternalSecret | bool | `true` | If true, create CRDs for Cluster External Secret. |
| crds.createClusterSecretStore | bool | `true` | If true, create CRDs for Cluster Secret Store. |
| crds.createPushSecret | bool | `true` | If true, create CRDs for Push Secret. |
| crds.annotations | object | `{}` |  |
| crds.conversion.enabled | bool | `true` |  |
| imagePullSecrets[0].name | string | `"private-registry"` |  |
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| namespaceOverride | string | `""` |  |
| commonLabels | object | `{}` | Additional labels added to all helm chart resources. |
| leaderElect | bool | `false` | If true, external-secrets will perform leader election between instances to ensure no more than one instance of external-secrets operates at a time. |
| controllerClass | string | `""` | If set external secrets will filter matching Secret Stores with the appropriate controller values. |
| extendedMetricLabels | bool | `false` | If true external secrets will use recommended kubernetes annotations as prometheus metric labels. |
| scopedNamespace | string | `""` | If set external secrets are only reconciled in the provided namespace |
| scopedRBAC | bool | `false` | Must be used with scopedNamespace. If true, create scoped RBAC roles under the scoped namespace and implicitly disable cluster stores and cluster external secrets |
| processClusterExternalSecret | bool | `true` | if true, the operator will process cluster external secret. Else, it will ignore them. |
| processClusterStore | bool | `true` | if true, the operator will process cluster store. Else, it will ignore them. |
| processPushSecret | bool | `true` | if true, the operator will process push secret. Else, it will ignore them. |
| createOperator | bool | `true` | Specifies whether an external secret operator deployment be created. |
| concurrent | int | `1` | Specifies the number of concurrent ExternalSecret Reconciles external-secret executes at a time. |
| log | object | `{"level":"info","timeEncoding":"epoch"}` | Specifices Log Params to the Webhook |
| service.ipFamilyPolicy | string | `""` | Set the ip family policy to configure dual-stack see [Configure dual-stack](https://kubernetes.io/docs/concepts/services-networking/dual-stack/#services) |
| service.ipFamilies | list | `[]` | Sets the families that should be supported and the order in which they should be applied to ClusterIP as well. Can be IPv4 and/or IPv6. |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| serviceAccount.automount | bool | `true` | Automounts the service account token in all containers of the pod |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| serviceAccount.extraLabels | object | `{}` | Extra Labels to add to the service account. |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| rbac.create | bool | `true` | Specifies whether role and rolebinding resources should be created. |
| rbac.servicebindings.create | bool | `true` | Specifies whether a clusterrole to give servicebindings read access should be created. |
| extraEnv | list | `[]` |  |
| extraArgs | object | `{}` |  |
| extraVolumes | list | `[]` |  |
| extraObjects | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| extraContainers | list | `[]` |  |
| deploymentAnnotations | object | `{}` | Annotations to add to Deployment |
| podAnnotations | object | `{}` | Annotations to add to Pod |
| podLabels | object | `{}` |  |
| podSecurityContext.enabled | bool | `true` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.enabled | bool | `true` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| serviceMonitor.enabled | bool | `false` | Specifies whether to create a ServiceMonitor resource for collecting Prometheus metrics |
| serviceMonitor.namespace | string | `""` | namespace where you want to install ServiceMonitors |
| serviceMonitor.additionalLabels | object | `{}` | Additional labels |
| serviceMonitor.interval | string | `"30s"` | Interval to scrape metrics |
| serviceMonitor.scrapeTimeout | string | `"25s"` | Timeout if metrics can't be retrieved in given time interval |
| serviceMonitor.honorLabels | bool | `false` | Let prometheus add an exported_ prefix to conflicting labels |
| serviceMonitor.metricRelabelings | list | `[]` | Metric relabel configs to apply to samples before ingestion. [Metric Relabeling](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#metric_relabel_configs) |
| serviceMonitor.relabelings | list | `[]` | Relabel configs to apply to samples before ingestion. [Relabeling](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config) |
| metrics.listen.port | int | `8080` |  |
| metrics.service.enabled | bool | `false` | Enable if you use another monitoring tool than Prometheus to scrape the metrics |
| metrics.service.port | int | `8080` | Metrics service port to scrape |
| metrics.service.annotations | object | `{}` | Additional service annotations |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| affinity | object | `{}` |  |
| priorityClassName | string | `""` | Pod priority class name. |
| podDisruptionBudget | object | `{"enabled":false,"minAvailable":1}` | Pod disruption budget - for more details see https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| hostNetwork | bool | `false` | Run the controller on the host network |
| webhook.create | bool | `true` | Specifies whether a webhook deployment be created. |
| webhook.certCheckInterval | string | `"5m"` | Specifices the time to check if the cert is valid |
| webhook.lookaheadInterval | string | `""` | Specifices the lookaheadInterval for certificate validity |
| webhook.replicaCount | int | `1` |  |
| webhook.log | object | `{"level":"info","timeEncoding":"epoch"}` | Specifices Log Params to the Webhook |
| webhook.revisionHistoryLimit | int | `10` | Specifies the amount of historic ReplicaSets k8s should keep (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#clean-up-policy) |
| webhook.certDir | string | `"/tmp/certs"` |  |
| webhook.failurePolicy | string | `"Fail"` | Specifies whether validating webhooks should be created with failurePolicy: Fail or Ignore |
| webhook.hostNetwork | bool | `false` | Specifies if webhook pod should use hostNetwork or not. |
| webhook.image.repository | string | `"registry1.dso.mil/ironbank/opensource/external-secrets/external-secrets"` |  |
| webhook.image.pullPolicy | string | `"IfNotPresent"` |  |
| webhook.image.tag | string | `"v0.10.2"` | The image tag to use. The default is the chart appVersion. |
| webhook.image.flavour | string | `""` | The flavour of tag you want to use |
| webhook.imagePullSecrets[0].name | string | `"private-registry"` |  |
| webhook.nameOverride | string | `""` |  |
| webhook.fullnameOverride | string | `""` |  |
| webhook.port | int | `10250` | The port the webhook will listen to |
| webhook.rbac.create | bool | `true` | Specifies whether role and rolebinding resources should be created. |
| webhook.serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| webhook.serviceAccount.automount | bool | `true` | Automounts the service account token in all containers of the pod |
| webhook.serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| webhook.serviceAccount.extraLabels | object | `{}` | Extra Labels to add to the service account. |
| webhook.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| webhook.nodeSelector | object | `{}` |  |
| webhook.certManager.enabled | bool | `false` | Enabling cert-manager support will disable the built in secret and switch to using cert-manager (installed separately) to automatically issue and renew the webhook certificate. This chart does not install cert-manager for you, See https://cert-manager.io/docs/ |
| webhook.certManager.addInjectorAnnotations | bool | `true` | Automatically add the cert-manager.io/inject-ca-from annotation to the webhooks and CRDs. As long as you have the cert-manager CA Injector enabled, this will automatically setup your webhook's CA to the one used by cert-manager. See https://cert-manager.io/docs/concepts/ca-injector |
| webhook.certManager.cert.create | bool | `true` | Create a certificate resource within this chart. See https://cert-manager.io/docs/usage/certificate/ |
| webhook.certManager.cert.issuerRef | object | `{"group":"cert-manager.io","kind":"Issuer","name":"my-issuer"}` | For the Certificate created by this chart, setup the issuer. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.IssuerSpec |
| webhook.certManager.cert.duration | string | `"8760h"` | Set the requested duration (i.e. lifetime) of the Certificate. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.CertificateSpec One year by default. |
| webhook.certManager.cert.renewBefore | string | `""` | How long before the currently issued certificate’s expiry cert-manager should renew the certificate. See https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.CertificateSpec Note that renewBefore should be greater than .webhook.lookaheadInterval since the webhook will check this far in advance that the certificate is valid. |
| webhook.certManager.cert.annotations | object | `{}` | Add extra annotations to the Certificate resource. |
| webhook.tolerations | list | `[]` |  |
| webhook.topologySpreadConstraints | list | `[]` |  |
| webhook.affinity | object | `{}` |  |
| webhook.priorityClassName | string | `""` | Pod priority class name. |
| webhook.podDisruptionBudget | object | `{"enabled":false,"minAvailable":1}` | Pod disruption budget - for more details see https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| webhook.metrics.listen.port | int | `8080` |  |
| webhook.metrics.service.enabled | bool | `false` | Enable if you use another monitoring tool than Prometheus to scrape the metrics |
| webhook.metrics.service.port | int | `8080` | Metrics service port to scrape |
| webhook.metrics.service.annotations | object | `{}` | Additional service annotations |
| webhook.readinessProbe.address | string | `""` | Address for readiness probe |
| webhook.readinessProbe.port | int | `8081` | ReadinessProbe port for kubelet |
| webhook.extraEnv | list | `[]` |  |
| webhook.extraArgs | object | `{}` |  |
| webhook.extraVolumes | list | `[]` |  |
| webhook.extraVolumeMounts | list | `[]` |  |
| webhook.secretAnnotations | object | `{}` | Annotations to add to Secret |
| webhook.deploymentAnnotations | object | `{}` | Annotations to add to Deployment |
| webhook.podAnnotations | object | `{}` | Annotations to add to Pod |
| webhook.podLabels."external-secrets.io/component" | string | `"webhook"` |  |
| webhook.podSecurityContext.enabled | bool | `true` |  |
| webhook.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| webhook.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| webhook.securityContext.enabled | bool | `true` |  |
| webhook.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| webhook.securityContext.runAsNonRoot | bool | `true` |  |
| webhook.securityContext.runAsUser | int | `1000` |  |
| webhook.securityContext.runAsGroup | int | `1000` |  |
| webhook.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| webhook.resources.requests.memory | string | `"256Mi"` |  |
| webhook.resources.requests.cpu | string | `"100m"` |  |
| webhook.resources.limits.cpu | string | `"100m"` |  |
| webhook.resources.limits.memory | string | `"256Mi"` |  |
| certController.create | bool | `true` | Specifies whether a certificate controller deployment be created. |
| certController.requeueInterval | string | `"5m"` |  |
| certController.replicaCount | int | `1` |  |
| certController.log | object | `{"level":"info","timeEncoding":"epoch"}` | Specifices Log Params to the Webhook |
| certController.revisionHistoryLimit | int | `10` | Specifies the amount of historic ReplicaSets k8s should keep (see https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#clean-up-policy) |
| certController.image.repository | string | `"registry1.dso.mil/ironbank/opensource/external-secrets/external-secrets"` |  |
| certController.image.pullPolicy | string | `"IfNotPresent"` |  |
| certController.image.tag | string | `"v0.10.2"` |  |
| certController.image.flavour | string | `""` |  |
| certController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| certController.nameOverride | string | `""` |  |
| certController.fullnameOverride | string | `""` |  |
| certController.rbac.create | bool | `true` | Specifies whether role and rolebinding resources should be created. |
| certController.serviceAccount.create | bool | `true` | Specifies whether a service account should be created. |
| certController.serviceAccount.automount | bool | `true` | Automounts the service account token in all containers of the pod |
| certController.serviceAccount.annotations | object | `{}` | Annotations to add to the service account. |
| certController.serviceAccount.extraLabels | object | `{}` | Extra Labels to add to the service account. |
| certController.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template. |
| certController.nodeSelector | object | `{}` |  |
| certController.tolerations | list | `[]` |  |
| certController.topologySpreadConstraints | list | `[]` |  |
| certController.affinity | object | `{}` |  |
| certController.hostNetwork | bool | `false` | Run the certController on the host network |
| certController.priorityClassName | string | `""` | Pod priority class name. |
| certController.podDisruptionBudget | object | `{"enabled":false,"minAvailable":1}` | Pod disruption budget - for more details see https://kubernetes.io/docs/concepts/workloads/pods/disruptions/ |
| certController.metrics.listen.port | int | `8080` |  |
| certController.metrics.service.enabled | bool | `false` | Enable if you use another monitoring tool than Prometheus to scrape the metrics |
| certController.metrics.service.port | int | `8080` | Metrics service port to scrape |
| certController.metrics.service.annotations | object | `{}` | Additional service annotations |
| certController.readinessProbe.address | string | `""` | Address for readiness probe |
| certController.readinessProbe.port | int | `8081` | ReadinessProbe port for kubelet |
| certController.extraEnv | list | `[]` |  |
| certController.extraArgs | object | `{}` |  |
| certController.extraVolumes | list | `[]` |  |
| certController.extraVolumeMounts | list | `[]` |  |
| certController.deploymentAnnotations | object | `{}` | Annotations to add to Deployment |
| certController.podAnnotations | object | `{}` | Annotations to add to Pod |
| certController.podLabels | object | `{}` |  |
| certController.podSecurityContext.enabled | bool | `true` |  |
| certController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| certController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| certController.securityContext.enabled | bool | `true` |  |
| certController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| certController.securityContext.runAsNonRoot | bool | `true` |  |
| certController.securityContext.runAsUser | int | `1000` |  |
| certController.securityContext.runAsGroup | int | `1000` |  |
| certController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| certController.resources.requests.memory | string | `"256Mi"` |  |
| certController.resources.requests.cpu | string | `"100m"` |  |
| certController.resources.limits.cpu | string | `"100m"` |  |
| certController.resources.limits.memory | string | `"256Mi"` |  |
| dnsPolicy | string | `"ClusterFirst"` | Specifies `dnsPolicy` to deployment |
| dnsConfig | object | `{}` | Specifies `dnsOptions` to deployment |
| podSpecExtra | object | `{}` | Any extra pod spec on the deployment |
| domain | string | `"bigbang.dev"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.outboundTrafficPolicyMode | string | `"REGISTRY_ONLY"` |  |
| istio.hardened.customServiceEntries | list | `[]` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| istio.injection | string | `"disabled"` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| networkPolicies.ingress[0].from[0].namespaceSelector | object | `{}` |  |
| networkPolicies.ingress[0].ports[0].port | int | `10250` |  |
| networkPolicies.ingress[0].ports[0].protocol | string | `"TCP"` |  |
| networkPolicies.ingress[0].ports[1].port | int | `10250` |  |
| networkPolicies.ingress[0].ports[1].protocol | string | `"TCP"` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.namespace | string | `"external-secrets"` |  |
| bbtests.secretstore.name | string | `"external-secrets-test-store"` |  |
| bbtests.serviceaccount.name | string | `"external-secrets-test"` |  |
| bbtests.rolebinding.name | string | `"external-secrets-test-read-secrets"` |  |
| bbtests.role.name | string | `"external-secrets-reader"` |  |
| bbtests.role.rules[0].apiGroups[0] | string | `""` |  |
| bbtests.role.rules[0].resources[0] | string | `"secrets"` |  |
| bbtests.role.rules[0].verbs[0] | string | `"get"` |  |
| bbtests.role.rules[0].verbs[1] | string | `"watch"` |  |
| bbtests.role.rules[0].verbs[2] | string | `"list"` |  |
| bbtests.role.rules[1].apiGroups[0] | string | `""` |  |
| bbtests.role.rules[1].resources[0] | string | `"SelfSubjectRulesReview"` |  |
| bbtests.role.rules[1].verbs[0] | string | `"create"` |  |
| bbtests.secrets.testsecret.value | string | `"this is a magic value"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

