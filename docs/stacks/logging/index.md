# Logging

These components are going to be deployed in `logging` namespace
in your Kubernetes cluster.

## EFK

You could deploy the Logging stack like that :

First install CRD:

* [elastic operator CRDs](elastic-operator-crds.md)

Then the operator :

* [elastic operator](elastic-operator.md)

Then operated components :

* [elasticsearch](elasticsearch.md)
* [kibana](kibana.md)

And choose component to retrieve logs :

* [filebeat](filebeat.md)
* [fluentd](fluentd.md)

## PLG

You could deploy the Logging stack like that :

* [promtail](promtail.md) to retrieve logs
* [loki](loki.md)
* [grafana](../monitoring/grafana.md)

<aside class="note warning">

<h1>Note</h1>

Grafana will be deployed in the `monitoring` namespace

</aside>
