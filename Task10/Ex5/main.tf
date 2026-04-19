#создаем облачную сеть
module "dev_net" {
  source       = "./modules/vpc"
  vpc_name     = var.vpc_name
  subnet_zones = var.subnet_zones
  cidr_blocks  = var.cidr_blocks
}
# создаем кластер MySQL
module "test_cluster" {
  source       = "./modules/cluster"
  env_name     = var.env_name
  network_id   = module.dev_net.network_id
  subnet_id    = module.dev_net.subnet_id.*
  ha           = var.ha
  subnet_zones = var.subnet_zones
}
module "data" {
  source = "./modules/data"
  cluster_id   = module.test_cluster.cluster_id
  db_name      = var.db_name
  db_user_name = var.db_user_name
  db_user_pw   = var.db_user_pw
}