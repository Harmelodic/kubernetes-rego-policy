# kubernetes-rego-policy

Policy for testing Kubernetes resources.

Compatible with [Conftest](https://www.conftest.dev).

## Run with Conftest locally

Assuming you have this repo next to your project in a directory structure, like so:

> code/
>   kubernetes-rego-policy/
>   your-project/

In `your-project` run:

```bash
conftest test --policy ../kubernetes-rego-policy/policy path/to/your/resource.yaml
```

Or if you build your resources with Kustomize:

```bash
kustomize build path/to/kustomization | conftest test --policy ../kubernetes-rego-policy/policy -
```

## Pull with Conftest

```bash
conftest pull git::https://github.com/Harmelodic/kubernetes-rego-policy.git//policy
```
