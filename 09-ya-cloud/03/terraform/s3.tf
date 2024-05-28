
resource "yandex_storage_bucket" "alex_s3" {
  bucket = "alex-2024-05-12"
  folder_id = "${var.yandex_folder_id}"
  max_size = 10485760
  default_storage_class = "COLD"
  acl    = "public-read"
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
