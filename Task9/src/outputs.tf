/*variable "vms" {
  description = "vms"

  type = map(list(object(
    {
      name = string,
      id   = string,
      fqdn = string
    }))
  )
  default = {
    "web" = [ {
      name = "1"
      id = "fdfsf"
      fqdn = "fdefsdf"
    } ],
  }
}
*/
locals  {
  vm1 = {vms = [for i in yandex_compute_instance.web : {
    id   = i .id,
    name = i.name,
    fqdn = i.fqdn
  }]}  
  vm2 = {vms = [for i in yandex_compute_instance.db : {
    id   = i.id,
    name = i.name,
    fqdn = i.fqdn
  }]}
  vm3 = {vms = [for i in yandex_compute_instance.storage.* : {
    id   = i.id,
    name = i.name,
    fqdn = i.fqdn
  }]}
  deep_merged = {
    for key in distinct(concat(keys(local.vm1), keys(local.vm2), keys(local.vm3))) :
    key => concat(
      lookup(local.vm1, key, []),
      lookup(local.vm2, key, []),
      lookup(local.vm3, key, [])
    )
  }  
}
output "test" {
  value = [for k,v in local.deep_merged : v]
}
