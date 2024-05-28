resource "yandex_kms_symmetric_key" "key-a" {
  name              = "symetric-key"
  description       = "description for key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h" // equal to 1 year
  folder_id         = "${var.yandex_folder_id}"
}