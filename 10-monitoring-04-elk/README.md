# Решение домашнего задания к занятию 15 «Система сбора логов Elastic Stack»
## Задание 1.
 - Обновление: после изменения конфигов filebeat, logstash начали поступать данные с индексом logstash. Воспользовался содержимым папки help с незначительными изменениями конфига filebeat, файла compose.
   <img src="/docs/images/T21-Mon-04/Screen-101.png" alt="Скриншот Kibana new" width="570" height="500">  
   Распределение по кол-ву логов в % от контейнеров:  
   <img src="/docs/images/T21-Mon-04/Screen-102.png" alt="Распределение в %" width="500" height="500">  

 - Настроены политики hot, warm путем ввода команды:  
   `curl -X PUT -H "Content-Type: application/json" -d '{"policy":{"_meta":{"description":"used for logstash","project":{"name":"myProject","department":"netology"}},"phases":{"warm":{"min_age":"1d","actions":{"forcemerge":{"max_num_segments":1}}},"delete":{"min_age":"3d","actions":{"delete":{}}}}}}' "$ES_URL/_ilm/policy/my_policy"`  
   Ответ после ввода команды:    
   `{"acknowledged":true}`  
   Предварительно в файлах es-hot.yml, es-warm.yml прописана настройка `node.attr.box_type: hot` `(node.attr.box_type: warm)`
   
## Неактуально:   
 - На данный момент получены логи с помщью сборщика Filebeat через Logstash:  
   <img src="/docs/images/T21-Mon-04/Screen-100.png" alt="Скриншот Kibana" width="570" height="500">  
   Используемые материалы:  
    1) Репозиторий Elastic Docker https://github.com/deviantony/docker-elk/blob/main/README.md;  
    2) Материал для помощи в связке Filebeat+Docker+Logstash, https://habr.com/ru/companies/otus/articles/542144/
