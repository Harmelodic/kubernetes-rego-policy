package main

import rego.v1

# Policy applicable to kind: Pod

name := input.metadata.name

deny contains msg if {
	input.kind == "Pod"

	details := {
		"issue": "Pod resources must not be defined manually.",
		"suggestion": "Use a controller (e.g Deployment) to manage Pods.",
	}
	msg := sprintf("Pod '%s': %s %s", [name, details.issue, details.suggestion])
}
