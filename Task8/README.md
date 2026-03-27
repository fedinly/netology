# Решение Домашнего задания к занятию «Основы Terraform. Yandex Cloud»
## Задание 1.
- Ошибка при terraform apply `Quota limit vpc.networks.count exceeded` говорит о том, что превышена квота "Количество облачных сетей" (2/2), можно увеличить до 6 (например). Интерфейс завис, но применился.
- Ошибка `code = FailedPrecondition desc = Platform "standart-v4" not found` говорит о том, что данная версия platform-id не поддерживается, необходимо задать `standard-v3` [link](https://yandex.cloud/ru/docs/compute/concepts/vm-platforms).
