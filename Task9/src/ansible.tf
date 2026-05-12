resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/inventory.tftpl",
    { 
      #ansible_group_web        = yandex_compute_instance.web.*.labels.ansible-group,
      web             = yandex_compute_instance.web,
      #ansible_group_db         = yandex_compute_instance.db.*.labels.ansible-group,
      db              = yandex_compute_instance.db,
      #ansible_group_storage    = yandex_compute_instance.storage.*.labels.ansible-group,
      storage         = yandex_compute_instance.storage.*,
    } )
  filename = "${abspath(path.module)}/hosts.ini"
}