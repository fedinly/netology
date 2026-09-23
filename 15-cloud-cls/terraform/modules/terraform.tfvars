
env_name     = "clopro-cls"
subnet_zones = ["ru-central1-b","ru-central1-a"]
db_name      = "netology_db"
db_user_name = "app"
db_protect   = "DELETION_PROTECTION_MODE_INHERITED" 
ha           = true
vpc_name     = "db_cls_net"
cidr_blocks  = ["10.0.1.0/24","10.0.3.0/24"] 