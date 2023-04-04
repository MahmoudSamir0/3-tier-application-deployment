resource "aws_nat_gateway" "gw" {
  subnet_id     = aws_subnet.mysub_az1[0].id
  allocation_id = aws_eip.elastic_id.id

  tags = {
    "name" = var.nat-name
  }
}

resource "aws_nat_gateway" "gw-2" {
  subnet_id     = aws_subnet.mysub_az2[0].id
  allocation_id = aws_eip.elastic_id-2.id

  tags = {
    "name" = var.nat-name-2
  }
}