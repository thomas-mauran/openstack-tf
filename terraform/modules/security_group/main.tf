resource "openstack_networking_secgroup_v2" "vm_security_group" {
  name        = "vm_security_group"
  description = "Allow SSH and HTTP"
}

resource "openstack_networking_secgroup_rule_v2" "allow_all_ingress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = "0"
  port_range_max    = "0"
  protocol          = "tcp"
  remote_ip_prefix  = "192.168.1.0/24"
}


resource "openstack_networking_secgroup_rule_v2" "allow_all_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = "0"
  port_range_max    = "0"
  protocol          = "tcp"
  remote_ip_prefix  = "192.168.1.0/24"
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

# Allow embedded etcd (HA)
resource "openstack_networking_secgroup_rule_v2" "allow_embedded_etcd" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 2379
  port_range_max    = 2380
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow kube API Server
resource "openstack_networking_secgroup_rule_v2" "allow_kube_api" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 6443
  port_range_max    = 6443
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_kube_api_6444" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 6444
  port_range_max    = 6444
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow Flannel VXLAN Networking
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_vxlan" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 8472
  port_range_max    = 8472
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow Flannel WireGuard (IPv4)
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_wireguard_ipv4" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 51820
  port_range_max    = 51820
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow Flannel WireGuard (IPv6)
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_wireguard_ipv6" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "udp"
  port_range_min    = 51821
  port_range_max    = 51821
  remote_ip_prefix  = "::/0"
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

# Allow embedded distributed registry (TCP 5001)
resource "openstack_networking_secgroup_rule_v2" "allow_embedded_registry_5001" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = 5001
  port_range_max    = 5001
  protocol          = "tcp"
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


## ici


# Allow embedded etcd (HA)
resource "openstack_networking_secgroup_rule_v2" "allow_embedded_etcd_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 2379
  port_range_max    = 2380
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow kube API Server
resource "openstack_networking_secgroup_rule_v2" "allow_kube_api_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 6443
  port_range_max    = 6443
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "openstack_networking_secgroup_rule_v2" "allow_kube_api_egress_6444" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 6444
  port_range_max    = 6444
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}


# Allow Flannel VXLAN Networking
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_vxlan_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 8472
  port_range_max    = 8472
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow Flannel WireGuard (IPv4)
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_wireguard_ipv4_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 51820
  port_range_max    = 51820
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow Flannel WireGuard (IPv6)
resource "openstack_networking_secgroup_rule_v2" "allow_flannel_wireguard_ipv6_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv6"
  protocol          = "udp"
  port_range_min    = 51821
  port_range_max    = 51821
  remote_ip_prefix  = "::/0"
}

# Allow kubelet API
resource "openstack_networking_secgroup_rule_v2" "allow_kubelet_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 10250
  port_range_max    = 10250
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow embedded distributed registry (TCP 5001)
resource "openstack_networking_secgroup_rule_v2" "allow_embedded_registry_5001_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = 5001
  port_range_max    = 5001
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow NodePort Services
resource "openstack_networking_secgroup_rule_v2" "allow_nodeport_egress" {
  security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
  direction         = "egress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 30000
  port_range_max    = 32767
  remote_ip_prefix  = "0.0.0.0/0"
}


# Allow Egress Traffic (General)
# resource "openstack_networking_secgroup_rule_v2" "allow_egress" {
#   security_group_id = openstack_networking_secgroup_v2.vm_security_group.id
#   direction         = "egress"
#   ethertype         = "IPv4"
#   protocol          = null
#   remote_ip_prefix  = "0.0.0.0/0"
# }