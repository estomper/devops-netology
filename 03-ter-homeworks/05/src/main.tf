terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"

  backend "s3" {
  endpoint = "storage.yandexcloud.net"
  bucket = "estomper-tfstate-develop"
  region = "ru-central1"
  key = "terraform.tfstate"
  skip_region_validation = true
  skip_credentials_validation = true
  dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g9up3ptkjglb5rj2tv/etni4c198bvc0g033cps"
  dynamodb_table = "tfstate-develop"
  }
}


provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  #zone      = var.default_zone
}

module "vpc" {
  source           = "./vpc"
  name         = "develop"
  zone         = "ru-central1-a"
  v4_cidr_blocks  = ["10.10.0.0/24"]
}


module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.vpc.network_id
  subnet_zones    = module.vpc.subnet_zones
  subnet_ids      = module.vpc.subnet_id
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
 vars = {
    ssh-keys  = "${file("~/.ssh/id_rsa.pub")}"
  }
}

