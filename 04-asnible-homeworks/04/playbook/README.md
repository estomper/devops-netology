# Ansible-Playbook Install Clickhouse, Vector and LightHouse

## Описание Playbook

```/site.yml```  
Состоит из roles:  
- ```Install Clickhouse``` - загрузка пакетов Clickhouse (clickhouse-common-static, clickhouse-client, clickhouse-server), выполняет роль ```clickhouse```
- ```Install Vector``` -  Установка и настройка Vector, выполняет роль ```vector-role```
- ```Install Nginx + LightHouse``` -  Установка и настройка Nginx + LightHouse, выполняет роль ```lighthouse-role```
--- 

## Role Description  

### Role: ```clickhouse```
Description - https://github.com/AlexeySetevoi/ansible-clickhouse/blob/master/README.md

### Role: ```vector-role```
Description - https://github.com/estomper/vector-role/blob/main/README.md

### Role: ```lighthouse-role```
Description - https://github.com/estomper/lighthouse-role/blob/main/README.md
  
---
## Configure
```/inventory/prod.yml```  
Необходимо указать IP или host_name серверов для установки

```/roles/lighthouse-role/defaults/main.yml```  
Необходимо указать пользователя, директорию установки и порт для lighthouse

```/roles/vector-role/defaults/main.yml```  
Необходимо указать версию дистрибутива для установки vector

---
## Install
Для установки Clickhouse, Vector and LightHouse необходимо выполнить команды:  
``` ansible-galaxy install -r requirements.yml -p roles ```  - для загрузки необходимых ролей  
``` ansible-playbook -i inventory/prod.yml site.yml ```  - для выполнения устанвоки  
где:  
- ```prod.yml``` - inventory файл
- ```site.yml``` - playbook файл.

---
