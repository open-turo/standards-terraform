terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">=2, <3"
    }
  }
}
