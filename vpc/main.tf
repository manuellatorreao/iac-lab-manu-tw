resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = format("%s-vpc", var.prefix)
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = var.number_public_subnets
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 3, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

    tags = {
    Name = "${var.prefix}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private" {
  count = var.number_private_subnets
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 3, count.index + 2)
  availability_zone = data.aws_availability_zones.available.names[count.index]
    tags = {
    Name = "${var.prefix}-private-subnet-${count.index + 1}"
  }
}
resource "aws_subnet" "secure" {
  count = var.number_secure_subnets
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 3, count.index + 4)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "${var.prefix}-secure-subnet-${count.index + 1}"
  }
}
resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.prefix}-internet-gateway"
  }
}

resource "aws_eip" "my_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.prefix}-eip"
  }
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.private[0].id
  tags = {
    Name = "${var.prefix}-nat-gateway"
  }
}

resource "aws_route_table" "public_route_table" {
  count = var.number_public_subnets
  vpc_id  = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id 
  }
  tags = {
    Name = "${var.prefix}-public-route-table-${count.index + 1}"
  }
}

resource "aws_route_table" "private_route_table" {
  count = var.number_private_subnets
  vpc_id  = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat_gateway.id
  }  
    tags = {
        Name = "${var.prefix}-private-route-table-${count.index + 1}"
  }
}
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table[count.index].id
}

resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}

