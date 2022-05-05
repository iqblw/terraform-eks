variable "name" {
    default = "development"
}

variable "vpc_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-021fb2b73ff1efc96"
}

variable "public_subnet_id" {
  description = "The public subnet id"
  type        = list
}

variable "security_group_ids" {
  description = "The security group for jump server"
  type        = list
  default = []
}

variable "env" {
    description = "Environment"
    type = string
    default = "development"
}
