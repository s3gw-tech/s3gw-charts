# s3gw-charts

![GitHub](https://img.shields.io/github/license/aquarist-labs/s3gw-charts?style=for-the-badge)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/aquarist-labs/s3gw-charts/Lint%20and%20Test%20Charts?style=for-the-badge)

Helm charts for [s3gw](https://github.com/aquarist-labs/s3gw-core)

## Install

In order to install s3gw using helm, from this repository directly, first you
must clone the repo:

    $ git clone https://github.com/aquarist-labs/s3gw-charts.git

Before installing, familiarize yourself with the options, if necessary provide
your own `values.yaml` file.
Then change into the repository and install using helm:

    $ cd s3gw-charts
    $ helm install $RELEASE_NAME charts/s3gw --namespace $S3GW_NAMESPACE --create-namespace -f /path/to/your/custom/values.yaml

## Options

The helm chart can be customized for your Kubernetes environment. To do so,
either provide a `values.yaml` file with your settings, or set the options on
the command line directly using `helm --set key=value`.

### Ingress Options

Both NGinx and Traefik are supported as ingress controllers. If your cluster
does not have either, it can be installed automatically by helm if
`ingress.nginx.install` or `ingress.traefik.install` respectively is set to
`true`
If your cluster already has either one of the ingress controllers installed, you
can enable the corresponding ingress object by setting `ingress.nginx.enabled`
or `ingress.traefik.enabled` respectively to `true`.

For example this configuration will reuse an existing traefik ingress controller
by deploying a traefik ingress object:
```yaml
ingress:
  nginx:
    enabled: false
    install: false
  traefik:
    enabled: true
    install: false
```

### TLS Certificates

provide the TLS certificate in the `values.yaml` file to enable TLS at the
ingress.
Note that the connection between the ingress and s3gw itself within the cluster
will not be TLS protected.

```yaml
tls:
  crt: PUT_YOUR_CERTIFICATE_HERE
  key: PUT_YOUR_CERTIFICATES_KEY_HERE
```

### Existing Volumes

The s3gw is best deployed ontop of a [longhorn](https://longhorn.io) volume. If
you have longhorn installed in your cluster, all appropriate resources will be
automatically deployed for you.
Make sure the `storageType` is set to `"longhorn"` and the correct size for the
claim is set in `storageSize`:
```yaml
storageType: "longhorn"
storageSize: 10Gi
```

However if you want to use s3gw with other storage providers, you can do so too.
You must first deploy a persistent volume claim for your storage provider. Then
you deploy s3gw and set it to use that persistent volume claim (pvc) with:
```yaml
storageType: "pvc"
storage: the-name-of-the-pvc
```
s3gw will then reuse that pvc instead of deploying a longhorn volume.

You can also use local filesystem storage instead, by setting `storageType` to
`"local"`, `storageSize` to the desired quota and `storage` to the path on the
hosts filesystem, e.g:
```yaml
storageType: "local"
storageSize: 10Gi
storage: /mnt/extra-storage/
```

### Image Settings

In some cases, custom image settings are needed, e.g. in an air-gapped
environment, or for developers. In that case, you can modify the registry and
image settings:
```yaml
imageRegistry: "ghcr.io/aquarist-labs"
imageName: "s3gw"
imageTag: "latest"
imagePullPolicy: "Always"
imageRegistry_ui: "ghcr.io/aquarist-labs"
imageName_ui: "s3gw-ui"
imageTag_ui: "latest"
imagePullPolicy_ui: "Always"
```
