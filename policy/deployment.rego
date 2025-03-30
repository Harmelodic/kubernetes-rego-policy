package main

import rego.v1

# Policy applicable to kind: Deployment

name := input.metadata.name

deny contains msg if {
    input.kind == "Deployment"
    input.spec.replicas < 1

    msg = sprintf("Deployment '%s': If spec.replicas is defined, it must be set to 1 or more", [name])
}

deny contains msg if {
    input.kind == "Deployment"
    input.spec.strategy.type != "RollingUpdate"

    msg = sprintf("Deployment '%s': If spec.strategy.type is defined, it must be set to 'RollingUpdate' for zero downtime updates. Default is 'RollingUpdate'.", [name])
}

deny contains msg if {
	input.kind == "Deployment"
	not input.spec.template.spec.securityContext.runAsNonRoot

	msg = sprintf("Deployment '%s': spec.template.spec.securityContext.runAsNonRoot must be defined, and set to true.", [name])
}
