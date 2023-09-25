################################################
# Firewall
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
################################################

resource "hcloud_firewall" "firewall" {
  count = var.create_firewall ? 1 : 0

  name   = var.firewall_name
  labels = var.firewall_labels

  dynamic "rule" {
    for_each = var.firewall_rules

    content {
      direction       = rule.value.direction
      protocol        = rule.value.protocol
      source_ips      = rule.value.source_ips
      destination_ips = rule.value.destination_ips
      port            = rule.value.port
      description     = rule.value.description
    }
  }


  dynamic "apply_to" {
    for_each = var.firewall_apply_to[*]

    content {
      label_selector = apply_to.value.label_selector
      server         = apply_to.value.server
    }
  }
}
