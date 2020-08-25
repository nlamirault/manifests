# Monitoring

These components are going to be deployed in `monitoring` namespace
in your Kubernetes cluster.

You could deploy the Monitoring Stack like that :

First install CRD:

* [Prometheus Operator CRDs](prometheus-operator-crds.md)

Then the operator :

* [Prometheus Operator](prometheus-operator.md)

Then operated components :

* [Prometheus-Thanos](prometheus-thanos.md)
* [Thanos](thanos.md)
* [Alertmanager](alertmanager.md)

Then install components for virtual machines and Kubernetes :

* [NodeExporter](node-exporter.md)
* [KubeStateMetrics](kube-state-metrics.md)

And :

* [kube-monitors-aks](kube-monitors-aks.md) for AKS cluster
* [kube-monitors-eks](kube-monitors-eks.md) for EKS cluster
* [kube-monitors-gke](kube-monitors-gke.md) for GKE cluster
* [kube-monitors-k3s](kube-monitors-k3s.md) for K3S cluster
