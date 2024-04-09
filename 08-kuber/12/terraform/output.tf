output "internal_ip_address_host-1_yandex_cloud" {
  value = "${yandex_compute_instance.host-1.network_interface.0.ip_address}"
}

output "external_ip_address_host-1_yandex_cloud" {
  value = "${yandex_compute_instance.host-1.network_interface.0.nat_ip_address}"
}


output "internal_ip_address_host-2_yandex_cloud" {
  value = "${yandex_compute_instance.host-2.network_interface.0.ip_address}"
}

output "external_ip_address_host-2_yandex_cloud" {
  value = "${yandex_compute_instance.host-2.network_interface.0.nat_ip_address}"
}


output "internal_ip_address_host-3_yandex_cloud" {
  value = "${yandex_compute_instance.host-3.network_interface.0.ip_address}"
}

output "external_ip_address_host-3_yandex_cloud" {
  value = "${yandex_compute_instance.host-3.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_host-4_yandex_cloud" {
  value = "${yandex_compute_instance.host-4.network_interface.0.ip_address}"
}

output "external_ip_address_host-4_yandex_cloud" {
  value = "${yandex_compute_instance.host-4.network_interface.0.nat_ip_address}"
}

output "internal_ip_address_host-5_yandex_cloud" {
  value = "${yandex_compute_instance.host-5.network_interface.0.ip_address}"
}

output "external_ip_address_host-5_yandex_cloud" {
  value = "${yandex_compute_instance.host-5.network_interface.0.nat_ip_address}"
}