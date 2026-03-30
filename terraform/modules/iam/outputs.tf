output "cluster_role_arn" {
  description = "ARN of EKS cluster IAM role"
  value       = aws_iam_role.eks_cluster.arn
}

output "node_role_arn" {
  description = "ARN of EKS node IAM role"
  value       = aws_iam_role.eks_nodes.arn
}