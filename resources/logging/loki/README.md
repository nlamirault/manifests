# Loki

## Description

Like Prometheus, but for logs

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/logging/loki/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.3`             | `v0.2.0`              |
