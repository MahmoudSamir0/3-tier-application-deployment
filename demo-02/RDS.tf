module "RDS_DATABASE" {
  source = "../all-modules/RDS"
  primary_subnet-id = module.network.RDS_private_subnet_ip_az1
  subnet_group_name_primary ="primary_subnet"
  rds_db_admin = "admin"
  rds_db_password = "password"
  db_name = "primary"
  engine_version = "5.7"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  db_engine =  "mysql"
  security_group_RDS = module.security.RDS_security_group_id
}
