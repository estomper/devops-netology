# Домашнее задание к занятию 14 «Средство визуализации Grafana»

## Обязательные задания

#
### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
2. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
3. Подключите поднятый вами prometheus, как источник данных.
4. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

## Ответ:
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/img/1.png)

#
## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
2. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
3. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

## Ответ:
утилизация CPU для nodeexporter (в процентах, 100-idle)  
```
rate(node_cpu_seconds_total{cpu="0", mode="idle"}[5m])*100
rate(node_cpu_seconds_total{cpu="1", mode="idle"}[5m])*100
```
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/img/2.png)  
  
CPULA 1/5/15  
```
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[1m])) * 100)
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[15m])) * 100)
```
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/img/3.png)  
  
количество свободной оперативной памяти  
```
node_memory_MemFree_bytes
```
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/img/4.png)  
  
количество места на файловой системе  
```
node_filesystem_avail_bytes
```
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/img/5.png)  
  
#
## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
2. В качестве решения задания приведите скриншот вашей итоговой Dashboard.
## Ответ:
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/img/5.png)  
  
## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
2. В качестве решения задания приведите листинг этого файла.

## Ответ:
[dashboard.json](https://github.com/estomper/devops-netology/blob/main/06-monitoring/02/dashboard.json)  
---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
