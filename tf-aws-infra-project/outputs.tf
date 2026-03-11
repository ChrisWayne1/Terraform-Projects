output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}

output "autoscaling_group_name" {
  value = module.autoscaling.asg_name
}

output "application_url" {
  value = "http://${module.alb.alb_dns_name}"
}