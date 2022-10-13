# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0] - 2022-10-13

### Changed

- Properly label all components of the chart to give helm hints about what is
  part of the chart.
- Redesing registry access variables to be usable with private registries
- Improve rancher questions to guide the installation in a more user friendly
  form

## [0.6.0] - 2022-09-29

### Changed

- Storage redesign storage settings to allow using an existing storage class
  while keeping it easy to use longhorn and local storage with minimal work
  required
- Give TLS certificates to UI ingress as well
- Enable TLS endpoints for Traefik ingress

## [0.5.0] - 2022-09-15

### Added

- The variables `hostnameNoTLS`, `ui.hostname` and `ui.hostnameNoTLS`
  has been added to configure the hostnames of the S3GW and S3GW-UI.

### Changed

- Defaulted `ui.enabled` to `true`.
- Rename the `access_key` and `secret_key` variable names according
  the Helm Chart best practices guide to `accessKey` and `secretKey`.
- Rename the `enableIngress` variable to `ingress.enabled`.
- Relocate the variables `imageRegistry_ui`, `imageName_ui`,
  `imageTag_ui` and `imagePullPolicy_ui` to `ui.imageRegistry`,
  `ui.imageName`, `ui.imageTag` and `ui.imagePullPolicy`

## [0.4.0] - 2022-09-01

### Added

- Set 'system' flag for default user
- Added questions.yaml to support PVC selection

### Changed

- Removed Traefik installation from CI pipeline
- Updated readme
- Disable version check for linter
- Configure UI and add information about CORS

### Fixed

- Fixed typos in documentation and code. - Add .editorconfig file.

## [0.3.0] - 2022-08-04

### Changed

- s3gw image set to v0.3.0 in values.yaml
- s3gw-ui image set to v0.3.0 in values.yaml

## [0.2.0] - 2022-07-28

### Changed

- Defaulted access_key and secret_key fields to "test" in values.yaml
- Set imageTag to a specific version rather than using "latest"
- RGW_BACKEND_STORE property set to "sfs"

## [0.1.0] - 2022-07-14

### Added

- Everything
