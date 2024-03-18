# s3gw-charts

[![License][license-badge]][license-url]
[![Lint][lint-badge]][lint-url]

Helm charts for [s3gw](https://github.com/s3gw-tech/s3gw)

s3gw is an S3-compatible service focused on deployments in a Kubernetes
environment backed by any PVC. Since its inception, the primary focus has been
on cloud native deployments. However, the s3gw can be deployed in a myriad of
scenarios, provided some form of storage is attached.

s3gw is based on Ceph’s RADOSGW (RGW) but runs as a stand–alone service without
the RADOS cluster and relies on a file system storage backend. A web-based UI
for management and an object explorer are also part of s3gw.

- [Quickstart](charts/s3gw/README.md)
- [Documentation][documentation].

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use licensed files except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

or the LICENSE file in this repository.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[license-badge]: https://img.shields.io/github/license/s3gw-tech/s3gw-charts
[license-url]: https://s3gw-docs.readthedocs.io/en/latest/license/
[lint-badge]: https://img.shields.io/github/actions/workflow/status/s3gw-tech/s3gw-charts/lint.yaml?branch=main&label=lint
[lint-url]: https://github.com/s3gw-tech/s3gw-charts/actions/workflows/lint.yaml
[documentation]: https://s3gw-docs.readthedocs.io/en/latest/helm-charts/
