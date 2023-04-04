output "my_public_elb_sg_id" {
  value = aws_security_group.my_public_lb_sg.id
}
output "my_private_elb_sg_id" {
  value = aws_security_group.my_private_lb_sg.id
}
output "proxy_security_group_id" {
  value = aws_security_group.proxy_security_group.id
}
output "app_security_group_id" {
  value = aws_security_group.app_security_group.id
}
output "RDS_security_group_id" {
  value = aws_security_group.RDS_security_group.id
}