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

variable "nat_instance" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "ubuntu" {
  default = "fd839i1233e8krfrf92s"
}

# host_names
variable "host_name_1" {
  default = "nat-instance"
}

variable "host_name_2" {
  default = "vm-public"
}

variable "host_name_3" {
  default = "vm-private"
}