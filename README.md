# mod-terraform-aws-ec2-key

Terraform module to create AWS EC2 Key

## Variables

- **profile** - The profile from ~/.aws/credentials file used for authentication. By default it is the default profile.
- **accountID** - ID of your AWS account. It is a required variable normally used in JSON files or while assuming a role.
- **region** - The region for the resources. By default it is eu-west-1.
- **assumeRole** - Enable / Disable role assume. This is disabled by default and normally used for sub organization configuration.
- **assumableRole** - The role the user will assume if assumeRole is enabled. By default, it is OrganizationAccountAccessRole.
- **name** - Key name. Required value
- **key** - Public key. Required value
- **generate_key** - In case you don't have a key, you can generate one.
- **private_key_algorithm** - Key algorithm, defaults to RSA. However, ED25519 is supported too.
- **private_key_bits** - Size of the generated RSA key, in bits. Defaults to 4096.

## Example

### With own key
``` terraform
variable accountID { default = "123456789012"}

module "ec2_key_default {
  source   = "git::https://github.com/virsas/mod-terraform-aws-ec2-key.git?ref=v1.0.0"

  profile = "default"
  accountID = var.accountID
  region = "eu-west-1"

  name   = "default"
  key   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIABCDEFGHIJKLMNOPRSTUVXYZ0123456789abcdefghi default@example.org"
}

output "ec2KeyDefault" {
  value = module.ec2_key_default.name
}

```

### With generated key
``` terraform
variable accountID { default = "123456789012"}

module "ec2_key_generated {
  source   = "git::https://github.com/virsas/mod-terraform-aws-ec2-key.git?ref=v1.0.0"

  profile = "default"
  accountID = var.accountID
  region = "eu-west-1"

  name           = "generated"
  generate_key   = true
}

output "ec2KeyGenerated" {
  value = module.ec2_key_generated.name
}
output "ec2KeyGeneratedOpensshPriv" {
  value     = module.ec2_key_generated.private_key_openssh
  sensitive = true
}
output "ec2KeyGeneratedOpensshPub" {
  value = module.ec2_key_generated.private_key_pub_openssh
}

```

## Outputs

- id
- arn
- name
- type
- fingerprint
- private_key_id
- private_key_openssh
- private_key_pub_openssh
- private_key_pem
- private_key_pub_pem
- private_key_pub_fingerprint_md5
- private_key_pub_fingerprint_sha256
