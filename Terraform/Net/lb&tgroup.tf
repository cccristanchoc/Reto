resource "aws_alb_target_group" "alb_TargetGrp" {
  name     = "tg-lb-reto"
  port     = 8080
  protocol = "HTTP"
  health_check {
    port                = 8080
    path                = "/actuator/health"
    protocol            = "HTTP"
    interval            = 30
  }
  vpc_id   = "${aws_vpc.VPC.id}"
}

resource "aws_alb" "aload_Blc" {
  name               = "lb-reto"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.SG_LoadBlnc.id}"]
  subnets            = ["${aws_subnet.public-subnet.*.id}"]

#   enable_deletion_protection = true

  tags {
    Name            = "cccristancho_LoadBlnc"
    created_by      = "${var.tags["created_by"]}"
    project_name    = "${var.tags["project_name"]}"
    start           = "${var.tags["start"]}"
    stop            = "${var.tags["stop"]}"  
  }
}

resource "aws_alb_listener" "alb_listener" {  
  load_balancer_arn = "${aws_alb.aload_Blc.arn}"  
  port              = 8080  
  protocol          = "HTTP"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.alb_TargetGrp.arn}"
    type             = "forward"  
  }
}