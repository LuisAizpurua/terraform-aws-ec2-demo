resource "aws_route_table" "aws-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "${var.project_name}-rt"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "aws-rta" {
  subnet_id      = aws_subnet.subnet-ec2.id
  route_table_id = aws_route_table.aws-rt.id
}
