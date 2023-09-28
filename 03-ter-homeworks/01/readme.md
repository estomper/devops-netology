
# Домашнее задание к занятию 1.  «Введение в Terraform»

Чек-лист готовности к домашнему заданию  
Скачайте и установите актуальную версию Terraform >=1.4.X . Приложите скриншот вывода команды terraform --version.  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_1.png)  
Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории 01/src.  
Убедитесь, что в вашей ОС установлен docker.  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_2.png)  
Зарегистрируйте аккаунт на сайте https://hub.docker.com/, выполните команду docker login и введите логин, пароль.  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_3.png)  

---

## Задача 1
1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?
3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
6. Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve.  Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. В качестве ответа дополнительно приложите вывод команды docker ps.
7. Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
8. Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ обязательно подкрепите строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )

## Ответ
2. Согласно .gitignore охранить личную, секретную информацию можно в файле personal.auto.tfvars  
3. ![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_4.png) 
4. Ошибка_1: отсутсует имя ресурса. All resource blocks must have 2 labels (type, name)  
 Ошибка_2: в наименовании ресурса. Имя должно начинаться с буквы или подчеркивания и может содержать только буквы, цифры, подчеркивания и тире.  
 Ошибка_3: Не объявлен random_string_FAKE в random_password. A managed resource "random_password" "random_string_FAKE" has not been declared in the root module.  
 Ошибка_4: Неверное обращение к ресурсу random_string.resulT. This object has no argument, nested block, or exported attribute named "resulT". Did you mean "result"?  
5. 
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_5.png)  
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_6.png)  

6.
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_7.png)  
Опасность применения ключа -auto-approve: Есть риск применения неверных конфигураций, т.к. применение происходит без подтверждения.  
7.
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_8.png)  
8. Т.к. указан keep_locally = true,  образ Docker не будет удален при операции уничтожения. Если это значение ложно, оно удалит изображение из локального хранилища докера при операции уничтожения.  
   
## Задача 2
Изучите в документации provider Virtualbox от shekeriev.  
Создайте с его помощью любую виртуальную машину. Чтобы не использовать VPN, советуем выбрать любой образ с расположением в GitHub из списка.  

## Ответ
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_9.png)
![ScreenShot](https://github.com/estomper/devops-netology/blob/main/03-ter-homeworks/01/img/img_10.png)
