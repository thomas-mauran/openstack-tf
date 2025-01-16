data "openstack_networking_network_v2" "public_network" {
  name = var.public_network_name
}

resource "openstack_networking_network_v2" "private_network" {
  name = var.network_name
}

resource "openstack_networking_subnet_v2" "private_subnet" {
  network_id      = openstack_networking_network_v2.private_network.id
  cidr            = var.subnet_cidr
  dns_nameservers = ["8.8.8.8"]
}

# Create the router
resource "openstack_networking_router_v2" "router" {
  name                = "${var.network_name}_router"
  external_network_id = data.openstack_networking_network_v2.public_network.id
}

# Connect the router to the private subnet
resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.private_subnet.id
}



# resource "openstack_networking_port_v2" "port" {
#   name           = "private_port"
#   network_id     = openstack_networking_network_v2.private_network.id
#   security_group_ids = [var.security_group]
# }

# resource "openstack_networking_floatingip_v2" "floating_ip" {
#   pool    = var.floating_ip_pool
#   port_id = openstack_networking_port_v2.port.id
# }
