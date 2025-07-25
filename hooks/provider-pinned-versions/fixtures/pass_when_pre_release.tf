terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.5.0"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "3.64.0"
    }
  }
}
