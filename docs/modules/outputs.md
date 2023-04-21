# Module: Outputs

All module outputs **MUST** be in files named either `outputs.tf` or `outputs.<function>.tf`.

Developer **MAY** choose to group outputs by function. For example, if a module has outputs that are used for logging,
the developer **MAY** choose to group those outputs in a file named `outputs.logging.tf`.

When module is to be sourced from outside the current GitHub repo, its outputs **MUST** have a description.

When outputs are expected to be used as inputs to other modules, developers **SHOULD** attempt to structure them in a
way that makes it easy to understand what the output is and how it should be used and can easily be used as an input to
another module.
