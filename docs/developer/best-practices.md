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

<aside class="note warning">

<h1>Action Required</h1>


Do not use the **commonLabels** feature of kustomize.
With this feature, those labels would also
be added to selectors which might not be what you want depending on the use
case at hand.

</aside>

You can use a custom label transformer to add your own labels to all ressources **/metadata/labels**.

the **kustomization.yaml** file :

```yaml
---
kind: Kustomization
apiVersion: kustomize.config.k8s.io/v1beta1
bases:
- "../../base"

transformers:
- metadataLabelTransformer.yaml
```

and the **metadataLabelTransformer.yaml** file :

```yaml
---
apiVersion: builtin
kind: LabelTransformer
metadata:
  name: labelTransformer
labels:
  app.kubernetes.io/name: minotor-landing-dashboard
  app.kubernetes.io/instance: minotor-landing
  app.kubernetes.io/component: customer
  app.kubernetes.io/version: v0.2.1
  app.kubernetes.io/part-of: ma-societe-infra
  app.kubernetes.io/managed-by: kustomize
  app.kubernetes.io/manufacturer: Fsociety
  env: staging
fieldSpecs:
- path: metadata/labels
  create: true
- kind: Deployment
  path: spec/template/metadata/labels
  create: true
```

## Removing common attributes across resources

There are often repeated attributes across resources: labels, namespace, or perhaps a common prefix used for each resource.

Move into the **kustomization.yaml** file:

* the namespace
* labels and their selectors

## Overlays

Each component must have 2 overlays :

*staging*, which use base with path:

```yaml
---
kind: Kustomization
apiVersion: kustomize.config.k8s.io/v1beta1
bases:
- ../../base
```

*remote*, which use remote base:

```yaml
---
kind: Kustomization
apiVersion: kustomize.config.k8s.io/v1beta1
bases:
- git@github.com:nlamirault/manifests.git//resources/logging/elasticsearch/base?ref=v0.8.0
```