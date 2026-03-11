variable "ami" {
  description = "AMI ID used to launch EC2 instances in the Auto Scaling Group"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used in the Auto Scaling Group launch template"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs where Auto Scaling Group instances will be launched"
  type        = list(string)
}

variable "ec2_sg" {
  description = "Security group ID attached to EC2 instances in the Auto Scaling Group"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the Application Load Balancer target group that the Auto Scaling Group will register instances with"
  type        = string
}

variable "instance_profile" {
  description = "IAM instance profile attached to EC2 instances for permissions such as CloudWatch access"
  type        = string
}

variable "user_data" {
  description = "User data script used to bootstrap EC2 instances (install nginx, configure services, etc.)"
  type        = string
}