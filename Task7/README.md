# Домашнее задание к занятию «Введение в Terraform»
[Cкриншот вывода команды terraform --version](Intro/screen-01.JPG)
## Задание 1
- Можно хранить данные в .terraform
- Сгенерированные ключ:значение ` "result": "XdaYB8mDGRew2b0p",`
- Ошибка `Not enough labels specified for "resource": All "resource" blocks must have 2 label(s)` на строке 23 говорит о том, что блок resource оформлен неверно, и должен быть ключ, в данном случае с названием образа.
   ```
   resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
  }
    ```
Вторая ошибка в имени docker-контейнера, имя не может начинаться с цифры: `resource "docker_container" "1nginx"`
