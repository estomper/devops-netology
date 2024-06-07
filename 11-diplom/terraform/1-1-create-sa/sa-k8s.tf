// Create SA
resource "yandex_iam_service_account" "sa_k8s" {
  folder_id = "${var.yandex_folder_id}"
  name      = "sa-k8s"
}

// Grant permissions k8s
resource "yandex_resourcemanager_folder_iam_member" "sa_k8s" {
  folder_id = "${var.yandex_folder_id}"
  role      = "k8s.clusters.agent"
  member    = "serviceAccount:${yandex_iam_service_account.sa_k8s.id}"
}

// Grant permissions vpc.publicAdmin
resource "yandex_resourcemanager_folder_iam_member" "vpc-public-admin" {
  folder_id = "${var.yandex_folder_id}"
  role      = "vpc.publicAdmin"
  member    = "serviceAccount:${yandex_iam_service_account.sa_k8s.id}"
}

// Grant permissions editor
resource "yandex_resourcemanager_folder_iam_member" "editor" {
 folder_id = "${var.yandex_folder_id}"
 role      = "editor"
 member    = "serviceAccount:${yandex_iam_service_account.sa_k8s.id}"
}

// Grant permissions container-registry.images.puller
resource "yandex_resourcemanager_folder_iam_member" "images-puller" {
 folder_id = "${var.yandex_folder_id}"
 role      = "container-registry.images.puller"
 member    = "serviceAccount:${yandex_iam_service_account.sa_k8s.id}"
}