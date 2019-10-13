# Monitoring Memcached

## Description

Add Prometheus rules to monitor Memcached

Depends on :

* [Prometheus Operator](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus-operator)
* [Prometheus](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus)
* [Memcached Exporter](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/memcached-exporter)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/monitoring/monitoring-memcached/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.31.0`          | `vx.y.z`              |
