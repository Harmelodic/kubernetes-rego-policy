package main_test

import data.main
import rego.v1

test_endpoint_slice if {
	main.deny with input as parse_config_file("../cases/endpoint-slice.yaml")
}
