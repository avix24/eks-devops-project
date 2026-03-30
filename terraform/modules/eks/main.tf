# The EKS Cluster - the Kubernetes control plane
resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-${var.environment}"
  role_arn = var.cluster_role_arn
  version  = "1.29"

  vpc_config {
    subnet_ids              = concat(var.public_subnet_ids, var.private_subnet_ids)
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}"
    Environment = var.environment
  }
}

# Node Group - the EC2 workers that run your containers
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-${var.environment}-nodes"
  node_role_arn   = var.node_role_arn

  # Workers go in private subnets - security best practice
  subnet_ids = var.private_subnet_ids

  # t3.small is the sweet spot - cheap enough, powerful enough for this project
  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-nodes"
    Environment = var.environment
  }

  # Cluster must exist before nodes can join
  depends_on = [aws_eks_cluster.main]
}