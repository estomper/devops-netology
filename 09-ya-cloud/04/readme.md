# Домашнее задание к занятию «Кластеры. Ресурсы под управлением облачных провайдеров»

### Цели задания 

1. Организация кластера Kubernetes и кластера баз данных MySQL в отказоустойчивой архитектуре.
2. Размещение в private подсетях кластера БД, а в public — кластера Kubernetes.

---
## Задание 1. Yandex Cloud

1. Настроить с помощью Terraform кластер баз данных MySQL.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/1.png) 
 - Используя настройки VPC из предыдущих домашних заданий, добавить дополнительно подсеть private в разных зонах, чтобы обеспечить отказоустойчивость. 
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/0.png) 
 - Разместить ноды кластера MySQL в разных подсетях.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/2.png) 
 - Необходимо предусмотреть репликацию с произвольным временем технического обслуживания.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/3.png) 
 - Использовать окружение Prestable, платформу Intel Broadwell с производительностью 50% CPU и размером диска 20 Гб.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/4.png) 
 - Задать время начала резервного копирования — 23:59.
 - Включить защиту кластера от непреднамеренного удаления.
 - Создать БД с именем `netology_db`, логином и паролем.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/5.png) 

2. Настроить с помощью Terraform кластер Kubernetes.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/8.1.png) 
 - Используя настройки VPC из предыдущих домашних заданий, добавить дополнительно две подсети public в разных зонах, чтобы обеспечить отказоустойчивость.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/6.png)  
 - Создать отдельный сервис-аккаунт с необходимыми правами. 
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/7.png)  
 - Создать региональный мастер Kubernetes с размещением нод в трёх разных подсетях.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/8.2.png)  
 - Добавить возможность шифрования ключом из KMS, созданным в предыдущем домашнем задании.
 - Создать группу узлов, состояющую из трёх машин с автомасштабированием до шести.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/9.png)  
 - Подключиться к кластеру с помощью `kubectl`.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/10.png)  
 - *Запустить микросервис phpmyadmin и подключиться к ранее созданной БД.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/11.png)  
 - *Создать сервис-типы Load Balancer и подключиться к phpmyadmin. Предоставить скриншот с публичным адресом и подключением к БД.
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/11.1.png)  
 ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/09-ya-cloud/04/img/12.png)  

Полезные документы:

- [MySQL cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_cluster).
- [Создание кластера Kubernetes](https://cloud.yandex.ru/docs/managed-kubernetes/operations/kubernetes-cluster/kubernetes-cluster-create)
- [K8S Cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_cluster).
- [K8S node group](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/kubernetes_node_group).

--- 
## Задание 2*. Вариант с AWS (задание со звёздочкой)

Это необязательное задание. Его выполнение не влияет на получение зачёта по домашней работе.

**Что нужно сделать**

1. Настроить с помощью Terraform кластер EKS в три AZ региона, а также RDS на базе MySQL с поддержкой MultiAZ для репликации и создать два readreplica для работы.
 
 - Создать кластер RDS на базе MySQL.
 - Разместить в Private subnet и обеспечить доступ из public сети c помощью security group.
 - Настроить backup в семь дней и MultiAZ для обеспечения отказоустойчивости.
 - Настроить Read prelica в количестве двух штук на два AZ.

2. Создать кластер EKS на базе EC2.

 - С помощью Terraform установить кластер EKS на трёх EC2-инстансах в VPC в public сети.
 - Обеспечить доступ до БД RDS в private сети.
 - С помощью kubectl установить и запустить контейнер с phpmyadmin (образ взять из docker hub) и проверить подключение к БД RDS.
 - Подключить ELB (на выбор) к приложению, предоставить скрин.

Полезные документы:

- [Модуль EKS](https://learn.hashicorp.com/tutorials/terraform/eks).

### Правила приёма работы

Домашняя работа оформляется в своём Git репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.