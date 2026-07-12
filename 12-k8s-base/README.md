# Решение домашнего задания по теме "Базовые объекты K8S"
## Задание 1.
- Создан Pod с именем hello-world. Содержимое файла манифеста:  
  <img src="/docs/images/T25-k8s-02/Screen-108.png" alt="Скриншот yaml" width="370" height="300"> 
- Команда проброса порта в Pod:
  `kubectl port-forward --address 0.0.0.0 pod/hello-world 8080:8080`  
- Вывод команды `curl localhost:8080`:  
  <img src="/docs/images/T25-k8s-02/Screen-107.png" alt="Скриншот curl" width="370" height="370">
- Вывод команды (список Pods):  
  <img src="/docs/images/T25-k8s-02/Screen-109.png" alt="Скриншот curl" width="370" height="170">
## Задание 2.
- Создан Pod с именем netology-web и сервис echoserver. Содержимое файла манифеста:
  <img src="/docs/images/T25-k8s-02/Screen-110.png" alt="Скриншот yaml 2" width="370" height="370">
- Вывод команды `curl localhost:8080`:
- <img src="/docs/images/T25-k8s-02/Screen-111.png" alt="Скриншот curl 2" width="370" height="370">
- Вывод команды (список Services):  
  <img src="/docs/images/T25-k8s-02/Screen-112.png" alt="Скриншот curl" width="370" height="170">
