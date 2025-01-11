terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "< 4"
    }
  }
}
