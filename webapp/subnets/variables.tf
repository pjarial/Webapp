#subnets

variable "vpc_id" {
  description = "vpc id"
  type = string
}
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