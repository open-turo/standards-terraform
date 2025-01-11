terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
    cyral = {
      source  = "cyralinc/cyral"
      version = "4.16.1"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.68"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.54.0"
    }
  }
}
