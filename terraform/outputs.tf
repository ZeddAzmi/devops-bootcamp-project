output "web_public_ip" {
  description = "Public IP of web server"
  value       = aws_instance.web.public_ip
}

output "web_public_dns" {
  description = "Public DNS of web server"
  value       = aws_instance.web.public_dns
}
