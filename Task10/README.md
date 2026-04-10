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
  [Ссылка на папку vms с кодом](https://github.com/fedinly/netology/tree/fddb42f60aaedd2d9714f143806f2990ab03f8ce/Task10/vms)
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
