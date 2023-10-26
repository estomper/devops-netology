variable "name" {
  type    = string
  default = "vpc"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "v4_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "ip" {
  type        = string
  default     = "192.168.0.1"
  #default     = "1920.1680.0.1"
  description = "ip-адрес"
  validation {
    condition = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",var.ip))
    error_message = "Invalid IP-address"
 }
}

variable "ips" {
  type        = list(string)
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  #default     = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]
  description = "список ip-адресов"
  validation {
    condition = alltrue([
      for a in var.ips : can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", a))
    ])
    error_message = "Invalid list IP-address"
    }
}