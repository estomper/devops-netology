/*
# Network
resource "yandex_vpc_network" "default" {
  name = "default-ru-central1-a"
}

resource "yandex_vpc_subnet" "default" {
  name = "my-subnet-a"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.default.id}"
  network_id     = "e9be3n4gsn4nioamqb43"
  v4_cidr_blocks = ["192.168.101.0/24"]
  v4_cidr_blocks = ["10.1.2.0/24"]
}
*/