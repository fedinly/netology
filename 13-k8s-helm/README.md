# Решение ДЗ по теме "Helm"
## Задание 1.
- Скриншот настроек `~/.kube/config`, подключается без tls к удаленному кластеру:
  <img src="/docs/images/T26-k8s-03/Screen-138.png" alt="Скриншот config" width="600" height="500">  
- Скриншот успешного деплоя приложения:  
  <img src="/docs/images/T26-k8s-03/Screen-137.png" alt="Скриншот деплоя" width="600" height="200">  
- [Каталог с чартом](https://github.com/fedinly/netology/tree/b469655609e1fdbeac0cacd151d3cbb6aa487ff8/13-k8s-helm/netology-app)
## Задание 2.
- Запуск нескольких копий приложения путем изменения параметра `replicas:` в файле values.yaml:  
  <img src="/docs/images/T26-k8s-03/Screen-139.png" alt="Скриншот upgrade chart" width="600" height="500">
- Скриншот pods:  
  <img src="/docs/images/T26-k8s-03/Screen-140.png" alt="Скриншот деплоя" width="600" height="200">  
