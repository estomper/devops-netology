### image vars
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image family"
}

### vm vars web

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "vm platform_id"
}

### vm vars db
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "vm platform_id"
}

### map var
variable "vms_resources" {
  type        = map(map(string))
  default     = {
    platform = {
      cores         = "2"
      memory        = "1"
      core_fraction = "5"
    }
    platform_db = {
      cores         = "2"
      memory        = "2"
      core_fraction = "20"
    }
  }
  description = "map for vms_resources"
}

variable "metadata" {
  type        = map
  default     = {
    serial-port-enable = "1"
    ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYswdNQz7Z8J7fiWhFvkJhkma3BSw7dSk1TEx/2H7LhhNRQVwBsWMjtHTgNMoFZn+q+XEOsAKycky17cpvntVufClyZwsxqF3TvQXh+8Mg3pNfqAxm7iRDYeaZFGqMaLUtDhwjtNesLEn3RMD0X9aguhJD1BeNOxRBaMb4TQElwuR7Gy5IExpMoEjI7N9hbnl9TjninF41SPBvJ/34ngGi9VYNuC6CquZ+rV8vLOReTsWt3MsCvHBI4wmK/B5uwRPZ3abW7RPhxOwOD/IdHNqvW2lgwOkv6mlQ9Wa7ZXxNs0vaZLusiJTbC6o/1ofKloaiaivOR5fxQPfjKribJUSY4eAcJIEzKD+0xMJDxXPRj0ILb5e4Xpgpx4lnQhGkSBmQX0QSp91gL+WHY2reI3VObUbEJ6KDulMrIdPmCPIBtsSo4u4i8X70kfjZWBukwvDCjjMsCug8sGshH9brxn3Pez6wR2KfOhXngH/7zGdJvddnyYixbSlDnmpMdwEwjrs= alex@ubuntu-22"
  }
  description = "map for metadata"
}


### project vars
variable "root" {
  type        = string
  default     = "netology"
  description = "root name"
}

variable "env" {
  type        = string
  default     = "develop"
  description = "env name"
}

variable "project" {
  type        = string
  default     = "platform"
  description = "project name"
}

variable "role" {
  type        = list
  default     = ["web", "db"]
  description = "role name"
}