data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.18-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance" {
  ami           = aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  user_data     = file("${path.module}/web-install.sh")

  vpc_security_group_ids = [aws_security_group.scg-web.id]
  subnet_id              = aws_subnet.subnet-ec2.id

  associate_public_ip_address = true

  tags = {
    Environment = var.environment
    Name        = "${var.project_name}-instance"
  }
}

