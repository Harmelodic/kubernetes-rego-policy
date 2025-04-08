package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to kind "Binding"
deny contains msg if {
	input.kind == "Binding"

	details := {
		"issue": "Binding resources must not be used - deprecated since 1.7.",
		"suggestion": "Use the bindings subresource of pods instead.",
	}
	msg := sprintf("Pod '%s': %s %s", [name, details.issue, details.suggestion])
}
