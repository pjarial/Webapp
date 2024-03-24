#route53
resource "aws_route53_zone" "private" {
  name = var.domain_name
  force_destroy = true
  vpc {
    vpc_id = var.vpc_id
  }
  tags = var.hosted_zone_tags
}

resource "aws_route53_record" "cname" {
  zone_id = aws_route53_zone.private.id
  name = var.cname_key
  type = "CNAME"
  ttl = "300"
  records = [var.cname_value]
}