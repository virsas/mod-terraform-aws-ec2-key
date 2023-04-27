output "id" {
  value = try(aws_key_pair.vss.id, "")
}
output "arn" {
  value = try(aws_key_pair.vss.arn, "")
}
output "name" {
  value = try(aws_key_pair.vss.key_name, "")
}
output "type" {
  value = try(aws_key_pair.vss.key_type, "")
}
output "fingerprint" {
  value = try(aws_key_pair.vss.fingerprint, "")
}
output "private_key_id" {
  value = try(tls_private_key.vss[0].id, "")
}
output "private_key_openssh" {
  value = try(trimspace(tls_private_key.vss[0].private_key_openssh), "")
  sensitive   = true
}
output "private_key_pub_openssh" {
  value = try(trimspace(tls_private_key.vss[0].public_key_openssh), "")
}
output "private_key_pem" {
  value = try(trimspace(tls_private_key.vss[0].private_key_pem), "")
  sensitive   = true
}
output "private_key_pub_pem" {
  value = try(trimspace(tls_private_key.vss[0].public_key_pem), "")
}
output "private_key_pub_fingerprint_md5" {
  value = try(tls_private_key.vss[0].public_key_fingerprint_md5, "")
}
output "private_key_pub_fingerprint_sha256" {
  value = try(tls_private_key.vss[0].public_key_fingerprint_sha256, "")
}