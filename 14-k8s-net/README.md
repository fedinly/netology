 # Решение Домашнего задания к занятию «Как работает сеть в K8s
 ## Задание 1.
 -  Скриншоты запука деплоя, сервисов, проверки сети без networkPolicy (namespace - app-testpol-01):  
  <img src="/docs/images/T27-k8s-01/Screen-143.png" alt="Скриншот deploy" width="700" height="300">  
  <img src="/docs/images/T27-k8s-01/Screen-144.png" alt="Скриншот service" width="700" height="300">
  <img src="/docs/images/T27-k8s-01/Screen-148.png" alt="Скриншот get service" width="700" height="300">  
  <img src="/docs/images/T27-k8s-01/Screen-146.png" alt="Скриншот проверки сети без networkPolicy" width="800" height="400">  
 - Далее запускается 2 networkPolicy: одна для блокировки всего трафика, за исключением dns, [файл allow-dns.yaml](https://github.com/fedinly/netology/blob/a33060600d2419a2ed4291ee69e87ecf7f015fdd/14-k8s-net/allow-dns.yaml), вторая - для реализации доступа между запущенными приложниями, [файл front-back-cache.yaml](https://github.com/fedinly/netology/blob/a33060600d2419a2ed4291ee69e87ecf7f015fdd/14-k8s-net/front-back-cache.yaml).
   Примененные политики:  
 <img src="/docs/images/T27-k8s-01/Screen-145.png" alt="Скриншот describe networkpolicy" width="600" height="400">
 + добавочно
 <img src="/docs/images/T27-k8s-01/Screen-151.png" alt="Скриншот describe networkpolicy" width="600" height="300">  
 <img src="/docs/images/T27-k8s-01/Screen-145.png" alt="Скриншот describe networkpolicy" width="700" height="500">  
 Результат:  
 <img src="/docs/images/T27-k8s-01/Screen-150.png" alt="Скриншот describe networkpolicy" width="700" height="400">  
