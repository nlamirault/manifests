# Kubernetes manifests

This repo is a [bespoke configuration](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/glossary.md#bespoke-configuration)
of `kustomize` targets.

## Organization

Each directory corresponds to a namespace. Except admin and namespaces.

In the directories of namespaces, we find the different services to deploy.


## Best practices

See [BestPractices](BestPractices.md)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//dns/external-dns/base?ref=v0.1.0
```

## Tools

| Name               | Releases           | Tags             |
| -----------------  |:------------------:| ----------------:|
| Kustomize          | `v3.1.0`           | `v0.1.0`         |
| Kubeval            | `v0.13.0`          | `v0.1.0`         |
| Conftest           | `v0.11.0`          | `v0.1.0`         |


## Components

### Cert manager

* Namespace : `certificates`
* Releases:

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.9.1`           | `v0.1.0`              |

### NGinx ingress controller

* Namespace : `ingress-controllers`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.21`            | `v0.1.0`              |

### Default backend

* Namespace : `ingress-controllers`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v1.4`             | `v0.1.0`              |

### Prometheus Operator

* Namespace : `monitoring`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.31.1`          | `v0.1.0`              |

### Prometheus

* Namespace : `monitoring`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v2.12.0`          | `v0.1.0`              |

### Alertmanager

* Namespace : `monitoring`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.18`            | `v0.1.0`              |

### Node exporter

* Namespace : `monitoring`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.18.1`          | `v0.1.0`              |

### Kube-state-metrics

* Namespace : `monitoring`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v1.7.2`           | `v0.1.0`              |

### Grafana

* Namespace : `monitoring`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v6.3.2`           | `v0.1.0`              |

### Loki

* Namespace : `logging`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.3`             | `v0.1.0`              |

### Promtail

* Namespace : `logging`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.3`             | `v0.1.0`              |

### Polaris

* Namespace : `reporting`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.4.0`           | `v0.1.0`              |

### Kube-resources-report

* Namespace : `reporting`
* Releases :

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.16.0`          | `v0.1.0`              |
