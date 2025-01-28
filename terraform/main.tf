terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
}



module "network" {
  source              = "./modules/network"
  network_name        = var.network_name
  security_group      = var.security_group
  subnet_cidr         = var.subnet_cidr
  public_network_name = var.public_network_name
}

module "security_group" {
  source = "./modules/security_group"

  depends_on = [module.network]
}

module "compute" {
  source                 = "./modules/compute"
  image                  = var.image
  key_name               = var.key_name
  network_name           = var.network_name
  security_group         = var.security_group
  cloud_init_config_path = var.cloud_init_config_path
  vm_instances           = var.vm_instances

  kube_token = var.kube_token

  public_network_name = var.public_network_name
  depends_on          = [module.network, module.security_group]
}
