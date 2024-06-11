
# Create bucket
resource "yandex_storage_bucket" "s3-tfstate-netology" {
  bucket = "s3-tfstate-netology"
  folder_id = "${var.yandex_folder_id}"
  max_size = 104857600
  default_storage_class = "COLD"
  acl    = "private"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  