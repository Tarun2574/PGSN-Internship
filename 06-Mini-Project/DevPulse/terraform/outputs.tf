output "instance_public_ip" {
  description = "Public IP address of the DevPulse EC2 instance"
  value       = aws_instance.devpulse.public_ip
}