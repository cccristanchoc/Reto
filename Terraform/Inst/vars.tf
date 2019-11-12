variable "aws_region" {
  description = "EC2 Region for the VPC"
}

variable "public_subnet" {
  description = "CIDR for the Public Subnet"
  type = "list"
}

variable "private_subnet" {
  description = "CIDR for the Private Subnet"
  type = "list"
}

variable "SGFront" {
  description = "Security Group from Front"
  type = "list"
}

variable "SGBack" {
  description = "Security Group from Back"
  type = "list"
}

variable "TGLoadBlc" {
  description = "Target Group Load Balancer"
  type = "list"
}

variable "tags" {
  description = "tags ccristancho"
  type = "map"
}

###############
###instances###
###############
/*
variable "ami" {
  description = "Amazon Linux AMI"
  default = "ami-4fffc834"
} 
*/
variable "ami" {
  description = "Ubuntu Xenial from Amazon Linux AMI"
}

variable "instance_type" {
  description = "Instance type"
}

# variable "docker_path" {
#   description = "Script to install Docker Engine"
#   default = "install-docker.sh"
# }
