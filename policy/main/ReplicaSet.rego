package main

import rego.v1

# Policy applicable to kind: ReplicaSet

name := input.metadata.name

deny contains msg if {
	input.kind == "ReplicaSet"

	details := {
		"issue": "ReplicaSet resources must not be defined manually.",
		"suggestion": "Use a controller (e.g Deployment) to manage a ReplicaSet.",
	}
	msg := sprintf("ReplicaSet '%s': %s %s", [name, details.issue, details.suggestion])
}
