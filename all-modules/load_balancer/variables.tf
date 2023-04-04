variable "instance_template_name" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "ami-temp" {
  type = string
}
variable "key-name" {
    type = string
}
variable "iam-connection" {
  type = string
}
variable "instance_template_ip" {
  
}
variable "subnet_id_temp" {
}

variable "user_data" {
  
}
variable "temp-sg-id" {
  
}
variable "autoscale_name" {
  
}
variable "target_name" { 
}
variable "target_port" { 
}
variable "target_protocol" { 
}
variable "target_vpc_id" { 
}

# target group attachments variables
# # variable "attach_target_group" { 
# # }
# variable "attach_target_id" { 
# }
variable "attach_target_port" { 
}


# load balancer variables
variable "lb_name" {
}
variable "lb_internal" { 
}
variable "lb_type" {
}
variable "lb_security_group" { 
}
variable "lb_subnet" { 
  type = list(string)
}

variable "lb_subnet-1" { 
  }
  variable "lb_subnet-2" { 
  }
# load balancer listener variables
# variable "listener_lb_arn" {
# }
variable "listener_port" { 
}
variable "listener_protocol" {
}
variable "listener_type" { 
}