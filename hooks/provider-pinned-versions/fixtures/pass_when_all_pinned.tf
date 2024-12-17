terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
    cyral = {
      source  = "cyralinc/cyral"
      version = "4.15.0"
    }
    mysql = {
      source  = "petoju/mysql"
      version = "3.0.67"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.53.0"
    }
  }
}
