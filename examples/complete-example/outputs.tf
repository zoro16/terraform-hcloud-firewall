################################################
# Firewall
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
################################################


output "firewall_id" {
  description = "ID of the Firewall."
  value       = module.firewall.firewall_id
}

output "firewall_name" {
  description = "Name of the Firewall."
  value       = module.firewall.firewall_name
}

output "firewall_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  value       = module.firewall.firewall_labels
}

output "firewall_rule" {
  description = "Configuration of a Rule from this Firewall."
  value       = module.firewall.firewall_rule
}

output "firewall_apply_to" {
  description = "Configuration of a Rule from this Firewall."
  value       = module.firewall.firewall_apply_to
}
