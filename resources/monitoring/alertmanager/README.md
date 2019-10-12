# Alertmanager

## Description

The Prometheus alerting system

Depends on :

* [Prometheus Operator](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus-operator)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/monitoring/alertmanager/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.18`            | `v0.2.0`              |
