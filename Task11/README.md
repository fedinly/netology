# Решение Домашнего задания к занятию «Использование Terraform в команде»  
## Задание 1.
- Утилита TFLint выдала в основном предупреждения типа terraform_unused_declarations (Fixable).
- Утилита checkov выдала `[WARNI]  Failed to get the checkov mappings and guidelines from https://api0.prismacloud.io/bridgecrew/api/v2/guidelines. Skips using`, но remote module проверила, скриншот:  
  <img src="/docs/images/Task11/Screen-61.png" alt="Скриншот checkov" width="470" height="350">  
## Задание 2.
- Сначала проект был инициализирован, затем прописана настройка `backend "s3"`. Скриншот вывода terraform init:  
  <img src="/docs/images/Task11/Screen-60.png" alt="Скриншот init" width="470" height="350">  
- [Ссылка на папку с кодом](https://github.com/fedinly/netology/tree/67f92cba0dba7040e9442613b4a8de918cc71fa4/Task11/Ex2)  
  Реализовать появление ошибки блокировки не удалось. В каталоге, указанном в настройке для бакета, файл появляется,  
  <img src="/docs/images/Task11/Screen-62.png" alt="Скриншот init" width="370" height="250">  
  затем после отработки terraform apply исчезает. При этом запущена terraform console в соседнем терминале.  
  В проекте два модуля, один ссылается на tfstate другого. Настройка бакета и запуск console происходит в модуле vms, который ссылается на модуль vpc.
## Задание 3.  
- [Ссылка на PR](https://github.com/fedinly/netology/pull/1#issue-4276909288)
## Задание 4.  
- Код для проверки одного ip-адреса:
  ```
  variable "test_ip" {
  type = string
  description = "ip address"
  default = "192.168.50.0/24"
    validation {
      condition =  can(cidrhost(var.test_ip,2))
      error_message = "It is not an ip address"
  }
  }
  ```
  При этом IP-адрес при использовании функции `cidrhost()` ip-адрес должен быть записан в cidr-нотации.
  При попытке проверить ip 192.1680.50.2 ошибка  
  <img src="/docs/images/Task11/Screen-64.png" alt="Скриншот terraform consolw" width="470" height="350">  
- Код для проверки списка ip-адресов:
  ```
  variable "test_ip_list" {
    type = list(string)
    description = "some ip addresses"
    default = [ "192.168.0.1/24", "1.1.1.1/8", "127.0.0.1/24"  ]
      validation {
        condition = alltrue([
          for ip in var.test_ip_list : can(cidrhost(ip,1))
        
        ])
        error_message = "Check input, mistake in address"
     }
  }
  ```  
  При попытке проверить неправильный ip-адрес консоль запускается с аналогичной ошибкой.
## Задание 5.  
- Код для проверки строки, чтобы не содержала заглавных символов:
  ```
  variable "test_upper" {
    type = string
    description = "no uppers"
    default = "fdggFkdfgbmbmidfdf"
      validation {
        condition =  can(regex("^[a-z]+$", var.test_upper))
        error_message = "It is not an ip address"
      }
  }
  ```
  При появлении заглавной буквы ошибка та же, `Invalid value for variable`.
- Код для проверки, что одно из значений равно true, а второе false:
  ```
  variable "in_the_end_there_can_be_only_one" {
    description="Who is better Connor or Duncan?"
    type = object({
        Dunkan = optional(bool)
        Connor = optional(bool)
    })

    default = {
        Dunkan = false
        Connor = false
    }

    validation {
        error_message = "There can be only one MacLeod"
        condition = length(distinct(values(var.in_the_end_there_can_be_only_one))) == length(var.in_the_end_there_can_be_only_one)
    }
  }  
  ```
  Результатом данной проверки в консоли также будет ошибка `Invalid value for variable`.
## Задание 6.  
Skipped.
## Задание 7.
Задача решена с ограничениями:  
- Необходимо создание конфигурационного файла backend.hcl и его наполнение, т.к. при попытке переноса в бакет tfstate-файла модулей проекта vpc, vms получаем ошибку :
```
 on providers.tf line 12, in terraform:
 │   12:     secret_key = data.terraform_remote_state.bucket.output.private_key_out
 │ 
 │ Variables may not be used here.
```
- На вновь созданный system account не назначилась роль storage.admin, ошибка `Error updating IAM policy for folder _id_: error updating access bindings of yandex_resourcemanager_folder_iam_member _id_: rpc error: code = PermissionDenied desc = Permission denied`, поэтому убран процесс создания аккаунта;
- Изначально s3-бакет для переноса tfstate-файла модуля bucket закомментирован, файл переносится после создания самого бакета в yandex (повторный init).
- Для переноса tfstate-файла в бакет необходимо включить бэкенд s3 в файле providers.tf, для инициализации использовать команду `terraform init -backend-config=./backend.hcl`
