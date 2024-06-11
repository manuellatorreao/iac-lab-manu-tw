output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "secure_subnets" {
  value = aws_subnet.secure[*].id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.my_nat_gateway.id
}
