# Upgrading to a new version

The below details the steps required to update to a new version of the External Secrets package.

1. Review the [upstream release notes](https://github.com/external-secrets/external-secrets/releases) for the update you are going to, as well as any versions skipped over between the last BB release and this one. Note any breaking changes and new features.

2. Use `kpt` to pull the upstream chart via the latest tag that corresponds to the application version. From the root of the repo run `kpt pkg update chart@helm-chart-0.9.18 --strategy alpha-git-patch` replacing `helm-chart-0.9.18` with the version tag you got in step 1. Also update the custom resource definitions using the same chart version `kpt pkg update chart/crds@helm-chart-0.9.18 --strategy alpha-git-patch`.

3. Based on the upstream changelog review from earlier, make any changes required to resolve breaking changes and reconcile the Big Bang modifications.

4. Modify the `version` in `Chart.yaml`. Also modify the `appVersion` and the `bigbang.dev/applicationVersions` to the new upstream version of External Secrets. 

5. Update helm dependencies to latest library versions.
    ```
    helm dependency update ./chart
    ```

6. Update `CHANGELOG.md` adding an entry for the new version and noting all changes (at minimum should include `Updated External Secrets Operator to x.x.x`).

7. Generate the `README.md` updates by following the [guide in gluon](https://repo1.dso.mil/platform-one/big-bang/apps/library-charts/gluon/-/blob/master/docs/bb-package-readme.md).

8. Open an MR in "Draft" status and validate that CI passes. This will perform a number of smoke tests against the package, but it is good to manually deploy to test some things that CI doesn't. Follow the steps below for manual testing.

9. Once all manual testing is complete take your MR out of "Draft" status and add the review label.

# Testing for updates

NOTE: For these testing steps it is good to do them on both a clean install and an upgrade. For clean install, point external-secrets to your branch. For an upgrade do an install with external-secrets pointing to the latest tag, then perform a helm upgrade with external-secrets pointing to your branch.

To install External Secrets Operator as a community package in a Big Bang Kubernetes Cluster, see the [deployment documentation](DEPLOYMENT.md) and follow the instructions there. 

Testing Steps:
- Ensure all resources have reconciled and are healthy
- Run the helm tests and ensure they pass

When in doubt with any testing or upgrade steps ask one of the CODEOWNERS for assistance.

# Big Bang Chart Additions

This chart has no Big Bang specific additions at this time.