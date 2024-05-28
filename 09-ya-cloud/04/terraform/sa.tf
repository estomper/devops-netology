// Create SA
resource "yandex_iam_service_account" "sa" {
  folder_id = "${var.yandex_folder_id}"
  name      = "sa"
}

// Grant permissions k8s
resource "yandex_resourcemanager_folder_iam_member" "sa-k8s" {
  folder_id = "${var.yandex_folder_id}"
  #role      = "storage.editor"
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Grant permissions vpc.publicAdmin
resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
  folder_id = "${var.yandex_folder_id}"
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Grant permissions docker
resource "yandex_resourcemanager_folder_iam_member" "editor" {
 folder_id = "${var.yandex_folder_id}"
 role      = "editor"
 member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Grant permissions container-registry.images.puller
resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
 folder_id = "${var.yandex_folder_id}"
 role      = "container-registry.images.puller"
 member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Grant permissions kms.keys.encrypterDecrypter
resource "yandex_resourcemanager_folder_iam_member" "encrypterDecrypter" {
  folder_id = "${var.yandex_folder_id}"
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}


/*
// Create Static Access Keys
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "SA"
}
*/