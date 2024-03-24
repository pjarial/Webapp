variable "vpc_id" {
  description = "vpc id to attach igw with"
  type = string
}
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
variable "pusnet" {
  description = "list of public subnet id to create alb in"
  type = list(string)
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
  description = "success matcher mode"
  type = string
}