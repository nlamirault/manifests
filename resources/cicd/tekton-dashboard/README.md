# Tekton Dashboard

## Description

A dashboard for Tekton.

Depends on:

* [Tekton](https://github.com/nlamirault/manifests/tree/master/resources/cicd/tekton)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/cicd/tekton-dashboard/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.9.1`           | `v0.2.0`              |

