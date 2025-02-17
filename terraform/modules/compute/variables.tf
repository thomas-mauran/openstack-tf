variable "vm_instances" {
  description = "Map of instances to create"
  type        = map(object({
    name     = string
    playbook = string
    ip       = string
    flavor   = string
  }))
}

# Kube related
variable "kube_token" {
  description = "kube token"
  type        = string
}

variable "argocd_password" {
  description = "ArgoCD password"
  type        = string
}

# Compute variables

variable "image" {
  description = "Image for the virtual machine"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key"
  type        = string
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "security_group" {
  description = "Security group for the VM"
  type        = string
}

variable "public_network_name" {
  description = "ID of the public network"
  type        = string
}

variable "cloud_init_config_path" {
  description = "Path to the cloud-init configuration file"
  type        = string
}