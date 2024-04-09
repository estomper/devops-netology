resource "yandex_compute_instance" "host-1" {
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
      image_id    = "${var.ubuntu}"
      name        = "${var.host_name_1}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "e9bnru09j799fc2n0dfj"
    nat       = true
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

resource "yandex_compute_instance" "host-2" {
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
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "e9bnru09j799fc2n0dfj"
    nat       = true
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

resource "yandex_compute_instance" "host-3" {
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
    subnet_id = "e9bnru09j799fc2n0dfj"
    nat       = true
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

resource "yandex_compute_instance" "host-4" {
  name                      = "${var.host_name_4}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.host_name_4}"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      name        = "${var.host_name_4}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "e9bnru09j799fc2n0dfj"
    nat       = true
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

resource "yandex_compute_instance" "host-5" {
  name                      = "${var.host_name_5}"
  zone                      = "ru-central1-a"
  hostname                  = "${var.host_name_5}"
  allow_stopping_for_update = true

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id    = "${var.ubuntu}"
      name        = "${var.host_name_5}"
      type        = "network-hdd"
      size        = "20"
    }
  }

  network_interface {
    subnet_id = "e9bnru09j799fc2n0dfj"
    nat       = true
  }
  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}