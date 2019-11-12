resource "aws_instance" "Front_SubN_1" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.public_subnet[0]}"
  security_groups             = ["${var.SGFront[0]}"]
  associate_public_ip_address = true
  key_name                    = "retocccc"

  tags {
    Name          = "cccristancho-Front_SubN_1"
    created_by    = "${var.tags["created_by"]}"
    project_name  = "${var.tags["project_name"]}"
    start         = "${var.tags["start"]}"
    stop          = "${var.tags["stop"]}"  
  }
}

resource "aws_instance" "Front_SubN_2" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  subnet_id       = "${var.public_subnet[1]}"
  security_groups = ["${var.SGFront[0]}"]
  associate_public_ip_address = true
  key_name        = "retocccc"

  tags {
    Name          = "cccristancho-Front_SubN_2"
    created_by    = "${var.tags["created_by"]}"
    project_name  = "${var.tags["project_name"]}"
    start         = "${var.tags["start"]}"
    stop          = "${var.tags["stop"]}"  
  }
}
