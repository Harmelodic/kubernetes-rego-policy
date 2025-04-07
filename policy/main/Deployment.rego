package main

import rego.v1

# Policy applicable to kind: Deployment

name := input.metadata.name

deny contains msg if {
	input.kind == "Deployment"
	input.spec.replicas < 1

	details := {
		"issue": "spec.replicas is defined, but is set to less than 1. This will result in downtime.",
		"suggestion": "Set spec.replicas to 1 or more to ensure deployment actually has pods.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	input.spec.strategy.type != "RollingUpdate"

	details := {
		"issue": "spec.strategy.type is not set to 'RollingUpdate' for zero downtime updates.",
		"suggestion": "Set spec.strategy.type to 'RollingUpdate' (default) for zero downtime updates.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	not input.spec.replicas
	input.spec.strategy.rollingUpdate.maxUnavailable >= 1

	details := {
		"issue": "maxUnavailable >= replicas (default 1). This could result in downtime during a rolling update.",
		"suggestion": "Ensure spec.strategy.rollingUpdate.maxUnavailable is less than spec.replicas.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	input.spec.strategy.rollingUpdate.maxUnavailable >= input.spec.replicas

	details := {
		"issue": "maxUnavailable >= replicas. This could result in downtime during a rolling update.",
		"suggestion": "Ensure spec.strategy.rollingUpdate.maxUnavailable is less than spec.replicas.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	input.spec.template.metadata.name

	details := {
		"issue": "spec.template.metadata.name must not be set.",
		"suggestion": "Let the Deployment handle Pod name(s) to eliminate human error.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	input.spec.template.metadata.generateName

	details := {
		"issue": "spec.template.metadata.generateName must not be set.",
		"suggestion": "Let the Deployment handle Pod name(s) to eliminate human error.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	input.spec.template.metadata.namespace

	details := {
		"issue": "spec.template.metadata.namespace must not be set.",
		"suggestion": "Let the Deployment handle Pod namespace to eliminate human error.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	input.spec.template.metadata.annotations

	details := {
		"issue": "spec.template.metadata.annotations must not be set.",
		"suggestion": "Let the Deployment handle Pod annotation(s) to eliminate human error.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}

deny contains msg if {
	input.kind == "Deployment"
	not input.spec.template.spec.securityContext.runAsNonRoot

	details := {
		"issue": "spec.template.spec.securityContext.runAsNonRoot is not defined, or set to false.",
		"suggestion": "spec.template.spec.securityContext.runAsNonRoot must be defined and set to true.",
	}
	msg := sprintf("Deployment '%s': %s %s", [name, details.issue, details.suggestion])
}
