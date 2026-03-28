# Решение Домашнего задания к занятию «Основы Terraform. Yandex Cloud»
## Задание 1.
- Ошибка при terraform apply `Quota limit vpc.networks.count exceeded` говорит о том, что превышена квота "Количество облачных сетей" (2/2), можно увеличить до 6 (например). Интерфейс завис, но применился.
- Ошибка `code = FailedPrecondition desc = Platform "standart-v4" not found` говорит о том, что данная версия platform-id не поддерживается, необходимо задать `standard-v1` для заданного уровня производительности 5%, и параметр количество ядер `cores = 2`, [link](https://yandex.cloud/ru/docs/compute/concepts/vm-platforms).
- [Скриншот ifconfig.me](Ex1/Screen-21.png), [Скриншот консоли YC](Ex1/Screen-22.png) Параметр preemptible = true позволяет сделать ВМ выключаемой по расписанию Yandex, т.е. работающей не постоянно, core_fraction=5 - уровень использования ядер процессора. Оба параметра позволяют сильно сэкономить на ВМ при обучении.
## Задание 2.
- [Скриншот, вызов terraform plan, отсутствие изменений](Ex2/Screen-23.png)
## Задание 3.
- [Скриншот консоли YC](Ex3/Screen-24.png)
## Задание 4.
