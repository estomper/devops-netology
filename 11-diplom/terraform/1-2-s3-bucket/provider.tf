# Provider YA
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">= 0.13"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "sa-key.json"
  cloud_id  = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
}

/*
# Provider AWS
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

*/

/*
provider "aws" {
  region = "ru-central1"
  endpoints {
    dynamodb = "https://docapi.serverless.yandexcloud.net/ru-central1/${var.yandex_cloud_id}/<ydb_database_id>"
  }
  profile = "<profile_name>"
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_region_validation = true
  skip_requesting_account_id = true
}

*/