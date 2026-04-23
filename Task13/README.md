# Решение Домашнего задания к занятию 2 «Работа с Playbook»
## Осн.часть №1
  - Подготовлен и протестирован inventory-файл prod.yml: развернута в yc ВМ centos9, установлены пакеты clickhouse c помощью ansible.
  <img src="/docs/images/Task13/Screen-67.png" alt="Скриншот ansible playbook ok" width="670" height="400">
  
## Осн.часть №2
  - Подготовлен play, который устанавливает и настраивает vector. Конфигурация vector деплоится через template файл vector.yaml.j2. Установлен стандартный конфиг через template файл. Установлен handler на перезапуск vector в случае изменения конфигурации.  
  <img src="/docs/images/Task13/Screen-68.png" alt="Скриншот ansible playbook ok" width="670" height="400">
