package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to all Kubernetes resources
deny contains msg if {
	not input.metadata.labels["app.kubernetes.io/name"]
	not input.metadata.labels["app.kubernetes.io/instance"]
	not input.metadata.labels["app.kubernetes.io/version"]
	not input.metadata.labels["app.kubernetes.io/component"]
	not input.metadata.labels["app.kubernetes.io/part-of"]
	not input.metadata.labels["app.kubernetes.io/managed-by"]

	details := {
		"issue": "All defined resources must include Kubernetes recommended labels.",
		"suggestion": "Add labels: https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/",
	}
	msg := sprintf("Resource '%s': %s %s", [name, details.issue, details.suggestion])
}
