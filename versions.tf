terraform {
  required_providers {
    spotinst = {
      source  = "spotinst/spotinst"
      version = "1.171.1" # Specify the version you wish to use
    }
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.13.0"
    }
  }
  backend "s3" {
    bucket = "bfauble-testing-terraform-bucket"
    key    = "."
    region = "us-east-1"
  }
}
