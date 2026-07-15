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
