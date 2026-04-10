<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_vpc_network.vpc_dev_net](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.vpc_dev_subn_a](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.vpc_dev_subn_b](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | n/a | `list(string)` | n/a | yes |
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"net"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | Network ID, for using in vm module |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Network name to use in vm module |
| <a name="output_subn_a_id"></a> [subn\_a\_id](#output\_subn\_a\_id) | Subnet to Marketing VM's |
| <a name="output_subn_b_id"></a> [subn\_b\_id](#output\_subn\_b\_id) | Subnet to Analytics VM's |
<!-- END_TF_DOCS -->