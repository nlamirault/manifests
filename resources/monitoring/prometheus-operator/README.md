# Prometheus Operator

## Description

The Prometheus factory

Depends on :

* [Prometheus Operator CRDs](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus-operator-crds)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/monitoring/prometheus-operator/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.31.1`          | `v0.2.0`              |
