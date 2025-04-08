package main_test

import data.main
import rego.v1

test_allow_labels if {
	count(main.deny) == 0 with input as parse_config_file("../cases/fake-resource-good.yaml")
}

test_missing_label_name if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-name.yaml")
}

test_missing_label_instance if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-instance.yaml")
}

test_missing_label_version if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-version.yaml")
}

test_missing_label_component if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-component.yaml")
}

test_missing_label_part_of if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-part-of.yaml")
}

test_missing_label_managed_by if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-managed-by.yaml")
}

test_missing_label_multiple if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-multiple.yaml")
}

test_missing_label_all if {
	main.deny with input as parse_config_file("../cases/fake-resource-missing-all.yaml")
}
