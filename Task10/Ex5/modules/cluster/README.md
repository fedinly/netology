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
| [yandex_mdb_mysql_cluster.test_cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | n/a | `bool` | `false` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | `16` | no |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | n/a | `string` | `"network-ssd"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | `"production"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"PRESTABLE"` | no |
| <a name="input_ha"></a> [ha](#input\_ha) | n/a | `bool` | `true` | no |
| <a name="input_ha_count"></a> [ha\_count](#input\_ha\_count) | n/a | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `""` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | `""` | no |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | n/a | `string` | `"s2.micro"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `list(string)` | `[]` | no |
| <a name="input_subnet_zones"></a> [subnet\_zones](#input\_subnet\_zones) | n/a | `list(string)` | `[]` | no |
| <a name="input_version_sql"></a> [version\_sql](#input\_version\_sql) | n/a | `string` | `"8.0"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the MySQL cluster |
| <a name="output_hosts"></a> [hosts](#output\_hosts) | List of host FQDNs in the MySQL cluster |
| <a name="output_name"></a> [name](#output\_name) | The name of the MySQL cluster |
<!-- END_TF_DOCS -->