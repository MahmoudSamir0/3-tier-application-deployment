module "network" {
  source = "../all-modules/network"
  subnet_name_az1 = ["public_subnet_az1", "private_subnet_az1", "RDS_private_subnet_az1"]
  subnet_id_az1   = ["10.0.0.0/24", "10.0.1.0/24","10.0.2.0/24"]
  subnet_id_az2   = ["10.0.3.0/24", "10.0.4.0/24","10.0.5.0/24"]
  subnet_name_az2 = ["public_subnet_az2", "private_subnet_az2", "RDS_private_subnet_az2"]
  nat-name        = "nat-ec1"
  nat-name-2      = "nat-ec2"
  route-nat       = "myprivate_nat-1"
  route-nat-2     = "myprivate_nat-2"
  rout-public     = "Public Route Table"
  internet-get    = "internet-getway"
  true-and-false  = ["true", "false", "false"]
}
module "security" {
  source = "../all-modules/security"
  vpc-id = module.network.vpc
}