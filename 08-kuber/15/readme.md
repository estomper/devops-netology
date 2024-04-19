# Домашнее задание к занятию Troubleshooting

### Цель задания

Устранить неисправности при деплое приложения.

### Чеклист готовности к домашнему заданию

1. Кластер K8s.

### Задание. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить

1. Установить приложение по команде:
```shell
kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml
```
2. Выявить проблему и описать.
### Ответ:
1. Отсутствуют ns: web, data
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/15/img/1.png)  

2. Ошибки в логах пода web-consumer: curl: (6) Couldn't resolve host 'auth-db' из-за того что сервисы разположены в разных ns и необходимо изменить адрес вызова сервиса auth-db указав ns

3. Исправить проблему, описать, что сделано.
### Ответ:
1. Создать ns: web, data
```
kubectl create ns web
kubectl create ns data
```
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/15/img/2.png) 
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/15/img/3.png)  

2. Исправлен адрес вызова сервиса auth-db в deployment скервиса web
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/15/img/4.png) 

4. Продемонстрировать, что проблема решена.
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/08-kuber/15/img/5.png) 


### Правила приёма работы

1. Домашняя работа оформляется в своём Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.