# Cert-Manager

![cert-manager](../../assets/certmanager.png)

## Description

Automatically provision and manage TLS certificates in Kubernetes

Depends on :

* [Cert-Manager CRD](https://github.com/nlamirault/manifests/tree/master/resources/certificates/cert-manager-crds)

## Usage

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/certificates/cert-manager/base?ref=vx.y.z
```

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `v0.9.1`           | `v0.1.0`              |

