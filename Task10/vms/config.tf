data template_file "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = var.public_key
    #packages       = nginx
  }
}
