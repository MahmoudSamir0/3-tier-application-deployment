# Define the subnet group for the RDS instances

resource "aws_db_subnet_group" "subnet_group_primary" {
  name       = var.subnet_group_name_primary
  subnet_ids = var.RDS_subnet-id

  tags = {
    Name = "My primary  DB subnet group"
  }
}
# Define the primary RDS instance

resource "aws_db_instance" "primary" {
  identifier = var.identifier_primary
  allocated_storage    = var.allocated_storage
  engine               = var.db_engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name                 = var.db_name
  username             = var.rds_db_admin
  password             = var.rds_db_password
  db_subnet_group_name = aws_db_subnet_group.subnet_group_primary.name
  vpc_security_group_ids = [ var.security_group_RDS]
  multi_az = true
}
