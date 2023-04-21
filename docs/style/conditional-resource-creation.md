# Conditional Resource Creation

When you have to create a resource conditionally based on a boolean or some other binary value, opt for the count
control block for most cases. The most cases here mean, a simple conditional creation of an isolated resource which may
have just one or two references as inputs for other resources for example

```hcl
# example for using count block for conditionally creating a resource
data "aws_iam_policy_document" "this" {
  count = local.iam_role_enabled ? 1 : 0

  statement {
    configurations = "..."
  }
}

resource "aws_iam_policy" "this" {
  name        = var.name
  path        = "/"
  description = "IAM policy for..."
  policy      = data.aws_iam_policy_document.this[0].json
  tags        = var.tags
}

```

Avoid count block if you have multiple resources created using the same binary condition and in such cases favor
for_each block (or even better consider modularizing the portion of resources that are conditionally created using the
same binary value)

```hcl
# example for_each use case where multiple resources are dependant on one single
# binary condition and chain referenced using the same key consistently across. If
# we had used count block, the references then would have to have used indexes which
# are hard to understand.

locals {
  iam_resources = toset(var.iam_role_enabled ? ["resource_name"] : [])
}

data "aws_kms_key" "this" {
  for_each = iam_resources

  key_id = var.kms_key_id
}

data "aws_iam_policy_document" "this" {
  for_each iam_resources

  statement {
    sid       = "statement identifier..."
    effect    = "Allow"
    actions   = ["kms:Decrypt"]
    resources = [data.aws_kms_key.this[each.key].arn]
  }
}

resource "aws_iam_policy" "this" {
  for_each = iam_resources

  name        = var.name
  path        = "/"
  description = "IAM policy for..."
  policy      = data.aws_iam_policy_document.this[
  each.key
  ].json

  tags = var.tags
}

```

One more thing to consider is before going with one of the above solution is to check whether we can group the
conditionally created resources together as an internal module. Are there enough resources that are related to each
other and created using the same binary condition/check? If we go with the option to create an internal module, the
whole of it is instantiated behind the one binary condition and each individual resource in it don’t have to be guarded
with the checks. If the module is enabled, the whole group of resources under it are created. If the module is not
enabled none are created. In this scenario, go with count block for enabling or disabling the module. for_each is not
preferred for the module since we are dealing with one single place to enable/disable the creation and count is easier
to comprehend.

```hcl
# assuming all of the iam related resources from the example above is changed into
# an internal module named "iam_role" (with a directory named "iam_role"), here is
# an example of enabling the module. The resources that make up this module don't
# specify the conditional check individually.

module "iam_role" {
  source = "./iam-role"

  count = local.iam_role_enabled ? 1 : 0

  configuration = "..."
  tags          = local.tags
}
```
