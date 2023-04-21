# Versioning

We have the following guidance for versioning within our repositories.

## Lock files

We check in lock files for all our projects. This is to ensure that we are all using the same versions of
dependencies.This is especially important for our libraries, as we want to ensure that the version of a library that we
are using is the same version that our consumers are using.

We lock two platform:

1. `linux_amd64` for our CI & Terraform Cloud agent platform
2. `darwin_amd64` for our local development platform -- note that `arm` support is not consistent enough for us to use
   that for local development. That may change in the future.

Locking can be performed with the following command:

```hcl
terraform -chdir = "$TERRAFORM_DIR" providers lock -platform = darwin_amd64 -platform = linux_amd64
```

Where `$TERRAFORM_DIR` is the directory containing the Terraform code.

## Provider Version Constraints

Here are the conventions we use when specifying the version of a given Terraform provider. The thought is that by having
only minimum versions specified in our Terraform modules, we can update the provider version in a Terraform workspace
without having to release new versions of our Terraform modules.

In general, when using version constraint pinning syntax, pin to the major version. e.g. `version = "~> 3.5"`.

`version = ">= 5.0.0, <6.0.0"`

See here for details for how Terraform interprets version constraints.

## Terraform Workspaces

Use major version pinning here. Use the ~> syntax to allow the rightmost version number to vary as new provider releases
become available. e.g. `version = "~> 3.5"` which indicates any version is acceptable from the `3.x` series, as long as the
version is `3.5` or higher.

## Terraform Modules

Use the `>=` syntax to allow the version specified to be a minimum. e.g. `version = ">= 3.5.0"` which indicates version
`3.5.0` or later, including `3.6`, `4.0`, etc.

This is true unless we know that the module will not be compatible with a future version of the provider.

## Tests within Terraform Modules

Use major version pinning here. Use the `~>` syntax to allow the rightmost version number to vary as new provider releases
become available. e.g. `version = "~> 3.5"` which indicates any version is acceptable from the `3.x` series, as long as the
version is `3.5` or higher.

## CI Validation

We expect that repos will perform the following linting steps during the pre-commit and CI process.

```hcl
  - repo: https://github.com/antonbabenko/pre-commit-terraform
    rev: v1.77.1
    hooks:
      - id: terraform_providers_lock
        stages: [commit]
        args:
          - --args=-platform=darwin_amd64
          - --args=-platform=linux_amd64
```
