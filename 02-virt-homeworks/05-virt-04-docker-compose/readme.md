## Задача 1  
Создайте собственный образ любой операционной системы (например, debian-11) с помощью Packer версии 1.5.0 (инструкция).  
Чтобы получить зачёт, вам нужно предоставить скриншот страницы с созданным образом из личного кабинета YandexCloud.  

## Ответ  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_1.png)

## Задача 2  
2.1. Создайте вашу первую виртуальную машину в YandexCloud с помощью web-интерфейса YandexCloud.  
2.2.* (Необязательное задание)  
Создайте вашу первую виртуальную машину в YandexCloud с помощью Terraform (вместо использования веб-интерфейса YandexCloud). Используйте Terraform-код в директории (src/terraform).  
Чтобы получить зачёт, вам нужно предоставить вывод команды terraform apply и страницы свойств, созданной ВМ из личного кабинета YandexCloud.  

## Ответ  2.1
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_2.1.png)
## Ответ  2.2
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_2.2.1.png)
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_2.2.2.png)

## Задача 3  
С помощью Ansible и Docker Compose разверните на виртуальной машине из предыдущего задания систему мониторинга на основе Prometheus/Grafana. Используйте Ansible-код в директории (src/ansible).  
Чтобы получить зачёт, вам нужно предоставить вывод команды "docker ps" , все контейнеры, описанные в docker-compose, должны быть в статусе "Up".  

## Ответ  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_3.png)

## Задача 4  
Откройте веб-браузер, зайдите на страницу http://<внешний_ip_адрес_вашей_ВМ>:3000.  
Используйте для авторизации логин и пароль из .env-file.  
Изучите доступный интерфейс, найдите в интерфейсе автоматически созданные docker-compose-панели с графиками(dashboards).  
Подождите 5-10 минут, чтобы система мониторинга успела накопить данные.  
Чтобы получить зачёт, предоставьте: скриншот работающего веб-интерфейса Grafana с текущими метриками.  

## Ответ  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_4.1.png)
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_4.2.png)

## Задача 5  
Создайте вторую ВМ и подключите её к мониторингу, развёрнутому на первом сервере.  
Чтобы получить зачёт, предоставьте: скриншот из Grafana, на котором будут отображаться метрики добавленного вами сервера.  

## Ответ  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/05-virt-04-docker-compose/img/ex_5.png)