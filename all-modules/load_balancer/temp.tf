resource "aws_launch_template" "instance_template" {
  name = var.instance_template_name

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 12
    }
  }

  image_id = var.ami-temp
  instance_type = var.instance_type
  key_name = var.key-name

  network_interfaces {
    associate_public_ip_address = var.instance_template_ip
  }

  network_interfaces {
    subnet_id = var.subnet_id_temp
  }

  vpc_security_group_ids = [ var.temp-sg-id ]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.instance_template_name
    }
  }
iam_instance_profile {
  name = var.iam-connection
}
  user_data = var.user_data
}
resource "aws_autoscaling_group" "autoscale" {
  name                      = var.autoscale_name
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_template {
    id = aws_launch_template.instance_template.id
  }
  vpc_zone_identifier       = [ var.lb_subnet-1 , var.lb_subnet-2 ]

  timeouts {
    delete = "15m"
  }

}

resource "aws_lb_target_group" "target_group" {
  name     = var.target_name
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.target_vpc_id

}

resource "aws_lb_target_group_attachment" "target_group_attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_lb.load_balancer.id
  port             = var.attach_target_port
    depends_on = [
    aws_lb_target_group.target_group
  ]
}

resource "aws_lb" "load_balancer" {
  name               = var.lb_name 
  internal           = var.lb_internal 
  load_balancer_type = var.lb_type 
  security_groups    = [var.lb_security_group ]
   subnets            = var.lb_subnet

  tags = {
    Name = var.lb_name 
  }
}

resource "aws_lb_listener" "load_balancer_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn 
  port              = var.listener_port 
  protocol          = var.listener_protocol 
  default_action {
    type             = var.listener_type 
    target_group_arn = aws_lb_target_group.target_group.arn
  }
  depends_on = [
    aws_lb.load_balancer,
    aws_lb_target_group.target_group
  ]
}