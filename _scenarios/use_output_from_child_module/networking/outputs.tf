output "security_groups" {
  value = [aws_security_group.http.id, aws_security_group.ssh.id]
}
