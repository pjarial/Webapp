#igw
variable "vpc_id" {
  description = "vpc id to attach igw with"
  type = string
}
variable "igw_tags" {
  description = "tags associated with igw"
  type = map(string)
}