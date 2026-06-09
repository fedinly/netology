# Решение домашнего задания к занятию 15 «Система сбора логов Elastic Stack»
## Задание 1.
 - Обновление: после изменения конфигов filebeat, logstash начали поступать данные с индексом logstash. Воспользовался содержимым папки help0 с незначительными изменениями конфига filebeat, файла compose.
   <img src="/docs/images/T21-Mon-04/Screen-101.png" alt="Скриншот Kibana new" width="570" height="500">
   
 - На данный момент получены логи с помщью сборщика Filebeat через Logstash:  
   <img src="/docs/images/T21-Mon-04/Screen-100.png" alt="Скриншот Kibana" width="570" height="500">  
   Используемые материалы:  
    1) Репозиторий Elastic Docker https://github.com/deviantony/docker-elk/blob/main/README.md;  
    2) Материал для помощи в связке Filebeat+Docker+Logstash, https://habr.com/ru/companies/otus/articles/542144/
