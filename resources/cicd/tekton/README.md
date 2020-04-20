# Tekton

## Description

Kubernetes-style resources for declaring CI/CD-style pipelines.

Depends on:

* [Tekton CRD](https://github.com/nlamirault/manifests/tree/master/resources/cicd/tekton-crds)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/cicd/tekton/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.11.2`          | `v0.2.0`              |
