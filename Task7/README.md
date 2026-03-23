# Домашнее задание к занятию «Введение в Terraform»
[Cкриншот вывода команды terraform --version](Intro/screen-01.JPG)
## Задание 1
- Можно хранить данные в .terraform
- Сгенерированные ключ:значение ` "result": "XdaYB8mDGRew2b0p",`
- Ошибка `Not enough labels specified for "resource": All "resource" blocks must have 2 label(s)` на строке 23 говорит о том, что блок resource оформлен неверно, и должен быть ключ, в данном случае с названием образа. Необходимо то, что указано позднее в блоке `resource "docker_container" "nginx"` в строке `image = docker_image.nginx.image_id`, т.е. "nginx".
   ```
   resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
  }
    ```
   Вторая ошибка в имени docker-контейнера, имя не может начинаться с цифры: `resource "docker_container" "1nginx"` - исправлено на "nginx".  
   Третья ошибка в строке `name  = "example_${random_password.random_string_FAKE.resulT}"`, нужно исправить на те значения, что ранее указаны в блоке `resource "random_password" "random_string"`, т.е.       "random_string" и .result.
   Исправленный код:
   ```
   resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
   }

   resource "docker_container" "nginx" {
     image = docker_image.nginx.image_id
     name  = "example_${random_password.random_string.result}"

     ports {
       internal = 80
       external = 9090
     }
   }
   ```
   Вывод docker ps:
   ```
      CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
   355903d0ad19   dec7a90bd097   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:9090->80/tcp   example_XdaYB8mDGRew2b0p
   ```
- -auto-approve пропускает интерактивное подтверждение (yes), автоматически применяя изменения. Опасность может состоять в том, что команда terraform apply после выполнения terraform init включает в себя команды terraform plan, terraform validate, т.е. мы не сможем воспользоваться результатом выполнения этих команд и не сможем проверить, какие настройки будут применяться.
