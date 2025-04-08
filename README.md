# kubernetes-rego-policy

Policy for linting Kubernetes resources.

Compatible with [Conftest](https://www.conftest.dev) (should therefore be compatible with OPA, but untested).

Currently only lints for a small subset of Kubernetes resources. Over time, I hope it covers everything.

## Use with Conftest

Pull the policy from GitHub (which copies the policy into `policy/`, the default directory used by Conftest):

```bash
conftest pull git::https://github.com/Harmelodic/kubernetes-rego-policy.git//policy
```

Then use Conftest to validate your resources against your policy:

```bash
conftest test path/to/resource.yaml
```

Or if you use Kustomize, test all resources in the Kustomization with:

```bash
kustomize build path/to/kustomization | conftest test -
```

## Supported Resources

Unsupported resources will eventually be supported.

| SUPPORTED?   | KIND                             | API VERSION                     | NAMESPACED |
|--------------|----------------------------------|---------------------------------|------------|
|              | APIService                       | apiregistration.k8s.io/v1       | false      |
| Yes          | Binding                          | v1                              | true       |
|              | CertificateSigningRequest        | certificates.k8s.io/v1          | false      |
|              | ClusterRoleBinding               | rbac.authorization.k8s.io/v1    | false      |
|              | ClusterRole                      | rbac.authorization.k8s.io/v1    | false      |
|              | ComponentStatus                  | v1                              | false      |
|              | ConfigMap                        | v1                              | true       |
|              | ControllerRevision               | apps/v1                         | true       |
|              | CronJob                          | batch/v1                        | true       |
|              | CSIDriver                        | storage.k8s.io/v1               | false      |
|              | CSINode                          | storage.k8s.io/v1               | false      |
|              | CSIStorageCapacity               | storage.k8s.io/v1               | true       |
|              | CustomResourceDefinition         | apiextensions.k8s.io/v1         | false      |
|              | DaemonSet                        | apps/v1                         | true       |
| Yes          | Deployment                       | apps/v1                         | true       |
| Yes          | Endpoints                        | v1                              | true       |
|              | EndpointSlice                    | discovery.k8s.io/v1             | true       |
|              | Event                            | v1                              | true       |
|              | Event                            | events.k8s.io/v1                | true       |
|              | FlowSchema                       | flowcontrol.apiserver.k8s.io/v1 | false      |
|              | HorizontalPodAutoscaler          | autoscaling/v2                  | true       |
|              | IngressClass                     | networking.k8s.io/v1            | false      |
|              | Ingress                          | networking.k8s.io/v1            | true       |
| Yes          | Job                              | batch/v1                        | true       |
|              | Lease                            | coordination.k8s.io/v1          | true       |
|              | LimitRange                       | v1                              | true       |
|              | LocalSubjectAccessReview         | authorization.k8s.io/v1         | true       |
|              | MutatingWebhookConfiguration     | admissionregistration.k8s.io/v1 | false      |
|              | Namespace                        | v1                              | false      |
|              | NetworkPolicy                    | networking.k8s.io/v1            | true       |
|              | Node                             | v1                              | false      |
|              | PersistentVolumeClaim            | v1                              | true       |
|              | PersistentVolume                 | v1                              | false      |
|              | PodDisruptionBudget              | policy/v1                       | true       |
| Yes (don't!) | Pod                              | v1                              | true       |
| Yes (don't!) | PodTemplate                      | v1                              | true       |
|              | PriorityClass                    | scheduling.k8s.io/v1            | false      |
|              | PriorityLevelConfiguration       | flowcontrol.apiserver.k8s.io/v1 | false      |
| Yes (don't!) | ReplicaSet                       | apps/v1                         | true       |
|              | ReplicationController            | v1                              | true       |
|              | ResourceQuota                    | v1                              | true       |
|              | RoleBinding                      | rbac.authorization.k8s.io/v1    | true       |
|              | Role                             | rbac.authorization.k8s.io/v1    | true       |
|              | RuntimeClass                     | node.k8s.io/v1                  | false      |
|              | Secret                           | v1                              | true       |
|              | SelfSubjectAccessReview          | authorization.k8s.io/v1         | false      |
|              | SelfSubjectReview                | authentication.k8s.io/v1        | false      |
|              | SelfSubjectRulesReview           | authorization.k8s.io/v1         | false      |
|              | ServiceAccount                   | v1                              | true       |
| Yes          | Service                          | v1                              | true       |
|              | StatefulSet                      | apps/v1                         | true       |
|              | StorageClass                     | storage.k8s.io/v1               | false      |
|              | SubjectAccessReview              | authorization.k8s.io/v1         | false      |
|              | TokenReview                      | authentication.k8s.io/v1        | false      |
|              | ValidatingAdmissionPolicy        | admissionregistration.k8s.io/v1 | false      |
|              | ValidatingAdmissionPolicyBinding | admissionregistration.k8s.io/v1 | false      |
|              | ValidatingWebhookConfiguration   | admissionregistration.k8s.io/v1 | false      |
|              | VolumeAttachment                 | storage.k8s.io/v1               | false      |

This list generated by running the following command on a "kind" Kubernetes cluster:

```bash
kubectl api-resources --sort-by=name
```
