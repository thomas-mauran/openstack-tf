flavor = "m1.small"
image = "Ubuntu"
key_name = "my-key"
network_name = "private_network"
security_group = "vm_security_group"
cloud_init_config_path = "./cloudinit/cloud-init-config.tftlp"

k3s_token = "K10064db4af364efa339faa2edb29404ca3b65dae8293e550afa0f35521cbc87aa3::server:52c1e31ff96277465631af6a0ce00657"
master_ip = "192.168.1.40"

vm_instances = {
    "master" = {
        name = "master",
        playbook = "k3s-master",
        ip = "192.168.1.40"
    },


    "node1" = {
        name = "node1",
        playbook = "k3s-node",
        ip = "192.168.1.10"
    }

    "node2" = {
        name = "node2",
        playbook = "k3s-node",
        ip = "192.168.1.20"
    }



    # "lb" = {
    #     name = "lb",
    #     playbook = "lb",
    #     ip = "192.168.1.50"
    # },
    # "backend" = {
    #     name = "backend",
    #     playbook = "backend",
    #     ip = "192.168.1.60",
    # }
    # "front1" = {
    #     name = "front1",
    #     playbook = "frontend",
    #     ip = "192.168.1.70",
    # },
    # "front2" = {
    #     name = "front2",
    #     playbook = "frontend",
    #     ip = "192.168.1.80",
    # },

}
