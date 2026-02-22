terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      version = "6.33.0"
      source  = "hashicorp/aws"
    }
    cyral = {
      source  = "cyralinc/cyral"
      version = "4.16.3"
    }
  }
}
