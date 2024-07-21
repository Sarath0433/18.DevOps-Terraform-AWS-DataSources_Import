output "awsb28_subnets" {
  value       = data.aws_subnets.awsb28vpcsubnets
  sensitive   = false
  description = "description"
  depends_on  = []
}

output "awsb28_subnets_hide" {
  value       = data.aws_subnets.awsb28vpcsubnets
  sensitive   = true
  description = "description"
  depends_on  = []
}
