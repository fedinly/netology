# Решение домашнего задания к занятию «Сетевое взаимодействие в Kubernetes»
## Задание 1.
- Изменение настройки `type: ClusterIP` по сравнению с деплоем для задания «Запуск приложений в K8S».  
  [Файл deploy](https://github.com/fedinly/netology/blob/47da2fb0906d485a1ebe00f24123d1869bf8369f/12-k8s-net/two-cnrs-deploy.yaml),
  [Файл service](https://github.com/fedinly/netology/blob/47da2fb0906d485a1ebe00f24123d1869bf8369f/12-k8s-net/two-cnrs-service-clusterip.yaml)  
  Скриншот результатов подключеня к двум разным портам.  
  <img src="/docs/images/T25-k8s-04/Screen-118.png" alt="Скриншот ClusterIP" width="670" height="600"> 
- Для NodePort файл манифеста:
  ```
    apiVersion: v1
    kind: Service
    metadata:
      name: two-cnrs-svc-node
    spec:
      selector:
        app: two-apps-deployment
      type: NodePort
      ports:
      - name: http
        protocol: TCP
        port: 80
        targetPort: 80

  ```
При этом созданы сервис, эндпоинты, но порт  в системе не слушается. Ноду перезапускал.  
<img src="/docs/images/T25-k8s-04/Screen-119.png" alt="Скриншот Service NodePort" width="500" height="200"> 
## Задание 2.
- [Файл деплоя](https://github.com/fedinly/netology/blob/6b21b328c0f7fb587c3d8a3d999dca52066f3165/12-k8s-net/deployment-front-back.yaml), [Service front](https://github.com/fedinly/netology/blob/6b21b328c0f7fb587c3d8a3d999dca52066f3165/12-k8s-net/service-frontend.yaml), [Service back](https://github.com/fedinly/netology/blob/6b21b328c0f7fb587c3d8a3d999dca52066f3165/12-k8s-net/service-backend.yaml), [ingress](https://github.com/fedinly/netology/blob/6b21b328c0f7fb587c3d8a3d999dca52066f3165/12-k8s-net/ingress.yaml).  
  Создаются сервисы, эндпоинты, но при проверке `curl <IP ep>/api` выдает 401 ошибку.
