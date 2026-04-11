# Решение Домашнего задания к занятию «Продвинутые методы работы с Terraform»
## Задача 1.
- Скриншот консоли ВМ  
  <img src="/docs/images/Task10/Screen-45.png" alt="Скриншот консоли ВМ" width="470" height="300">  
- Скриншот свойств ВМ  
  <img src="/docs/images/Task10/Screen-46.png" alt="Скриншот свойств ВМ" width="470" height="370">  
- Скриншот вывода terraform console  
  <img src="/docs/images/Task10/Screen-47.png" alt="Скриншот terraform console" width="470" height="300">
## Задача 2.
- Скриншот вывода terraform console  
  <img src="/docs/images/Task10/Screen-48.png" alt="Скриншот terraform console" width="270" height="150">  
  [Ссылка на папку vms с кодом](https://github.com/fedinly/netology/tree/0bca3718b74133ff37edff6c209464fc1080d7d3/Task10/vms)
## Задача 3.
- terraform state list  
  <img src="/docs/images/Task10/Screen-49.png" alt="Скриншот terraform state" width="370" height="250">  
- Команды  
  `terraform state rm module.vpc_dev_net`;  
  убрана секция module;  
 `terraform import 'module.vpc_dev_net.yandex_vpc_network.vpc_dev_net' _id_`;  
 `terraform import 'module.vpc_dev_net.yandex_vpc_subnet.vpc_dev_subn_a' _id_`;  
 `terraform import 'module.vpc_dev_net.yandex_vpc_subnet.vpc_dev_subn_a' _id_`  
## Задача 4.
- [Ссылка на папку с кодом](https://github.com/fedinly/netology/tree/7668e73ffad8c60b522141b60ffc304882ee779d/Task10/Ex4)  
  В соответствии с документацией к Terraform, разные модули не могут располагаться в одной директории, поэтому была создана папка modules, и в ней подпапки с модулями.  
  Также были исправлены зоны доступности, добавлена зона ru-central1-d вместо ru-central1-с. В этой зоне доступны платформы standard-v2, standard-v3, исправлено локально в модуле.  
<img src="/docs/images/Task10/Screen-52.png" alt="Скриншот terraform state" width="570" height="350">
<img src="/docs/images/Task10/Screen-53.png" alt="Скриншот terraform state" width="470" height="350">

## Задача 5.
<details>
<summary>План выполнения (нажмите, чтобы развернуть)</summary>
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  \# module.data.yandex_mdb_mysql_database.test-db will be created
  + resource "yandex_mdb_mysql_database" "test-db" {
      + cluster_id = (known after apply)
      + id         = (known after apply)
        name       = null
    }

  \# module.data.yandex_mdb_mysql_user.test-db-user will be created
  + resource "yandex_mdb_mysql_user" "test-db-user" {
      + authentication_plugin = (known after apply)
      + cluster_id            = (known after apply)
      + connection_manager    = (known after apply)
      + generate_password     = false
      + id                    = (known after apply)
        name                  = null

      + connection_limits (known after apply)
    }

  \# module.dev_net.yandex_vpc_network.dev_net will be created
  + resource "yandex_vpc_network" "dev_net" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "c-net"
      + subnet_ids                = (known after apply)
    }

  \# module.dev_net.yandex_vpc_subnet.dev_subn_a will be created
  + resource "yandex_vpc_subnet" "dev_subn_a" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "c-net-ru-central1-a"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  \# module.dev_net.yandex_vpc_subnet.dev_subn_d will be created
  + resource "yandex_vpc_subnet" "dev_subn_d" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "c-net-ru-central1-d"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.0.3.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-d"
    }

  \# module.test_cluster.yandex_mdb_mysql_cluster.test_cluster will be created
  + resource "yandex_mdb_mysql_cluster" "test_cluster" {
      + allow_regeneration_host   = false
      + backup_retain_period_days = (known after apply)
      + created_at                = (known after apply)
      + deletion_protection       = (known after apply)
      + description               = "MySQL Test Cluster"
      + disk_encryption_key_id    = (known after apply)
      + environment               = "PRESTABLE"
      + folder_id                 = (known after apply)
      + health                    = (known after apply)
      + host_group_ids            = (known after apply)
      + id                        = (known after apply)
      + mysql_config              = (known after apply)
      + name                      = "example"
      + network_id                = (known after apply)
      + status                    = (known after apply)
      + version                   = "8.0"

      + access (known after apply)

      + backup_window_start (known after apply)

      + disk_size_autoscaling (known after apply)

      + host {
          + assign_public_ip   = false
          + fqdn               = (known after apply)
          + name               = "example-replica-1"
          + priority           = 0
          + replication_source = (known after apply)
          + subnet_id          = (known after apply)
          + zone               = "ru-central1-a"
        }

      + maintenance_window (known after apply)

      + performance_diagnostics (known after apply)

      + resources {
          + disk_size          = 16
          + disk_type_id       = "network-ssd"
          + resource_preset_id = "s2.micro"
        }
    }

Plan: 6 to add, 0 to change, 0 to destroy.
</details>
