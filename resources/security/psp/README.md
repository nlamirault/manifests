# Pod Security Policy

## Description

Validation of best practices in your Kubernetes clusters

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/security/psp/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.4.0`           | `v0.2.0`              |
