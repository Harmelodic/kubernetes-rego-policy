package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to kind "ReplicaSet"
deny contains msg if {
	input.kind == "ReplicaSet"

	details := {
		"issue": "ReplicaSet resources must not be defined manually.",
		"suggestion": "Use a controller (e.g Deployment) to manage a ReplicaSet.",
	}
	msg := sprintf("ReplicaSet '%s': %s %s", [name, details.issue, details.suggestion])
}
