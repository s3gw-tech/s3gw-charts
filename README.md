# s3gw-charts

[![GitHub][license-badge]][license-url]
[![Slack][slack-badge]][slack-url]

Helm charts for [s3gw](https://github.com/aquarist-labs/s3gw-core)

s3gw is an S3-compatible service focused on deployments in a Kubernetes
environment backed by any PVC, including Longhorn. Since its inception, the
primary focus has been on cloud native deployments. However, the s3gw can be
deployed in a myriad of scenarios, provided some form of storage is attached.

s3gw is based on Ceph’s RADOSGW (RGW) but runs as a stand–alone service without
the RADOS cluster and relies on a storage backend still under heavy development
by the storage team at SUSE. A web-based UI for management and an object
explorer are also part of s3gw.

- [Quickstart](charts/s3gw/README.md)
- [Documentation][documentation].

[license-badge]: https://img.shields.io/github/license/aquarist-labs/s3gw-charts
[license-url]: https://s3gw-docs.readthedocs.io/en/latest/license/
[slack-badge]: https://img.shields.io/badge/slack-s3gw-brightgreen.svg?logo=slack
[slack-url]: https://slack.com/app_redirect?channel=C04DCMUV8SE
[documentation]: https://s3gw-docs.readthedocs.io/en/latest/helm-charts/
