## Решение домашнего задания к занятию «Настройка приложений и управление доступом в Kubernetes»
# Задание 1: Работа с ConfigMaps
- [Файл deployment.yaml](https://github.com/fedinly/netology/blob/0257db4df80733be1cf1bfd3357bb1aca9d256da/13-k83-configs/deployment.yaml)  
- [Файл configmap-web.yaml](https://github.com/fedinly/netology/blob/0257db4df80733be1cf1bfd3357bb1aca9d256da/13-k83-configs/configmap-web.yaml)  
- Скриншот доступа к подготовленной странице из контейнера multitool в поде:  
  <img src="/docs/images/T26-k8s-02/Screen-128.png" alt="Скриншот вывод html" width="500" height="400"> 
# Задание 2: Настройка HTTPS с Secrets
# Задание 3: Настройка RBAC
- Cоздание сертификата:  
  <img src="/docs/images/T26-k8s-02/Screen-129.png" alt="Скриншот create cert" width="500" height="300">
- [Файл role-pod-reader.yaml](https://github.com/fedinly/netology/blob/fde45f91d33c4c5951e9cbe29379ea63505eb038/13-k83-configs/role-pod-reader.yaml)  
- [Файл rolebinding-developer.yaml](https://github.com/fedinly/netology/blob/fde45f91d33c4c5951e9cbe29379ea63505eb038/13-k83-configs/rolebinding-developer.yaml)  
- Скриншот проверки доступа к логам и поду, при этом запрет доступа к другим объектам:
  <img src="/docs/images/T26-k8s-02/Screen-130.png" alt="Скриншот доступ к объектам" width="600" height="300">
  
