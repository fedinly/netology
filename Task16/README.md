# Решение домашнего задания к занятию 5 «Тестирование roles»
## Основная часть.
 - Воспользовался репозиторием [docker-systemd](https://github.com/antmelekhin/docker-systemd.git), для создания контейнеров с предустановленным systemd и тестирования роли. На данный момент ошибка проверки сертификата при скачивании дистрибутива роли (https://yum.vector.dev/stable/vector-0/), возможно, из-за блокировки провайдером.  
 <img src="/docs/images/Task16/Screen-81.png" alt="Скриншот ошибки molecule local" width="370" height="200">   
 - Поднял на yc хост на ubuntu-22.04, установил с помощью ansible roles пакеты docker, python, pip3, molecule. Тестирование molecule проводилось на контейнерах rockylinux-9, fedora-40, установка успешна, ошибка проверки идемпотентности:  
 <img src="/docs/images/Task16/Screen-82.png" alt="Скриншот molecule test remote" width="570" height="500">  
 - Реализовал в версии роли 2.0.0 поддержку разных платформ, в т.ч. Debian, RedHat-подобные дистрибутивов, протестировал с помощью molecule на rocky, ubuntu 22.04. Ошибка проверки идемпотентности.
 
