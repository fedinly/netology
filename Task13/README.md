# Решение Домашнего задания к занятию 2 «Работа с Playbook»
## Осн.часть №1
  - Подготовлен и протестирован inventory-файл prod.yml: развернута в yc ВМ centos9, установлены пакеты clickhouse c помощью ansible.
  <img src="/docs/images/Task13/Screen-67.png" alt="Скриншот ansible playbook ok" width="670" height="400">
  
## Осн.часть №2-4
  - Подготовлен play, который устанавливает и настраивает vector. Конфигурация vector деплоится через template файл vector.yaml.j2. Установлен стандартный конфиг через template файл. Установлен handler на перезапуск vector в случае изменения конфигурации.  
  <img src="/docs/images/Task13/Screen-68.png" alt="Скриншот ansible playbook ok" width="670" height="400">

## Осн.часть №5.
  - В файле requirements.yml закомментированы строки, отномящиеся к roles, поэтому в lint оошибки. На запуск play не влияют.
  <img src="/docs/images/Task13/Screen-69.png" alt="Скриншот vector" width="570" height="300">

## Осн.часть №6.
 - Запуск playbook на этом окружении с флагом --check.  
<img src="/docs/images/Task13/Screen-70.png" alt="Скриншот с check" width="670" height="400">

## Осн.часть №7.
