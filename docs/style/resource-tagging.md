# Resource Tagging Conventions

## Standard Default Tags

These are the default standard tags that are created and expected through our metadata module. Standard default tags are always proper case and allow them to be visualized in the AWS console.

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
2. Use lowercase for all the words
3. Use `:` to help identify that the resource is associated with the prefix
4. Should not contain any personal identifiable information (PII)

Example:

```aws
backup:required = true
backup:enabled = true

pii = true
pii:description = some description
pii:contact-team = platform
pii:contact = bpham@bpham.com
```

## Reference

- [What Are Tags?](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/what-are-tags.html)
- [Tagging Best Practices](https://docs.aws.amazon.com/whitepapers/latest/tagging-best-practices/tagging-best-practices.html)
- [Tagging Standards](https://docs.aws.amazon.com/whitepapers/latest/establishing-your-cloud-foundation-on-aws/tagging-standards.html)
