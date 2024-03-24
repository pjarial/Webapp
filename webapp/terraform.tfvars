region = "ap-south-1"

#vpc
vpc_cidr = "10.0.0.0/16"
vpc_tags = {
  "Name" = "test-vpc"
  "Environment" = "test"
}

#subnets
availability_zone = [ "ap-south-1a","ap-south-1b" ]
pub_cidr = [ "10.0.8.0/24","10.0.2.0/24" ]
pusnet_tags = [ "test-pubsnet-1","test-pubsnet-1" ]
pr_cidr = [ "10.0.3.0/24","10.0.5.0/24" ]
prsnet_tags = [ "test-prsnet-1","test-prsnet-2" ]

#igw
igw_tags = {
  "Name" = "test-igw"
  "Environment" = "test"
}

#natgw
eip_tags = [ "test-eip-1","test-eip-2" ]
natgw_tags = [ "test-natgw-1" ,"test-natgw-2"]

#route_tables
pubrt_tags = "test-public-route-table"
prrt_tags = [ "test-private-route-table-1","test-private-route-table-2" ]

#alb
sgalb_name = "test-alb-security-group"
sgalb_tags = {
  "Name" = "test-alb-security-group"
  "Environment" = "test"
}
sgalb_ingress_from_port = "443"
sgalb_ingress_to_port = "443"
sgalb_egress_from_port = "443"
sgalb_egress_to_port = "443"
sgalb_protocol = "tcp"
alb_name = "test-application-load-balancer"
enable_deletion_protection = true
alb_tags = {
  "Name" = "test-application-load-balancer"
  "Environment" = "test"
}
listener_port = "443"
listener_protocol = "HTTPS"
ssl_policy = "ELBSecurityPolicy-2016-08"
certificate_arn = "arn:aws:acm:ap-south-1:757683203103:certificate/7582039c-b7ba-4a14-93ab-76543be43a51"
tg_name = "test-target-group"
tg_port = "443"
tg_protocol = "HTTPS"
healthcheck_protocol = "HTTPS"
healthy_threshold = "3"
unhealthy_threshold = "3"
timeout = "15"
interval = "30"
matcher = "302"

#ec2
sgec2_name = "test-asg-security-group"
sgec2_tags = {
  "Name" = "test-asg-security-group"
  "Environment" = "test"
}
sgec2_ingress_from_port = "443"
sgec2_ingress_to_port = "443"
sgec2_egress_from_port = "443"
sgec2_egress_to_port = "443"
sgec2_protocol = "tcp"
iam_role_name = "test-ssm-role"
instance_profile_name = "test-instance-profile"
launch_template_name = "test-launch-template"
instance_type = "t2.micro"
launch_template_ec2_name = "test-asg-ec2"
desired_capacity = 3
max_size = 5
min_size = 2

#route53
domain_name = "example.com"
hosted_zone_tags = {
  "Name" = "test-hosted-zone"
  "Environment" = "test"
}
cname_key = "test"