# Promtail

## Description

Agent to collect logs on a host and push them to a Loki instance

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/logging/promtail/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.3`             | `v0.2.0`              |
