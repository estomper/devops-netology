/*
#nat-instance
resource "yandex_compute_instance" "nat-instance" {
  name                      = "${var.host_name_1}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.host_name_1}"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.nat_instance}"
      name        = "${var.host_name_1}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.public.id}"
    nat        = true
    ip_address = "192.168.10.254"
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

#vm-public
resource "yandex_compute_instance" "vm-public" {
  name                      = "${var.host_name_2}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.host_name_2}"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      name        = "${var.host_name_2}"
      type        = "network-hdd"
      size        = "10"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.public.id}"
    nat        = true
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

/*
#vm-private
resource "yandex_compute_instance" "vm-private" {
  name                      = "${var.host_name_3}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.host_name_3}"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      name        = "${var.host_name_3}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id  = "${yandex_vpc_subnet.private.id}"
    nat        = false
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

*/