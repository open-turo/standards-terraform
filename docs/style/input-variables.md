# Input Variables

If an input variable needs to be defined as null or emtpy:

- prefer using a `nullable` variable with a default value of `null`
- if a `nullable` variable is not possible, use a `string` variable with a default value of `""` and add an explanation why.

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
