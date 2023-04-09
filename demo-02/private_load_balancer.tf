module "private_lb" {
    source = "../all-modules/load_balancer"
    instance_template_name = "private_load_balancer"
    instance_type = "t2.micro"
    ami-temp = "ami-0b5eea76982371e91"
    key-name = "key-pair"
    instance_template_ip =false
    subnet_id_temp = module.network.private_subnet_ip_az1
    iam-connection = aws_iam_instance_profile.ec2_ecr_connection.name
  user_data = base64encode(templatefile("./../user-data/app.sh", {
    rds_hostname  = module.RDS_DATABASE.rds_address,
    rds_username  = var.rds_db_admin,
    rds_password  = var.rds_db_password,
    rds_port      = 3306,
    rds_db_name   = var.db_name
    ecr_url       = module.ecr_repository.repository_url
    ecr_repo_name = module.ecr_repository.name,
    region        = var.region
  }))    
    temp-sg-id = module.security.app_security_group_id
    autoscale_name = "private_autoscale"
    target_name = "private"
    target_port = "80"
    target_protocol = "HTTP"
    target_vpc_id = module.network.vpc
    attach_target_port = "80"
    lb_name = "private-load-balancer"
    lb_internal = true 
    lb_type = "application"
    lb_security_group =  module.security.my_private_elb_sg_id
    lb_subnet = [ module.network.private_subnet_ip_az1, module.network.private_subnet_ip_az2]
    listener_port = "80"
    listener_protocol = "HTTP"
    listener_type = "forward"
    # lb_subnet-1 = module.network.private_subnet_ip_az1
    # lb_subnet-2 = module.network.private_subnet_ip_az2
}
