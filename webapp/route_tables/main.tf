#public route table
resource "aws_route_table" "pub" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = var.pubrt_tags
  }
}

resource "aws_route_table_association" "pub" {
  count = length(var.availability_zone)
  route_table_id = aws_route_table.pub.id
  subnet_id = var.pusnet_id[count.index]
}

#private route table 1
resource "aws_route_table" "pr1" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.natgw1_id
  }
  tags ={
    Name = var.prrt_tags[0]
   }
}

resource "aws_route_table" "pr2" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.natgw2_id
  }
  tags ={
    Name = var.prrt_tags[1]
   }
}

resource "aws_route_table_association" "pr1" {
  route_table_id = aws_route_table.pr1.id
  subnet_id = var.prsnet_id[0]
}

resource "aws_route_table_association" "pr2" {
  route_table_id = aws_route_table.pr2.id
  subnet_id = var.prsnet_id[1]
}
