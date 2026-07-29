# Решение домашнего задания к занятию «Хранение в K8s»
## Задание 1.
- [Файл деплоя](https://github.com/fedinly/netology/blob/98c6dde294889aecbb9b5ed4582182024467cc49/13-k8s-store/data-exchange-deploy.yaml)  
  Скриншот вывода содержимого общего файла:  
  <img src="/docs/images/T26-k8s-01/Screen-120.png" alt="Скриншот общий файл" width="500" height="200">  
  Скриншот информации об изменении файла каждые 5 сек.  
  <img src="/docs/images/T26-k8s-01/Screen-121.png" alt="Скриншот изменений" width="500" height="400">
## Задание 2.
- В файле деплоя меняется описание подключаемого диска:
  ```
     volumes:
        - name: exchange
          persistentVolumeClaim:
            claimName: pv1-claim
  ```  
  [Файл pv-pvc.yaml](https://github.com/fedinly/netology/blob/8d69d79c06172a8132a4fe39581bb69eca7f5d2e/13-k8s-store/pv-pvc.yaml)
- Скриншот изменений общего файла в контейнере multitool:  
  <img src="/docs/images/T26-k8s-01/Screen-122.png" alt="Скриншот общий файл" width="500" height="500">  
  Содержимое файла:  
  <img src="/docs/images/T26-k8s-01/Screen-123.png" alt="Скриншот содержимое" width="500" height="200">
- PV переходит из состояния Bound в состояние Released при удалении использующего его PVC, при этом в соответствии с политикой Retain данные продолжают храниться на томе.  
  <img src="/docs/images/T26-k8s-01/Screen-124.png" alt="Скриншот содержимое" width="700" height="500">  
