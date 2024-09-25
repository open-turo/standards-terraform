# Resource Tagging Conventions

Reference
https://docs.aws.amazon.com/whitepapers/latest/establishing-your-cloud-foundation-on-aws/tagging-standards.html
https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html
https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/what-are-tags.html

## Standard Default Tags

These are the standard default tags that are created and expected through our metadata module.
Standard default tags are proper case and allow us to be visualized in the AWS console better.

- Component
- Contact
- Description
- Domain
- Environments
- Organization
- System
- Team

## General Convention For New Tags

For tags that are not the standard default tags, use the following convention:

1. Use kebab case follow by colon

Example:

```aws
backup:required = true
backup:enabled = true

pii = true
pii:description = some description
pii:contact-team = platform
pii:contact = bpham@bpham.com
```

## Tagging Dictionary
