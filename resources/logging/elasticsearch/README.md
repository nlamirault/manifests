# Elasticsearch

## Description

Open Source, Distributed, RESTful Search Engine

Depends on :

* [Elastic Operator](https://github.com/nlamirault/manifests/tree/master/resources/logging/elastic-operator)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/logging/elasticsearch/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v7.4.0`           | `v0.2.0`              |
