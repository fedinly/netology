# Решение домашнего задания по теме "Базовые объекты K8S"
## Задание 1
- Создан Pod с именем hello-world. Содержимое файла манифеста:
  <details>
  <summary>Нажмите, чтобы развернуть</summary>
    apiVersion: v1
    kind: Pod
    metadata:
      name: hello-world
    spec:
      containers:
      - name: hello-world
        image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
        ports:
          - containerPort: 80
  </details>
- Команда проброса порта в Pod:
  `kubectl port-forward --address 0.0.0.0 pod/hello-world 8080:8080`  
- Вывод команды `curl localhost:8080`:
  <img src="/docs/images/T25-k8s-02/Screen-107.png" alt="Скриншот curl" width="370" height="370"> 
