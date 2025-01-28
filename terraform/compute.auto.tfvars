image = "Ubuntu"
key_name = "my-key"
network_name = "private_network"
security_group = "vm_security_group"
cloud_init_config_path = "./cloudinit/cloud-init-config.tftlp"

kube_token = "K10847543704d3339621ef739b4218e6d41fd028a46bbc915c4a1cee5ea40f1e282::server:test"
master_ip = "192.168.1.40"

vm_instances = {
    "master" = {
        name = "master",
        playbook = "kube-master",
        ip = "192.168.1.40",
        flavor = "m1.medium"
    },

    "node1" = {
        name = "node1",
        playbook = "kube-node",
        ip = "192.168.1.10",
        flavor = "m1.medium"
    }

    "node2" = {
        name = "node2",
        playbook = "kube-node",
        ip = "192.168.1.20",
        flavor = "m1.medium"
    }



    "lb" = {
        name = "lb",
        playbook = "lb",
        ip = "192.168.1.50",
        flavor = "m1.small"
    },

    "backend" = {
        name = "backend",
        playbook = "backend",
        ip = "192.168.1.60",
        flavor = "m1.small"
    }

    "front1" = {
        name = "front1",
        playbook = "frontend",
        ip = "192.168.1.70",
        flavor = "m1.small"
    },
    
    "front2" = {
        name = "front2",
        playbook = "frontend",
        ip = "192.168.1.80",
        flavor = "m1.small"
    },

}
