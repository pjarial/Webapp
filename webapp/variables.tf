variable "region" {
  description = "aws region for the configuration"
  type = string
}

#vpc
variable "vpc_cidr" {
  description = "cidr block range of vpc"
  type = string
}
variable "vpc_tags" {
  description = "tags associated to vpc"
  type = map(string)
}

#subnets
variable "availability_zone" {
  description = "list of Azz to be used in a region"
  type = list(string)
}
variable "pub_cidr" {
  description = "list of pub cidr block ranges"
  type = list(string)
}
variable "pusnet_tags" {
  description = "tags associated with public subnets"
  type = list(string)
}
variable "pr_cidr" {
  description = "list of private cidr block ranges"
  type = list(string)
}
variable "prsnet_tags" {
  description = "tags associated with private subnets"
  type = list(string)
}

#igw
variable "igw_tags" {
  description = "tags associated with igw"
  type = map(string)
}


#natgw
variable "eip_tags" {
  description = "tags associated with eip"
  type = list(string)
}
variable "natgw_tags" {
  description = "tags associated with natgw"
  type = list(string)
}

#route_tables
variable "pubrt_tags" {
  description = "public route table tags"
  type = string
}
variable "prrt_tags" {
  description = "private route table tags"
  type = list(string)
}

#alb
variable "sgalb_name" {
  description = "name of alb security group"
  type = string
}
variable "sgalb_tags" {
  description = "tags associated to sgalb"
  type = map(string)
}
variable "sgalb_ingress_from_port" {
  description = "starting inbound port for security group"
  type = string
}
variable "sgalb_ingress_to_port" {
  description = "ending inbound port for security group"
  type = string
}
variable "sgalb_protocol" {
  description = "protocol for the defined ports"
  type = string
}
variable "sgalb_egress_from_port" {
  description = "starting outbound port for security group"
  type = string
}
variable "sgalb_egress_to_port" {
  description = "ending outbound port for security group"
  type = string
}
variable "alb_name" {
  description = "name of the application load balancer"
  type = string
}
variable "enable_deletion_protection" {
  description = "whether to enable deletion protection on alb"
  type = bool
}
variable "alb_tags" {
  description = "tags associated to alb"
  type = map(string)
}
variable "listener_port" {
  description = "listener port number"
  type = string
}
variable "listener_protocol" {
  description = "listener protocol"
  type = string
}
variable "ssl_policy" {
  description = "security policy for alb listener"
  type = string
}
variable "certificate_arn" {
  description = "arn of the listener certificate"
  type = string
}
variable "tg_name" {
  description = "name of target group"
  type = string
}
variable "tg_port" {
  description = "target group port"
  type = string
}
variable "tg_protocol" {
  description = "target group protocol"
  type = string
}
variable "healthcheck_protocol" {
  description = "target group healthcheck protocol"
  type = string
}
variable "healthy_threshold" {
  description = "healthy threshold for targets"
  type = string
}
variable "unhealthy_threshold" {
  description = "unhealthy threshold for targets"
  type = string
}
variable "timeout" {
  description = "heathcheck timeout"
  type = string
}
variable "interval" {
  description = "interval for HC"
  type = string
}
variable "matcher" {
  description = "success matcher code"
  type = string
}

#ec2
variable "sgec2_name" {
  description = "ec2 security group name"
  type = string
}
variable "sgec2_tags" {
  description = "tags associated with ec2 security group"
  type = map(string)
}
variable "sgec2_ingress_from_port" {
  description = "starting inbound port number for security group"
  type = string
}
variable "sgec2_ingress_to_port" {
  description = "ending inbound port number for security group"
  type = string
}
variable "sgec2_egress_from_port" {
  description = "starting outbound port for security group"
  type = string
}
variable "sgec2_egress_to_port" {
  description = "ending outbound port for security group"
  type = string
}
variable "sgec2_protocol" {
  description = "protocol for the inbound and outbound ports"
  type = string
}
variable "iam_role_name" {
  description = "name of the iam role for ssm"
  type = string
}
variable "instance_profile_name" {
  description = "name of instance profile"
  type = string
}
variable "launch_template_name" {
  description = "name of launch template"
  type = string
}
variable "instance_type" {
  description = "instance type"
  type = string
}
variable "launch_template_ec2_name" {
  description = "name tag for ec2 launched by launch template"
  type = string
}
variable "desired_capacity" {
  description = "desired ec2"
  type = number
}
variable "max_size" {
  description = "maximum ec2 size"
  type = number
}
variable "min_size" {
  description = "minimum ec2 size"
  type = number
}

#route53
variable "domain_name" {
  description = "domain name for private hosted zone"
  type = string
}
variable "hosted_zone_tags" {
  description = "tags associated to hosted zone"
  type = map(string)
}
variable "cname_key" {
  description = "cname record key for alb in dns"
  type = string
}
