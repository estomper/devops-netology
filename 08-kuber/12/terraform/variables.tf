# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1g9up3ptkjglb5rj2tv"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1gpr28nt91k1jnaj91s"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos" {
  default = "fd8g780qosl8bthufqjh"
}

variable "centos8" {
  default = "fd8j1b4mu38iae8nsm8s"
}

variable "ubuntu" {
  default = "fd839i1233e8krfrf92s"
}

variable "host_name_1" {
  default = "master"
}

variable "host_name_2" {
  default = "node01"
}

variable "host_name_3" {
  default = "node02"
}

variable "host_name_4" {
  default = "node03"
}

variable "host_name_5" {
  default = "node04"
}