output "sgalb" {
  value = aws_security_group.sgalb.id
}
output "tg_arn" {
  value = aws_lb_target_group.tg.arn
}
output "alb_endpoint" {
  value = aws_lb.app.dns_name
}