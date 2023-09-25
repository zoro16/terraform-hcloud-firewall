# terraform-hcloud-firewall

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.42.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.firewall](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_firewall"></a> [create\_firewall](#input\_create\_firewall) | Whether to create a Firewall or not. | `bool` | `false` | no |
| <a name="input_firewall_apply_to"></a> [firewall\_apply\_to](#input\_firewall\_apply\_to) | Configuration of a Rule from this Firewall. | <pre>object({<br>    # Label Selector to select servers the firewall should be applied to (only one of server and label_selectorcan be applied in one block)<br>    label_selector = optional(string)<br><br>    # ID of the server you want to apply the firewall to (only one of server and label_selectorcan be applied in one block<br>    server = optional(number)<br>  })</pre> | `{}` | no |
| <a name="input_firewall_labels"></a> [firewall\_labels](#input\_firewall\_labels) | User-defined labels (key-value pairs) should be created with. | `map(string)` | `{}` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | Name of the Firewall. | `string` | `""` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | Configuration of a Rule from this Firewall. | <pre>list(object({<br>    # Direction of the Firewall Rule. `in`<br>    direction = string<br><br>    # Protocol of the Firewall Rule. `tcp`, `icmp`, `udp`, `gre`, `esp`<br>    protocol = string<br><br>    # List of CIDRs that are allowed within this Firewall Rule (when direction is in)<br>    source_ips = optional(list(string))<br><br>    # List of CIDRs that are allowed within this Firewall Rule (when direction is out)<br>    destination_ips = optional(list(string))<br><br>    # Port of the Firewall Rule. Required when `protocol` is `tcp` or `udp`. You can use any to allow all ports for the specific protocol. Port ranges are also possible: `80-85` allows all ports between 80 and 85.<br>    port = optional(string)<br><br>    # Description of the firewall rule<br>    description = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_apply_to"></a> [firewall\_apply\_to](#output\_firewall\_apply\_to) | Configuration of a Rule from this Firewall. |
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | ID of the Firewall. |
| <a name="output_firewall_labels"></a> [firewall\_labels](#output\_firewall\_labels) | User-defined labels (key-value pairs) should be created with. |
| <a name="output_firewall_name"></a> [firewall\_name](#output\_firewall\_name) | Name of the Firewall. |
| <a name="output_firewall_rule"></a> [firewall\_rule](#output\_firewall\_rule) | Configuration of a Rule from this Firewall. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
