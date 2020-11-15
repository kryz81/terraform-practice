output "security_groups" {
  value = [aws_security_group.sg1_ssh.id, aws_security_group.sg1_web.id]
}

output "vpc_id" {
  value = var.vpc_id
}
