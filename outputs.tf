output "vpc_id" {
    description = "vpc id created"
    value = aws_vpc.my_vpc.id
}