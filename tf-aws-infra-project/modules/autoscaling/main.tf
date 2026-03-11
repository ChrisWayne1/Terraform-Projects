resource "aws_launch_template" "ec2_template" {
  name_prefix   = "terraform-template"
  image_id      = var.ami
  instance_type = var.instance_type

  user_data = base64encode(var.user_data)

  network_interfaces {
    security_groups = [var.ec2_sg]
  }

  iam_instance_profile {
    name = var.instance_profile
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 2
  max_size         = 3
  min_size         = 2

  vpc_zone_identifier = var.private_subnets

  target_group_arns = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.ec2_template.id
    version = "$Latest"
  }

  health_check_type = "ELB"
}