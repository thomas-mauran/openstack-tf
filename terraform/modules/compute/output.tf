output "floating_ips_with_names" {
  value = {
    for key, fip in openstack_networking_floatingip_v2.floating_ip : 
    key => {
      name        = var.vm_instances[key].name
      floating_ip = fip.address
    }
  }
  description = "A map of VM names and their corresponding floating IPs."
}
