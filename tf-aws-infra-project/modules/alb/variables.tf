variable "vpc_id" {
  description = "ID of the VPC where the Application Load Balancer and target group will be created"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs where the Application Load Balancer will be deployed"
  type        = list(string)
}

variable "alb_sg" {
  description = "Security group ID attached to the Application Load Balancer to allow inbound HTTP traffic"
  type        = string
}