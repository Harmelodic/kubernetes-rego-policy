package main_test

import data.main
import rego.v1

test_pod_template if {
	main.deny with input as parse_config_file("../cases/pod-template.yaml")
}
