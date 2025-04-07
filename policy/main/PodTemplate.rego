package main

import rego.v1

# Policy applicable to kind: PodTemplate

name := input.metadata.name

deny contains msg if {
	input.kind == "PodTemplate"

	details := {
		"issue": "PodTemplate resources must not be defined manually.",
		"suggestion": "Use a controller (e.g Deployment) and define a PodTemplate for a Pod.",
	}
	msg := sprintf("PodTemplate '%s': %s %s", [name, details.issue, details.suggestion])
}
