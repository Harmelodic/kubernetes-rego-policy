package main

import rego.v1

# Policy applicable to kind: Deployment

name := input.metadata.name

deny contains msg if {
    input.kind == "Deployment"
    input.spec.replicas < 1

    msg = sprintf("Deployment '%s' must have at least 1 replica.", [name])
}

deny contains msg if {
    input.kind == "Deployment"
    input.spec.strategy.type != "RollingUpdate"

    msg = sprintf("Deployment '%s' must have RollingUpdate strategy type for zero down-time rollouts.", [name])
}

deny contains msg if {
	input.kind == "Deployment"
	not input.spec.template.spec.securityContext.runAsNonRoot

	msg = sprintf("Deployment '%s' must have pod security context configured to run as non root.", [name])
}
