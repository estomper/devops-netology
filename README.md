# devops-netology

## Description terraform/.gitignore 
1. \*\*.terraform/* - игнорировать все файлы из вложенных каталогов .terraform
2. *.tfstate - игнорировать все файлы с расширением .tfstate
3. \*.tfstate.* - игнорировать все файлы имеющие в имени .tfstate.
4. crash.log - игнорировать все файлы crash.log
5. crash.*.log - игнорировать все файлы имеющие в имени crash.\*.log
6. *.tfvars - игнорировать все файлы с расширением *.tfvars
7. *.tfvars.json  - игнорировать все файлы имя которых оканчивается на .tfvars.json
8. override.tf - игнорировать файл override.tf
9. override.tf.json - игнорировать файл override.tf.json
10. *_override.tf - игнорировать все файлы имя которых оканчивается на _override.tf
11. *_override.tf.json - игнорировать все файлы имя которых оканчивается на _override.tf.json
12. .terraformrc - игнорировать файл .terraformrc
13. terraform.rc - игнорировать файл terraform.rc

## Домашнее задание к занятию «Инструменты Git»
Ответьте на вопросы.

1. Какому тегу соответствует коммит 85024d3?  
команда: git show 85024d3  
Ответ: tag: v0.12.23


2. Сколько родителей у коммита b8d720? Напишите их хеши.  
Команда: git show b8d720 --pretty=format:%P  
Ответ: 	2 родителя  
56cd7859e05c36c06b56d013b55a252d0bb7e158  
9ea88f22fc6269854151c571162c5bcf958bee2b  


3. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.  
Команда: git log v0.12.23...v0.12.24 --pretty=format:"%H - %s"  
Ответ:  
33ff1c03bb960b332be3af2e333462dde88b279e - v0.12.24  
b14b74c4939dcab573326f4e3ee2a62e23e12f89 - [Website] vmc provider links  
3f235065b9347a758efadc92295b540ee0a5e26e - Update CHANGELOG.md  
6ae64e247b332925b872447e9ce869657281c2bf - registry: Fix panic when server is unreachable  
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 - website: Remove links to the getting started guide's old location  
06275647e2b53d97d4f0a19a0fec11f6d69820b5 - Update CHANGELOG.md  
d5f9411f5108260320064349b757f55c09bc4b80 - command: Fix bug when using terraform login on Windows  
4b6d06cc5dcb78af637bbb19c198faff37a066ed - Update CHANGELOG.md  
dd01a35078f040ca984cdd349f18d0b67e486c35 - Update CHANGELOG.md  
225466bc3e5f35baa5d07197bbc079345b77525e - Cleanup after v0.12.23 release  


4. Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).  
Команда: git log -S 'func providerSource' --oneline  
Ответ:  
8c928e8358 main: Consult local directories as potential mirrors of providers  


5. Найдите все коммиты, в которых была изменена функция globalPluginDirs.  
Команда: git log -S 'globalPluginDirs' --oneline  
Ответ:  
65c4ba7363 Remove terraform binary  
125eb51dc4 Remove accidentally-committed binary  
22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)  
7c7e5d8f0a Don't show data while input if sensitive  
35a058fb3d main: configure credentials from the CLI config file  
c0b1761096 prevent log output during init  


6. Кто автор функции synchronizedWriters?  
Команда: git log -S 'synchronizedWriters' --pretty=format:"%cd - %H - %s, %an"  
Ответ: Martin Atkins  
