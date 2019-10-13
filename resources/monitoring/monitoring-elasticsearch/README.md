# Monitoring Elasticsearch

## Description

Add Prometheus rules to monitor Elasticsearch

Depends on :

* [Prometheus Operator](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus-operator)
* [Prometheus](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/prometheus)
* [Elasticsearch Exporter](https://github.com/nlamirault/manifests/tree/master/resources/monitoring/elasticsearch-exporter)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/monitoring/monitoring-elasticsearch/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.31.0`          | `vx.y.z`              |
