provider "spacelift" {
  api_key_endpoint = "https://sagebionetworks.app.spacelift.io"
  # Running from within spacelift does not require these to be set
  # api_key_id       = var.spacelift_key_id
  # api_key_secret   = var.spacelift_key_secret
}

resource "spacelift_stack" "eks_stack_cli" {
  administrative    = true
  autodeploy        = false
  branch            = "main"
  description       = "Provisions a Kubernetes cluster"
  name              = "eks_stack_cli"
  repository        = "eks-stack"
  terraform_version = "1.5.7"
  raw_git {
    namespace = "BryanFauble"
    url       = "https://github.com/BryanFauble/eks-stack"
  }
}


resource "spacelift_aws_integration" "this" {
  name = local.role_name

  # We need to set this manually rather than referencing the role to avoid a circular dependency
  role_arn                       = local.role_arn
  generate_credentials_in_worker = false
  space_id                       = "root"
}
