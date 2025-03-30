package main

import rego.v1

# Policy applicable to kind: ReplicaSet

name := input.metadata.name

deny contains msg if {
    input.kind == "ReplicaSet"

    msg = sprintf("ReplicaSet '%s': ReplicaSet resources must not be defined manually. Use a controller (e.g Deployment) to manage a ReplicaSet.", [name])
}
