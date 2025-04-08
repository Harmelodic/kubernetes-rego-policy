package main_test

import data.main
import rego.v1

test_allow_deployment if {
	count(main.deny) == 0 with input as parse_config_file("../test-resources/good-deployment.yaml")
}
