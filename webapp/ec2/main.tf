#security group for ec2
resource "aws_security_group" "sgec2" {
  vpc_id = var.vpc_id
  name = var.sgec2_name
  tags = var.sgec2_tags
}
resource "aws_security_group_rule" "sgec2rule1" {
  security_group_id = aws_security_group.sgec2.id
  type = "ingress"
  from_port = var.sgec2_ingress_from_port
  to_port = var.sgec2_ingress_to_port
  protocol = var.sgec2_protocol
  source_security_group_id = var.sgalb_id
}
resource "aws_security_group_rule" "sgec2rule2" {
  security_group_id = aws_security_group.sgec2.id
  type = "egress"
  from_port = var.sgec2_egress_from_port
  to_port = var.sgec2_egress_to_port
  protocol = var.sgec2_protocol
  cidr_blocks = ["0.0.0.0/0"]
}

#iam role for ssm
resource "aws_iam_role" "ssm" {
    name = var.iam_role_name
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

#ssm policy addition to role
resource "aws_iam_role_policy_attachment" "ssm" {
  role = aws_iam_role.ssm.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#iam instance profile
resource "aws_iam_instance_profile" "ec2" {
  name = var.instance_profile_name
  role = aws_iam_role.ssm.id
}

#launch template
resource "aws_launch_template" "ec2" {
  name = var.launch_template_name
  image_id = data.aws_ami.amazonlinux.id
  instance_type = var.instance_type
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2.name
  }
  network_interfaces {
    device_index = 0
    security_groups = [aws_security_group.sgec2.id]
  }
  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 10
      encrypted = true
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
        Name = var.launch_template_ec2_name
    }
  }
  user_data = filebase64("${path.module}/webserver.sh")
}

#autoscaling group
resource "aws_autoscaling_group" "asg" {
  desired_capacity = var.desired_capacity
  max_size = var.max_size
  min_size = var.min_size
  vpc_zone_identifier = var.prsnet_id
  target_group_arns = [var.tg_arn]
  
  launch_template {
    id = aws_launch_template.ec2.id
    version = aws_launch_template.ec2.latest_version
  }
}