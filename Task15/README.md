# Решение домашнего задания к занятию 4 «Работа с roles»
## Основная часть
  - Создан файл requirements.yml с требуемым содержимым;  
  - Загружена роль clickhouse в папку roles;  
  - Создан новый каталог с ролями vector-role, lighthouse-role;  
  - Новые роли заполнены на основе tasks имеющегося playbook, разнесены переменные на vars, default;  
  - Перенесены нужные шаблоны конфигов в templates;  
  - Все roles выложены в репозитории. Проставлены теги 1.0.0. Добавлены roles в requirements.yml в playbook;  
  - playbook переработан на использование roles;  
  - Произведена проверка деплоя на инфраструктуру, развернутую на yc, скриншоты выполнения:  
  <img src="/docs/images/Task15/Screen-78.png" alt="Скриншот выполнения с roles 1" width="570" height="400">  
  <img src="/docs/images/Task15/Screen-79.png" alt="Скриншот выполнения с roles 1" width="670" height="600">
    Скриншот ответа от сервера с установленным lighthouse.  
  <img src="/docs/images/Task15/Screen-80.png" alt="Скриншот lighthouse" width="270" height="160">

