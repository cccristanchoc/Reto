variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default = "172.23.0.0/16"
}

variable "public_subnets_cidr" {
    description = "CIDR for the Public Subnet"
    default = ["172.23.1.0/24", "172.23.3.0/24"]
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = ["172.23.2.0/24", "172.23.4.0/24"]
}

variable "avalaible_zone" {
    description = "Availability Zones to use in vpc"
    default = ["us-east-1a", "us-east-1b"]
}

variable "tags" {
    description = "Tags ccristancho"
    default = {
        Name = "ccristancho",
        created_by = "CristianC",
        project_name = "RetoCC"
        start = "start",
        stop = "stop"
    }
}

###############
###instances###
###############
variable "ami" {
  description = "Ubuntu Xenial from Amazon Linux AMI"
  default = "ami-0a313d6098716f372"
}

variable "instance_type" {
  description = "Instance type"
  default = "t2.micro"
}