# Provider YA
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket = "s3-tfstate-netology"
    region = "ru-central1"
    key    = "terraform/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
}
}

provider "yandex" {
  ####service_account_key_file = "${ secrets.YC_SA_TERRAFORM_JSON_CREDENTIALS }"
  token     = "${var.token}"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}