data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }

}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "marketing" 
  #network_id     = yandex_vpc_network.develop.id
  network_id     = data.terraform_remote_state.vpc.outputs.network_id
  subnet_zones   = ["ru-central1-a","ru-central1-d"]
  #subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  subnet_ids     = [data.terraform_remote_state.vpc.outputs.subnet_id[0], data.terraform_remote_state.vpc.outputs.subnet_id[1]]
  instance_name  = "webs"
  instance_count = 2
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    owner= "i.ivanov",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "analytics"
  network_id     = data.terraform_remote_state.vpc.outputs.network_id
  subnet_zones   = ["ru-central1-a"]
  #subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  subnet_ids     = [data.terraform_remote_state.vpc.outputs.subnet_id[0]]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true
  
  labels = { 
    owner= "b.petrov",
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}


