package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to kind "Endpoints"
deny contains msg if {
	input.kind == "Endpoints"

	details := {
		"issue": "Endpoints resources must not be defined manually.",
		"suggestion": "Use a Service.",
	}
	msg := sprintf("Endpoints '%s': %s %s", [name, details.issue, details.suggestion])
}
