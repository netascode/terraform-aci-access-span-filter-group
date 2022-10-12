<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-access-span-filter-group/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-access-span-filter-group/actions/workflows/test.yml)

# Terraform ACI Access SPAN Filter Group Module

Manages ACI Access SPAN Filter Group

Location in GUI:
`Fabric` » `Access Policies` » `Policies` » `Troubleshooting` » `SPAN` » `SPAN Filter Groups`

## Examples

```hcl
module "aci_access_span_filter_group" {
  source  = "netascode/access-span-filter-group/aci"
  version = ">= 0.1.0"

  name        = "ABC"
  description = "My Filter Group"
  entries = [
    {
      name                  = "HTTP"
      description           = "My Entry"
      source_ip             = "1.1.1.1"
      destination_ip        = "2.2.2.2"
      source_port_from      = 2001
      source_port_to        = 2002
      destination_port_to   = "http"
      destination_port_from = "http"
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 2.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Access SPAN Filter Group name. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Access SPAN Filter Group description. | `string` | `""` | no |
| <a name="input_entries"></a> [entries](#input\_entries) | Access SPAN Filter Group entries. Allowed values `ip_protocol`: `unspecified`, `icmp`, `igmp`, `tcp`, `egp`, `igp`, `udp`, `icmpv6`, `eigrp`, `ospfigp`, `pim`, `l2tp` or a number between 0 and 255. Default value `protocol`: `tcp`. Allowed values `destination_port_from`, `destination_port_to`, `destination_from_port`, `source_port_from`: `source_port_to`, `dns`, `ftpData`, `http`, `https`, `pop3`, `rtsp`, `smtp`, `ssh` or a number between 0 and 65535. Default value `source_from_port`, `source_to_port`, `destination_from_port`, `destination_to_port`: `unspecified`. | <pre>list(object({<br>    name                  = string<br>    description           = optional(string, "")<br>    destination_ip        = string<br>    destination_port_from = optional(string, "unspecified")<br>    destination_port_to   = optional(string)<br>    ip_protocol           = optional(string, "unspecified")<br>    source_ip             = string<br>    source_port_from      = optional(string, "unspecified")<br>    source_port_to        = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `spanFilterGrp` object. |
| <a name="output_name"></a> [name](#output\_name) | SPAN Filter Group name. |

## Resources

| Name | Type |
|------|------|
| [aci_rest_managed.spanFilterEntry](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest_managed) | resource |
| [aci_rest_managed.spanFilterGrp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest_managed) | resource |
<!-- END_TF_DOCS -->