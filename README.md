# kubernetes-rego-policy

Policy for linting Kubernetes resources.

Compatible with [Conftest](https://www.conftest.dev).

## Use with Conftest

Pull the policy from GitHub (which copies the policy into `policy/`, the default directory used by Conftest):

```bash
conftest pull git::https://github.com/Harmelodic/kubernetes-rego-policy.git//policy
```

Then use Conftest to validate your resources against your policy:

```bash
conftest test resources.yaml
```

Or if you build your resources with Kustomize:

```bash
kustomize build path/to/kustomization | conftest test -
```