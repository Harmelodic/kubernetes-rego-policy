package main_test

import data.main
import rego.v1

test_endpoints if {
	main.deny with input as parse_config_file("../cases/endpoints.yaml")
}
