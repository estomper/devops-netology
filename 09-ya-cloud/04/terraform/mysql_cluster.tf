# Create CLUSTER
resource "yandex_mdb_mysql_cluster" "mysql" {
  name        = "test"
  environment = "PRESTABLE"
  network_id  = "${yandex_vpc_network.default.id}"
  version     = "8.0"
  deletion_protection = true

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  maintenance_window {
    type = "ANYTIME"
  }

  backup_window_start {
    hours = 23
    minutes = 59
  }

  access {
    web_sql = true
  }

  host {
    zone      = "ru-central1-a"
    name      = "na-1"
    subnet_id = "${yandex_vpc_subnet.private-a.id}"
  }
  host {
    zone      = "ru-central1-b"
    name      = "nb-1"
    subnet_id = "${yandex_vpc_subnet.private-b.id}"
  }
}

# Create DB
resource "yandex_mdb_mysql_database" "netology" {
  cluster_id = "${yandex_mdb_mysql_cluster.mysql.id}"
  name       = "netology_db"
}

# Create USER
resource "yandex_mdb_mysql_user" "alex" {
    cluster_id = "${yandex_mdb_mysql_cluster.mysql.id}"
    name       = "alex"
    password   = "Qwe12345"

    permission {
      database_name = "${yandex_mdb_mysql_database.netology.name}"
      roles         = ["ALL"]
    }

    connection_limits {
      max_questions_per_hour   = 10
      max_updates_per_hour     = 20
      max_connections_per_hour = 30
      max_user_connections     = 40
    }

    global_permissions = ["PROCESS"]
    authentication_plugin = "SHA256_PASSWORD"
}