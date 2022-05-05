locals {
  vpc_id             = var.vpc_id
  instance_type      = var.instance_type
  instance_ami       = var.instance_ami
  subnet_id          = var.public_subnet_id[0][0]
  security_group_ids = var.security_group_ids
}

#EC2 Instance
resource "aws_instance" "bastion-host" {
  count                       = 1
  instance_type               = local.instance_type
  ami                         = local.instance_ami
  associate_public_ip_address = true
  hibernation                 = false
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = setunion([aws_security_group.bastion-host-sg.id], local.security_group_ids)
  iam_instance_profile        = aws_iam_instance_profile.bastion-host-profile.name
  tags = {
    Name        = "${var.env}-bastion-host${count.index}"
    Environment = var.env
  }
}

#Security group for Bastion Host
resource "aws_security_group" "bastion-host-sg" {
  name   = "${var.name}-bastion-sg"
  vpc_id = local.vpc_id

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH inbound traffic"
  }

  # Allow all outbound traffic
  egress {
    from_port        = 0
    protocol         = "-1"
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    description      = "Allow all outbound traffic"
  }

  tags = {
    Name        = "${var.env}-bastion-sg"
    Environment = var.env
  }
}

#IAM Role for Bastion Host
resource "aws_iam_role" "bastion-host-role" {
  name               = "bastion-host-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })
  tags = {
    Environment = "${var.env}-bastion-host-role"
  }
}

# Attach policy to IAM Role
resource "aws_iam_role_policy_attachment" "bastion-host-AdministratorAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = aws_iam_role.bastion-host-role.name
}

#EC2 Instance IAM Profile
resource "aws_iam_instance_profile" "bastion-host-profile" {
  name = "bastion-host-profile"
  role = aws_iam_role.bastion-host-role.name
  tags = {
    Environment = "${var.env}-bastion-host-profile"
  }
}
