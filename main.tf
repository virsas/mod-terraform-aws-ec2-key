provider "aws" {
  profile = var.profile
  region = var.region

  assume_role {
    role_arn = var.assumeRole ? "arn:aws:iam::${var.accountID}:role/${var.assumableRole}" : null
  }
}

resource "aws_key_pair" "vss" {
  key_name   = var.name
  public_key = var.generate_key ? trimspace(tls_private_key.vss[0].public_key_openssh) : var.key
}

resource "tls_private_key" "vss" {
  count = var.generate_key ? 1 : 0

  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_bits
}