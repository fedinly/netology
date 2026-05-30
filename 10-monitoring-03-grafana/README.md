# Решение домашнего задания к занятию 14 «Средство визуализации Grafana»
## Основная часть.
 - П.1. Представлена ссылка на каталог ansible [ссылка](https://github.com/fedinly/netology/tree/14acb18b6db953a87eba7036574689a9371ee61a/10-monitoring-03-grafana/ansible), в нем файл site.yml (playbook) и compose.yml (файл для развертывания контейнеров). Реализовать задание логина/пароля на вход через манифест не удалось, первый вход с помощью стандартных кредов.  
 - П.2. Скриншот Dashboard  
 <img src="/docs/images/T20-Mon-03/Screen-97.png" alt="Скриншот Dashboard" width="570" height="500">
Запросы в PromQL:  
1) `100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) (Код - честно - позаимствован у ИИ)  
Пояснения:  
`node_cpu_seconds_total` - метрика, которая запрашивается и с которой выполняется дальнейшее преобразование;  
`{mode="idle"}` - указывает на то, что это счетчик общего времени простоя процессора в секундах;  
`irate` ф-ция вычисляет скорость изменения счетчика, вычисляется за последние 5 минут (выражение `[5m]`);  
`avg by (instance)` - вычисление среднего значения для инстанса;  
вычитаем из 100%, чтобы получить загруженность CPU, а не простой.  
2) `(node_load15 / on(instance) group_left count(node_cpu_seconds_total{mode="idle"}) by (instance)) * 100`  
Пояснения:  
Для мониторинга средней нагрузки системы (1/5/15 минут) с помощью exporter, используется node_load1, node_load5, и node_load15  
3) `node_memory_MemAvailable_bytes / 1024 /1024 /1024` - своб.память в Гб;  
4) `node_filesystem_free_bytes / 1024 / 1024 / 1024`.
