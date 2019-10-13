# FluxCD

![flux](../../assets/flux.svg)

## Description

The GitOps operator for Kubernetes

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/cicd/flux/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v1.15.0`          | `v0.1.0`              |

