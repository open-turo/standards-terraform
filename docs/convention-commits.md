# Conventional Commit message structure

Commit messages are expected to follow the conventional-commit standards as defined
by [conventionalcommits.org](https://www.conventionalcommits.org/en/v1.0.0/).

Terraform is not exactly `code` so the meaning of `fix` and `feat` are slightly different than in a code repository.
This is expressed in the tables below.

### Terraform workspaces

The following table describes the meaning of our conventional commits within the usage of a Terraform workspace.

| Type     | Release?               | Description                                                                             |
| -------- | ---------------------- | --------------------------------------------------------------------------------------- |
| feat     | :white-check-mark: yes | Adding resources                                                                        |
| fix      | :white-check-mark: yes | Modifying an existing resource                                                          |
| docs     | :x: no                 | Changes to documentation - both markdown files and comments                             |
| chore    | :x: no                 | Changes that don't modify resource or test files - modifying scripts, repository config |
| ci       | :x: no                 | Changes to continuous integration - GHA workflows                                       |
| refactor | :x: no                 | Changes which do not affect the public behavior                                         |
| revert   | :x: no                 | Permanently revert a change                                                             |
| style    | :x: no                 | Changes due to code style, whitespace, or documentation linting                         |
| build    | :x: no                 | Do not use - build is unused with terraform workspaces                                  |
| perf     | :x: no                 | Do not use                                                                              |
| test     | :x: no                 | Do not use - workspaces do not have tests                                               |

#### Removing resources

When removing a resource, you can choose whether or not you want it to be a `feat` or `fix`. This is a judgement call
based on the size and scope of the change.

- **fix** – When you are removing an unused and easily re-creatable or recoverable resource with no state
  the change would be considered a fix. For example: removing an unused security group or IAM role.
- **feat** – When you are removing a resource that has state where recreation would be substantial. For example:
  removing an RDS instance.

#### Scope

- _may_ be `environment` when changes apply to one environment
- _may_ be the type of file changed for chores (for example script or workflow)

#### Breaking change

A breaking change may be used to call out substantial changes that others might want to be made aware of.

This is particularly important if there are other, external dependencies to the workspace - such as remote state - which
require other workspaces to be updated in sync.

### Terraform modules

The following table describes the meaning of our conventional commits within the usage of a Terraform workspace.

| type     | creates release | description                                                                                    |
| -------- | --------------- | ---------------------------------------------------------------------------------------------- |
| feat     | yes             | Adding new functionality and/or resources                                                      |
| fix      | yes             | Modifying an existing resource or functionality                                                |
| test     | no              | Modifying only test resources or the actual tests                                              |
| docs     | no              | Changes to documentation - either descriptions & comments in `tf` files or in other docs files |
| chore    | no              | Other changes that don't modify src or test files - modifying scripts                          |
| ci       | no              | Changes to continuous integration - GHA workflows                                              |
| refactor | no              | Changes which do not affect the public behavior                                                |
| revert   | no              | Permanently revert a change                                                                    |
| style    | no              | Changes due to code style, whitespace, or documentation linting                                |
| build    | no              | Do not use - build is unused with terraform workspaces                                         |
| perf     | no              | Do not use                                                                                     |

#### Removing resources

When removing a resource, you can choose whether or not you want it to be a `feat` or `fix`. This is a judgement call
based on the size and scope of the change.

- **fix** – When you are removing an unused and easily re-creatable or recoverable resource with no state
  the change would be considered a fix. For example: removing an unused security group or IAM role.
- **feat** – When you are removing a resource that has state where recreation would be substantial. For example:
  removing an RDS instance.

#### Breaking change

This must be specified if the change will break any current usages of the module.

This is best implemented through deprecation first to add new/replacement functionality followed up with remove of the
now unused functionality.

When creating a breaking change - you MUST include a markdown document in the `docs/breaking-changes` directory. It
should be named `v<version>.md` where `<version>` is the new/breakign version. This document should explain the breaking
change and how to migrate to the new version.

#### Scope

Use of scope is optional. It may reflect a fucntional area or component that matches the change.
