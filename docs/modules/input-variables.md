# Module: Input Variables

All module input variables **MUST** be in files named either `variables.tf` or `variables.<function>.tf`.

Developers **MAY** group variables into files by function. For example, if a module has variables that are used for logging,
the developer **MAY** choose to group those variables in a file named `variables.logging.tf`.

When module is to be sourced from outside the current GitHub repo, its variables **MUST** have a description.

When variables are expected to be used as inputs to other modules, developers **SHOULD** attempt to structure them in a
