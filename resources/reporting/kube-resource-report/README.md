# Kube-resource-report

## Description

Report Kubernetes cluster and pod resource requests vs usage


## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/reporting/kube-resource-report/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.16.0`          | `v0.2.0`              |
| `v19.9.0`          | **in progress**       |
