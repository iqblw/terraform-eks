variable "vpc_cidr_block" {
  default = "10.230.0.0/19"
  type = string
}

variable "public_subnet_cidr_block" {
    type = list
    default = ["10.230.0.0/24", "10.230.1.0/24", "10.230.2.0/24"]
}

variable "eks_private_subnet_cidr_block" {
    type = list
    default = ["10.230.8.0/22", "10.230.12.0/22", "10.230.16.0/22"]
}

variable "env" {
    description = "Environment"
    type = string
    default = "development"
}
