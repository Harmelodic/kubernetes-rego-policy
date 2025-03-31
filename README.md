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
