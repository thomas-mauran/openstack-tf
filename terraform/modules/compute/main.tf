resource "openstack_compute_instance_v2" "vm_instance" {
  name            = var.vm_name
  flavor_name     = var.flavor
  image_name      = var.image
  key_pair        = var.key_name
  security_groups = [var.security_group]

  network {
    name = var.network_name
  }

  user_data = file(var.cloud_init_config_path)
}

data "openstack_networking_network_v2" "public_network" {
  name = var.public_network_name
}

# We create a floating ip for our vm
resource "openstack_networking_floatingip_v2" "floating_ip" {
  pool = data.openstack_networking_network_v2.public_network.name
}

data "openstack_networking_port_v2" "vm-port" {
  device_id  = openstack_compute_instance_v2.vm_instance.id
  network_id = openstack_compute_instance_v2.vm_instance.network.0.uuid
}

resource "openstack_networking_floatingip_associate_v2" "myip" {
  floating_ip = openstack_networking_floatingip_v2.floating_ip.address
  port_id     = data.openstack_networking_port_v2.vm-port.id
}

