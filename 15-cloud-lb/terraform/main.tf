module "cloud_net" {
  source       = "./vpc"
  vpc_name     = "cloud_net"
  subnet_zones = ["ru-central1-b","ru-central1-d"]
  cidr_blocks  = ["192.168.10.0/24","192.168.20.0/24"]
  cloud_id       = var.cloud_id
  folder_id      = var.folder_id 
}

resource "yandex_storage_bucket" "task-bucket" {
  #access_key = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  #secret_key = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
  folder_id             = var.folder_id
  bucket                = var.bucket_name
  max_size              = 104857600
  default_storage_class = var.bucket_class
  #acl                   = "private"
  versioning {
    enabled = true
  }
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = true 
  }
}
resource "yandex_storage_object" "bucket-picture" {
  bucket     = yandex_storage_bucket.task-bucket.id
  key        = "images/cat.jpg" # Путь и имя файла внутри бакета
  source     = "./cat.jpg" # Путь к файлу на вашем компьютере
  #access_key = "your_static_access_key"
  #secret_key = "your_static_secret_key"
  content_type = "image/png" 
}

locals {
  subnet_id_list = module.cloud_net.subnet_details
  user-data = "${file("~/.ssh/id_ed25519.pub")}"
}

data "yandex_compute_image" "laps" {
  image_id  = var.vm_image_id
}

resource "yandex_compute_instance_group" "laps-group" {
  name               = "laps-instance-group-01"
  folder_id          = var.folder_id
  service_account_id = var.sa_id

  instance_template {
    platform_id = "standard-v3"
    resources {
      cores  = 2
      memory = 2
      core_fraction = 20
    }

    boot_disk {
      initialize_params {
        image_id = var.vm_image_id
        size     = 10
      }
    }

    network_interface {
      network_id = module.cloud_net.network_id
      subnet_ids = [local.subnet_id_list[1].id]
      nat        = true
    }
    scheduling_policy {
      preemptible   = true
    }
    metadata = {
      user-data  = data.template_file.cloudinit.rendered
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [local.subnet_id_list[1].zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_creating    = 1
    max_expansion   = 1
    max_deleting    = 1
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "TG Network Load Balancer"
  }
}

resource "yandex_lb_network_load_balancer" "lb-1" {
  name = "network-load-balancer-1"

  listener {
    name = "nlb-1-listener"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.laps-group.load_balancer.0.target_group_id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/index.html"
      }
    }
  }
}
