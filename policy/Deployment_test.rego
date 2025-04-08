package main_test

import data.main
import rego.v1

test_allow_deployment if {
	count(main.deny) == 0 with input as parse_config_file("../test-resources/deployment-good.yaml")
}

test_replicas_less_than_one if {
	main.deny with input as parse_config_file("../test-resources/deployment-replicas-less-than-one.yaml")
}
