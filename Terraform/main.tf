provider "aws" {
  region = "${var.aws_region}"
}

module "Inst" {
  source          = "./Inst"
  private_subnet  = "${module.Net.private_subnet}"
  public_subnet   = "${module.Net.public_subnet}"
  SGFront         = "${module.Net.SGFront}"
  SGBack          = "${module.Net.SGBack}"
  TGLoadBlc       = "${module.Net.TGLoadBlc}"
  aws_region      = "${var.aws_region}"
  tags            = "${var.tags}"
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
}

module "Net" {
  source              = "./Net"
  vpc_cidr            = "${var.vpc_cidr}"
  public_subnets_cidr = "${var.public_subnets_cidr}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  avalaible_zones     = "${var.avalaible_zone}"
  aws_region          = "${var.aws_region}"
  tags                = "${var.tags}"
}
