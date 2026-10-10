#создаем облачную сеть для k8s
module "cluster_net" {
  source       = "./modules/vpc"
  vpc_name     = var.vpc_name
  subnet_zones = var.subnet_zones
  db_subnet_zones = var.db_subnet_zones
  subnets      = var.k8s_subnets
  cidr_blocks_priv = var.cidr_blocks_priv
  cidr_blocks_pub  = var.cidr_blocks_pub
  external_static_ips = var.external_static_ips
  white_ips_for_master = var.white_ips_for_master
}
# создаем кластер MySQL
module "db_cluster" {
  source       = "./modules/cluster"
  env_name     = var.env_name
  network_id   = module.cluster_net.network_id
  subnet_id    = module.cluster_net.subnet_priv_details.*.id
  ha           = var.ha
  subnet_zones = var.db_subnet_zones
}
module "data" {
  source       = "./modules/data"
  cluster_id   = module.db_cluster.cluster_id
  db_name      = var.db_name
  db_user_name = var.db_user_name
  db_user_pw   = var.db_user_pw
  db_protect   = var.db_protect
  depends_on = [ module.cluster_net ]
}
# создаем кластер k8s
module "k8s_cluster" {
  source       = "./modules/k8s_cluster"
  #env_name     = var.env_name
  network_id   = module.cluster_net.network_id
  k8s_workers_subnet_info =    module.cluster_net.k8s_workers_subnet_info
  k8s_masters_subnet_info =   module.cluster_net.k8s_masters_subnet_info
  subnet_zones = var.subnet_zones
  folder_id    = var.folder_id
  service_account_name = var.service_account_name
  node_service_account_name = var.node_service_account_name
  platform     = var.platform
  env_name_k8s = var.env_name_k8s
  np_provider  = var.np_provider
  master_version = var.master_version
  sg_internal = module.cluster_net.sg_internal
  sg_k8s_worker = module.cluster_net.sg_k8s_worker
  sg_k8s_master = module.cluster_net.sg_k8s_master
  node_groups = var.node_groups
}
