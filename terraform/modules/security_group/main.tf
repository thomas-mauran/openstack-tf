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

resource "openstack_networking_secgroup_rule_v2" "allow_https" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id 
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "443"
  port_range_max    = "443"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_rke2_api" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "9345"
  port_range_max    = "9345"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_etcd" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "2379"
  port_range_max    = "2380"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_kubelet" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "10250"
  port_range_max    = "10250"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_k8s_api" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "6443"
  port_range_max    = "6443"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_egress_all" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = "0"
  port_range_max    = "0"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}
