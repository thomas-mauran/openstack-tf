resource "openstack_networking_secgroup_v2" "vm_security_group" {
  name        = "vm_security_group"
  description = "Allow SSH and HTTP"
}

resource "openstack_networking_secgroup_rule_v2" "allow_ssh" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "22"
  port_range_max    = "22"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_http" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "80"
  port_range_max    = "80"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}