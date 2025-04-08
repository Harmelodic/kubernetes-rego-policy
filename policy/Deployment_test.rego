package main_test

import data.main
import rego.v1

test_allow_deployment if {
	count(main.deny) == 0 with input as example_deployment
}

example_deployment := {
	"apiVersion": "apps/v1",
	"kind": "Deployment",
	"metadata": {
		"name": "test-input",
		"labels": {
			"app.kubernetes.io/name": "test-input",
			"app.kubernetes.io/instance": "test-input-1",
			"app.kubernetes.io/version": "1.0.0",
			"app.kubernetes.io/component": "deployment",
			"app.kubernetes.io/part-of": "test-input-system",
			"app.kubernetes.io/managed-by": "kustomize",
		},
	},
	"spec": {
		"replicas": 3,
		"selector": {"matchLabels": {
			"app.kubernetes.io/name": "test-input",
			"app.kubernetes.io/instance": "test-input-1",
			"app.kubernetes.io/version": "1.0.0",
			"app.kubernetes.io/component": "deployment",
			"app.kubernetes.io/part-of": "test-input-system",
			"app.kubernetes.io/managed-by": "kustomize",
		}},
		"strategy": {
			"type": "RollingUpdate",
			"rollingUpdate": {
				"maxSurge": 1,
				"maxUnavailable": 0,
			},
		},
		"template": {
			"metadata": {"labels": {
				"app.kubernetes.io/name": "test-input",
				"app.kubernetes.io/instance": "test-input-1",
				"app.kubernetes.io/version": "1.0.0",
				"app.kubernetes.io/component": "deployment",
				"app.kubernetes.io/part-of": "test-input-system",
				"app.kubernetes.io/managed-by": "kustomize",
			}},
			"spec": {
				"serviceAccountName": "test-input",
				"securityContext": {
					"secompProfile": {"type": "RuntimeDefault"},
					"runAsNonRoot": true,
					"runAsUser": 1000,
					"runAsGroup": 3000,
					"fsGroup": 2000,
				},
				"containers": [{
					"name": "test-input",
					"image": "test-input:v1",
					"imagePullPolicy": "Always",
					"ports": [
						{
							"name": "http",
							"containerPort": 8080,
						},
						{
							"name": "http-management",
							"containerPort": 8081,
						},
					],
					"resources": {
						"requests": {
							"cpu": "500m",
							"memory": "0.25Gi",
						},
						"limits": {"memory": "0.25Gi"},
					},
					"startupProbe": {
						"initialDelaySeconds": 20,
						"periodSeconds": 10,
						"failureThreshold": 10,
						"httpGet": {
							"path": "/actuator/health/liveness",
							"port": "http-management",
						},
					},
					"readinessProbe": {
						"periodSeconds": 10,
						"failureThreshold": 10,
						"httpGet": {
							"path": "/actuator/health/readiness",
							"port": "http-management",
						},
					},
					"livenessProbe": {
						"periodSeconds": 10,
						"failureThreshold": 10,
						"httpGet": {
							"path": "/actuator/health/liveness",
							"port": "http-management",
						},
					},
					"securityContext": {
						"allowPrivilegeEscalation": false,
						"privileged": false,
						"readOnlyRootFilesystem": true,
						"capabilities": {"drop": ["ALL"]},
					},
				}],
			},
		},
	},
}
