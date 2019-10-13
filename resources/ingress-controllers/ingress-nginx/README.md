# Ingress NGinx

## Description

A Kubernetes Ingress controller using NGinx


## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/ingress-controllers/ingress-nginx/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.21`            | `v0.2.0`              |
