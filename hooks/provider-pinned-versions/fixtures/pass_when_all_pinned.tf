terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.11.0"
    }
    cyral = {
      source  = "cyralinc/cyral"
      version = "4.16.3"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.84"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.66.0"
    }
  }
}
