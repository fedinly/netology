# Решение домашнего задания к занятию «Запуск приложений в K8S»
## Задание 1.
- Листинг файла с deployment:
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: two-apps-deployment
  labels:
    app: my-app-multitool
spec:
  replicas: 1
  selector:
    matchLabels:
      app: two-apps-deployment
  template:
    metadata:
      labels:
        app: two-apps-deployment
    spec:
        containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
      - name: multitool
        image: wbitt/network-multitool
        env:
        - name: HTTP_PORT
          value: "8080"
        - name: HTTPS_PORT
          value: "11443"
```
 Используем в манифесте другой порт (8080) для Multitool, поэтому ошибка не возникает.
- Увеличен параметр replicas до 2:  
  <img src="/docs/images/T25-k8s-03/Screen-113.png" alt="Скриншот replicas" width="370" height="250"> 
- Кол-во подов (до и после масштабирования):
  <img src="/docs/images/T25-k8s-03/Screen-114.png" alt="Скриншот pods" width="370" height="250"> 
