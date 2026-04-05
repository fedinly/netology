# Решение Домашнего задания к занятию «Управляющие конструкции в коде Terraform»
[Ссылка на репозиторий с кодом](https://github.com/fedinly/netology/tree/6e61e70b812c0f29223ffba7b5cca180857a7f38/Task9/src)  
## Задание 1.
- Скриншот консоли YC
<img src="Ex1/Screen-33.png" alt="Скриншот консоли YC" width="370" height="330">  

## Задание 2.
- Скриншот созданных ВМ
<img src="Ex2/Screen-36.png" alt="Скриншот консоли YC" width="770" height="230">  
- Очередность создания VM:
<img src="Ex2/Screen-35.png" alt="Скриншот VSCode" width="370" height="150">  

## Задание 3.  
- Скриншоты созданных ВМ и дисков.  
  <img src="/docs/images/Task9/Screen-37.png" alt="Скриншот - созданные диски" width="570" height="400">
  <img src="/docs/images/Task9/Screen-38.png" alt="Скриншот - созданные ВМ" width="570" height="300">  

## Задание 4.
- Скриншот ansible инвент-файла
 <img src="/docs/images/Task9/Screen-39.png" alt="Скриншот ansible инвент-файла" width="370" height="200">  
- Инвентарь для серверов из групп webservers, databases позволяет создать боле 2 ВМ, т.к. машины создаются циклически; для ВМ storage динамически создаются только доп.диски, ВМ в единственном экземпляре.
## Задание 5.
- Получилось реализовать способ из нескольких секций output в файле outputs.tf (представлен в репозитории). Данный код не работает для ВМ storage, такжже не получилось реализовать требуемую конкатенацию листов.  
  <img src="/docs/images/Task9/Screen-41.png" alt="Скриншот output" width="390" height="390">     
## Задание 8.
- Ошибка terrafdorm plan: `Invalid character; This character is not used within the language., and 1 other diagnostic(s).`  
  Необходимо верно расставить закрывающие скобки `}`, т.е. нужно поставить вслед за строкой `"nat_ip_address"]` и убрать в конце строки. Также необходимо убрать пробел в строке `i["platform_id "]`.  
  Скрин hosts.ini после вставки исправленного кода:  
  <img src="/docs/images/Task9/Screen-40.png" alt="Скриншот hosts.ini" width="470" height="250">  
