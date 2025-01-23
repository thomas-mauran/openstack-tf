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

# Define Ingress Rule for 10.0.30.0/24
resource "openstack_networking_secgroup_rule_v2" "ingress_10_0_30_0" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 0
  port_range_max    = 0
  protocol          = ""
  remote_ip_prefix  = "10.0.30.0/24"
}

# Define Egress Rule for 10.0.30.0/24
resource "openstack_networking_secgroup_rule_v2" "egress_10_0_30_0" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 0
  port_range_max    = 0
  protocol          = ""
  remote_ip_prefix  = "10.0.30.0/24"
}

# Define Ingress Rule for 10.0.40.0/24
resource "openstack_networking_secgroup_rule_v2" "ingress_10_0_40_0" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 0
  port_range_max    = 0
  protocol          = ""
  remote_ip_prefix  = "10.0.40.0/24"
}

# Define Egress Rule for 10.0.40.0/24
resource "openstack_networking_secgroup_rule_v2" "egress_10_0_40_0" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 0
  port_range_max    = 0
  protocol          = ""
  remote_ip_prefix  = "10.0.40.0/24"
}

# If you want to delete default rules (optional)
resource "openstack_networking_secgroup_rule_v2" "delete_default" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 0
  port_range_max    = 0
  protocol          = ""
  remote_ip_prefix  = "0.0.0.0/0"
  # If deletion functionality is necessary, this would usually be part of a more complex workflow in Terraform
  lifecycle {
    ignore_changes = [
      # Example for ignoring changes to default rules.
      security_group_id
    ]
  }
}
