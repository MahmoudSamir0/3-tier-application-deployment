# rds variables
variable "primary_subnet-id" {
  
}
variable "secondary_subnet-id" {
  
}
variable "subnet_group_name_primary" {
  
}
variable "subnet_group_name_secondary" {
  
}
variable "rds_db_admin" {
  type = string
  default = "admin"
}

variable "rds_db_password" {
  type = string
  default = "password"
}

variable "db_name" {
  type = string
  default = "my_db"
}
variable "db_name_secondary" {
  type = string
  default = "my_db"
}
variable "engine_version" {
  type = string
  default = "5.7.31"
}

variable "allocated_storage" {
  type = number
}

variable "instance_class" {
  type = string
}

variable "db_engine" {
}
variable "security_group_RDS" {
}
variable "identifier_primary" {
  
}
variable "identifier_secondary" {
  
}