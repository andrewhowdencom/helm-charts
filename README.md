# Drupal with nginx and php-fpm

[Drupal](https://www.drupal.org/) is one of the most versatile open source content management systems on the market.

[Nginx](https://www.nginx.com/) [engine x] is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev.

[PHP-FPM](https://php-fpm.org/) (FastCGI Process Manager) is an alternative PHP FastCGI implementation with some additional features useful for sites of any size, especially busier sites.

## TL;DR;

```console
$ helm repo add supernami https://supernami.github.io/helm-charts/
$ helm install supernami/drupal
```

## Introduction

This chart bootstraps a [Drupal](https://github.com/bitnami/bitnami-docker-drupal) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [Bitnami MariaDB chart](https://github.com/kubernetes/charts/tree/master/stable/mariadb) which is required for bootstrapping a MariaDB deployment for the database requirements of the Drupal application.

It's different from [Bitnami's drupal kubernetes chart](https://github.com/kubernetes/charts/tree/master/stable/drupal) in the fact that it uses nginx and php-fpm instead of apache.

## Prerequisites

- Kubernetes 1.4+ with Beta APIs enabled
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release supernami/drupal
```

The command deploys Drupal on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following tables lists the configurable parameters of the Drupal chart and their default values.

| Parameter                         | Description                           | Default                                                   |
| --------------------------------- | ------------------------------------- | --------------------------------------------------------- |
| `replicaCount`                    | Amount of replica's                   | `1`                                                       |
| `namespace`                       | Deploy in which namespace             | `default`                                                 |
| `nginx.image.repository`          |                                       | ``                                                        |
| `nginx.image.tag`                 |                                       | ``                                                        |
| `nginx.image.pullPolicy`          |                                       | ``                                                 |
| `drupal.image.repository`         |                                       | ``                                                 |
| `drupal.image.tag`                |                                       | ``                                                 |
| `drupal.image.pullPolicy`         |                                       | ``                                                 |
| `drupal.image.internalPort`       |                                       | ``                                                 |
| `website.name`                    |                                       | ``                                                 |
| `website.tld`                     |                                       | ``                                                 |
| `service.name`                    |                                       | ``                                                 |
| `service.type`                    |                                       | ``                                                 |
| `service.httpexternalPort`        |                                       | ``                                                 |
| `service.httpinternalPort`        |                                       | ``                                                 |
| `service.httpsexternalPort`       |                                       | ``                                                 |
| `service.httpsinternalPort`       |                                       | ``                                                 |
| `resources.limits.cpu`            |                                       | ``                                                 |
| `resources.limits.memory`         |                                       | ``                                                 |
| `resources.requests.cpu`          |                                       | ``                                                 |
| `resources.requests.memory`       |                                       | ``                                                 |
| `persistence.enabled.true`        |                                       | ``                                                 |
| `persistence.data.storageClass`   |                                       | ``                                                 |
| `persistence.data.accessMode`     |                                       | ``                                                 |
| `persistence.data.size`           |                                       | ``                                                 |
| `persistence.config.storageClass` |                                       | ``                                                 |
| `persistence.config.accessMode`   |                                       | ``                                                 |
| `persistence.config.size`         |                                       | ``                                                 |
| `mariadb.mariadbRootPassword`     |                                       | ``                                                 |
| `mariadb.persistence.enabled`     |                                       | ``                                                 |
| `mariadb.persistence.storageClass`|                                       | ``                                                 |
| `mariadb.persistence.accessMode`  |                                       | ``                                                 |
| `mariadb.persistence.size`        |                                       | ``                                                 |

work in progress

The above parameters map to the env variables defined in [values.yaml](https://github.com/SuperNami/helm-charts/blob/master/charts/drupal/values.yaml).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set mariadb.mariadbRootPassword=secretpassword \
    stable/drupal
```

The above command sets the MariaDB `root` user password to `secretpassword`.

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml stable/drupal
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

The [SuperNami Drupal](https://github.com/SuperNami/helm-charts) image stores the Drupal data and configurations at the `/var/www/html` and `/etc/nginx` paths of the container.

Persistent Volume Claims are used to keep the data across deployments. This is known to work in GCE, AWS, and minikube.

See the [Configuration](#configuration) section to configure the PVC or to disable persistence.
