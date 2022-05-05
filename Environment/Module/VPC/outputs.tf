output "vpc_id" {
  value = aws_vpc.vpc.id
}


output "public_subnet_id" {
  value = values(aws_subnet.public_subnet)[*].*.id
}

output "eks_subnet_id" {
  value = values(aws_subnet.eks_subnet)[*].*.id
}

output "security_groups_ids" {
  value = [aws_security_group.security_group.id]
}

output "public_route_table" {
  value = aws_route_table.public.id
}
