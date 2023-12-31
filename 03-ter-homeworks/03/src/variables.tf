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