# # Creating a service account

# resource "yandex_iam_service_account" "sa" {
#   name = "netology-terraform-01"
# }

# # Assigning roles to a service account

# resource "yandex_resourcemanager_folder_iam_member" "sa-admin" {
#   folder_id = var.folder_id
#   role      = "storage.admin"
#   member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
# }

# Creating a static access key

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  #service_account_id = yandex_iam_service_account.sa.id
  service_account_id = var.sa_id
  description        = "static access key of sa for object storage"
}

# Creating a bucket using a static key

resource "yandex_storage_bucket" "fedinly-netology-team" {
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket                = var.bucket_name
  max_size              = 1048576
  default_storage_class = var.bucket_class
  #acl                   = "private"
  versioning {
    enabled = true
  }
  anonymous_access_flags {
    read        = false
    list        = false
    config_read = false
  }
}

resource "local_file" "backend_provision" {
  content =  <<-EOT
  %{if length(yandex_storage_bucket.fedinly-netology-team) > 0}
  bucket             = "${yandex_storage_bucket.fedinly-netology-team.bucket}"
  region             = "ru-central-1"
  access_key         = "${yandex_iam_service_account_static_access_key.sa-static-key.access_key}"
  secret_key         = "${yandex_iam_service_account_static_access_key.sa-static-key.secret_key}"
  %{endif}
  EOT
  filename = "${abspath(path.module)}/backend.hcl"
}
resource "null_resource" "creds_chmod" {
  provisioner "local-exec" {
    command = "chmod 0600 ${abspath(path.module)}/backend.hcl"
  }
}