# Домашнее задание к занятию 2.  «Основы Terraform. Yandex Cloud»
  
Ссылка на репо - https://github.com/estomper/devops-netology/tree/main/03-ter-homeworks/02/src

## Задача 0
Запросите preview-доступ к этому функционалу в личном кабинете Yandex Cloud. Обычно его выдают в течение 24-х часов. https://console.cloud.yandex.ru/folders/<ваш cloud_id>/vpc/security-groups.  
Этот функционал понадобится к следующей лекции.  

## Ответ:
Правильно ли я понимаю, что у меня уже есть доступ (см. скриншот)?  
И в  https://console.cloud.yandex.ru/folders/<ваш cloud_id>/vpc/security-groups вместо <ваш cloud_id> я подставил свой folder_id  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_0.png)  

## Задача 1
## Ответ
скриншот ЛК Yandex Cloud с созданной ВМ  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_1.png)  
  
скриншот успешного подключения к консоли ВМ через ssh.  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_2.png)  
  
ответы на вопросы:  
core_fraction- Если указано, указывает базовую производительность ядра в процентах. https://cloud.yandex.ru/docs/compute/concepts/performance-levels  
Данный параметр выбирается в зависимости от запуска приложений, требующих или не требующих высокой производительности и чувствительно / не чувствительных к задержкам.  
ВМ с уровнем производительности меньше 100% будут дешевле.  
  
preemptible- (Необязательно) Указывает, является ли экземпляр вытесняемым. По умолчанию ложь. https://cloud.yandex.ru/docs/compute/concepts/preemptible-vm 
ВМ, которые могут быть принудительно остановлены в любой момент. Это может произойти в двух случаях:  
Если с момента запуска виртуальной машины прошло 24 часа.  
Если возникнет нехватка ресурсов для запуска обычной виртуальной машины в той же зоне доступности. Вероятность такого события низкая, но может меняться изо дня в день.  
Прерываемые виртуальные машины доступны по более низкой цене в сравнении с обычными, однако не обеспечивают отказоустойчивости.  


## Задача 2
Проверьте terraform plan. Изменений быть не должно.  
## Ответ
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_3.png)  

## Задача 3
Примените изменения.  
## Ответ
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_4.png)  

## Задача 4
В качестве решения приложите вывод значений ip-адресов команды terraform output.  
## Ответ
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_5.png)  

## Задача 5
Примените изменения.
## Ответ
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_6.png)  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_7.png)  

## Задача 6
Проверьте terraform plan. Изменений быть не должно.
## Ответ
Ссылка на репо - https://github.com/estomper/devops-netology/tree/main/03-ter-homeworks/02/src
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/02/img/img_8.png)  


## Задача 7*
1. Напишите, какой командой можно отобразить второй элемент списка test_list.  
2. Найдите длину списка test_list с помощью функции length(<имя переменной>).  
3. Напишите, какой командой можно отобразить значение ключа admin из map test_map.  
4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.  

## Ответ
1. local.test_list[1]  
2. length(local.test_list)  
3. local.test_map.admin  
4. Не понял какой функцией объединять данные, но логика будет такая:  
    
local.test_map.admin + " is admin for " + local.test_list[2] + " server based on OS " + local.servers.production.image + " with " + local.servers.production.cpu + " vcpu, " + local.servers.production.ram + " ram, " + length(local.servers.production.disks) + " virtual disks."