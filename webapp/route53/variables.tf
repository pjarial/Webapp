variable "domain_name" {
  description = "domain name for private hosted zone"
  type = string
}
variable "vpc_id" {
  description = "vpc id to be associate with zone"
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
variable "cname_value" {
  description = "cname record value for alb in dns"
  type = string
}