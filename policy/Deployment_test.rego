package main_test

import data.main
import rego.v1

test_allow_deployment if {
	count(main.deny) == 0 with input as parse_config_file("../cases/deployment-good.yaml")
}

test_replicas_less_than_one if {
	main.deny with input as parse_config_file("../cases/deployment-replicas-less-than-one.yaml")
}

test_strategy_not_rolling_update if {
	main.deny with input as parse_config_file("../cases/deployment-strategy-not-rolling-update.yaml")
}

test_max_unavailable_equal_to_default_replicas if {
	main.deny with input as parse_config_file("../cases/deployment-max-unavailable-equal-to-default-replicas.yaml")
}

test_max_unavailable_greater_than_default_replicas if {
	main.deny with input as parse_config_file("../cases/deployment-max-unavailable-greater-than-default-replicas.yaml")
}

test_max_unavailable_equal_to_replicas if {
	main.deny with input as parse_config_file("../cases/deployment-max-unavailable-equal-to-replicas.yaml")
}

test_max_unavailable_greater_than_replicas if {
	main.deny with input as parse_config_file("../cases/deployment-max-unavailable-greater-than-replicas.yaml")
}

test_with_pod_template_name if {
	main.deny with input as parse_config_file("../cases/deployment-pod-template-name.yaml")
}

test_with_pod_template_generate_name if {
	main.deny with input as parse_config_file("../cases/deployment-pod-template-generate-name.yaml")
}

test_with_pod_template_namespace if {
	main.deny with input as parse_config_file("../cases/deployment-pod-template-namespace.yaml")
}

test_with_pod_template_annotations if {
	main.deny with input as parse_config_file("../cases/deployment-pod-template-annotations.yaml")
}

test_with_pod_security_context_run_as_root if {
	main.deny with input as parse_config_file("../cases/deployment-pod-security-context-run-as-root.yaml")
}

test_with_pod_security_context_no_run_as_non_root if {
	main.deny with input as parse_config_file("../cases/deployment-pod-security-context-no-run-as-non-root.yaml")
}
