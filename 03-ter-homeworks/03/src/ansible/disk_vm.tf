
resource "yandex_compute_disk" "disk-storage" {
  count = 3
  name  = "disk-${count.index}"
  size  = 1
}

resource "yandex_compute_instance" "storage-vm" {
  depends_on = [yandex_compute_disk.disk-storage]
  name        = "storage"
  platform_id = "standard-v1"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
   }


  dynamic secondary_disk{
    for_each = "${yandex_compute_disk.disk-storage.*.id}"
    content {
        disk_id = yandex_compute_disk.disk-storage["${secondary_disk.key}"].id
    }    
  }

  allow_stopping_for_update = true

  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.metadata["serial-port-enable"]
    ssh-keys           = local.ssh-keys
  }
}
