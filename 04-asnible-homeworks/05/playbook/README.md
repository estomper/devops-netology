# Ansible-Playbook Install Clickhouse and Vector

## Описание Playbook

### Play Install Clickhouse 
``` /site.yml```  
Состоит из Tasks:  
- ```Get clickhouse distrib``` - загрузка пакетов Clickhouse (clickhouse-common-static, clickhouse-client, clickhouse-server) версии ```clickhouse_version```  
- ```Install clickhouse packages``` - установка пакетов Clickhouse  
- ```Create database``` - создание БД Clickhouse  

### Play Install Vector
Состоит из Tasks:  
- ```Mkdir vector``` - подготовка дирректории  
- ```Download Vector``` - загрузка архива с Vector версии ```vector_version```  
- ```Configure Vector Template config``` - создает файл конфигурации из шаблона  

### handlers
- ```Start clickhouse service``` - запуск сервиса clickhouse-server, если был вызван с task ```Install clickhouse packages```

---
## Configure
```/inventory/prod.yml```  
Необходимо указать IP или host_name серверов для установки

```/clickhouse/vars.yml```  
Необходимо указать версию пакетов для установки clickhouse

```/vector/vars.yml```  
Необходимо указать версию дистрибутива для установки vector

---
## Install
Для установки Clickhouse and Vector необходимо выполнить команду:  
``` ansible-playbook -i inventory/prod.yml site.yml```  
где:  
- ```prod.yml``` - inventory файл
- ```site.yml``` - playbook файл.

---
