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

# Allow K3s API Server
resource "openstack_networking_secgroup_rule_v2" "allow_kube_api" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 6443
  port_range_max    = 6443
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow K3s Flannel VXLAN Networking
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_vxlan" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 8472
  port_range_max    = 8472
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow NodePort Services
resource "openstack_networking_secgroup_rule_v2" "allow_nodeport" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30000
  port_range_max    = 32767
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow kubelet API
resource "openstack_networking_secgroup_rule_v2" "allow_kubelet" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow Egress Traffic (General)
resource "openstack_networking_secgroup_rule_v2" "allow_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}
