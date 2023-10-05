output "security_group_ids" {
  value = [aws_security_group.sg_ingress.id, aws_security_group.sg_egress.id]
}

output "ingress_security_group_id" {
  value = aws_security_group.sg_ingress.id
}

output "ingress_security_group_arn" {
  value = aws_security_group.sg_ingress.arn
}

output "egress_security_group_id" {
  value = aws_security_group.sg_egress.id
}

output "egress_security_group_arn" {
  value = aws_security_group.sg_egress.arn
}
