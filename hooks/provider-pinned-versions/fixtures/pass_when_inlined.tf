terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = { source  = "hashicorp/aws", version = "5.90.0" }
    cyral = { source  = "cyralinc/cyral", version = "4.16.2" }
  }
}
