package main

import rego.v1

# Policy applicable to all Kubernetes resources

name := input.metadata.name

# Labels as recommended here: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels
all_recommended_labels if {
	input.metadata.labels["app.kubernetes.io/name"]
	input.metadata.labels["app.kubernetes.io/instance"]
	input.metadata.labels["app.kubernetes.io/version"]
	input.metadata.labels["app.kubernetes.io/component"]
	input.metadata.labels["app.kubernetes.io/part-of"]
	input.metadata.labels["app.kubernetes.io/managed-by"]
}

deny contains msg if {
	not all_recommended_labels
	msg = sprintf(
	    "%s '%s': All defined resources must include Kubernetes recommended labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/#labels",
	    [input.kind, name]
	)
}
