module "cloud_net" {
  source       = "./vpc"
  vpc_name     = "cloud_net_module"
  subnet_zones = ["ru-central1-b","ru-central1-d"]
  cidr_blocks  = ["192.168.10.0/24","192.168.20.0/24"] 
}
