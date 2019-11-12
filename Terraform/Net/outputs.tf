output "private_subnet" {
  value = ["${aws_subnet.private-subnet.*.id}"]
}

output "public_subnet" {
  value = ["${aws_subnet.public-subnet.*.id}"]
}

output "SGFront" {
  value = ["${aws_security_group.SG_FrontEnd.*.id}"]
}

output "SGBack" {
  value = ["${aws_security_group.SG_BackEnd.*.id}"]
}

output "TGLoadBlc" {
  value = ["${aws_alb_target_group.alb_TargetGrp.*.arn}"]
}