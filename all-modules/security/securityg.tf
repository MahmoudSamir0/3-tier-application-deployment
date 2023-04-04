resource "aws_security_group" "my_public_lb_sg" {
  vpc_id = var.vpc-id
  ingress {
    description      = "My Ingress Rules"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "My_Public_ELB_SG"
  }
}
resource "aws_security_group" "my_private_lb_sg" {
  vpc_id = var.vpc-id
  ingress {
    description     = "My Ingress Rules"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.proxy_security_group.id]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "My_Private_ELB_SG"
  }
}
resource "aws_security_group" "proxy_security_group" {
  vpc_id = var.vpc-id
  ingress {
    description = "My SSH Ingress Rule"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description     = "My HTTP Ingress Rule"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.my_public_lb_sg.id]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "My_proxy_security_group"
  }
}
resource "aws_security_group" "app_security_group" {
  vpc_id = var.vpc-id
  ingress {
    description     = "My HTTP Ingress Rule"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.my_private_lb_sg.id]
  }
  egress {
    description      = "My Egress Rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    "Name" = "My_Private_EC2_SG"
  }
}
resource "aws_security_group" "RDS_security_group" {
  name_prefix = "primarydb_sg"
  vpc_id = var.vpc-id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.app_security_group.id]

  }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

