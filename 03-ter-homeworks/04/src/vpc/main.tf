terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

#создаем облачную сеть
resource "yandex_vpc_network" "vpc" {
  name = var.name
}

#создаем подсеть
resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet-${var.name}-${var.zone}"
  zone           = var.zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = var.v4_cidr_blocks
}
