
data "vault_generic_secret" "vault_example" {
  path = "secret/example"
}
output "vault_example" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data).db_password #функция nonsensitive позволяет узнать значение sensitive данных
}

resource "vault_generic_secret" "example" {
  path = "secret/example"

  data_json = <<EOT
{
  "db_password": "${var.new_secret}"
}
EOT
}