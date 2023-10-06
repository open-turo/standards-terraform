# Module: Input Variables

All module input variables **MUST** be in files named either `variables.tf` or `variables.<function>.tf`.

Developers **MAY** group variables into files by function. For example, if a module has variables that are used for
logging,
the developer **MAY** choose to group those variables in a file named `variables.logging.tf`.

When module is to be sourced from outside the current GitHub repo, its variables **MUST** have a description.

When variables are expected to be used as inputs to other modules, developers **SHOULD** attempt to structure them in a
way that can be passed through without dereferencing.

## Override variables

It is quite common to have a default behavior while providing users a way to override this behavior. When the default
behavior can be captured in the variable's default, it should be:

```hcl
variable "instance_type" {
  type        = string
  description = "Default instance type"
  default     = "t4a.medium"
}
```

Sometimes the default behavior cannot be captured in the variable's default. This often happens when the default needs
to be computed. In this case, the variable should be defined as `null` and the default behavior should be captured in
the module's locals.

Using `null` is a stronger single that the value is unset. Ensuring that all modules follow this will allow us to pass
override behaviors down to submodules without having to dereference the variables.

#### Do this:

```hcl
variable "name_override" {
  type        = string
  description = "Override the default name"
  default     = null

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.name)) || (var.name == null)
    error_message = "For the name_override, only alphanumeric characters and hyphens are allowed."
  }
}

locals {
  name = var.name_override != null ? var.name_override : some_resource.source.name
}
```

#### Not this:

```hcl
variable "name_override" {
  type        = string
  description = "Override the default name"
  default     = ""
}

locals {
  name = var.name_override != "" ? var.name_override : some_resource.source.name
}
```

## Nullable Variables

If an input variable needs to be defined as null or emtpy:

- prefer using a `nullable` variable with a default value of `null`
- if a `nullable` variable is not possible, use a `string` variable with a default value of `""` and add an explanation
  why.

Examples:

```hcl
variable "foo" {
  type        = string
  description = "This variable is a string that can be null"
  default     = null
}

variable "bar" {
  type        = string
  description = "This variable is a string that can be empty, but not null"
  nullable    = false

  # Add an explanation why this variable is not nullable
  default = ""
}
```
