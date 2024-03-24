#security group for alb
resource "aws_security_group" "sgalb" {
    vpc_id = var.vpc_id
    name = var.sgalb_name
    tags = var.sgalb_tags
} 
resource "aws_security_group_rule" "sgalbrule1" {
  security_group_id = aws_security_group.sgalb.id
  type = "ingress"
  from_port = var.sgalb_ingress_from_port
  to_port = var.sgalb_ingress_to_port
  protocol = var.sgalb_protocol
  cidr_blocks = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "sgalbrule2" {
  security_group_id = aws_security_group.sgalb.id
  type = "egress"
  from_port = var.sgalb_egress_from_port
  to_port = var.sgalb_egress_to_port
  protocol = var.sgalb_protocol
  cidr_blocks = ["0.0.0.0/0"]
}

#alb
resource "aws_lb" "app" {
  name = var.alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sgalb.id]
  subnets = var.pusnet
  enable_deletion_protection = var.enable_deletion_protection
  tags = var.alb_tags 
}

resource "aws_lb_listener" "name" {
  load_balancer_arn = aws_lb.app.arn
  port = var.listener_port
  protocol = var.listener_protocol
  ssl_policy = var.ssl_policy
  certificate_arn = var.certificate_arn
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#target group
resource "aws_lb_target_group" "tg" {
  name = var.tg_name
  port = var.tg_port
  protocol = var.tg_protocol
  vpc_id = var.vpc_id
  health_check {
    protocol = var.healthcheck_protocol
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.timeout
    interval = var.interval
    matcher = var.matcher
    path = "/"
  }
}