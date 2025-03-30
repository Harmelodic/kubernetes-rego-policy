package main

import rego.v1

# Policy applicable to kind: Pod

name := input.metadata.name

deny contains msg if {
    input.kind == "Pod"

    msg = sprintf("Pod '%s' has been defined. Do not manage Pods manually. Use a controller (e.g Deployment) to manage Pods.", [name])
}
