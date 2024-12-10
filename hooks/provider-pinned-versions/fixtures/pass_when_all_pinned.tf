terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
    cyral = {
      source  = "cyralinc/cyral"
      version = "4.14.1"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.67"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.52.1"
    }
  }
}
