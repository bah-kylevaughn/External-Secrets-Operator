# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [0.9.18-bb.8] - 2024-07-12
### Changed
- Added integration testing instructions for External Secrets Operator

## [0.9.18-bb.7] - 2024-07-03
### Changed
- Fixed kyverno polciy issues with external-secrets-test-secret-mount

## [0.9.18-bb.6] - 2024-07-03
### Changed
- Fixed kyvero policy issue setting runAsGroup: 1000

## [0.9.18-bb.5] - 2024-06-13
### Changed
- Added istio authorization policies

## [0.9.18-bb.4] - 2024-06-10
### Added
- Added istio PeerAuthorization policies

## [0.9.18-bb.3] - 2024-06-05
### Changed
- Corrected an issue in the deployment documentation

## [0.9.18-bb.2] - 2024-06-02
### Added
- Added helm test to validate that the external secrets operator is functional


## [0.9.18-bb.1] - 2024-05-28
### Added
- Add Resource values for every pod to set Guaranteed QoS

## [0.9.18-bb.0] - 2024-05-15
### Changed
- update "custom_resources" (https://github.com/external-secrets/external-secrets) from "v0.9.15" (57521cd87ead96f0b1f550bc04f2edcb45b56071) to "helm-chart-0.9.18" (b8f27d6b0a35ff0b6b8a1772799364e271bcd294)
- update "external-secrets" (https://github.com/external-secrets/external-secrets) from "v0.9.15" (3d96be0d53817cde9e1c431b4b51550614e064df) to "helm-chart-0.9.18" (b8f27d6b0a35ff0b6b8a1772799364e271bcd294)
- Updated to gluon 0.4.10

## [0.9.16-bb.0] - 2024-05-22
### Added
- Updated chart to v0.9.16
- Added network policies

## [0.9.15-bb.3] - 2024-05-15
### Added
- Added renovate configuration to external-secrets opensource app

## [0.9.15-bb.2] - 2024-05-11
### Added
- KPT pull for upstream custom resource definitions bundle
- kustomizations to deploy custom resources before the helm release

## [0.9.15-bb.1] - 2024-05-03
### Added
- Generate README.md

## [0.9.15-bb.0] - 2024-04-30
### Initial
- Pull latest chart with kpt
