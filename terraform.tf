terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      version = "~> 6.0"
      source  = "registry.terraform.io/hashicorp/aws"
    }
  }
}
