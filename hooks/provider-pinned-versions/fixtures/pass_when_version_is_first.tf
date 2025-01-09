terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      version = "5.82.2"
      source  = "hashicorp/aws"
    }
    cyral = {
      source  = "cyralinc/cyral"
      version = "4.16.1"
    }
  }
}
