# Решение Домашнего задания к занятию «Основы Terraform. Yandex Cloud»
Файлы проекта в Terraform представлены в [репозитории.](https://github.com/fedinly/task8_tf.git)
## Задание 1.
- Ошибка при terraform apply `Quota limit vpc.networks.count exceeded` говорит о том, что превышена квота "Количество облачных сетей" (2/2), можно увеличить до 6 (например). Интерфейс завис, но применился.
- Ошибка `code = FailedPrecondition desc = Platform "standart-v4" not found` говорит о том, что данная версия platform-id не поддерживается, необходимо задать `standard-v1` для заданного уровня производительности 5%, и параметр количество ядер `cores = 2`, [link](https://yandex.cloud/ru/docs/compute/concepts/vm-platforms).
- [Скриншот ifconfig.me](Ex1/Screen-21.png), [Скриншот консоли YC](Ex1/Screen-22.png) Параметр preemptible = true позволяет сделать ВМ выключаемой по расписанию Yandex, т.е. работающей не постоянно, core_fraction=5 - уровень использования ядер процессора. Оба параметра позволяют сильно сэкономить на ВМ при обучении.
## Задание 2.
- [Скриншот, вызов terraform plan, отсутствие изменений](Ex2/Screen-23.png)
## Задание 3.
- [Скриншот консоли YC](Ex3/Screen-24.png)
## Задание 4.
- [Скриншот вывода terraform output](Ex4/Screen-25.png)
## Задание 5.
- [Скриншот изменений](Ex5/Screen-27.png), [Скриншот вывода terraform plan](Ex5/Screen-28.png)
## Задание 6.
- Параметры диска берутся из образа при инициализации - [скриншот файла .tfstate](Ex6/Screen-26.png)).  
  После задания параметров и terraform plan изменений не обнаружено [скриншот](Ex6/Screen-29.png).  
  Закомментирована переменная `variable "vms_ssh_root_key"`
## Задание 7.
- Необходимо ввести `local.test_list[1]`, получим второй элемент `"staging"`;
- Необходимо ввести `length(local.test_list)`, получим 3;
- Необходимо ввести `local.test_map["admin"]`, получим `"John"`;
- Необходимо ввести `join(" ",[local.test_map["admin"]],["is"],[keys(local.test_map)[0]],["of"],[local.test_list[2]],["server, based on OS"],[local.servers.production.image],["with"],[local.servers.production.cpu],["vcpu,"],[local.servers.production.ram],["vram and"],[length(local.servers.production.disks)],["virtual disks"])`, получим строку `"John is admin of production server, based on OS ubuntu-20-04 with 10 vcpu, 40 vram and 4 virtual disks"`
## Задание 8.
- Описание переменной:
  ```
  variable "test" {
  type = object({
    connection = string
    addr = string
  })
  }
  ```
- 
