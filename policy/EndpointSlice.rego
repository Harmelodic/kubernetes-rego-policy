package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to kind "EndpointSlice"
deny contains msg if {
	input.kind == "EndpointSlice"

	details := {
		"issue": "EndpointSlice resources must not be defined manually.",
		"suggestion": "Use a Service.",
	}
	msg := sprintf("EndpointSlice '%s': %s %s", [name, details.issue, details.suggestion])
}
