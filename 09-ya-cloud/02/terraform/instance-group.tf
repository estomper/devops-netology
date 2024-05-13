
resource "yandex_compute_instance_group" "group" {
  name                = "alex-ig"
  folder_id           = "${var.yandex_folder_id}"
  service_account_id  = "${yandex_iam_service_account.sa.id}"
  deletion_protection = false
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size     = 4
      }
    }
    network_interface {
      network_id = "${yandex_vpc_network.default.id}"
      subnet_ids = ["${yandex_vpc_subnet.public.id}"]
    }
    labels = {
      label1 = "label1-value"
      label2 = "label2-value"
      label3 = "label3-value"
    }
    metadata = {
      user-data = "${file("cloud-init.yaml")}"


    }
    network_settings {
      type = "STANDARD"
    }
  }
  
  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "Целевая группа Network Load Balancer"
  }
}
