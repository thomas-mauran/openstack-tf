
resource "openstack_compute_instance_v2" "vm_instance" {
  for_each = tomap({ for i, name in var.vm_names : name => i })

  name            = each.key
  flavor_name     = var.flavor
  image_name      = var.image
  key_pair        = var.key_name
  security_groups = [var.security_group]

network {
  name = "network${each.value + 1}"
  fixed_ip_v4 = var.vm_fixed_ips[each.value]
}

  user_data = templatefile(var.cloud_init_config_path, {hostname = each.key, playbook_name = "${var.vm_playbooks[each.value]}.yml"})
}

data "openstack_networking_network_v2" "public_network" {
  name = var.public_network_name
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  for_each = tomap({ for i, name in var.vm_names : name => i })

  pool = data.openstack_networking_network_v2.public_network.name
}

data "openstack_networking_port_v2" "vm_port" {
  for_each = tomap({ for i, name in var.vm_names : name => i })

  device_id  = openstack_compute_instance_v2.vm_instance[each.key].id
  network_id = openstack_compute_instance_v2.vm_instance[each.key].network[0].uuid
}

resource "openstack_networking_floatingip_associate_v2" "floating_ip_associate" {
  for_each = tomap({ for i, name in var.vm_names : name => i })

  floating_ip = openstack_networking_floatingip_v2.floating_ip[each.key].address
  port_id     = data.openstack_networking_port_v2.vm_port[each.key].id
}