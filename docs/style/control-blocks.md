# Control blocks: `for_each` and `count`

Control blocks **MUST** have an empty line after them to make it easy to know that they are a control block rather than
an attribute.

```hcl
resource "aws_sns_topic_policy" "allow" {
  for_each = {for k, v in var.sns_notifications : k => v if var.create_sns_policy}

  arn    = each.value.topic_arn
  policy = data.aws_iam_policy_document.sns[each.key].json
}
```
