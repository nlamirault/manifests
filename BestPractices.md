# Kustomize Best Practices

## Documentation

Add a `README.md` file which must contains theses informations :

```text
# The Fake component

## Description

A description

## Usage

apiVersion: kustomize.config.k8s.io/v1beta1
genre: Kustomization
bases:
- git@github.com:nlamirault/manifests.git//resources/xxxxx/xxxxx/base?ref=vx.y.z

## Releases

| Release            | Manifests tag         |
| ------------------:|:---------------------:|
| `vx.y.z`           | `vx.y.z`              |
```

## Resource file naming

Resources must be organized by Kind. The file name must be the type of the Kind in
Camel Case.

For example:

* a Deployment would go to a file named deployment.yaml
* a ClusterRoleBinding would go into a file called clusterRoleBinding.yaml

## Kubernetes common labels

Each component must have theses labels :

* `app.kubernetes.io/name`: **todo**
* `app.kubernetes.io/instance`: **todo**
* `app.kubernetes.io/component`: the namespace name
* `app.kubernetes.io/version`: release using [Semver](https://semver.org/) **vMAJOR.MINOR.PATCH**
* `app.kubernetes.io/part-of`: name of the project
* `app.kubernetes.io/managed-by`: **kustomize**
* `env`: environment (**staging**, **prod**, ...)

Ex:

```yaml
commonLabels:
  app.kubernetes.io/name: kubernetes-dashboard
  app.kubernetes.io/instance: kubernetes-dashboard-jarvis
  app.kubernetes.io/component: reporting
  app.kubernetes.io/version: v2.0.0
  app.kubernetes.io/part-of: jarvis
  app.kubernetes.io/managed-by: kustomize
```

## Removing common attributes across resources

There are often repeated attributes across resources: labels, namespace, or perhaps a common prefix used for each resource.

Move into the **kustomization.yaml** file:

* the namespace
* labels and their selectors

## Docker Image versions

In base , use ̀`latest` tag, and use the **kustomization.yaml** file to specify which version to use.

Ex:

```yaml
images:
- name: prom/prometheus:latest
  newName: prom/prometheus
  newTag: v2.12.0
```
