package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to kind "Pod"
deny contains msg if {
	input.kind == "Pod"

	details := {
		"issue": "Pod resources must not be defined manually.",
		"suggestion": "Use a controller (e.g Deployment) to manage Pods.",
	}
	msg := sprintf("Pod '%s': %s %s", [name, details.issue, details.suggestion])
}
