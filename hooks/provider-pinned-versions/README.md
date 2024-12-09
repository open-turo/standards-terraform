# Provider Pinned Versions Hook

This hook validates that all providers under the `required_providers` block of a Terraform configuration file have a pinned version.

## Usage

### cli

```bash
pre-commit run provider-pinned-versions --all-files
```

### pre-commit config

```yaml
repos:
  - repo: https://github.com/open-turo/standards-terraform
    hooks:
      - id: provider-pinned-versions
        files: ^terraform.tf$
```

## Examples of supported configurations

### Standard pinned version

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.40.0"
    }
  }
}
```

### Pre-release version

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.41.0-beta1"
    }
  }
}
```

## Examples of unsupported configurations

### Version constraints

If the version contains any of the following constraint characters, `!~><`, the hook will fail.

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 3.40.0"
    }
  }
}
```

```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.40.0"
    }
  }
}
```
