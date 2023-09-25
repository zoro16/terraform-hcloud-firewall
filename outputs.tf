################################################
# Firewall
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
################################################


output "firewall_id" {
  description = "ID of the Firewall."
  value       = try(hcloud_firewall.firewall[0].id, hcloud_firewall.firewall[*].id, null)
}

output "firewall_name" {
  description = "Name of the Firewall."
  value       = try(hcloud_firewall.firewall[0].name, hcloud_firewall.firewall[*].name, null)
}

output "firewall_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  value       = try(hcloud_firewall.firewall[0].labels, hcloud_firewall.firewall[*].labels, null)
}

output "firewall_rule" {
  description = "Configuration of a Rule from this Firewall."
  value       = try(hcloud_firewall.firewall[*].rule, null)
}

output "firewall_apply_to" {
  description = "Configuration of a Rule from this Firewall."
  value       = try(hcloud_firewall.firewall[*].apply_to, null)
}
