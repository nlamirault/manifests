# Monitoring Redis

## Description

Add Prometheus rules to monitor Redis

Depends on :

* [Prometheus Operator](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus-operator)
* [Prometheus](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus)
* [Redis Exporter](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/redis-exporter)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/monitoring/monitoring-redis/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.31.0`          | `vx.y.z`              |
