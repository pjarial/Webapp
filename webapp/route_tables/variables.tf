variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "igw_id" {
  description = "igw id for public route"
  type = string
}
variable "pubrt_tags" {
  description = "public route table tags"
  type = string
}
variable "availability_zone" {
  description = "list of Azz to be used in a region"
  type = list(string)
}
variable "pusnet_id" {
  description = "list of public subnet ids"
  type = list(string)
}
variable "natgw1_id" {
  description = "natgw1 id in first AZ"
  type = string
}
variable "natgw2_id" {
  description = "natgw2 id in second AZ"
  type = string
}
variable "prrt_tags" {
  description = "private route table tags"
  type = list(string)
}
variable "prsnet_id" {
  description = "list of private subnet ids"
  type = list(string)
}