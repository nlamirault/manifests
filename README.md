# Kubernetes manifests

This repo is a [bespoke configuration](https://github.com/kubernetes-sigs/kustomize/blob/master/docs/glossary.md#bespoke-configuration)
of `kustomize` targets used by Skale-5.

## Organization

Each directory corresponds to a namespace. Except admin and namespaces.

In the directories of namespaces, we find the different services to deploy.

## Best practices

See [BestPractices](BestPractices.md)

## Tools

| Name               | Releases           | Tags             |
| -----------------  |:------------------:| ----------------:|
| Kustomize          | `v3.1.0`           | `v0.2.0`         |
| Kubeval            | `v0.13.0`          | `v0.2.0`         |
| Conftest           | `v0.11.0`          | `v0.2.0`         |
