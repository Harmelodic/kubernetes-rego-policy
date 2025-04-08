package main_test

import data.main
import rego.v1

test_replica_set if {
	main.deny with input as parse_config_file("../cases/replica-set.yaml")
}
