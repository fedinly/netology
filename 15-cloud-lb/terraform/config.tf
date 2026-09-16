data template_file "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = local.user-data
    picture        = yandex_storage_object.bucket-picture.key
    bucket         = yandex_storage_bucket.task-bucket.bucket
    #packages       = nginx
  }
}
