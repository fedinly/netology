# Решение Домашнего задания к занятию «Использование Terraform в команде»
## Задание 1.
- Утилита TFLint выдала в основном предупреждения типа terraform_unused_declarations (Fixable).
- Утилита checkov выдала `[WARNI]  Failed to get the checkov mappings and guidelines from https://api0.prismacloud.io/bridgecrew/api/v2/guidelines. Skips using`, но remote module проверила, скриншот:  
  <img src="/docs/images/Task11/Screen-61.png" alt="Скриншот checkov" width="470" height="350">  
## Задание 2.
- Сначала проект был инициализирован, затем прописана настройка `backend "s3"`. Скриншот вывода terraform init:  
  <img src="/docs/images/Task11/Screen-60.png" alt="Скриншот init" width="470" height="350">  
