resource "aws_security_group" "scg-web" {
  name        = "${var.project_name}-scg-web"
  description = "Allow ingress traffic for web servers"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name        = "${var.project_name}-scg-web"
    Environment = var.environment
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.scg-web.id

  description = "Allow HTTP traffic from anywhere"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.scg-web.id

  description = "Allow all outbound traffic"
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}