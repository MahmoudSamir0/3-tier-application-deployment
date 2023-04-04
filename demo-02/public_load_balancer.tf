module "pub_lb" {
    source = "../all-modules/load_balancer"
    instance_template_name = "proxy_load_balancer"
    instance_type = "t2.micro"
    ami-temp = "ami-0b5eea76982371e91"
    key-name = "key-pair"
    instance_template_ip = true
    subnet_id_temp = module.network.public_subnet_ip_az1
    iam-connection = aws_iam_instance_profile.ec2_ecr_connection.name
    user_data = base64encode(templatefile("./../user-data/proxy.sh", {
    application_load_balancer = module.private_lb.lb_dns,
    ecr_url                   = module.ecr_repository.repository_url
    ecr_repo_name             = module.ecr_repository.name,
    region                    = var.region
  }))
    temp-sg-id = module.security.proxy_security_group_id
    autoscale_name = "public_autoscale"
    target_name = "public" 
    target_port = "80"
    target_protocol = "HTTP"
    target_vpc_id = module.network.vpc
    attach_target_port = "80"
    lb_name = "pub-lb"
    lb_internal = false
    lb_type = "application"
    lb_security_group = module.security.my_public_elb_sg_id
    lb_subnet = [ module.network.public_subnet_ip_az1, module.network.public_subnet_ip_az2]
    listener_port = "80"
    listener_protocol = "HTTP"
    listener_type = "forward"
    lb_subnet-1 = module.network.public_subnet_ip_az1
    lb_subnet-2 = module.network.public_subnet_ip_az2
}