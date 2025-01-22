variable "vm_names" {
  description = "List of VM names"
  type        = list(string)
  default     = ["lb", "front1", "front2", "back"]
}

variable "vm_playbooks" {
  description = "List of VM playbooks"
  type        = list(string)
  default     = ["lb", "frontend", "frontend", "backend"]
}


variable "vm_fixed_ips" {
  type        = list(string)
  description = "List of fixed IPs for the VMs"
  default     = ["192.168.1.10", "192.168.1.20", "192.168.1.30", "192.168.1.40"]
} 

variable "flavor" {
  description = "Flavor of the virtual machine"
  type        = string
}

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