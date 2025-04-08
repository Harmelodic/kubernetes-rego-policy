package main_test

import data.main
import rego.v1

test_binding if {
	main.deny with input as parse_config_file("../cases/binding.yaml")
}
