# Домашнее задание к занятию «Установка Kubernetes»

### Цель задания

Установить кластер K8s.

### Чеклист готовности к домашнему заданию

1. Развёрнутые ВМ с ОС Ubuntu 20.04-lts.


### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Инструкция по установке kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/).
2. [Документация kubespray](https://kubespray.io/).

-----

### Задание 1. Установить кластер k8s с 1 master node

1. Подготовка работы кластера из 5 нод: 1 мастер и 4 рабочие ноды.
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/12/img/1.png)  
2. В качестве CRI — containerd.
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/12/img/2.png)  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/12/img/3.png)  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/12/img/4.png)  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/12/img/5.png)  
3. Запуск etcd производить на мастере.  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/12/img/6.png)  
4. Способ установки выбрать самостоятельно.

## Дополнительные задания (со звёздочкой)

**Настоятельно рекомендуем выполнять все задания под звёздочкой.** Их выполнение поможет глубже разобраться в материале.   
Задания под звёздочкой необязательные к выполнению и не повлияют на получение зачёта по этому домашнему заданию. 

------
### Задание 2*. Установить HA кластер

1. Установить кластер в режиме HA.
2. Использовать нечётное количество Master-node.
3. Для cluster ip использовать keepalived или другой способ.

### Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl get nodes`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.