################################################
# Firewall
# https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall
################################################

variable "create_firewall" {
  description = "Whether to create a Firewall or not."
  type        = bool
  default     = false
}

variable "firewall_name" {
  description = "Name of the Firewall."
  type        = string
  default     = ""
}

variable "firewall_labels" {
  description = "User-defined labels (key-value pairs) should be created with."
  type        = map(string)
  default     = {}
}

variable "firewall_rules" {
  description = "Configuration of a Rule from this Firewall."
  type = list(object({
    # Direction of the Firewall Rule. `in`
    direction = string

    # Protocol of the Firewall Rule. `tcp`, `icmp`, `udp`, `gre`, `esp`
    protocol = string

    # List of CIDRs that are allowed within this Firewall Rule (when direction is in)
    source_ips = optional(list(string))

    # List of CIDRs that are allowed within this Firewall Rule (when direction is out)
    destination_ips = optional(list(string))

    # Port of the Firewall Rule. Required when `protocol` is `tcp` or `udp`. You can use any to allow all ports for the specific protocol. Port ranges are also possible: `80-85` allows all ports between 80 and 85.
    port = optional(string)

    # Description of the firewall rule
    description = optional(string)
  }))
  default = []

  validation {
    condition     = contains(["in", "out"], var.firewall_rules[0].direction)
    error_message = "Direction could only be `in` or `out`. Please use a valid direction value."
  }

  validation {
    condition     = contains(["tcp", "udp", "icmp", "udp", "gre", "esp"], var.firewall_rules[0].protocol)
    error_message = "Only one of this list of protocols could be used [`tcp`, `icmp`, `udp`, `gre`, `esp`]. Please use a valid protocol value."
  }

  validation {
    condition = alltrue([
      for rule in var.firewall_rules : false if(rule.direction == "out" && rule.destination_ips == null)
    ])
    error_message = "When `direction` is set to 'out', `destination_ips` list with at least one CIDR must be added."
  }

  validation {
    condition = alltrue([
      for rule in var.firewall_rules : false if(rule.direction == "in" && rule.source_ips == null)
    ])
    error_message = "When `direction` is set to 'in', `source_ips` list with at least one CIDR must be added."
  }

  validation {
    condition     = contains(["tcp", "udp"], var.firewall_rules[0].protocol) ? var.firewall_rules[0].port != null : true
    error_message = "If `protocol` is set to either 'tcp' or 'udp', `port` must be set."
  }


}

variable "firewall_apply_to" {
  description = "Configuration of a Rule from this Firewall."
  type = object({
    # Label Selector to select servers the firewall should be applied to (only one of server and label_selectorcan be applied in one block)
    label_selector = optional(string)

    # ID of the server you want to apply the firewall to (only one of server and label_selectorcan be applied in one block
    server = optional(number)
  })
  default = {}
}
