# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog][1],
and this project adheres to [Semantic Versioning][2].

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
