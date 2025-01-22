# Create multiple private networks
resource "openstack_networking_network_v2" "private_network" {
  name = var.network_name
}

# Create subnets for each private network
resource "openstack_networking_subnet_v2" "private_subnet" {
  network_id      = openstack_networking_network_v2.private_network.id
  cidr            = var.subnet_cidr
  dns_nameservers = ["8.8.8.8"]
}

# Fetch public networks dynamically
data "openstack_networking_network_v2" "public_network" {
  name = var.public_network_name
}

# Create routers for each private network
resource "openstack_networking_router_v2" "router" {
  name                = "${var.network_name}_router"
  external_network_id = data.openstack_networking_network_v2.public_network.id
}

# Connect routers to their respective private subnets
resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.private_subnet.id
}