#vpc
variable "vpc_cidr" {
  description = "cidr block range of vpc"
  type = string
}
variable "vpc_tags" {
  description = "tags associated to vpc"
  type = map(string)
}