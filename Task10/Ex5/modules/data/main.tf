terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_mdb_mysql_database" "test-db" {
  cluster_id = var.cluster_id
  name       = var.db_name

}
resource "yandex_mdb_mysql_user" "test-db-user" {
  name       = var.db_user_name
  cluster_id = var.cluster_id
  password   = var.db_user_pw
}