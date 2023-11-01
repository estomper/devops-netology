# Ansible-Playbook Install Clickhouse, Vector and LightHouse

## Описание Playbook ``` /site.yml``` 

### Play Install Clickhouse 
   
Состоит из Tasks:  
- ```Get clickhouse distrib``` - загрузка пакетов Clickhouse (clickhouse-common-static, clickhouse-client, clickhouse-server) версии ```clickhouse_version```  
- ```Install clickhouse packages``` - установка пакетов Clickhouse  
- ```Create database``` - создание БД Clickhouse  
### handlers
- ```Start clickhouse service``` - запуск сервиса clickhouse-server, если был вызван из task ```Install clickhouse packages```  
  
### Play Install Vector
Состоит из Tasks:  
- ```Mkdir vector``` - подготовка дирректории  
- ```Download Vector``` - загрузка архива с Vector версии ```vector_version```  
- ```Configure Vector Template config``` - создает файл конфигурации для Vector из шаблона  
- ```Vector service``` - конфигурация сервиса для Vector
- ```Vector start service``` - запуск сервиса Vector
  
### Install Nginx
Состоит из Tasks: 
- ```Nginx epel-release``` - установка epel-release  
- ```Nginx Install``` - установка Nginx  
- ```Nginx Configure Template config``` - создает файл конфигурации для Nginx из шаблона  
  
Состоит из handlers:
- ```Nginx-start``` - запуск Nginx если был вызван из task ```Nginx Install```  
- ```Nginx-reload``` - перезагрузка Nginx если был вызван из task ```Nginx Configure Template config```  
  
### Install LightHouse
Состоит из pre_tasks:  
- ```Install Git``` - установка Git  
  
Состоит из Tasks: 
- ```Mkdir lighthouse``` - подготовка дирректории для LightHouse  
- ```Git pull``` - загрузка статики LightHouse из ```lighthouse_git```  
- ```Configure LightHouse Template config``` - создает файл конфигурации для LightHouse из шаблона  

Состоит из handlers:
- ```Nginx-reload``` - перезагрузка Nginx если был вызван из task ```Configure LightHouse Template config```  
  
---
  
## Configure
```/inventory/prod.yml```  
Необходимо указать IP или host_name серверов для установки

```/clickhouse/vars.yml```  
Необходимо указать версию пакетов для установки clickhouse

```/vector/vars.yml```  
Необходимо указать версию дистрибутива для установки vector

```/lighthouse/vars.yml```  
Необходимо указать:  
- git директорию LightHouse  
- директорию для установки LightHouse  
- порт для LightHouse

---
## Install
Для установки Clickhouse, Vector и LightHouse необходимо выполнить команду:  
``` ansible-playbook -i inventory/prod.yml site.yml```  
где:  
- ```prod.yml``` - inventory файл
- ```site.yml``` - playbook файл.

---
