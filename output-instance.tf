output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.instance.id
}

output "public_ip" {
  description = "EC2 Public IPv4 address"
  value       = aws_instance.instance.public_ip
}

output "private_ip" {
  description = "EC2 Private IPv4 address"
  value       = aws_instance.instance.private_ip
}

output "instance_arn" {
  description = "EC2 Instance ARN"
  value       = aws_instance.instance.arn
}

output "url_web" {
  description = "URL to access the web application"
  value       = "http://${aws_instance.instance.public_ip}/index.html"
}