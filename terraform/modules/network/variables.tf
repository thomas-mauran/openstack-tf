variable "networks" {
  description = "Map of networks with their properties"
  type = map(object({
    subnet_cidr = string
  }))
  default = {
    network1 = { subnet_cidr = "192.168.1.0/24" }
    network2 = { subnet_cidr = "192.168.2.0/24" }
    network3 = { subnet_cidr = "192.168.3.0/24" }
    network4 = { subnet_cidr = "192.168.4.0/24" }
  }
}

variable "network_name" {
  description = "Name of the network"
  type        = string
}

variable "security_group" {
  description = "Security group for the VM"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR for the subnet"
  type        = string
}

variable "public_network_name" {
  description = "ID of the public network"
  type        = string
}