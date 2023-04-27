# Account setup
variable "profile" {
  description           = "The profile from ~/.aws/credentials file used for authentication. By default it is the default profile."
  type                  = string
  default               = "default"
}

variable "accountID" {
  description           = "ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role."
  type                  = string

  validation {
    condition           = length(var.accountID) == 12
    error_message       = "Please, provide a valid account ID."
  }
}

variable "region" {
  description           = "The region for the resources. By default it is eu-west-1."
  type                  = string
  default               = "eu-west-1"
}

variable "assumeRole" {
  description           = "Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration."
  type                  = bool
  default               = false
}

variable "assumableRole" {
  description           = "The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole."
  type                  = string
  default               = "OrganizationAccountAccessRole"
}

variable "name" {
  description = "Key name. Required value"
  type        = string
}

variable "key" {
  description = "Public key. Required value"
  type        = string
  default     = ""
}

variable "generate_key" {
  description = "In case you don't have a key, you can generate one."
  type        = bool
  default     = false
}

variable "private_key_algorithm" {
  description = "Key algorithm, defaults to RSA. However, ED25519 is supported too."
  type        = string
  default     = "RSA"

  validation {
    condition           = contains(["RSA", "ED25519"], var.private_key_algorithm)
    error_message       = "Expected values: RSA, ED25519."
  }
}

variable "private_key_bits" {
  description = "Size of the generated RSA key, in bits. Defaults to 4096."
  type        = number
  default     = 4096

  validation {
    condition           = contains([512, 1024, 2048, 4096], var.private_key_bits)
    error_message       = "Expected values: 512, 1024, 2048, 4096."
  }
}