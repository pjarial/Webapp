#public subnets 
resource "aws_subnet" "pub" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.pub_cidr[count.index]
  tags = {
    Name    = var.pusnet_tags[count.index]
  }
}

#private subnets
resource "aws_subnet" "pr" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.pr_cidr[count.index]
  tags = {
    Name = var.prsnet_tags[count.index]
  }
}