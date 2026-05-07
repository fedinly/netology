# Решение домашнего задания к занятию 5 «Тестирование roles»
## Основная часть.
 - Воспользовался репозиторием [docker-systemd](https://github.com/antmelekhin/docker-systemd.git), для создания контейнеров с предустановленным systemd и тестирования роли. На данный момент ошибка проверки сертификата при скачивании дистрибутива роли (https://yum.vector.dev/stable/vector-0/), возможно, из-за блокировки провайдером.  
 <img src="/docs/images/Task16/Screen-81.png" alt="Скриншот ошибки molecule local" width="370" height="200">   
 - Поднял на yc хост на ubuntu-22.04, установил с помощью ansible roles пакеты docker, python, pip3, molecule. Тестирование molecule проводилось на контейнерах rockylinux-9, fedora-40, установка успешна, ошибка проверки идемпотентности:  
 <img src="/docs/images/Task16/Screen-82.png" alt="Скриншот molecule test remote" width="570" height="500">  
 - Реализовал в версии роли 2.0.0 поддержку разных платформ, в т.ч. Debian, RedHat-подобные дистрибутивы, протестировал с помощью molecule на rocky, ubuntu 22.04. Ошибка проверки идемпотентности. При двойном запуске `molecule converge` ошибки не возникает.  
 <img src="/docs/images/Task16/Screen-83.png" alt="Скриншот molecule test remote" width="470" height="300">
 - Скоиншоты проверки после внесения asserts в verify.yml:  
 <img src="/docs/images/Task16/Screen-84.png" alt="Скриншот molecule test remote" width="570" height="570">  

 - tox  
    Ошибки:
    ```
    stderr="ERROR! Unexpected Exception, this is probably a bug: cannot import name 'should_retry_error' from 'ansible.galaxy.api'  (images antmelekhin/docker-systemd)
    "module_stderr": "/bin/sh: sudo: command not found\n", "module_stdout" (image stream8)
    "Error: OCI runtime errorV: crun: chmod `run/shm`: Operation not supported"], (image antmelekhin/docker-syste:ubuntu2204, ansible 50)
    Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: Curl error (6): Couldn't resolve host name for http://mirrorlist.centos.org/ (image centos:8)
    error from /usr/bin/crun creating container for [/bin/sh -c sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*]: writing file `/sys/fs/cgroup/cgroup.subtree_control`: Operation not supported       (image centos:8, свой Dockerfile для изменения источника для загрузки пакетов)
    ```
    Данный лог начал вести только на четвертый день работы. Использую для tox образ aragast/netology:latest, ранее пробовал в venv.  
    В итоге получил:  
    <img src="/docs/images/Task16/Screen-85.png" alt="Скриншот tox с ошибкой" width="470" height="300">  
    Данную ситуацию имеем  с сильно кастомной настройкой в molecule.yml (image) и tox.ini (версия ansible).  
    [Ссылка на репозиторий с ролью](https://github.com/fedinly/ansible-vector-role/releases/tag/2.1.2)
