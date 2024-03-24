#vpc
module "vpc" {
  source            =   "./vpc"
  vpc_cidr          =   var.vpc_cidr
  vpc_tags          =   var.vpc_tags
}

module "subnets" {
  source            = "./subnets"
  availability_zone =   var.availability_zone
  vpc_id            =   module.vpc.vpc
  pub_cidr          =   var.pub_cidr
  pusnet_tags       =   var.pusnet_tags
  pr_cidr           =   var.pr_cidr
  prsnet_tags       =   var.prsnet_tags
}

module "igw" {
  source            =   "./igw"
  vpc_id            =   module.vpc.vpc
  igw_tags          =   var.igw_tags
}

module "natgw" {
  source            =   "./natgw"
  availability_zone =   var.availability_zone
  eip_tags          =   var.eip_tags
  pusnet_id         =   module.subnets.pusnet
  natgw_tags        =   var.natgw_tags
}

module "route_tables" {
  source            =   "./route_tables"
  vpc_id            =   module.vpc.vpc
  igw_id            =   module.igw.igw
  pubrt_tags        =   var.pubrt_tags
  availability_zone =   var.availability_zone
  pusnet_id         =   module.subnets.pusnet
  natgw1_id         =   module.natgw.natgw[0]
  natgw2_id         =   module.natgw.natgw[1]
  prrt_tags         =   var.prrt_tags
  prsnet_id         =   module.subnets.prsnet
}

module "alb" {
  source                    =   "./alb"
  vpc_id                    =   module.vpc.vpc
  sgalb_name                =   var.sgalb_name
  sgalb_tags                =   var.sgalb_tags
  sgalb_ingress_from_port   =   var.sgalb_ingress_from_port
  sgalb_ingress_to_port     =   var.sgalb_ingress_to_port
  sgalb_egress_from_port    =   var.sgalb_egress_from_port
  sgalb_egress_to_port      =   var.sgalb_egress_to_port
  sgalb_protocol            =   var.sgalb_protocol
  alb_name                  =   var.alb_name
  pusnet                    =   module.subnets.pusnet
  enable_deletion_protection=   var.enable_deletion_protection
  alb_tags                  =   var.alb_tags
  listener_port             =   var.listener_port
  listener_protocol         =   var.listener_protocol
  ssl_policy                =   var.ssl_policy
  certificate_arn           =   var.certificate_arn
  tg_name                   =   var.tg_name
  tg_port                   =   var.tg_port
  tg_protocol               =   var.tg_protocol
  healthcheck_protocol      =   var.healthcheck_protocol
  healthy_threshold         =   var.healthy_threshold
  unhealthy_threshold       =   var.unhealthy_threshold
  timeout                   =   var.timeout
  interval                  =   var.interval
  matcher                   =   var.matcher
}

module "ec2" {
  source                    =   "./ec2"
  depends_on                =   [module.alb ]
  vpc_id                    =   module.vpc.vpc
  sgec2_name                =   var.sgec2_name
  sgec2_tags                =   var.sgec2_tags
  sgec2_ingress_from_port   =   var.sgec2_ingress_from_port
  sgec2_ingress_to_port     =   var.sgec2_ingress_to_port
  sgec2_protocol            =   var.sgec2_protocol
  sgalb_id                  =   module.alb.sgalb
  sgec2_egress_from_port    =   var.sgec2_egress_from_port
  sgec2_egress_to_port      =   var.sgec2_egress_to_port
  iam_role_name             =   var.iam_role_name
  instance_profile_name     =   var.instance_profile_name
  launch_template_name      =   var.launch_template_name
  instance_type             =   var.instance_type
  launch_template_ec2_name  =   var.launch_template_ec2_name
  desired_capacity          =   var.desired_capacity
  max_size                  =   var.max_size
  min_size                  =   var.min_size
  prsnet_id                 =   module.subnets.prsnet
  tg_arn                    =   module.alb.tg_arn  
}

module "route53" {
  source                    =   "./route53"
  depends_on                =   [ module.alb ]
  domain_name               =   var.domain_name
  vpc_id                    =   module.vpc.vpc
  hosted_zone_tags          =   var.hosted_zone_tags
  cname_key                 =   var.cname_key
  cname_value               =   module.alb.alb_endpoint
}