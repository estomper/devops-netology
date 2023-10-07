
resource "yandex_compute_instance" "for-each-vm" {
  depends_on = [yandex_compute_instance.count-vm]
  for_each = { for index, vm in var.for_each_vms: vm.name => vm }
  name = each.value.name
  resources {
    cores     = each.value.cores
    memory     = each.value.memory
    core_fraction = each.value.core_fraction
  }
      
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_size
    }
   }

  allow_stopping_for_update = true

  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata["serial-port-enable"]
    ssh-keys           = local.ssh-keys
  }
}