# Locals & Data

## Hardcoded values

Please store hardcoded values as local variables with appropriate names

### Do this

```hcl
locals {
  segment_aws_identifier = "arn:aws:iam::107630771604:user/s3-copy" # Segment AWS account
}

principals {
  type = "AWS"
  identifiers = [local.segment_aws_identifier]
}
```

### Not this

```hcl
principals {
  type = "AWS"
  identifiers = ["arn:aws:iam::107630771604:user/s3-copy"]
}
```

## Copying variables into locals

Only copy variables into locals if you are performing an operation on them, do not simply copy them for the sake of it. Simply copying variables into locals causes needless duplication and makes the code harder to read. Additionally, it often results in code completion that is not able to function as effectively.

### Do this

```hcl
locals {
  bucket_wildcard_arn = "${var.bucket_arn}/*"
}
```

### Not this

```hcl
locals {
  bucket_arn = var.bucket_arn
}
```
