output "public_subnet_ip_az1" {
  value = aws_subnet.mysub_az1[0].id

}
output "public_subnet_ip_az2" {
  value = aws_subnet.mysub_az2[0].id

}
output "private_subnet_ip_az1" {
  value = aws_subnet.mysub_az1[1].id

}
output "private_subnet_ip_az2" {
  value = aws_subnet.mysub_az2[1].id

}
output "RDS_private_subnet_ip_az1" {
  value = aws_subnet.mysub_az1[2].id

}
output "RDS_private_subnet_ip_az2" {
  value = aws_subnet.mysub_az2[2].id

}
output "vpc" {
  value = aws_vpc.myvpc.id
}
