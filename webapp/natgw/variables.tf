variable "availability_zone" {
  description = "list of Azz to be used in a region"
  type = list(string)
}
variable "eip_tags" {
  description = "tags associated with eip"
  type = list(string)
}
variable "pusnet_id" {
  description = "public subnet ids to create natgw in"
  type = list(string)
}
variable "natgw_tags" {
  description = "tags associated with natgw"
  type = list(string)
}