package main

import rego.v1

name := input.metadata.name

# METADATA
# scope: rule
# description: Policy applicable to kind "Job"
deny contains msg if {
	input.kind == "Job"

	details := {
		"issue": "Job resources must not be defined manually in config.",
		"suggestion": "Create jobs instead using a CronJob.",
	}
	msg := sprintf("Job '%s': %s %s", [name, details.issue, details.suggestion])
}
