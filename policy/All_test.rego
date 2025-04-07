package main_test

import data.main
import rego.v1

test_allow_labels if {
	count(main.deny) == 0 with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/part-of": "thing-system",
				"app.kubernetes.io/managed-by": "kustomize",
			},
		},
	}
}

test_missing_label_name if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/part-of": "thing-system",
				"app.kubernetes.io/managed-by": "kustomize",
			},
		},
	}
}

test_missing_label_instance if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/part-of": "thing-system",
				"app.kubernetes.io/managed-by": "kustomize",
			},
		},
	}
}

test_missing_label_version if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/part-of": "thing-system",
				"app.kubernetes.io/managed-by": "kustomize",
			},
		},
	}
}

test_missing_label_component if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/part-of": "thing-system",
				"app.kubernetes.io/managed-by": "kustomize",
			},
		},
	}
}

test_missing_label_part_of if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/managed-by": "kustomize",
			},
		},
	}
}

test_missing_label_managed_by if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/part-of": "thing-system",
			},
		},
	}
}

test_missing_label_multiple if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {
			"name": "test_input",
			"labels": {
				"app.kubernetes.io/name": "thing",
				"app.kubernetes.io/instance": "thing-1",
				"app.kubernetes.io/version": "1.0.0",
			},
		},
	}
}

test_missing_label_all if {
	main.deny with input as {
		"kind": "TestAny",
		"metadata": {"name": "test_input"},
	}
}
