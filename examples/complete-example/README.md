# complete-example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.42.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall"></a> [firewall](#module\_firewall) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud API Token | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_apply_to"></a> [firewall\_apply\_to](#output\_firewall\_apply\_to) | Configuration of a Rule from this Firewall. |
| <a name="output_firewall_id"></a> [firewall\_id](#output\_firewall\_id) | ID of the Firewall. |
| <a name="output_firewall_labels"></a> [firewall\_labels](#output\_firewall\_labels) | User-defined labels (key-value pairs) should be created with. |
| <a name="output_firewall_name"></a> [firewall\_name](#output\_firewall\_name) | Name of the Firewall. |
| <a name="output_firewall_rule"></a> [firewall\_rule](#output\_firewall\_rule) | Configuration of a Rule from this Firewall. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
