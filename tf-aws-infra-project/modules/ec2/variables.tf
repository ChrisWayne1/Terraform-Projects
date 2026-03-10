variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
  type        = string
}

variable "security_group" {
  description = "Security group ID"
  type        = string
}

variable "instance_profile" {
  description = "IAM instance profile"
  type        = string
}

variable "user_data" {
  description = "User data script"
  type        = string
}