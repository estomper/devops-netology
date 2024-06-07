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

# S3 bucket name
variable "s3_bucket_name" {
  default = "s3-tfstate-netology"
}

# sa_k8s id
variable "sa_k8s_id" {
  default = "ajelcp7uj1iq2c3cseq0"
}

# IP
variable "host_ip" {
  default = "92.255.137.0/24"
}

