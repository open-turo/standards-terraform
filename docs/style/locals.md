## Locals & Data

## Hardcoded values

Please store hardcoded values as local variables with appropriate names

### Do this

```hcl
locals {
  segment_aws_identifier = "arn:aws:iam::107630771604:user/s3-copy" # Segment AWS account
}

principals {
  type        = "AWS"
  identifiers = [local.segment_aws_identifier]
}
```

### Not this

```hcl
principals {
  type        = "AWS"
  identifiers = ["arn:aws:iam::107630771604:user/s3-copy"]
}
```
