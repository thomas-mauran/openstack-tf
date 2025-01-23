flavor = "m1.small"
image = "Ubuntu"
key_name = "my-key"
network_name = "private_network"
security_group = "vm_security_group"
cloud_init_config_path = "./cloudinit/cloud-init-config.tftlp"

k3s_token = "K10ecf1ba02dc1b04df10daa949058e4c78583b0c06d5b07c5bf108a26ba5b6ad52::server:52c1e31ff96277465631af6a0ce00657"
master_ip = "192.168.1.40"

vm_instances = {
    # "master" = {
    #     name = "master",
    #     playbook = "k3s-master",
    #     ip = "192.168.1.40"
    # },


    # "node1" = {
    #     name = "node1",
    #     playbook = "k3s-node",
    #     ip = "192.168.1.10"
    # }

    # "node2" = {
    #     name = "node2",
    #     playbook = "k3s-node",
    #     ip = "192.168.1.20"
    # }



    "lb" = {
        name = "lb",
        playbook = "lb",
        ip = "192.168.1.50"
    },
    "backend" = {
        name = "backend",
        playbook = "backend",
        ip = "192.168.1.60",
    }
    "front1" = {
        name = "front1",
        playbook = "frontend",
        ip = "192.168.1.70",
    },
    "front2" = {
        name = "front2",
        playbook = "frontend",
        ip = "192.168.1.80",
    },

}
