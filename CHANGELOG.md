# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][1],
and this project adheres to [Semantic Versioning][2].

## [0.10.0] - Unreleased

### Added

- **TLS Certificate Management**
  - Ability to use an optional certificate manager:
  [cert-manager](https://cert-manager.io/),
    to automatically provision TLS certificates. When using such feature,
    `cert-manager` installation is a prerequisite.
  - Usage of `cert-manager` is enabled by default and can be disabled
    with the flag:
    - `useCertManager`
  - `cert-manager` namespace can be set with the following chart field:
    - `certManagerNamespace`
  - `cert-manager` will provision certificates for:
    - S3 service's ingress (public domain)
    - UI service's ingress (public domain)
    - S3 service's internal endpoint (Kubernetes private domain)
  - When using `cert-manager`, the user can choose between
    two predefined `ClusterIssuer`:
    - `s3gw-issuer`
    - `s3gw-letsencrypt-issuer`
  - `s3gw-issuer` can be used to generate self-signed certificates.
  - `s3gw-letsencrypt-issuer` should be used for production environments.
  - Please, note that when using a certificate manager, the `s3gw-issuer`
    `ClusterIssuer` will be used for generating certificates for the S3 service's
    internal endpoint.
  - When the user chooses not to employ `cert-manager`,
    TLS secrets must be filled manually. The following fields
    have been added to the chart for this purpose:
    - `tls.publicDomain.crt`
    - `tls.publicDomain.key`
    - `tls.privateDomain.crt`
    - `tls.privateDomain.key`
    - `tls.ui.publicDomain.crt`
    - `tls.ui.publicDomain.key`
  - The user can choose a custom `ClusterIssuer` by setting the following chart fields:
    - `useCustomTlsIssuer` and `customTlsIssuer`
- **Internal TLS endpoint for the S3 service**
  - The `s3gw`-Pod can now accept TLS connections on port `7481`.
  - The `s3gw-cluster-ip-tls` secret is used to configure both
    `ssl_certificate` and `ssl_private_key`.
  - The `s3gw`-ClusterIP-Service has been extended to link the `s3gw`-Pod port
    `7481` with the `s3gw`-ClusterIP-Service port `443`.

### Removed

- Configuration options superseded by the newly added variables:
  - `tls.crt`, `tls.key`
  - `ui.tls.crt`, `ui.tls.key`
- Dropped some entries from `s3gw-config` map:
  - `RGW_DNS_NAME`, `RGW_BACKEND_STORE`, `DEBUG_RGW`
  - when applicable, these values are now taken directly from the chart.

## [0.9.0] - 2022-12-01

### Added

- Configuration options: `serviceName`, `publicDomain`, `privateDomain`
  used to configure the s3gw-service's public domain used by the Ingress
  and the private domain used inside the Kubernetes cluster.
- Defaulted values:
  - `serviceName` : s3gw
  - `publicDomain` : be.127.0.0.1.omg.howdoi.website
  - `privateDomain` : svc.cluster.local
- Configuration options: `ui.serviceName`, `ui.publicDomain`
  used to configure the s3gw-ui-service's public domain used by
  the Ingress.
- Defaulted values:
  - `ui.serviceName` : s3gw-ui
  - `ui.publicDomain` : fe.127.0.0.1.omg.howdoi.website
- Configuration option: `logLevel` used to set the s3gw-service's
  log verbosity.
- Defaulted value: `1`

### Removed

- Configuration options: `hostname` and `ui.hostname`, both superseded
  by the newly added variables.

## [0.8.0] - 2022-11-10

### Changed

- Expose `ETag` header in the Traefik s3gw ingress to allow multipart
  uploads via browser (gh#aquarist-labs/s3gw#170).
- Add the `OPTIONS` method to the Traefik CORS configuration (gh#aquarist-labs/s3gw#188).
- Fix an issue in the GW ingress related to TLS + wildcard host.

## [0.7.0] - 2022-10-20

- Added some regression tests against templating failures

## [0.6.1] - 2022-10-06

- Properly label all components of the chart to give helm hints about what is
  part of the chart.
- Redesign registry access variables to be usable with private registries
- Improve rancher questions to guide the installation in a more user friendly
  form

## [0.6.0] - 2022-09-29

- Storage redesign storage settings to allow using an existing storage class
  while keeping it easy to use longhorn and local storage with minimal work
  required
- Give TLS certificates to UI ingress as well
- Enable TLS endpoints for Traefik ingress

## [0.5.0] - 2022-09-15

- The variables `hostnameNoTLS`, `ui.hostname` and `ui.hostnameNoTLS`
  has been added to configure the hostnames of the S3GW and S3GW-UI.
- Defaulted `ui.enabled` to `true`.
- Rename the `access_key` and `secret_key` variable names according
  the Helm Chart best practices guide to `accessKey` and `secretKey`.
- Rename the `enableIngress` variable to `ingress.enabled`.
- Relocate the variables `imageRegistry_ui`, `imageName_ui`,
  `imageTag_ui` and `imagePullPolicy_ui` to `ui.imageRegistry`,
  `ui.imageName`, `ui.imageTag` and `ui.imagePullPolicy`

## [0.4.0] - 2022-09-01

- Set 'system' flag for default user
- Added questions.yaml to support PVC selection
- Removed Traefik installation from CI pipeline
- Updated readme
- Disable version check for linter
- Configure UI and add information about CORS
- Fixed typos in documentation and code. - Add .editorconfig file.

## [0.3.0] - 2022-08-04

- s3gw image set to v0.3.0 in values.yaml
- s3gw-ui image set to v0.3.0 in values.yaml

## [0.2.0] - 2022-07-28

- Defaulted access_key and secret_key fields to "test" in values.yaml
- Set imageTag to a specific version rather than using "latest"
- RGW_BACKEND_STORE property set to "sfs"

## [0.1.0] - 2022-07-14

- Initial version of the chart

[1]: https://keepachangelog.com/en/1.0.0/
[2]: https://semver.org/spec/v2.0.0.html
