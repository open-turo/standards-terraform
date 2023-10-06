# Changes & Updates to the Standards

Our development standards and best practices are always evolving. This repository is the source of truth for the
standards and best practices we use at Turo. This document is a changelog of the changes and updates to the standards as
well as the toll that we use the make these changes.

If you have a suggestion for a change or update to the standards, please open an issue in this repository.

Changes are managed through pull requests and merged using
the [Rebase & Merge](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-request-merges#rebase-and-merge-your-pull-request-commits)
workflow.

## Guidelines for changes

At Turo we believe in convention & prior art over configuration and bespoke creations. To that end, we try to base our
standards and practices off of industry standards and best practices. When making changes to the standards or
substantial existing prior art.

We use this document to allow us:

- To clarify how an existing standard might be applied
- To extend an existing pattern where we see a need -- for example: allowing for splitting `variables.tf` into
  multiple `variables.<function>.tf` files.
- To define best practices where we have found no prior examples or subtantial prior art

In general, if you are proposing a new change we hope that the change is based on prior art and that you can provide
examples of how the change is being used in the industry.

## Conventional Commits

The following table describes the meaning of our conventional commits within this standards repository. Our end goal
is that the version of these standards roughly track with the standards, not the implementation of those standards.
Implementation being the specific text and/or checks to enforce standars and policies. In those cases, a `fix` is enough
to ensure a new version of the standards is released but not that the actual standards have meaningfully changed.

| type     | creates release | description                                                                                    |
| -------- | --------------- | ---------------------------------------------------------------------------------------------- |
| feat     | yes             | Adding a new standard (Adding checks for standards IS NOT a `feat`)                            |
| fix      | yes             | Modifying/improving an existing standard or adding/modifying checks for any existing standard  |
| test     | no              | Modifying only test resources or the actual tests                                              |
| docs     | no              | Changes to documentation - either descriptions & comments in `tf` files or in other docs files |
| chore    | no              | Other changes that don't modify src or test files - modifying scripts                          |
| ci       | no              | Changes to continuous integration - GHA workflows                                              |
| refactor | no              | Changes which do not affect the public behavior                                                |
| revert   | no              | Permanently revert a change                                                                    |
| style    | no              | Changes due to code style, whitespace, or documentation linting                                |
| build    | no              | Do not use - build is unused with terraform workspaces                                         |
| perf     | no              | Do not use                                                                                     |

## Folder Structure

Folders should be used to create clean groupings. Each folder should contain a `README.md` that summarizes the folder's
contents and provides links to any relevant documentation.
