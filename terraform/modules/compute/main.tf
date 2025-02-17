data "openstack_images_image_v2" "image" {
  name = var.image
}

resource "openstack_compute_instance_v2" "vm_instance" {
  for_each = var.vm_instances

  name            = each.value.name
  flavor_name     = each.value.flavor
  key_pair        = var.key_name
  security_groups = [var.security_group]

  network {
    name        = var.network_name
    fixed_ip_v4 = each.value.ip
  }

  block_device {
    uuid                  = data.openstack_images_image_v2.image.id
    source_type           = "image"
    volume_size           = 50
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  user_data = templatefile(var.cloud_init_config_path, {
    hostname       = each.value.name,
    playbook_name  = "ansible/${each.value.playbook}.yml",
    front1         = lookup(var.vm_instances, "front1", { name = "", playbook = "", ip = "", flavor = "" }).ip,
    front2         = lookup(var.vm_instances, "front2", { name = "", playbook = "", ip = "", flavor = "" }).ip,
    backend        = "${lookup(var.vm_instances, "backend", { name = "", playbook = "", ip = "", flavor = "" }).ip}"
    kube_token      = var.kube_token
    master_ip      = lookup(var.vm_instances, "master", { name = "", playbook = "", ip = "", flavor = "" }).ip,
    argocd_password = var.argocd_password
  })
}


data "openstack_networking_network_v2" "public_network" {
  name = var.public_network_name
}

resource "openstack_networking_floatingip_v2" "floating_ip" {
  for_each = var.vm_instances

  pool = data.openstack_networking_network_v2.public_network.name
}

data "openstack_networking_port_v2" "vm_port" {
  for_each = var.vm_instances

  device_id  = openstack_compute_instance_v2.vm_instance[each.key].id
  network_id = openstack_compute_instance_v2.vm_instance[each.key].network[0].uuid
}

resource "openstack_networking_floatingip_associate_v2" "floating_ip_associate" {
  for_each = var.vm_instances

  floating_ip = openstack_networking_floatingip_v2.floating_ip[each.key].address
  port_id     = data.openstack_networking_port_v2.vm_port[each.key].id
}
