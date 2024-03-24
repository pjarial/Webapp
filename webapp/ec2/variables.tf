variable "vpc_id" {
  description = "vpc id to attach igw with"
  type = string
}
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
variable "sgalb_id" {
  description = "security group if of alb"
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
variable "prsnet_id" {
  description = "private subnet ids where to launch ec2"
  type = list(string)
}
variable "tg_arn" {
  description = "arn of target group"
  type = string
}