variable "access_key" {
     type    = string
     default = ""
}

variable "secret_key" {
     type    = string
     default = ""
}

variable "host"  {
    default = "aws_instance.my_web_instance.public_dns"
}

variable "region" {
    type    = string
    default = "ap-southeast-1"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "subnet_one_cidr" {
    type = string
    default = "10.0.1.0/24"
}

variable "subnet_two_cidr" {
    type = string
    default = ["10.0.2.0/24","10.0.3.0/24"]
}

variable "availability_zone_name" {
    type = string
    default = "ap-southeast-1a"
}

variable "route_table_cidr" {
    type = string
    default = "0.0.0.0/0"
}

variable "web_ports" {
    type = string
    default = ["22","80", "443", "3306"]
}

variable "db_ports" {
    type = string
    default = ["22", "3306"]
}

variable "images" {
    type = "map"
    default = {
        "ap-southeast-1" = "ami-02f26adf094f51167"
    }
}
