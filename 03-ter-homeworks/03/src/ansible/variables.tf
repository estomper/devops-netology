###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYswdNQz7Z8J7fiWhFvkJhkma3BSw7dSk1TEx/2H7LhhNRQVwBsWMjtHTgNMoFZn+q+XEOsAKycky17cpvntVufClyZwsxqF3TvQXh+8Mg3pNfqAxm7iRDYeaZFGqMaLUtDhwjtNesLEn3RMD0X9aguhJD1BeNOxRBaMb4TQElwuR7Gy5IExpMoEjI7N9hbnl9TjninF41SPBvJ/34ngGi9VYNuC6CquZ+rV8vLOReTsWt3MsCvHBI4wmK/B5uwRPZ3abW7RPhxOwOD/IdHNqvW2lgwOkv6mlQ9Wa7ZXxNs0vaZLusiJTbC6o/1ofKloaiaivOR5fxQPfjKribJUSY4eAcJIEzKD+0xMJDxXPRj0ILb5e4Xpgpx4lnQhGkSBmQX0QSp91gL+WHY2reI3VObUbEJ6KDulMrIdPmCPIBtsSo4u4i8X70kfjZWBukwvDCjjMsCug8sGshH9brxn3Pez6wR2KfOhXngH/7zGdJvddnyYixbSlDnmpMdwEwjrs= alex@ubuntu-22"
}

variable "metadata" {
  type        = map
  default     = {
    serial-port-enable = "1"
   }
  description = "map for metadata"
}

variable "for_each_vms" {
  description = "List of for-each-vms"
  type = list(object({
    name          = string
    cores         = number
    memory        = number
    disk_size     = number
    core_fraction = number
  }))
  default = [
    {
      name          = "main"
      cores         = 2
      memory        = 1
      disk_size     = 5
      core_fraction = 5
    },
    {
      name          = "replica"
      cores         = 2
      memory        = 2
      disk_size     = 6
      core_fraction = 20
    }
  ]
}