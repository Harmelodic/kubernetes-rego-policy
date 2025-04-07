package main

import rego.v1

# Policy applicable to kind: PodTemplate

name := input.metadata.name

deny contains msg if {
    input.kind == "PodTemplate"

    msg = sprintf("PodTemplate '%s': PodTemplate resources must not be defined manually. Use a controller (e.g Deployment) and define a PodTemplate for a Pod.", [name])
}
