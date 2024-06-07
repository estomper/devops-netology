
# Create bucket
resource "yandex_storage_bucket" "s3-tfstate-netology" {
  bucket = "s3-tfstate-netology"
  folder_id = "${var.yandex_folder_id}"
  max_size = 104857600
  default_storage_class = "COLD"
  acl    = "private"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  
  /*
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  */
}
/*
# Create doc Table
resource "aws_dynamodb_table" "db-tfstate" {
  name         = "tb-tfstate"
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "<attribute_name_1>"
  range_key = "<attribute_name_2>"

  attribute {
    name = "<attribute_name_1>"
    type = "<attribute_type>"
  }

  attribute {
    name = "<attribute_name_2>"
    type = "<attribute_type>"
  }
}
*/