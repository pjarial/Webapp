#eip
resource "aws_eip" "eip" {
  count = length(var.availability_zone)
  domain = "vpc"
  tags = {
    Name = var.eip_tags[count.index]
  }
}

#natgw
resource "aws_nat_gateway" "natgw" {
  count = length(var.availability_zone)
  allocation_id = aws_eip.eip[count.index].id
  subnet_id = var.pusnet_id[count.index]
  tags = {
    Name = var.natgw_tags[count.index]
  }
}
