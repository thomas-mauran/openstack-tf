# Terraform TP

The goal here is to familiarize ourselves with Terraform to declare and manage infrastructure as code.

The deployed infrastructure will be a RKE2 cluster with a master and 2 workers nodes with an argocd application deployed on it.

## Prerequisites

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)


### Terraform

3 modules are created, to run the commands you need to go modify the compute.auto.tfvars.example file with your own values.

then terraform apply, make sure you sourced the op


### Ansible deploy a simple pod

```bash
ansible-galaxy collection install openstack.cloud
```