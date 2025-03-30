package main

import rego.v1

# Policy applicable to kind: ReplicaSet

name := input.metadata.name

deny contains msg if {
    input.kind == "ReplicaSet"

    msg = sprintf("ReplicaSet '%s' has been defined. Do not manage ReplicaSets manually. Use a controller (e.g Deployment) instead.", [name])
}
