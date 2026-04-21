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
