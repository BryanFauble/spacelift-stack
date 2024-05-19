variable "spacelift_key_id" {
  description = "The API key ID for Spacelift"
  type        = string
}

variable "spacelift_key_secret" {
  description = "The API key secret for Spacelift"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "AWS Resource Tags"
  type        = map(string)
  default = {
    "CostCenter" = "No Program / 000000"
  }
}
