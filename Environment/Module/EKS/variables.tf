variable "env" {
    description = "Environment"
    type = string
    default = "development"
}

variable "name" {
    // EKS Cluster Name
    default = "development-cluster"
}


variable "instance_types" {
  type        = list
  description = "VPC Development ID"
  default     = ["t3.micro"]
}

variable "vpc_id" {
  type        = string
  description = "VPC Development ID"
}

variable "public_subnet_id" {
  description = "Public Subnet ID"
  type        = list
}

variable "eks_subnet_id" {
  description = "EKS Private subnets ID"
  type        = list
}

variable "desired_size" {
  description = "Desired size of node"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum size of node"
  type        = number
  default = 2
}

variable "min_size" {
  description = "Minimum size of node"
  type        = number
  default     = 1
}

variable "security_group_ids" {
  description = "The security groups to access EKS"
  type        = list
  default     = []
}
