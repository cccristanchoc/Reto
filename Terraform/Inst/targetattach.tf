resource "aws_lb_target_group_attachment" "tgAttach-instance1" {
  target_group_arn = "${var.TGLoadBlc.[0]}"
  target_id        = "${aws_instance.Front_SubN_1.id}"
  port             = 8080
}

resource "aws_lb_target_group_attachment" "tgAttach-instance2" {
  target_group_arn = "${var.TGLoadBlc.[0]}"
  target_id        = "${aws_instance.Front_SubN_2.id}"
  port             = 8080
}