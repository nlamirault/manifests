# Default Backend

## Description

A service which handles all URL paths and hosts the nginx controller doesn't understand

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/ingress-controllers/default-backend/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v1.4`             | `v0.2.0`              |

