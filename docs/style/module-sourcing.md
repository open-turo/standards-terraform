# Module source

Module source **MUST** have an empty line after them to make it easy to know that they are not attributes.

If the module has a `for_each` or `count` the source **MUST** be the first attribute and there should be a newline
between the source and the `for_each`/`count` and that control statement **MUST** have a newline after it.

```hcl
module "wrapper" {
  source = "../"

  for_each = var.items

  create_bucket = try(each.value.create_bucket, var.defaults.create_bucket, true)
}
```
