# Решение Домашнего задания к занятию 1 «Введение в Ansible»
## Осн.часть №1.
- ` "msg": 12 `
## Осн.часть №2.
- ` "msg": "all default fact"`
## Осн.часть №3.
- Окружение подготовлено.
## Осн.часть №4.
```
TASK [Print fact] *************************************************************************************************************************
ok: [centos7] => {
    "msg": "el"
}
ok: [ubuntu] => {
    "msg": "deb"
}
```
## Осн.часть №6.
```
TASK [Print fact] *************************************************************************************************************************
ok: [centos7] => {
    "msg": "el default fact"
}
ok: [ubuntu] => {
    "msg": "deb default fact"
}
```
## Осн.часть №7.
<img src="/docs/images/Task12/Screen-65.png" alt="Скриншот encrypt" width="470" height="350">  

## Осн.часть №8.
- Работает с ключом `--ask-vault-pass`. 
## Осн.часть №9.
- Для работы на control node дополнительные плагины не нужны.
## Осн.часть №10-11.
<details>
  <summary>prod.yml (нажмите, чтобы развернуть)</summary>  

  ---
  el:  
    hosts:  
      centos7:  
        ansible_connection: docker  
  deb:  
    hosts:  
      ubuntu:  
        ansible_connection: docker  
  local:  
    hosts:  
      localhost:  
        ansible_connection: local  

</details>  
Факты some_fact для каждого из хостов определяются из group_vars - all.  

## Осн.часть №12-13.
[Ссылка на папку с кодом](https://github.com/fedinly/netology/tree/28749f0c5bba271f26faddcef73ae9ce17e03ff7/Task12/playbook)
## Необяз.часть №1.
- Командой `find group_vars/ -type f -name "*.yml" -exec ansible-vault decrypt {} +` расшифруются все зашифрованные файлы в каталоге group_vars\
## Необяз.часть №2.
- Скрин зашифрованной части файла:  
<img src="/docs/images/Task12/Screen-63.png" alt="Скриншот encrypt" width="370" height="200">

## Необяз.часть №3.
- Для группы хостов all из файла плейбука site.yml (параметр hosts: all) применяется плей Print fact, в нем настраивается данная переменная, которую назвал `"{{ some_fact2 }}"`.  
<img src="/docs/images/Task12/Screen-66.png" alt="Скриншот результата" width="370" height="200">  
